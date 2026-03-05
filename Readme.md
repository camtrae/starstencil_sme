# Star3 Stencil Benchmark — ARM NEON vs SVE Streaming

5-point star stencil (FP32) on Apple M4, comparing 6 implementation strategies.

## Stencil Pattern

```
        k[0]
k[1]    k[2]    k[3]
        k[4]
```

Each output pixel `out[r][c]` depends on its 4 direct neighbors and itself:

```c
out[r][c] = k[0]*in[r-1][c] + k[1]*in[r][c-1] + k[2]*in[r][c]
           + k[3]*in[r][c+1] + k[4]*in[r+1][c]
```

## Versions

| ID | Name | Description |
|----|------|-------------|
| V1 | Scalar autovec | Plain C loop, compiled with `-O3`, compiler auto-vectorizes |
| V2 | Scalar novec | Plain C loop, `__attribute__((optnone))`, true scalar baseline |
| V3 | NEON x4 | 128-bit NEON, 4 fp32 outputs/iter, no streaming mode |
| V4 | SVE load5 | 512-bit SVE streaming, 16 fp32 outputs/iter, `pg_all` |
| V5 | NEON x16+rb4 | 128-bit NEON, 4 rows × 16 cols = 64 outputs/iter, register blocking |
| V6 | SVE rb4 | 512-bit SVE streaming, 4 rows × 16 cols = 64 outputs/iter, register blocking |

## Build

```bash
clang -O3 -march=native+sme2 star3_stencil_neon.c -o star3_stencil_neon -lm
./star3_stencil_neon
```

> **Note:** `__arm_locally_streaming` is required on Apple M4 to use SVE intrinsics.
> SVE versions run in SME streaming mode, which operates at a reduced clock frequency.

## Results (Apple M4)

### 128×128

| Version | ms | Mpix/s | vs autovec |
|---------|-----|--------|------------|
| V1 Scalar autovec | 0.006 | 2684.4 | 1.00x |
| V2 Scalar novec | 0.075 | 212.0 | 0.08x |
| V3 NEON x4 | 0.002 | 7306.0 | **2.72x** |
| V4 SVE streaming load5 | 0.008 | 1936.3 | 0.72x |
| V5 NEON x16+rb4 | 0.001 | 10788.3 | **4.02x** |
| V6 SVE streaming rb4 | 0.009 | 1782.3 | 0.66x |

### 256×256

| Version | ms | Mpix/s | vs autovec |
|---------|-----|--------|------------|
| V1 Scalar autovec | 0.008 | 7995.5 | 1.00x |
| V2 Scalar novec | 0.224 | 288.3 | 0.04x |
| V3 NEON x4 | 0.008 | 7632.3 | 0.95x |
| V4 SVE streaming load5 | 0.027 | 2402.9 | 0.30x |
| V5 NEON x16+rb4 | 0.008 | 7775.1 | 0.97x |
| V6 SVE streaming rb4 | 0.028 | 2279.6 | 0.29x |

### 512×512

| Version | ms | Mpix/s | vs autovec |
|---------|-----|--------|------------|
| V1 Scalar autovec | 0.032 | 8186.8 | 1.00x |
| V2 Scalar novec | 2.241 | 116.1 | 0.01x |
| V3 NEON x4 | 0.034 | 7572.0 | 0.92x |
| V4 SVE streaming load5 | 0.097 | 2678.4 | 0.33x |
| V5 NEON x16+rb4 | 0.033 | 8001.1 | 0.98x |
| V6 SVE streaming rb4 | 0.099 | 2615.7 | 0.32x |

### 1024×1024 

| Version | ms | Mpix/s | vs autovec |
|---------|-----|--------|------------|
| V1 Scalar autovec | 0.128 | 8184.4 | 1.00x |
| V2 Scalar novec | 3.638 | 287.1 | 0.04x |
| V3 NEON x4 | 0.138 | 7577.9 | 0.93x |
| V4 SVE streaming load5 | 0.364 | 2869.0 | 0.35x |
| V5 NEON x16+rb4 | 0.134 | 7813.7 | 0.95x |
| V6 SVE streaming rb4 | 0.394 | 2651.9 | 0.32x |

## Key Findings

**SVE streaming mode is consistently ~3x slower than NEON on Apple M4.**

```
NEON x4  : 128-bit,  4 fp32/iter, native freq  → ~7500-8000 Mpix/s
SVE load5: 512-bit, 16 fp32/iter, streaming    → ~2600-2900 Mpix/s
```

SVE is 4× wider but runs at roughly 1/3 the speed.

**Compiler auto-vectorization (V1) matches hand-written NEON (V3/V5).**

Clang `-O3` generates NEON code that is essentially equivalent to hand-written V3/V5,
confirmed by inspecting the assembly (`ldp q`, `fmla.4s`, `stp q` pattern).