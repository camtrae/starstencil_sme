#include <arm_sme.h>
#include <arm_neon.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

// SVE streaming mode: 512bit / 32bit = 16 elements per register
// We load all 16 elements by loading p+c-1, p+c, p+c+1 separately (like NEON),
// so no masking needed and utilization is 100%
#define STEP 16

static double elapsed_ms(struct timespec s, struct timespec e) {
    return (e.tv_sec - s.tv_sec) * 1000.0 + (e.tv_nsec - s.tv_nsec) / 1e6;
}

// =====================================================================
// Version 1: Scalar with O3 (compiler auto-vectorization allowed)
// Used as the primary baseline
// =====================================================================
void star3_scalar_autovec(const float * restrict in,
                          const float * restrict k,
                          float       * restrict out,
                          int rows, int cols)
{
    for (int r = 1; r < rows - 1; r++)
        for (int c = 1; c < cols - 1; c++)
            out[r*cols+c] = k[0]*in[(r-1)*cols+c  ] +
                            k[1]*in[ r   *cols+c-1] +
                            k[2]*in[ r   *cols+c  ] +
                            k[3]*in[ r   *cols+c+1] +
                            k[4]*in[(r+1)*cols+c  ];
}

// =====================================================================
// Version 2: Scalar with no vectorization (optnone)
// True scalar baseline, reveals how much auto-vec helps
// =====================================================================
__attribute__((optnone))
void star3_scalar_novec(const float * restrict in,
                        const float * restrict k,
                        float       * restrict out,
                        int rows, int cols)
{
    for (int r = 1; r < rows - 1; r++)
        for (int c = 1; c < cols - 1; c++)
            out[r*cols+c] = k[0]*in[(r-1)*cols+c  ] +
                            k[1]*in[ r   *cols+c-1] +
                            k[2]*in[ r   *cols+c  ] +
                            k[3]*in[ r   *cols+c+1] +
                            k[4]*in[(r+1)*cols+c  ];
}

// =====================================================================
// Version 3: NEON x4
// 128-bit NEON, processes 4 fp32 outputs per iteration
// No streaming mode required, runs at full CPU frequency
// =====================================================================
void star3_neon_x4(const float * restrict in,
                   const float * restrict k,
                   float       * restrict out,
                   int rows, int cols)
{
    float32x4_t vc0 = vdupq_n_f32(k[0]);
    float32x4_t vc1 = vdupq_n_f32(k[1]);
    float32x4_t vc2 = vdupq_n_f32(k[2]);
    float32x4_t vc3 = vdupq_n_f32(k[3]);
    float32x4_t vc4 = vdupq_n_f32(k[4]);

    for (int r = 1; r < rows - 1; r++) {
        const float *p0 = in + (r-1)*cols;
        const float *p1 = in +  r   *cols;
        const float *p2 = in + (r+1)*cols;
        float       *po = out + r*cols;
        int c;
        for (c = 1; c + 4 <= cols - 1; c += 4) {
            float32x4_t acc = vmulq_f32(vld1q_f32(p0+c  ), vc0);
            acc = vmlaq_f32(acc, vld1q_f32(p1+c-1), vc1);
            acc = vmlaq_f32(acc, vld1q_f32(p1+c  ), vc2);
            acc = vmlaq_f32(acc, vld1q_f32(p1+c+1), vc3);
            acc = vmlaq_f32(acc, vld1q_f32(p2+c  ), vc4);
            vst1q_f32(po+c, acc);
        }
        // scalar tail
        for (; c < cols - 1; c++)
            out[r*cols+c] = k[0]*in[(r-1)*cols+c  ] + k[1]*in[r*cols+c-1] +
                            k[2]*in[ r   *cols+c  ] + k[3]*in[r*cols+c+1] +
                            k[4]*in[(r+1)*cols+c  ];
    }
}

