/*
 * star5_sme_fixed.c
 * 针对 Apple M4 (FP32, 4-Tile) 修复越界 bug 的 HStencil 完整实现
 *
 * Bug 修复列表：
 *   [1] Paper M4: Phase2 步长由 256 改为 64，与 Phase1 对齐；
 *       每次仅用 1 个 tile (tile0)，彻底消除列越界。
 *   [2] Variant1 / Variant2: 行尾块用 rib 限制循环上界，
 *       防止 bi+16 超出 rows-1 时的越界写。
 *   [3] Variant2: Phase1 内层循环上界改为 bi+rib（原 bi+16）。
 *   [4] Variant2: 尾列标量补算从 1+main_cols 开始，覆盖对齐余量。
 *
 * 编译命令:
 *   clang -O3 -mcpu=apple-m4 -march=armv9-a+sme \
 *         -rtlib=compiler-rt star5_sme_fixed.c -o hstencil_bench
 * 运行命令:
 *   ./hstencil_bench
 */

#include <arm_sme.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

/* ──────────────────────────────────────────────
 * 工具函数
 * ────────────────────────────────────────────── */

static double now_us(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return ts.tv_sec * 1e6 + ts.tv_nsec / 1e3;
}

static float* alloc_matrix(int rows, int cols) {
    float* p = (float*)aligned_alloc(64, (size_t)rows * cols * sizeof(float));
    if (!p) { fprintf(stderr, "Alloc failed\n"); exit(1); }
    return p;
}

static void rand_fill(float* m, int r, int c) {
    for (int i = 0; i < r * c; i++) m[i] = (float)(rand() % 100) / 10.0f;
}

static float max_abs_err(const float* a, const float* b, int r, int c) {
    float err = 0.0f;
    for (int i = 1; i < r - 1; i++)
        for (int j = 1; j < c - 1; j++) {
            float d = fabsf(a[i * c + j] - b[i * c + j]);
            if (d > err) err = d;
        }
    return err;
}

/* ──────────────────────────────────────────────
 * 0. Baseline (Scalar)
 * ────────────────────────────────────────────── */
static void star3_baseline(const float* in, const float* k, float* out,
                           int rows, int cols) {
    for (int i = 1; i < rows - 1; i++)
        for (int j = 1; j < cols - 1; j++)
            out[i * cols + j] =
                k[0] * in[(i-1) * cols + j] +
                k[1] * in[ i    * cols + j - 1] +
                k[2] * in[ i    * cols + j] +
                k[3] * in[ i    * cols + j + 1] +
                k[4] * in[(i+1) * cols + j];
}

/* ──────────────────────────────────────────────
 * 1. Paper M4 (Two-Phase: svmopa + M-MLA)
 *
 * 修复 [1]：Phase2 步长改为 64，每轮只使用 tile0 的 4 行
 *           (M-MLA 只更新 0/4/8/12 行)，消除列越界。
 * ────────────────────────────────────────────── */