// =====================================================================
// Version 4: SVE load5 (full 16-element utilization)
// 512-bit SVE in streaming mode, processes 16 fp32 outputs per iteration
// Loads p+c-1, p+c, p+c+1 as separate pointers (same as NEON x4 strategy),
// so pg_all is used throughout — no masking, 100% register utilization
// Requires __arm_locally_streaming on Apple M4
// =====================================================================
__arm_locally_streaming
void star3_sve_load5(const float * restrict in,
                     const float * restrict k,
                     float       * restrict out,
                     int rows, int cols)
{
    svbool_t pg_all = svptrue_b32();

    svfloat32_t vc0 = svdup_n_f32(k[0]);
    svfloat32_t vc1 = svdup_n_f32(k[1]);
    svfloat32_t vc2 = svdup_n_f32(k[2]);
    svfloat32_t vc3 = svdup_n_f32(k[3]);
    svfloat32_t vc4 = svdup_n_f32(k[4]);

    for (int r = 1; r < rows - 1; r++) {
        const float *p0 = in + (r-1)*cols;
        const float *p1 = in +  r   *cols;
        const float *p2 = in + (r+1)*cols;
        float       *po = out + r*cols;
        int c;
        for (c = 1; c + STEP <= cols - 1; c += STEP) {
            svfloat32_t acc = svmul_f32_x(pg_all, svld1_f32(pg_all, p0+c  ), vc0);
            acc = svmla_f32_x(pg_all, acc, svld1_f32(pg_all, p1+c-1), vc1);
            acc = svmla_f32_x(pg_all, acc, svld1_f32(pg_all, p1+c  ), vc2);
            acc = svmla_f32_x(pg_all, acc, svld1_f32(pg_all, p1+c+1), vc3);
            acc = svmla_f32_x(pg_all, acc, svld1_f32(pg_all, p2+c  ), vc4);
            svst1_f32(pg_all, po+c, acc);
        }
        // scalar tail
        for (; c < cols - 1; c++)
            out[r*cols+c] = k[0]*in[(r-1)*cols+c  ] + k[1]*in[r*cols+c-1] +
                            k[2]*in[ r   *cols+c  ] + k[3]*in[r*cols+c+1] +
                            k[4]*in[(r+1)*cols+c  ];
    }
}

// =====================================================================
// Version 5: NEON x16 + register blocking 4 rows
// Processes 4 rows x 16 cols = 64 outputs per iteration
// Adjacent rows share loaded data, reducing redundant memory loads
// Row r+1 reuses row r's center data as its own top/bottom neighbors
// =====================================================================
void star3_neon_rb4(const float * restrict in,
                    const float * restrict k,
                    float       * restrict out,
                    int rows, int cols)
{
    float32x4_t vc0 = vdupq_n_f32(k[0]);
    float32x4_t vc1 = vdupq_n_f32(k[1]);
    float32x4_t vc2 = vdupq_n_f32(k[2]);
    float32x4_t vc3 = vdupq_n_f32(k[3]);
    float32x4_t vc4 = vdupq_n_f32(k[4]);

    // Helper macro: compute one group of 4 outputs
    // U=above-center, L=left, C=center, R=right, D=below-center
#define COMP4(acc, U, L, C, R, D)       \
    float32x4_t acc = vmulq_f32(U, vc0);\
    acc = vmlaq_f32(acc, L, vc1);       \
    acc = vmlaq_f32(acc, C, vc2);       \
    acc = vmlaq_f32(acc, R, vc3);       \
    acc = vmlaq_f32(acc, D, vc4);

#define LD(p, o) vld1q_f32((p)+(o))

    int r;
    // Main loop: process 4 rows at a time
    for (r = 1; r + 3 < rows - 1; r += 4) {
        const float *R0 = in + (r-1)*cols;   // top halo row
        const float *R1 = in +  r   *cols;
        const float *R2 = in + (r+1)*cols;
        const float *R3 = in + (r+2)*cols;
        const float *R4 = in + (r+3)*cols;
        const float *R5 = in + (r+4)*cols;   // bottom halo row
        float *O0 = out +  r   *cols;
        float *O1 = out + (r+1)*cols;
        float *O2 = out + (r+2)*cols;
        float *O3 = out + (r+3)*cols;

        int c;
        // Column loop: process 16 outputs (4 groups of 4) per iteration
        for (c = 1; c + 16 <= cols - 1; c += 16) {
            // Load 6 rows x 4 groups x 4 elements
            // R0: top halo (center only needed)
            float32x4_t d0_0=LD(R0,c), d0_1=LD(R0,c+4), d0_2=LD(R0,c+8), d0_3=LD(R0,c+12);
            // R1: left/center/right for row r output
            float32x4_t d1l_0=LD(R1,c-1), d1l_1=LD(R1,c+3), d1l_2=LD(R1,c+7), d1l_3=LD(R1,c+11);
            float32x4_t d1c_0=LD(R1,c  ), d1c_1=LD(R1,c+4), d1c_2=LD(R1,c+8), d1c_3=LD(R1,c+12);
            float32x4_t d1r_0=LD(R1,c+1), d1r_1=LD(R1,c+5), d1r_2=LD(R1,c+9), d1r_3=LD(R1,c+13);
            // R2
            float32x4_t d2l_0=LD(R2,c-1), d2l_1=LD(R2,c+3), d2l_2=LD(R2,c+7), d2l_3=LD(R2,c+11);
            float32x4_t d2c_0=LD(R2,c  ), d2c_1=LD(R2,c+4), d2c_2=LD(R2,c+8), d2c_3=LD(R2,c+12);
            float32x4_t d2r_0=LD(R2,c+1), d2r_1=LD(R2,c+5), d2r_2=LD(R2,c+9), d2r_3=LD(R2,c+13);
            // R3
            float32x4_t d3l_0=LD(R3,c-1), d3l_1=LD(R3,c+3), d3l_2=LD(R3,c+7), d3l_3=LD(R3,c+11);
            float32x4_t d3c_0=LD(R3,c  ), d3c_1=LD(R3,c+4), d3c_2=LD(R3,c+8), d3c_3=LD(R3,c+12);
            float32x4_t d3r_0=LD(R3,c+1), d3r_1=LD(R3,c+5), d3r_2=LD(R3,c+9), d3r_3=LD(R3,c+13);
            // R4
            float32x4_t d4l_0=LD(R4,c-1), d4l_1=LD(R4,c+3), d4l_2=LD(R4,c+7), d4l_3=LD(R4,c+11);
            float32x4_t d4c_0=LD(R4,c  ), d4c_1=LD(R4,c+4), d4c_2=LD(R4,c+8), d4c_3=LD(R4,c+12);
            float32x4_t d4r_0=LD(R4,c+1), d4r_1=LD(R4,c+5), d4r_2=LD(R4,c+9), d4r_3=LD(R4,c+13);
            // R5: bottom halo (center only needed)
            float32x4_t d5_0=LD(R5,c), d5_1=LD(R5,c+4), d5_2=LD(R5,c+8), d5_3=LD(R5,c+12);

            // Compute row r (top=R0, mid=R1, bot=R2)
            COMP4(a0_0, d0_0, d1l_0, d1c_0, d1r_0, d2c_0)
            COMP4(a0_1, d0_1, d1l_1, d1c_1, d1r_1, d2c_1)
            COMP4(a0_2, d0_2, d1l_2, d1c_2, d1r_2, d2c_2)
            COMP4(a0_3, d0_3, d1l_3, d1c_3, d1r_3, d2c_3)
            // Compute row r+1 (top=R1, mid=R2, bot=R3) — reuses d1c/d2c/d3c
            COMP4(a1_0, d1c_0, d2l_0, d2c_0, d2r_0, d3c_0)
            COMP4(a1_1, d1c_1, d2l_1, d2c_1, d2r_1, d3c_1)
            COMP4(a1_2, d1c_2, d2l_2, d2c_2, d2r_2, d3c_2)
            COMP4(a1_3, d1c_3, d2l_3, d2c_3, d2r_3, d3c_3)
            // Compute row r+2 (top=R2, mid=R3, bot=R4)
            COMP4(a2_0, d2c_0, d3l_0, d3c_0, d3r_0, d4c_0)
            COMP4(a2_1, d2c_1, d3l_1, d3c_1, d3r_1, d4c_1)
            COMP4(a2_2, d2c_2, d3l_2, d3c_2, d3r_2, d4c_2)
            COMP4(a2_3, d2c_3, d3l_3, d3c_3, d3r_3, d4c_3)
            // Compute row r+3 (top=R3, mid=R4, bot=R5)
            COMP4(a3_0, d3c_0, d4l_0, d4c_0, d4r_0, d5_0)
            COMP4(a3_1, d3c_1, d4l_1, d4c_1, d4r_1, d5_1)
            COMP4(a3_2, d3c_2, d4l_2, d4c_2, d4r_2, d5_2)
            COMP4(a3_3, d3c_3, d4l_3, d4c_3, d4r_3, d5_3)

            // Store all 4 rows
            vst1q_f32(O0+c,    a0_0); vst1q_f32(O0+c+ 4, a0_1);
            vst1q_f32(O0+c+ 8, a0_2); vst1q_f32(O0+c+12, a0_3);
            vst1q_f32(O1+c,    a1_0); vst1q_f32(O1+c+ 4, a1_1);
            vst1q_f32(O1+c+ 8, a1_2); vst1q_f32(O1+c+12, a1_3);
            vst1q_f32(O2+c,    a2_0); vst1q_f32(O2+c+ 4, a2_1);
            vst1q_f32(O2+c+ 8, a2_2); vst1q_f32(O2+c+12, a2_3);
            vst1q_f32(O3+c,    a3_0); vst1q_f32(O3+c+ 4, a3_1);
            vst1q_f32(O3+c+ 8, a3_2); vst1q_f32(O3+c+12, a3_3);
        }
        // Column remainder: process 4 at a time
        for (; c + 4 <= cols - 1; c += 4) {
            float32x4_t d0 =LD(R0,c);
            float32x4_t d1l=LD(R1,c-1), d1c=LD(R1,c), d1r=LD(R1,c+1);
            float32x4_t d2l=LD(R2,c-1), d2c=LD(R2,c), d2r=LD(R2,c+1);
            float32x4_t d3l=LD(R3,c-1), d3c=LD(R3,c), d3r=LD(R3,c+1);
            float32x4_t d4l=LD(R4,c-1), d4c=LD(R4,c), d4r=LD(R4,c+1);
            float32x4_t d5 =LD(R5,c);
            COMP4(a0, d0,  d1l, d1c, d1r, d2c)
            COMP4(a1, d1c, d2l, d2c, d2r, d3c)
            COMP4(a2, d2c, d3l, d3c, d3r, d4c)
            COMP4(a3, d3c, d4l, d4c, d4r, d5 )
            vst1q_f32(O0+c,a0); vst1q_f32(O1+c,a1);
            vst1q_f32(O2+c,a2); vst1q_f32(O3+c,a3);
        }
        // Scalar tail
        for (; c < cols - 1; c++)
            for (int rr = r; rr < r+4 && rr < rows-1; rr++)
                out[rr*cols+c] = k[0]*in[(rr-1)*cols+c  ] + k[1]*in[rr*cols+c-1] +
                                 k[2]*in[ rr   *cols+c  ] + k[3]*in[rr*cols+c+1] +
                                 k[4]*in[(rr+1)*cols+c  ];
    }
    // Row remainder: use plain neon_x4 style
    for (; r < rows - 1; r++) {
        const float *p0=in+(r-1)*cols, *p1=in+r*cols, *p2=in+(r+1)*cols;
        float *po=out+r*cols;
        int c;
        for (c = 1; c + 4 <= cols - 1; c += 4) {
            float32x4_t acc = vmulq_f32(LD(p0,c  ), vc0);
            acc = vmlaq_f32(acc, LD(p1,c-1), vc1);
            acc = vmlaq_f32(acc, LD(p1,c  ), vc2);
            acc = vmlaq_f32(acc, LD(p1,c+1), vc3);
            acc = vmlaq_f32(acc, LD(p2,c  ), vc4);
            vst1q_f32(po+c, acc);
        }
        for (; c < cols-1; c++)
            out[r*cols+c] = k[0]*in[(r-1)*cols+c  ] + k[1]*in[r*cols+c-1] +
                            k[2]*in[ r   *cols+c  ] + k[3]*in[r*cols+c+1] +
                            k[4]*in[(r+1)*cols+c  ];
    }
#undef COMP4
#undef LD
}