__attribute__((noinline)) __arm_new("za") void star3_paper_m4(
    const float* restrict in, const float* restrict k, float* restrict out,
    int rows, int cols) __arm_streaming {

    /* 垂直系数向量: index 16=k[4](+1行), 17=k[2](中心), 18=k[0](-1行) */
    float cv[34] = {0};
    cv[16] = k[4]; cv[17] = k[2]; cv[18] = k[0];

    svbool_t    pg      = svptrue_b32();
    svcount_t   vc      = svptrue_c32();
    svfloat32_t c_left  = svdup_n_f32(k[1]);
    svfloat32_t c_right = svdup_n_f32(k[3]);

    /* ── Phase 1: 垂直外积 → 暂存到 out (步长 64 列, 4 tiles) ── */
    for (int bj = 1; bj < cols - 1; bj += 64) {
        for (int bi = 1; bi < rows - 1; bi += 16) {
            svzero_za();
            for (int i = bi - 1; i <= bi + 16; i++) {
                svfloat32_t c = svld1_f32(pg, cv + (17 - (i - bi)));
                const float* row = in + i * cols + bj;
                svmopa_za32_f32_m(0, pg, pg, c, svld1_f32(pg, row));
                svmopa_za32_f32_m(1, pg, pg, c, svld1_f32(pg, row + 16));
                svmopa_za32_f32_m(2, pg, pg, c, svld1_f32(pg, row + 32));
                svmopa_za32_f32_m(3, pg, pg, c, svld1_f32(pg, row + 48));
            }
            /* 写回 out，行数用 rib 保护尾块 */
            int rib = (bi + 16 <= rows - 1) ? 16 : (rows - 1 - bi);
            for (int r = 0; r < rib; r++) {
                float* d = out + (bi + r) * cols + bj;
                svst1_hor_za32(0, r, pg, d);
                svst1_hor_za32(1, r, pg, d + 16);
                svst1_hor_za32(2, r, pg, d + 32);
                svst1_hor_za32(3, r, pg, d + 48);
            }
        }
    }

    /* ── Phase 2: 水平 M-MLA ──
     * 修复 [1]: 步长改为 64，每次仅用 tile0；
     *           M-MLA vg1x4 一次处理 4×16=64 个元素，
     *           刚好对应一个 tile 的 64 列。
     * ────────────────────────────────────────── */
    for (int bi = 1; bi < rows - 1; bi++) {
        for (int bj = 1; bj < cols - 1; bj += 64) {
            const float* b = out + bi * cols + bj;

            /* 只加载 tile0 的 4 个有效行 (M-MLA 写 0/4/8/12) */
            svld1_hor_za32(0,  0, pg, b);
            svld1_hor_za32(0,  4, pg, b + 16);
            svld1_hor_za32(0,  8, pg, b + 32);
            svld1_hor_za32(0, 12, pg, b + 48);

            /* M-MLA: 水平邻居累加到 tile0 */
            const float* a = in + bi * cols + bj;
            svmla_single_za32_f32_vg1x4(0, svld1_f32_x4(vc, a - 1), c_left);
            svmla_single_za32_f32_vg1x4(0, svld1_f32_x4(vc, a + 1), c_right);

            /* 写回 */
            float* d = out + bi * cols + bj;
            svst1_hor_za32(0,  0, pg, d);
            svst1_hor_za32(0,  4, pg, d + 16);
            svst1_hor_za32(0,  8, pg, d + 32);
            svst1_hor_za32(0, 12, pg, d + 48);
        }
    }
}

/* ──────────────────────────────────────────────
 * 2. Variant 1 (Merged Phase + Vector svmla)
 *
 * 修复 [2]: 行尾块用 rib 限制 r 循环上界。
 * ────────────────────────────────────────────── */
__attribute__((noinline)) __arm_new("za") void star3_variant1(
    const float* restrict in, const float* restrict k, float* restrict out,
    int rows, int cols) __arm_streaming {

    float cv[34] = {0};
    cv[16] = k[4]; cv[17] = k[2]; cv[18] = k[0];

    svbool_t    pg      = svptrue_b32();
    svfloat32_t c_left  = svdup_n_f32(k[1]);
    svfloat32_t c_right = svdup_n_f32(k[3]);

    for (int bj = 1; bj < cols - 1; bj += 64) {
        for (int bi = 1; bi < rows - 1; bi += 16) {
            /* 修复 [2]: 计算本块实际行数 */
            int rib = (bi + 16 <= rows - 1) ? 16 : (rows - 1 - bi);

            svzero_za();
            /* 外积上界同样用 rib 保护 */
            for (int i = bi - 1; i <= bi + rib; i++) {
                svfloat32_t c = svld1_f32(pg, cv + (17 - (i - bi)));
                svmopa_za32_f32_m(0, pg, pg, c, svld1_f32(pg, in + i * cols + bj));
                svmopa_za32_f32_m(1, pg, pg, c, svld1_f32(pg, in + i * cols + bj + 16));
                svmopa_za32_f32_m(2, pg, pg, c, svld1_f32(pg, in + i * cols + bj + 32));
                svmopa_za32_f32_m(3, pg, pg, c, svld1_f32(pg, in + i * cols + bj + 48));
            }

            /* 修复 [2]: r < rib，不超出矩阵边界 */
            for (int r = 0; r < rib; r++) {
                int cur = bi + r;
                /* tile 0 */
                svfloat32_t row0 = svread_hor_za32_f32_m(svundef_f32(), pg, 0, r);
                row0 = svmla_f32_m(pg, row0,
                        svld1_f32(pg, in + cur * cols + bj - 1),  c_left);
                row0 = svmla_f32_m(pg, row0,
                        svld1_f32(pg, in + cur * cols + bj + 1),  c_right);
                svst1_f32(pg, out + cur * cols + bj, row0);
                /* tile 1 */
                svfloat32_t row1 = svread_hor_za32_f32_m(svundef_f32(), pg, 1, r);
                row1 = svmla_f32_m(pg, row1,
                        svld1_f32(pg, in + cur * cols + bj + 15), c_left);
                row1 = svmla_f32_m(pg, row1,
                        svld1_f32(pg, in + cur * cols + bj + 17), c_right);
                svst1_f32(pg, out + cur * cols + bj + 16, row1);
                /* tile 2 */
                svfloat32_t row2 = svread_hor_za32_f32_m(svundef_f32(), pg, 2, r);
                row2 = svmla_f32_m(pg, row2,
                        svld1_f32(pg, in + cur * cols + bj + 31), c_left);
                row2 = svmla_f32_m(pg, row2,
                        svld1_f32(pg, in + cur * cols + bj + 33), c_right);
                svst1_f32(pg, out + cur * cols + bj + 32, row2);
                /* tile 3 */
                svfloat32_t row3 = svread_hor_za32_f32_m(svundef_f32(), pg, 3, r);
                row3 = svmla_f32_m(pg, row3,
                        svld1_f32(pg, in + cur * cols + bj + 47), c_left);
                row3 = svmla_f32_m(pg, row3,
                        svld1_f32(pg, in + cur * cols + bj + 49), c_right);
                svst1_f32(pg, out + cur * cols + bj + 48, row3);
            }
        }
    }
}