// =====================================================================
// Version 6: SVE rb4 (full 16-element utilization)
// Same row-blocking strategy as version 5 but using 512-bit SVE
// Each iteration: 4 rows x 16 elements = 64 outputs
// All loads use pg_all — no masking, 100% register utilization
// =====================================================================
__arm_locally_streaming
void star3_sve_rb4(const float * restrict in,
                   const float * restrict k,
                   float       * restrict out,
                   int rows, int cols)
{
    svbool_t pg_all = svptrue_b32();

    svfloat32_t vc0 = svdup_n_f32(k[0]);
    svfloat32_t vc1 = svdup_n_f32(k[1]);
    svfloat32_t vc2 = svdup_n_f32(k[2]);
    svfloat32_t vc3 = svdup_n_f32(k[3]);
    svfloat32_t vc4 = svdup_n_f32(k[4]);

#define SVE_COMP(acc, U, L, C, R, D)                        \
    svfloat32_t acc = svmul_f32_x(pg_all, U, vc0);          \
    acc = svmla_f32_x(pg_all, acc, L, vc1);                 \
    acc = svmla_f32_x(pg_all, acc, C, vc2);                 \
    acc = svmla_f32_x(pg_all, acc, R, vc3);                 \
    acc = svmla_f32_x(pg_all, acc, D, vc4);

#define SVE_LD(p, o) svld1_f32(pg_all, (p)+(o))

    int r;
    for (r = 1; r + 3 < rows - 1; r += 4) {
        const float *R0 = in + (r-1)*cols;
        const float *R1 = in +  r   *cols;
        const float *R2 = in + (r+1)*cols;
        const float *R3 = in + (r+2)*cols;
        const float *R4 = in + (r+3)*cols;
        const float *R5 = in + (r+4)*cols;
        float *O0 = out +  r   *cols;
        float *O1 = out + (r+1)*cols;
        float *O2 = out + (r+2)*cols;
        float *O3 = out + (r+3)*cols;

        int c;
        for (c = 1; c + STEP <= cols - 1; c += STEP) {
            // Load all 6 rows, each 16 elements (pg_all, full utilization)
            svfloat32_t d0  = SVE_LD(R0, c);
            svfloat32_t d1l = SVE_LD(R1, c-1);
            svfloat32_t d1c = SVE_LD(R1, c  );
            svfloat32_t d1r = SVE_LD(R1, c+1);
            svfloat32_t d2l = SVE_LD(R2, c-1);
            svfloat32_t d2c = SVE_LD(R2, c  );
            svfloat32_t d2r = SVE_LD(R2, c+1);
            svfloat32_t d3l = SVE_LD(R3, c-1);
            svfloat32_t d3c = SVE_LD(R3, c  );
            svfloat32_t d3r = SVE_LD(R3, c+1);
            svfloat32_t d4l = SVE_LD(R4, c-1);
            svfloat32_t d4c = SVE_LD(R4, c  );
            svfloat32_t d4r = SVE_LD(R4, c+1);
            svfloat32_t d5  = SVE_LD(R5, c);

            // Compute 4 rows, reusing shared center data
            SVE_COMP(a0, d0,  d1l, d1c, d1r, d2c)
            SVE_COMP(a1, d1c, d2l, d2c, d2r, d3c)
            SVE_COMP(a2, d2c, d3l, d3c, d3r, d4c)
            SVE_COMP(a3, d3c, d4l, d4c, d4r, d5 )

            svst1_f32(pg_all, O0+c, a0);
            svst1_f32(pg_all, O1+c, a1);
            svst1_f32(pg_all, O2+c, a2);
            svst1_f32(pg_all, O3+c, a3);
        }
        // Scalar tail
        for (; c < cols - 1; c++)
            for (int rr = r; rr < r+4 && rr < rows-1; rr++)
                out[rr*cols+c] = k[0]*in[(rr-1)*cols+c  ] + k[1]*in[rr*cols+c-1] +
                                 k[2]*in[ rr   *cols+c  ] + k[3]*in[rr*cols+c+1] +
                                 k[4]*in[(rr+1)*cols+c  ];
    }
    // Row remainder
    for (; r < rows - 1; r++) {
        const float *p0=in+(r-1)*cols, *p1=in+r*cols, *p2=in+(r+1)*cols;
        float *po=out+r*cols;
        int c;
        for (c = 1; c + STEP <= cols - 1; c += STEP) {
            svfloat32_t acc = svmul_f32_x(pg_all, SVE_LD(p0,c  ), vc0);
            acc = svmla_f32_x(pg_all, acc, SVE_LD(p1,c-1), vc1);
            acc = svmla_f32_x(pg_all, acc, SVE_LD(p1,c  ), vc2);
            acc = svmla_f32_x(pg_all, acc, SVE_LD(p1,c+1), vc3);
            acc = svmla_f32_x(pg_all, acc, SVE_LD(p2,c  ), vc4);
            svst1_f32(pg_all, po+c, acc);
        }
        for (; c < cols-1; c++)
            out[r*cols+c] = k[0]*in[(r-1)*cols+c  ] + k[1]*in[r*cols+c-1] +
                            k[2]*in[ r   *cols+c  ] + k[3]*in[r*cols+c+1] +
                            k[4]*in[(r+1)*cols+c  ];
    }
#undef SVE_COMP
#undef SVE_LD
}

// =====================================================================
// Correctness check
// =====================================================================
static int verify(const float *ref, const float *out,
                  int rows, int cols, float tol, const char *name)
{
    int err = 0;
    for (int r = 1; r < rows-1; r++)
        for (int c = 1; c < cols-1; c++) {
            float d = fabsf(ref[r*cols+c] - out[r*cols+c]);
            if (d > tol) {
                if (err < 3)
                    printf("  [%s] MISMATCH (%d,%d): ref=%.6f got=%.6f\n",
                           name, r, c, ref[r*cols+c], out[r*cols+c]);
                err++;
            }
        }
    return err;
}

// =====================================================================
// Single-size benchmark
// =====================================================================
static void run_bench(int rows, int cols, int do_verify)
{
    const int N    = rows * cols;
    float kernel[5] = { 1.f/5, 1.f/5, 1.f/5, 1.f/5, 1.f/5 };

    float *in    = (float *)aligned_alloc(64, N * sizeof(float));
    float *ref   = (float *)aligned_alloc(64, N * sizeof(float));
    float *buf1  = (float *)aligned_alloc(64, N * sizeof(float));  // novec
    float *buf2  = (float *)aligned_alloc(64, N * sizeof(float));  // neon_x4
    float *buf3  = (float *)aligned_alloc(64, N * sizeof(float));  // sve_load5
    float *buf4  = (float *)aligned_alloc(64, N * sizeof(float));  // neon_rb4
    float *buf5  = (float *)aligned_alloc(64, N * sizeof(float));  // sve_rb4

    srand(42);
    for (int i = 0; i < N; i++) in[i] = (float)(rand() % 256);
    memset(ref,  0, N*4); memset(buf1, 0, N*4); memset(buf2, 0, N*4);
    memset(buf3, 0, N*4); memset(buf4, 0, N*4); memset(buf5, 0, N*4);

    if (do_verify) {
        star3_scalar_autovec(in, kernel, ref,  rows, cols);
        star3_neon_x4       (in, kernel, buf2, rows, cols);
        star3_sve_load5     (in, kernel, buf3, rows, cols);
        star3_neon_rb4      (in, kernel, buf4, rows, cols);
        star3_sve_rb4       (in, kernel, buf5, rows, cols);
        printf("[Verify %dx%d]  neon_x4=%s  sve_load5=%s  neon_rb4=%s  sve_rb4=%s\n\n",
               rows, cols,
               verify(ref,buf2,rows,cols,1e-4f,"neon_x4"  )==0?"PASS":"FAIL",
               verify(ref,buf3,rows,cols,1e-4f,"sve_load5")==0?"PASS":"FAIL",
               verify(ref,buf4,rows,cols,1e-4f,"neon_rb4" )==0?"PASS":"FAIL",
               verify(ref,buf5,rows,cols,1e-4f,"sve_rb4"  )==0?"PASS":"FAIL");
    }

    // Scale run count so total wall time stays reasonable
    long elem = (long)rows * cols;
    int  RUNS = (int)(1e9 / elem);
    if (RUNS < 10)   RUNS = 10;
    if (RUNS > 5000) RUNS = 5000;
    int  RUNS_NV = RUNS / 8;            // novec is much slower
    if (RUNS_NV < 3) RUNS_NV = 3;

    struct timespec t0, t1;
#define BENCH(fn, buf, runs) \
    clock_gettime(CLOCK_MONOTONIC, &t0); \
    for (int _i = 0; _i < (runs); _i++) fn(in, kernel, buf, rows, cols); \
    clock_gettime(CLOCK_MONOTONIC, &t1);

    BENCH(star3_scalar_autovec, ref,  RUNS);    double ms_av  = elapsed_ms(t0,t1)/RUNS;
    BENCH(star3_scalar_novec,   buf1, RUNS_NV); double ms_nv  = elapsed_ms(t0,t1)/RUNS_NV;
    BENCH(star3_neon_x4,        buf2, RUNS);    double ms_n4  = elapsed_ms(t0,t1)/RUNS;
    BENCH(star3_sve_load5,      buf3, RUNS);    double ms_sv  = elapsed_ms(t0,t1)/RUNS;
    BENCH(star3_neon_rb4,       buf4, RUNS);    double ms_nr  = elapsed_ms(t0,t1)/RUNS;
    BENCH(star3_sve_rb4,        buf5, RUNS);    double ms_sr  = elapsed_ms(t0,t1)/RUNS;
#undef BENCH

    long   inner  = (long)(rows-2)*(cols-2);
    double mbs_av = inner/ms_av/1e3;

    printf("┌─────────────────────────────────────────────────────────────────────────┐\n");
    printf("│ Grid %5dx%-5d  inner=%ldK  runs=%d\n", rows, cols, inner/1000, RUNS);
    printf("├──────────────────────────────────┬──────────┬────────────┬─────────────┤\n");
    printf("│ Version                          │   ms     │  Mpix/s    │ vs autovec  │\n");
    printf("├──────────────────────────────────┼──────────┼────────────┼─────────────┤\n");
    printf("│ V1 Scalar autovec (O3)           │ %7.3f  │ %9.1f  │    1.00x    │\n", ms_av, mbs_av);
    printf("│ V2 Scalar novec (optnone)        │ %7.3f  │ %9.1f  │  %6.2fx    │\n", ms_nv, inner/ms_nv/1e3, ms_nv/ms_av);
    printf("├──────────────────────────────────┼──────────┼────────────┼─────────────┤\n");
    printf("│ V3 NEON x4                       │ %7.3f  │ %9.1f  │  %6.2fx    │\n", ms_n4, inner/ms_n4/1e3, ms_av/ms_n4);
    printf("│ V4 SVE streaming load5 (pg_all)  │ %7.3f  │ %9.1f  │  %6.2fx    │\n", ms_sv, inner/ms_sv/1e3, ms_av/ms_sv);
    printf("├──────────────────────────────────┼──────────┼────────────┼─────────────┤\n");
    printf("│ V5 NEON x16 + regblock4          │ %7.3f  │ %9.1f  │  %6.2fx    │\n", ms_nr, inner/ms_nr/1e3, ms_av/ms_nr);
    printf("│ V6 SVE streaming rb4  (pg_all)   │ %7.3f  │ %9.1f  │  %6.2fx    │\n", ms_sr, inner/ms_sr/1e3, ms_av/ms_sr);
    printf("└──────────────────────────────────┴──────────┴────────────┴─────────────┘\n\n");

    free(in); free(ref); free(buf1); free(buf2); free(buf3); free(buf4); free(buf5);
}

// =====================================================================
// Main
// =====================================================================
int main(void)
{
    printf("Star3 Stencil Benchmark  (FP32, 5-point star, 6 versions)\n");
    printf("============================================================\n");
    printf("V1: scalar autovec   V2: scalar novec\n");
    printf("V3: NEON x4          V4: SVE streaming load5\n");
    printf("V5: NEON x16+rb4     V6: SVE streaming rb4\n\n");

    struct { int rows, cols; } sizes[] = {
        {  128,  128 },
        {  256,  256 },
        {  512,  512 },
        { 1024, 1024 },
        { 2048, 2048 },
        { 4096, 4096 },
    };
    int n = (int)(sizeof(sizes)/sizeof(sizes[0]));
    for (int i = 0; i < n; i++)
        run_bench(sizes[i].rows, sizes[i].cols, i == 0 ? 1 : 0);
    return 0;
}