/* ──────────────────────────────────────────────
 * 3. Variant 2 (Full Outer-Product + ZA Transpose)
 *
 * 修复 [3]: Phase1 内层上界改为 bi+rib（原 bi+16）。
 * 修复 [4]: 尾列标量补算覆盖 main_cols 之后的所有列。
 * ────────────────────────────────────────────── */
__attribute__((noinline)) __arm_new("za") void star3_variant2(
    const float* restrict in, const float* restrict k, float* restrict out,
    int rows, int cols) __arm_streaming {

    float coef_v[34]    = {0};
    float coef_sw1d[34] = {0};

    coef_v[16] = k[4];
    coef_v[17] = k[2];
    coef_v[18] = k[0];

    coef_sw1d[16] = k[3];
    coef_sw1d[18] = k[1];

    svbool_t pg = svptrue_b32();

    /* mask: lane 1~14 有效，跳过首尾边界列 */
    svuint32_t idx     = svindex_u32(0, 1);
    svbool_t mask_1_14 = svcmpgt_n_u32(pg, idx, 0);
    mask_1_14          = svcmplt_n_u32(mask_1_14, idx, 15);

    int inner     = cols - 2;
    int main_cols = (inner / 28) * 28;

    for (int bj = 1; bj < 1 + main_cols; bj += 28) {
        for (int bi = 1; bi < rows - 1; bi += 16) {
            /* 修复 [3]: 尾块行数保护 */
            int rib = (bi + 16 <= rows - 1) ? 16 : (rows - 1 - bi);

            /* ── Phase 1: 垂直外积 + 写入转置缓冲 ── */
            svzero_za();
            /* 修复 [3]: 上界改为 bi + rib */
            for (int i = bi - 1; i <= bi + rib; i++) {
                int di = i - bi;
                svfloat32_t coef = svld1_f32(pg, coef_v + (17 - di));

                svfloat32_t dA = svld1_f32(pg, in + i * cols + bj - 1);
                svmopa_za32_f32_m(0, pg, pg, coef, dA);
                if (i >= bi && i < bi + rib) {
                    svwrite_hor_za32_f32_m(1, i - bi, pg, dA);
                }

                svfloat32_t dB = svld1_f32(pg, in + i * cols + bj + 13);
                svmopa_za32_f32_m(2, pg, pg, coef, dB);
                if (i >= bi && i < bi + rib) {
                    svwrite_hor_za32_f32_m(3, i - bi, pg, dB);
                }
            }

            /* ── Phase 2: 水平外积（利用 ZA 转置列向量）── */
            for (int c = 0; c < 16; c++) {
                svfloat32_t csw = svld1_f32(pg, coef_sw1d + (17 - c));

                svfloat32_t colA = svread_ver_za32_f32_m(svdup_n_f32(0.0f), pg, 1, c);
                svmopa_za32_f32_m(0, pg, pg, colA, csw);

                svfloat32_t colB = svread_ver_za32_f32_m(svdup_n_f32(0.0f), pg, 3, c);
                svmopa_za32_f32_m(2, pg, pg, colB, csw);
            }

            /* ── Store: 掩码写回有效列 ── */
            for (int r = 0; r < rib; r++) {
                svfloat32_t row0 = svread_hor_za32_f32_m(svundef_f32(), pg, 0, r);
                svfloat32_t row2 = svread_hor_za32_f32_m(svundef_f32(), pg, 2, r);
                svst1_f32(mask_1_14, out + (bi + r) * cols + bj - 1, row0);
                svst1_f32(mask_1_14, out + (bi + r) * cols + bj + 13, row2);
            }
        }
    }

    /* ── 修复 [4]: 尾列标量补算 ── */
    int tail = 1 + main_cols;
    for (int r = 1; r < rows - 1; r++) {
        for (int c = tail; c < cols - 1; c++) {
            out[r * cols + c] =
                k[0] * in[(r - 1) * cols + c] +
                k[1] * in[ r      * cols + c - 1] +
                k[2] * in[ r      * cols + c] +
                k[3] * in[ r      * cols + c + 1] +
                k[4] * in[(r + 1) * cols + c];
        }
    }
}

/* ──────────────────────────────────────────────
 * main: 多规模基准测试
 * ────────────────────────────────────────────── */
int main(void) {
    const int   sizes[]  = {128, 256, 512, 1024, 2048};
    const int   nsize    = (int)(sizeof(sizes) / sizeof(sizes[0]));
    const int   warmup   = 20;
    const int   repeat   = 100;
    const float k[5]     = {0.2f, 0.2f, 0.2f, 0.2f, 0.2f};

    printf("%-8s | %-12s | %-12s | %-12s | %-12s | %-9s | %-9s\n",
           "Size", "Baseline(us)", "Paper_M4(us)", "Variant1(us)",
           "Var2(us)", "sp_paper", "sp_v2");
    printf("---------|--------------|--------------|--------------|"
           "--------------|-----------|----------\n");

    for (int s = 0; s < nsize; s++) {
        int N = sizes[s];
        srand(42);
        float* in  = alloc_matrix(N, N);
        float* ref = alloc_matrix(N, N);
        float* out = alloc_matrix(N, N);
        rand_fill(in, N, N);

        memset(ref, 0, (size_t)N * N * sizeof(float));
        star3_baseline(in, k, ref, N, N);

        int ok = 1;
#define VERIFY(label, call)                                         \
        do {                                                        \
            memset(out, 0, (size_t)N * N * sizeof(float));         \
            call;                                                   \
            float err = max_abs_err(ref, out, N, N);                \
            if (err > 1e-4f) {                                      \
                printf("[WRONG %s @ %dx%d err=%.3e]\n",             \
                       label, N, N, err);                           \
                ok = 0;                                             \
            }                                                       \
        } while(0)

        VERIFY("paper_m4", star3_paper_m4(in, k, out, N, N));
        VERIFY("variant1", star3_variant1 (in, k, out, N, N));
        VERIFY("variant2", star3_variant2 (in, k, out, N, N));

        if (!ok) {
            printf("  ↳ skipping benchmark for %dx%d (correctness failed)\n", N, N);
            free(in); free(ref); free(out);
            continue;
        }

        double t_base, t_paper, t_v1, t_v2;
#define BENCH(tvar, call)                                           \
        do {                                                        \
            for (int _w = 0; _w < warmup;  _w++) { call; }        \
            double _t0 = now_us();                                  \
            for (int _r = 0; _r < repeat; _r++) { call; }         \
            tvar = (now_us() - _t0) / repeat;                      \
        } while(0)

        BENCH(t_base,  star3_baseline(in, k, out, N, N));
        BENCH(t_paper, star3_paper_m4(in, k, out, N, N));
        BENCH(t_v1,    star3_variant1(in, k, out, N, N));
        BENCH(t_v2,    star3_variant2(in, k, out, N, N));

        printf("%-8d | %12.2f | %12.2f | %12.2f | %12.2f | %9.2fx | %9.2fx\n",
               N, t_base, t_paper, t_v1, t_v2,
               t_base / t_paper,
               t_base / t_v2);

        free(in); free(ref); free(out);
    }
    return 0;
}