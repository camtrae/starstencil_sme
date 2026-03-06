	.build_version macos, 26, 0	sdk_version 26, 2
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_star3_scalar_autovec           ; -- Begin function star3_scalar_autovec
	.p2align	2
_star3_scalar_autovec:                  ; @star3_scalar_autovec
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w4 killed $w4 def $x4
	cmp	w3, #3
	b.lt	LBB0_18
; %bb.1:
	cmp	w4, #3
	b.lt	LBB0_18
; %bb.2:
	stp	x28, x27, [sp, #-96]!           ; 16-byte Folded Spill
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 96
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	mov	x8, #0                          ; =0x0
	sub	w9, w3, #1
	sub	w10, w4, #1
	ldp	s0, s1, [x1]
	mov	w11, w4
	sub	x12, x10, #1
	ldp	s2, s3, [x1, #8]
	and	x14, x12, #0xfffffffffffffff0
	and	x15, x12, #0xfffffffffffffffc
	ldr	s4, [x1, #16]
	ubfiz	x16, x4, #2, #32
	add	x17, x16, x2
	add	x17, x17, #36
	ubfiz	x19, x4, #3, #32
	add	x1, x0, x19
	add	x3, x1, #52
	add	x4, x0, x16
	add	x5, x0, #4
	add	x6, x11, #1
	neg	x7, x15
	add	x19, x5, x19
	sub	x20, x0, #4
	mov	w21, #1                         ; =0x1
	mov	x22, x11
	mov	x23, x0
	b	LBB0_4
LBB0_3:                                 ;   in Loop: Header=BB0_4 Depth=1
	add	x21, x21, #1
	add	x8, x8, x16
	add	x5, x5, x16
	add	x6, x6, x11
	add	x19, x19, x16
	add	x1, x1, x16
	add	x23, x23, x16
	add	x22, x22, x11
	cmp	x21, x9
	b.eq	LBB0_17
LBB0_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_9 Depth 2
                                        ;     Child Loop BB0_13 Depth 2
                                        ;     Child Loop BB0_16 Depth 2
	cmp	x12, #4
	b.hs	LBB0_6
; %bb.5:                                ;   in Loop: Header=BB0_4 Depth=1
	mov	w28, #1                         ; =0x1
	b	LBB0_15
LBB0_6:                                 ;   in Loop: Header=BB0_4 Depth=1
	cmp	x12, #16
	b.hs	LBB0_8
; %bb.7:                                ;   in Loop: Header=BB0_4 Depth=1
	mov	x26, #0                         ; =0x0
	b	LBB0_12
LBB0_8:                                 ;   in Loop: Header=BB0_4 Depth=1
	and	x24, x12, #0xfffffffffffffff0
	mov	x25, x8
LBB0_9:                                 ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x26, x0, x25
	ldur	q5, [x26, #4]
	ldur	q6, [x26, #20]
	ldur	q7, [x26, #36]
	ldur	q16, [x26, #52]
	add	x26, x4, x25
	ldp	q17, q18, [x26]
	ldp	q19, q20, [x26, #32]
	fmul.4s	v17, v17, v1[0]
	fmul.4s	v18, v18, v1[0]
	fmul.4s	v19, v19, v1[0]
	fmul.4s	v20, v20, v1[0]
	fmla.4s	v17, v5, v0[0]
	fmla.4s	v18, v6, v0[0]
	fmla.4s	v19, v7, v0[0]
	fmla.4s	v20, v16, v0[0]
	ldur	q5, [x26, #4]
	ldur	q6, [x26, #20]
	ldur	q7, [x26, #36]
	ldur	q16, [x26, #52]
	fmla.4s	v17, v5, v2[0]
	fmla.4s	v18, v6, v2[0]
	fmla.4s	v19, v7, v2[0]
	fmla.4s	v20, v16, v2[0]
	ldur	q5, [x26, #8]
	ldur	q6, [x26, #24]
	ldur	q7, [x26, #40]
	ldur	q16, [x26, #56]
	fmla.4s	v17, v5, v3[0]
	fmla.4s	v18, v6, v3[0]
	fmla.4s	v19, v7, v3[0]
	fmla.4s	v20, v16, v3[0]
	add	x26, x3, x25
	ldp	q5, q6, [x26, #-48]
	ldp	q7, q16, [x26, #-16]
	fmla.4s	v17, v5, v4[0]
	fmla.4s	v18, v6, v4[0]
	fmla.4s	v19, v7, v4[0]
	fmla.4s	v20, v16, v4[0]
	add	x26, x17, x25
	stp	q17, q18, [x26, #-32]
	stp	q19, q20, [x26]
	add	x25, x25, #64
	subs	x24, x24, #16
	b.ne	LBB0_9
; %bb.10:                               ;   in Loop: Header=BB0_4 Depth=1
	cmp	x12, x14
	b.eq	LBB0_3
; %bb.11:                               ;   in Loop: Header=BB0_4 Depth=1
	and	x26, x12, #0xfffffffffffffff0
	orr	x28, x14, #0x1
	and	x13, x12, #0xc
	cbz	x13, LBB0_15
LBB0_12:                                ;   in Loop: Header=BB0_4 Depth=1
	lsl	x27, x26, #2
	add	x24, x5, x27
	add	x25, x26, x6
	lsl	x28, x25, #2
	add	x25, x2, x28
	add	x26, x7, x26
	add	x27, x19, x27
	add	x28, x0, x28
LBB0_13:                                ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q5, [x24], #16
	ldur	q6, [x28, #-4]
	fmul.4s	v6, v6, v1[0]
	fmla.4s	v6, v5, v0[0]
	ldr	q5, [x28]
	fmla.4s	v6, v5, v2[0]
	ldur	q5, [x28, #4]
	ldr	q7, [x27], #16
	fmla.4s	v6, v5, v3[0]
	fmla.4s	v6, v7, v4[0]
	str	q6, [x25], #16
	add	x28, x28, #16
	adds	x26, x26, #4
	b.ne	LBB0_13
; %bb.14:                               ;   in Loop: Header=BB0_4 Depth=1
	orr	x28, x15, #0x1
	cmp	x12, x15
	b.eq	LBB0_3
LBB0_15:                                ;   in Loop: Header=BB0_4 Depth=1
	mov	x24, #0                         ; =0x0
	lsl	x26, x28, #2
	add	x25, x1, x26
	add	x26, x23, x26
	add	x27, x28, x22
	lsl	x30, x27, #2
	add	x27, x2, x30
	sub	x28, x10, x28
	add	x30, x20, x30
LBB0_16:                                ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	s5, [x26, x24]
	add	x13, x30, x24
	ldp	s6, s7, [x13]
	fmul	s6, s1, s6
	fmadd	s5, s0, s5, s6
	fmadd	s5, s2, s7, s5
	ldr	s6, [x13, #8]
	ldr	s7, [x25, x24]
	fmadd	s5, s3, s6, s5
	fmadd	s5, s4, s7, s5
	str	s5, [x27, x24]
	add	x24, x24, #4
	subs	x28, x28, #1
	b.ne	LBB0_16
	b	LBB0_3
LBB0_17:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #96             ; 16-byte Folded Reload
LBB0_18:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_star3_scalar_novec             ; -- Begin function star3_scalar_novec
	.p2align	2
_star3_scalar_novec:                    ; @star3_scalar_novec
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	x0, [sp, #40]
	str	x1, [sp, #32]
	str	x2, [sp, #24]
	str	w3, [sp, #20]
	str	w4, [sp, #16]
	mov	w8, #1                          ; =0x1
	str	w8, [sp, #12]
LBB1_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_4 Depth 2
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #20]
	sub	w9, w9, #1
	cmp	w8, w9
	b.lt	LBB1_3
; %bb.2:
	mov	w8, #2                          ; =0x2
	str	w8, [sp, #8]
	b	LBB1_10
LBB1_3:                                 ;   in Loop: Header=BB1_1 Depth=1
	mov	w8, #1                          ; =0x1
	str	w8, [sp, #4]
LBB1_4:                                 ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #4]
	ldr	w9, [sp, #16]
	sub	w9, w9, #1
	cmp	w8, w9
	b.lt	LBB1_6
; %bb.5:                                ;   in Loop: Header=BB1_1 Depth=1
	mov	w8, #5                          ; =0x5
	str	w8, [sp, #8]
	b	LBB1_8
LBB1_6:                                 ;   in Loop: Header=BB1_4 Depth=2
	ldr	x8, [sp, #32]
	ldr	s0, [x8]
	ldr	x8, [sp, #40]
	ldr	w9, [sp, #12]
	sub	w9, w9, #1
	ldr	w10, [sp, #16]
	ldr	w11, [sp, #4]
	madd	w9, w9, w10, w11
	sxtw	x9, w9
	mov	x10, #4                         ; =0x4
	madd	x8, x9, x10, x8
	ldr	s1, [x8]
	ldr	x8, [sp, #32]
	ldr	s2, [x8, #4]
	ldr	x8, [sp, #40]
	ldr	w9, [sp, #12]
	ldr	w10, [sp, #16]
	ldr	w11, [sp, #4]
	madd	w9, w9, w10, w11
	sub	w9, w9, #1
	sxtw	x9, w9
	mov	x10, #4                         ; =0x4
	madd	x8, x9, x10, x8
	ldr	s3, [x8]
	fmul	s2, s2, s3
	fmadd	s0, s0, s1, s2
	ldr	x8, [sp, #32]
	ldr	s1, [x8, #8]
	ldr	x8, [sp, #40]
	ldr	w9, [sp, #12]
	ldr	w10, [sp, #16]
	ldr	w11, [sp, #4]
	madd	w9, w9, w10, w11
	sxtw	x9, w9
	mov	x10, #4                         ; =0x4
	madd	x8, x9, x10, x8
	ldr	s2, [x8]
	fmadd	s0, s1, s2, s0
	ldr	x8, [sp, #32]
	ldr	s1, [x8, #12]
	ldr	x8, [sp, #40]
	ldr	w9, [sp, #12]
	ldr	w10, [sp, #16]
	ldr	w11, [sp, #4]
	madd	w9, w9, w10, w11
	add	w9, w9, #1
	sxtw	x9, w9
	mov	x10, #4                         ; =0x4
	madd	x8, x9, x10, x8
	ldr	s2, [x8]
	fmadd	s0, s1, s2, s0
	ldr	x8, [sp, #32]
	ldr	s1, [x8, #16]
	ldr	x8, [sp, #40]
	ldr	w9, [sp, #12]
	add	w9, w9, #1
	ldr	w10, [sp, #16]
	ldr	w11, [sp, #4]
	madd	w9, w9, w10, w11
	sxtw	x9, w9
	mov	x10, #4                         ; =0x4
	madd	x8, x9, x10, x8
	ldr	s2, [x8]
	fmadd	s0, s1, s2, s0
	ldr	x8, [sp, #24]
	ldr	w9, [sp, #12]
	ldr	w10, [sp, #16]
	ldr	w11, [sp, #4]
	madd	w9, w9, w10, w11
	sxtw	x9, w9
	mov	x10, #4                         ; =0x4
	madd	x8, x9, x10, x8
	str	s0, [x8]
; %bb.7:                                ;   in Loop: Header=BB1_4 Depth=2
	ldr	w8, [sp, #4]
	add	w8, w8, #1
	str	w8, [sp, #4]
	b	LBB1_4
LBB1_8:                                 ;   in Loop: Header=BB1_1 Depth=1
	b	LBB1_9
LBB1_9:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB1_1
LBB1_10:
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_star3_neon_x4                  ; -- Begin function star3_neon_x4
	.p2align	2
_star3_neon_x4:                         ; @star3_neon_x4
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #144
	stp	x28, x27, [sp, #48]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #64]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #80]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #96]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #112]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #128]            ; 16-byte Folded Spill
	.cfi_def_cfa_offset 144
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
                                        ; kill: def $w4 killed $w4 def $x4
	str	x2, [sp, #40]                   ; 8-byte Spill
	cmp	w3, #3
	b.lt	LBB2_25
; %bb.1:
	ldp	s0, s1, [x1]
	ldp	s2, s3, [x1, #8]
	sub	w9, w3, #1
	sub	w8, w4, #1
	ldr	s4, [x1, #16]
	subs	w13, w4, #6
	b.lt	LBB2_19
; %bb.2:
	mov	w10, w4
	and	w7, w13, #0xfffffffc
	add	w11, w7, #5
	add	x12, x7, #5
	sub	x19, x8, #5
	and	x16, x19, #0x3
	sub	x14, x19, x7
	and	x15, x19, #0x3
	str	x15, [sp, #24]                  ; 8-byte Spill
	sub	x15, x14, x16
	add	x15, x12, x15
	str	x15, [sp, #16]                  ; 8-byte Spill
	add	x1, x0, #4
	ubfiz	x3, x4, #2, #32
	ldr	x15, [sp, #40]                  ; 8-byte Reload
	add	x5, x15, #4
	ubfiz	x4, x4, #3, #32
	lsl	x13, x13, #2
	and	x6, x13, #0x3fffffff0
	add	x23, x0, #68
	add	x13, x3, x0
	add	x17, x13, #72
	add	x20, x0, x4
	add	x16, x20, #36
	add	x13, x3, x15
	add	x15, x13, #68
	bfxil	x7, x19, #0, #2
	sub	x13, x7, x8
	add	x13, x13, #5
	str	x13, [sp, #8]                   ; 8-byte Spill
	add	x13, x6, x0
	add	x24, x13, #20
	add	x25, x24, x4
	mov	x2, x12
	add	x26, x12, x10
	sub	x12, x0, #4
	str	x12, [sp, #32]                  ; 8-byte Spill
	mov	w28, #1                         ; =0x1
	mov	x30, x10
	b	LBB2_4
LBB2_3:                                 ;   in Loop: Header=BB2_4 Depth=1
	add	x1, x1, x3
	add	x5, x5, x3
	add	x23, x23, x3
	add	x17, x17, x3
	add	x16, x16, x3
	add	x15, x15, x3
	add	x25, x25, x3
	add	x26, x26, x10
	add	x24, x24, x3
	add	x20, x20, x3
	add	x0, x0, x3
	add	x30, x30, x10
	cmp	x28, x9
	b.eq	LBB2_25
LBB2_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_5 Depth 2
                                        ;     Child Loop BB2_11 Depth 2
                                        ;     Child Loop BB2_15 Depth 2
                                        ;     Child Loop BB2_18 Depth 2
	add	x28, x28, #1
	mov	x13, x5
	mov	x7, x1
	mov	w19, #5                         ; =0x5
LBB2_5:                                 ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q5, [x7]
	fmul.4s	v5, v5, v0[0]
	add	x12, x7, x3
	ldur	q6, [x12, #-4]
	fmla.4s	v5, v6, v1[0]
	ldr	q6, [x12]
	fmla.4s	v5, v6, v2[0]
	ldur	q6, [x12, #4]
	fmla.4s	v5, v6, v3[0]
	ldr	q6, [x7, x4]
	fmla.4s	v5, v6, v4[0]
	str	q5, [x13, x3]
	add	x19, x19, #4
	add	x7, x7, #16
	add	x13, x13, #16
	cmp	x19, x10
	b.lo	LBB2_5
; %bb.6:                                ;   in Loop: Header=BB2_4 Depth=1
	cmp	w11, w8
	b.ge	LBB2_3
; %bb.7:                                ;   in Loop: Header=BB2_4 Depth=1
	mov	x22, x2
	cmp	x14, #4
	b.lo	LBB2_17
; %bb.8:                                ;   in Loop: Header=BB2_4 Depth=1
	cmp	x14, #16
	b.hs	LBB2_10
; %bb.9:                                ;   in Loop: Header=BB2_4 Depth=1
	mov	x27, #0                         ; =0x0
	b	LBB2_14
LBB2_10:                                ;   in Loop: Header=BB2_4 Depth=1
	mov	x22, x15
	mov	x21, x16
	mov	x19, x17
	mov	x7, x23
	and	x13, x14, #0xfffffffffffffff0
LBB2_11:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x12, x7, x6
	ldp	q5, q6, [x12, #-48]
	ldp	q7, q16, [x12, #-16]
	add	x12, x19, x6
	ldur	q17, [x12, #-56]
	ldur	q18, [x12, #-40]
	ldur	q19, [x12, #-24]
	ldur	q20, [x12, #-8]
	fmul.4s	v17, v17, v1[0]
	fmul.4s	v18, v18, v1[0]
	fmul.4s	v19, v19, v1[0]
	fmul.4s	v20, v20, v1[0]
	fmla.4s	v17, v5, v0[0]
	fmla.4s	v18, v6, v0[0]
	fmla.4s	v19, v7, v0[0]
	fmla.4s	v20, v16, v0[0]
	ldur	q5, [x12, #-52]
	ldur	q6, [x12, #-36]
	ldur	q7, [x12, #-20]
	ldur	q16, [x12, #-4]
	fmla.4s	v17, v5, v2[0]
	fmla.4s	v18, v6, v2[0]
	fmla.4s	v19, v7, v2[0]
	fmla.4s	v20, v16, v2[0]
	ldp	q5, q6, [x12, #-48]
	ldp	q7, q16, [x12, #-16]
	fmla.4s	v17, v5, v3[0]
	fmla.4s	v18, v6, v3[0]
	fmla.4s	v19, v7, v3[0]
	fmla.4s	v20, v16, v3[0]
	add	x12, x21, x6
	ldp	q5, q6, [x12, #-16]
	ldp	q7, q16, [x12, #16]
	fmla.4s	v17, v5, v4[0]
	fmla.4s	v18, v6, v4[0]
	fmla.4s	v19, v7, v4[0]
	fmla.4s	v20, v16, v4[0]
	add	x12, x22, x6
	stp	q17, q18, [x12, #-48]
	add	x7, x7, #64
	stp	q19, q20, [x12, #-16]
	add	x19, x19, #64
	add	x21, x21, #64
	add	x22, x22, #64
	subs	x13, x13, #16
	b.ne	LBB2_11
; %bb.12:                               ;   in Loop: Header=BB2_4 Depth=1
	and	x12, x14, #0xfffffffffffffff0
	cmp	x14, x12
	b.eq	LBB2_3
; %bb.13:                               ;   in Loop: Header=BB2_4 Depth=1
	and	x27, x14, #0xfffffffffffffff0
	and	x12, x14, #0xfffffffffffffff0
	add	x22, x2, x12
	and	x12, x14, #0xc
	cbz	x12, LBB2_17
LBB2_14:                                ;   in Loop: Header=BB2_4 Depth=1
	mov	x13, #0                         ; =0x0
	ldr	x12, [sp, #8]                   ; 8-byte Reload
	add	x7, x12, x27
	lsl	x12, x27, #2
	add	x19, x25, x12
	add	x22, x27, x26
	add	x21, x24, x12
	add	x12, x10, x27
	ldr	x27, [sp, #40]                  ; 8-byte Reload
	add	x22, x27, x22, lsl #2
	add	x27, x24, x12, lsl #2
LBB2_15:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q5, [x21, x13]
	add	x12, x27, x13
	ldur	q6, [x12, #-4]
	fmul.4s	v6, v6, v1[0]
	fmla.4s	v6, v5, v0[0]
	ldr	q5, [x12]
	fmla.4s	v6, v5, v2[0]
	ldur	q5, [x12, #4]
	ldr	q7, [x19, x13]
	fmla.4s	v6, v5, v3[0]
	fmla.4s	v6, v7, v4[0]
	str	q6, [x22, x13]
	add	x13, x13, #16
	adds	x7, x7, #4
	b.ne	LBB2_15
; %bb.16:                               ;   in Loop: Header=BB2_4 Depth=1
	ldp	x22, x12, [sp, #16]             ; 16-byte Folded Reload
	cbz	x12, LBB2_3
LBB2_17:                                ;   in Loop: Header=BB2_4 Depth=1
	mov	x13, #0                         ; =0x0
	lsl	x12, x22, #2
	add	x7, x20, x12
	add	x19, x0, x12
	add	x12, x22, x30
	lsl	x12, x12, #2
	ldp	x27, x21, [sp, #32]             ; 16-byte Folded Reload
	add	x21, x21, x12
	sub	x22, x8, x22
	add	x27, x27, x12
LBB2_18:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	s5, [x19, x13]
	add	x12, x27, x13
	ldp	s6, s7, [x12]
	fmul	s6, s1, s6
	fmadd	s5, s0, s5, s6
	fmadd	s5, s2, s7, s5
	ldr	s6, [x12, #8]
	ldr	s7, [x7, x13]
	fmadd	s5, s3, s6, s5
	fmadd	s5, s4, s7, s5
	str	s5, [x21, x13]
	add	x13, x13, #4
	subs	x22, x22, #1
	b.ne	LBB2_18
	b	LBB2_3
LBB2_19:
	cmp	w4, #3
	b.lt	LBB2_25
; %bb.20:
                                        ; kill: def $w4 killed $w4 killed $x4 def $x4
	ubfiz	x10, x4, #3, #32
	ubfiz	x11, x4, #2, #32
	sub	x9, x9, #1
	ldr	x12, [sp, #40]                  ; 8-byte Reload
	add	x12, x11, x12
	add	x12, x12, #8
	b	LBB2_22
LBB2_21:                                ;   in Loop: Header=BB2_22 Depth=1
	add	x12, x12, x11
	mov	x0, x13
	subs	x9, x9, #1
	b.eq	LBB2_25
LBB2_22:                                ; =>This Inner Loop Header: Depth=1
	ldr	s5, [x0, #4]
	add	x13, x0, x11
	ldp	s6, s7, [x13]
	fmul	s6, s1, s6
	fmadd	s5, s0, s5, s6
	fmadd	s5, s2, s7, s5
	ldr	s6, [x13, #8]
	fmadd	s5, s3, s6, s5
	add	x14, x0, x10
	ldr	s6, [x14, #4]
	fmadd	s5, s4, s6, s5
	stur	s5, [x12, #-4]
	cmp	w8, #2
	b.eq	LBB2_21
; %bb.23:                               ;   in Loop: Header=BB2_22 Depth=1
	ldr	s5, [x0, #8]
	ldp	s6, s7, [x13, #4]
	fmul	s6, s1, s6
	fmadd	s5, s0, s5, s6
	fmadd	s5, s2, s7, s5
	ldr	s6, [x13, #12]
	fmadd	s5, s3, s6, s5
	ldr	s6, [x14, #8]
	fmadd	s5, s4, s6, s5
	str	s5, [x12]
	cmp	w8, #3
	b.eq	LBB2_21
; %bb.24:                               ;   in Loop: Header=BB2_22 Depth=1
	ldr	s5, [x0, #12]
	add	x14, x0, x11
	ldp	s6, s7, [x14, #8]
	fmul	s6, s1, s6
	fmadd	s5, s0, s5, s6
	fmadd	s5, s2, s7, s5
	ldr	s6, [x14, #16]
	fmadd	s5, s3, s6, s5
	add	x14, x0, x10
	ldr	s6, [x14, #12]
	fmadd	s5, s4, s6, s5
	str	s5, [x12, #4]
	b	LBB2_21
LBB2_25:
	ldp	x29, x30, [sp, #128]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #112]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #80]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #64]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #144
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_star3_sve_load5                ; -- Begin function star3_sve_load5
	.p2align	2
_star3_sve_load5:                       ; @star3_sve_load5
	.cfi_startproc
; %bb.0:
	stp	d15, d14, [sp, #-128]!          ; 16-byte Folded Spill
	.cfi_def_cfa_offset 128
	stp	d13, d12, [sp, #16]             ; 16-byte Folded Spill
	stp	d11, d10, [sp, #32]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #48]               ; 16-byte Folded Spill
	stp	x24, x23, [sp, #64]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #80]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #96]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset b8, -72
	.cfi_offset b9, -80
	.cfi_offset b10, -88
	.cfi_offset b11, -96
	.cfi_offset b12, -104
	.cfi_offset b13, -112
	.cfi_offset b14, -120
	.cfi_offset b15, -128
                                        ; kill: def $w4 killed $w4 def $x4
	smstart	sm
	cmp	w3, #3
	b.lt	LBB3_13
; %bb.1:
	ldp	s0, s1, [x1]
	ldp	s2, s3, [x1, #8]
	sub	w8, w3, #1
	sub	w9, w4, #1
	ldr	s4, [x1, #16]
	subs	w15, w4, #18
	b.lt	LBB3_8
; %bb.2:
	and	w3, w15, #0xfffffff0
	add	w10, w3, #17
	mov	z5.s, s0
	ubfiz	x11, x4, #2, #32
	add	x12, x0, x11
	mov	z6.s, s1
	ubfiz	x17, x4, #3, #32
	add	x13, x17, x0
	mov	z7.s, s2
	add	x13, x13, #4
	add	x14, x11, x2
	mov	z16.s, s3
	add	x14, x14, #4
	lsl	x15, x15, #2
	mov	z17.s, s4
	and	x15, x15, #0x3ffffffc0
	add	x16, x0, #68
	add	x17, x16, x17
	add	x5, x11, #68
	add	x1, x2, x5
	sub	x2, x9, x3
	sub	x2, x2, #17
	add	x3, x0, x5
	ptrue	p0.s
	mov	w5, #1                          ; =0x1
	mov	x6, #1                          ; =0x1
	mov	x7, #2                          ; =0x2
	mov	w4, w4
	b	LBB3_4
LBB3_3:                                 ;   in Loop: Header=BB3_4 Depth=1
	add	x0, x0, x11
	add	x12, x12, x11
	add	x13, x13, x11
	add	x14, x14, x11
	add	x17, x17, x11
	add	x16, x16, x11
	add	x1, x1, x11
	add	x3, x3, x11
	cmp	x5, x8
	b.eq	LBB3_13
LBB3_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_5 Depth 2
                                        ;     Child Loop BB3_7 Depth 2
	mov	x19, #0                         ; =0x0
	add	x5, x5, #1
LBB3_5:                                 ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lsl	x20, x19, #2
	add	x21, x0, x20
	ld1w	{ z18.s }, p0/z, [x21, x6, lsl #2]
	fmul	z18.s, z5.s, z18.s
	add	x20, x12, x20
	ld1w	{ z19.s }, p0/z, [x12, x19, lsl #2]
	fmla	z18.s, p0/m, z19.s, z6.s
	ld1w	{ z19.s }, p0/z, [x20, x6, lsl #2]
	fmla	z18.s, p0/m, z19.s, z7.s
	ld1w	{ z19.s }, p0/z, [x20, x7, lsl #2]
	fmla	z18.s, p0/m, z19.s, z16.s
	ld1w	{ z19.s }, p0/z, [x13, x19, lsl #2]
	fmla	z18.s, p0/m, z19.s, z17.s
	st1w	{ z18.s }, p0, [x14, x19, lsl #2]
	add	x20, x19, #33
	add	x19, x19, #16
	cmp	x20, x4
	b.lo	LBB3_5
; %bb.6:                                ;   in Loop: Header=BB3_4 Depth=1
	mov	x19, x3
	mov	x20, x2
	mov	x21, x1
	mov	x22, x16
	mov	x23, x17
	cmp	w10, w9
	b.ge	LBB3_3
LBB3_7:                                 ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x24, x19, x15
	ldr	s18, [x22, x15]
	ldp	s19, s20, [x24, #-4]
	fmul	s19, s1, s19
	fmadd	s18, s0, s18, s19
	fmadd	s18, s2, s20, s18
	ldr	s19, [x24, #4]
	fmadd	s18, s3, s19, s18
	ldr	s19, [x23, x15]
	fmadd	s18, s4, s19, s18
	str	s18, [x21, x15]
	add	x23, x23, #4
	add	x22, x22, #4
	add	x21, x21, #4
	add	x19, x19, #4
	subs	x20, x20, #1
	b.ne	LBB3_7
	b	LBB3_3
LBB3_8:
	cmp	w4, #3
	b.lt	LBB3_13
; %bb.9:
	add	x10, x0, w4, uxtw #3
	add	x10, x10, #4
                                        ; kill: def $w4 killed $w4 killed $x4 def $x4
	ubfiz	x11, x4, #2, #32
	add	x12, x11, x2
	add	x12, x12, #4
	ubfiz	x9, x9, #2, #32
	sub	x9, x9, #4
	add	x13, x0, x11
	mov	w14, #1                         ; =0x1
LBB3_10:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_11 Depth 2
	mov	x15, #0                         ; =0x0
	add	x14, x14, #1
LBB3_11:                                ;   Parent Loop BB3_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x16, x0, x15
	ldr	s5, [x16, #4]
	add	x16, x13, x15
	ldp	s6, s7, [x16]
	fmul	s6, s1, s6
	fmadd	s5, s0, s5, s6
	fmadd	s5, s2, s7, s5
	ldr	s6, [x16, #8]
	ldr	s7, [x10, x15]
	fmadd	s5, s3, s6, s5
	fmadd	s5, s4, s7, s5
	str	s5, [x12, x15]
	add	x15, x15, #4
	cmp	x9, x15
	b.ne	LBB3_11
; %bb.12:                               ;   in Loop: Header=BB3_10 Depth=1
	add	x10, x10, x11
	add	x0, x0, x11
	add	x12, x12, x11
	add	x13, x13, x11
	cmp	x14, x8
	b.ne	LBB3_10
LBB3_13:
	smstop	sm
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #48]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #32]             ; 16-byte Folded Reload
	ldp	d13, d12, [sp, #16]             ; 16-byte Folded Reload
	ldp	d15, d14, [sp], #128            ; 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	.cfi_restore w23
	.cfi_restore w24
	.cfi_restore b8
	.cfi_restore b9
	.cfi_restore b10
	.cfi_restore b11
	.cfi_restore b12
	.cfi_restore b13
	.cfi_restore b14
	.cfi_restore b15
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_star3_neon_rb4                 ; -- Begin function star3_neon_rb4
	.p2align	2
_star3_neon_rb4:                        ; @star3_neon_rb4
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #320
	stp	d9, d8, [sp, #208]              ; 16-byte Folded Spill
	stp	x28, x27, [sp, #224]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #240]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #256]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #272]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #288]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #304]            ; 16-byte Folded Spill
	.cfi_def_cfa_offset 320
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	mov	x15, x4
	ldp	s0, s1, [x1]
	ldp	s2, s3, [x1, #8]
	sub	w14, w3, #1
	ldr	s4, [x1, #16]
	cmp	w3, #6
	str	x14, [sp, #160]                 ; 8-byte Spill
	str	x2, [sp, #200]                  ; 8-byte Spill
	b.lt	LBB4_20
; %bb.1:
	mov	x17, #0                         ; =0x0
	mov	x12, #0                         ; =0x0
	sub	w8, w15, #1
	sxtw	x11, w15
	sub	w9, w15, #18
	and	w9, w9, #0xfffffff0
	add	w9, w9, #17
	str	w9, [sp, #20]                   ; 4-byte Spill
	sxtw	x13, w8
	sub	x8, x14, #7
	str	x8, [sp, #40]                   ; 8-byte Spill
	sbfiz	x3, x15, #4, #32
	sbfiz	x16, x15, #2, #32
	add	x25, x2, x16
	add	x1, x25, #4
	add	x28, x0, x16
	add	x5, x28, #32
	sbfiz	x8, x15, #3, #32
	add	x6, x0, x8
	add	x7, x6, #32
	add	x9, x11, w15, sxtw #1
	lsl	x9, x9, #2
	add	x19, x0, x9
	add	x20, x19, #32
	add	x21, x0, x3
	add	x22, x21, #32
	mov	w10, #20                        ; =0x14
	smaddl	x23, w15, w10, x0
	add	x24, x23, #52
	add	x30, x2, x3
	add	x27, x2, x9
	add	x26, x2, x8
	sxtw	x8, w14
	stp	x8, x3, [sp, #24]               ; 16-byte Folded Spill
	mov	w9, #4                          ; =0x4
	mov	x8, #-1                         ; =0xffffffffffffffff
	stp	x0, x8, [sp, #184]              ; 16-byte Folded Spill
	mov	w4, #1                          ; =0x1
	mov	w2, #2                          ; =0x2
	str	x0, [sp, #176]                  ; 8-byte Spill
	mov	x3, x15
	str	x15, [sp, #56]                  ; 8-byte Spill
	b	LBB4_3
LBB4_2:                                 ;   in Loop: Header=BB4_3 Depth=1
	ldp	x12, x9, [sp, #168]             ; 16-byte Folded Reload
	add	x12, x12, #1
	ldp	x25, x17, [sp, #144]            ; 16-byte Folded Reload
	ldr	x8, [sp, #32]                   ; 8-byte Reload
	add	x17, x17, x8
	add	x9, x9, x8
	str	x9, [sp, #176]                  ; 8-byte Spill
	ldp	x28, x2, [sp, #64]              ; 16-byte Folded Reload
	add	x28, x28, x8
	ldp	x27, x30, [sp, #96]             ; 16-byte Folded Reload
	add	x30, x30, x8
	add	x27, x27, x8
	ldp	x9, x26, [sp, #80]              ; 16-byte Folded Reload
	add	x26, x26, x8
	add	x25, x25, x8
	ldp	x23, x21, [sp, #112]            ; 16-byte Folded Reload
	add	x23, x23, x8
	add	x21, x21, x8
	ldp	x19, x6, [sp, #128]             ; 16-byte Folded Reload
	add	x19, x19, x8
	add	x6, x6, x8
	add	w9, w9, #4
	add	x2, x2, #4
	ldr	x8, [sp, #192]                  ; 8-byte Reload
	sub	x10, x8, #4
	ldr	x8, [sp, #184]                  ; 8-byte Reload
	add	x8, x8, #16
	stp	x8, x10, [sp, #184]             ; 16-byte Folded Spill
	ldr	x8, [sp, #40]                   ; 8-byte Reload
	cmp	x15, x8
	ldr	x14, [sp, #160]                 ; 8-byte Reload
	ldr	x3, [sp, #56]                   ; 8-byte Reload
	b.ge	LBB4_21
LBB4_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_5 Depth 2
                                        ;     Child Loop BB4_10 Depth 2
                                        ;     Child Loop BB4_14 Depth 2
                                        ;       Child Loop BB4_16 Depth 3
                                        ;       Child Loop BB4_19 Depth 3
	mov	x15, x4
	str	x9, [sp, #80]                   ; 8-byte Spill
	sxtw	x8, w9
	add	x9, x8, #1
	ldr	x10, [sp, #24]                  ; 8-byte Reload
	cmp	x9, x10
	csinc	x8, x10, x8, ge
	cmp	x8, x2
	csel	x8, x8, x2, gt
	str	x8, [sp, #48]                   ; 8-byte Spill
	lsl	w8, w12, #2
	add	w8, w8, #5
	cmp	w8, w14
	csel	w8, w8, w14, lt
	sxtw	x8, w8
	mov	w9, #2                          ; =0x2
	bfi	x9, x12, #2, #62
	cmp	x8, x9
	csel	x14, x8, x9, gt
	cmp	w3, #18
	str	x17, [sp, #152]                 ; 8-byte Spill
	str	x12, [sp, #168]                 ; 8-byte Spill
	b.lt	LBB4_7
; %bb.4:                                ;   in Loop: Header=BB4_3 Depth=1
	mov	w9, #17                         ; =0x11
LBB4_5:                                 ;   Parent Loop BB4_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x8, x0, x17
	ldur	q5, [x8, #4]
	ldur	q6, [x8, #20]
	ldur	q7, [x8, #36]
	ldur	q16, [x8, #52]
	add	x8, x5, x17
	ldp	q28, q25, [x8, #-32]
	ldp	q24, q22, [x8]
	ldur	q17, [x8, #-28]
	ldur	q18, [x8, #-12]
	ldur	q20, [x8, #4]
	ldur	q19, [x8, #20]
	ldur	q29, [x8, #-24]
	ldur	q27, [x8, #-8]
	ldur	q26, [x8, #8]
	ldur	q23, [x8, #24]
	add	x8, x7, x17
	ldp	q21, q30, [x8, #-32]
	fmul.4s	v5, v5, v0[0]
	fmla.4s	v5, v28, v1[0]
	fmla.4s	v5, v17, v2[0]
	fmla.4s	v5, v29, v3[0]
	ldp	q31, q29, [x8]
	fmul.4s	v6, v6, v0[0]
	fmla.4s	v6, v25, v1[0]
	fmla.4s	v6, v18, v2[0]
	fmla.4s	v6, v27, v3[0]
	ldur	q28, [x8, #-28]
	fmul.4s	v7, v7, v0[0]
	fmla.4s	v7, v24, v1[0]
	ldur	q25, [x8, #-12]
	fmla.4s	v7, v20, v2[0]
	fmla.4s	v7, v26, v3[0]
	ldur	q27, [x8, #4]
	fmul.4s	v16, v16, v0[0]
	fmla.4s	v16, v22, v1[0]
	ldur	q26, [x8, #20]
	fmla.4s	v16, v19, v2[0]
	fmla.4s	v16, v23, v3[0]
	ldur	q22, [x8, #-24]
	fmul.4s	v17, v17, v0[0]
	fmla.4s	v17, v21, v1[0]
	ldur	q21, [x8, #-8]
	fmla.4s	v17, v28, v2[0]
	fmla.4s	v17, v22, v3[0]
	ldur	q22, [x8, #8]
	fmul.4s	v18, v18, v0[0]
	fmla.4s	v18, v30, v1[0]
	ldur	q23, [x8, #24]
	add	x8, x20, x17
	fmla.4s	v18, v25, v2[0]
	fmla.4s	v18, v21, v3[0]
	ldp	q21, q30, [x8, #-32]
	fmul.4s	v20, v20, v0[0]
	fmla.4s	v20, v31, v1[0]
	fmla.4s	v20, v27, v2[0]
	fmla.4s	v20, v22, v3[0]
	fmul.4s	v22, v19, v0[0]
	fmla.4s	v22, v29, v1[0]
	ldp	q31, q29, [x8]
	fmla.4s	v22, v26, v2[0]
	fmla.4s	v22, v23, v3[0]
	ldur	q8, [x8, #-28]
	fmla.4s	v5, v28, v4[0]
	fmul.4s	v24, v28, v0[0]
	fmla.4s	v24, v21, v1[0]
	ldur	q19, [x8, #-24]
	fmla.4s	v24, v8, v2[0]
	fmla.4s	v24, v19, v3[0]
	ldur	q19, [x8, #-12]
	fmla.4s	v6, v25, v4[0]
	fmul.4s	v25, v25, v0[0]
	fmla.4s	v25, v30, v1[0]
	ldur	q21, [x8, #-8]
	fmla.4s	v25, v19, v2[0]
	fmla.4s	v25, v21, v3[0]
	ldur	q21, [x8, #4]
	fmla.4s	v7, v27, v4[0]
	fmul.4s	v27, v27, v0[0]
	fmla.4s	v27, v31, v1[0]
	ldur	q23, [x8, #8]
	fmla.4s	v27, v21, v2[0]
	fmla.4s	v27, v23, v3[0]
	ldur	q23, [x8, #20]
	fmla.4s	v16, v26, v4[0]
	fmul.4s	v28, v26, v0[0]
	fmla.4s	v28, v29, v1[0]
	ldur	q26, [x8, #24]
	add	x8, x22, x17
	fmla.4s	v28, v23, v2[0]
	fmla.4s	v28, v26, v3[0]
	ldur	q29, [x8, #-32]
	fmla.4s	v17, v8, v4[0]
	fmul.4s	v26, v8, v0[0]
	fmla.4s	v26, v29, v1[0]
	add	x10, x1, x17
	add	x12, x10, x16
	stp	q5, q6, [x10]
	stp	q7, q16, [x10, #32]
	fmla.4s	v18, v19, v4[0]
	stp	q17, q18, [x12]
	fmla.4s	v20, v21, v4[0]
	fmla.4s	v22, v23, v4[0]
	stp	q20, q22, [x12, #32]
	ldur	q5, [x8, #-28]
	ldur	q6, [x8, #-12]
	fmla.4s	v24, v5, v4[0]
	fmla.4s	v25, v6, v4[0]
	add	x10, x12, x16
	add	x12, x10, x16
	stp	q24, q25, [x10]
	ldur	q7, [x8, #4]
	ldur	q16, [x8, #20]
	fmla.4s	v27, v7, v4[0]
	fmla.4s	v28, v16, v4[0]
	stp	q27, q28, [x10, #32]
	ldur	q17, [x8, #-24]
	add	x10, x24, x17
	fmla.4s	v26, v5, v2[0]
	fmla.4s	v26, v17, v3[0]
	ldp	q5, q17, [x10, #-48]
	fmla.4s	v26, v5, v4[0]
	ldur	q5, [x8, #-16]
	fmul.4s	v18, v19, v0[0]
	fmla.4s	v18, v5, v1[0]
	fmla.4s	v18, v6, v2[0]
	ldur	q5, [x8, #-8]
	fmla.4s	v18, v5, v3[0]
	fmla.4s	v18, v17, v4[0]
	ldr	q5, [x8]
	fmul.4s	v6, v21, v0[0]
	fmla.4s	v6, v5, v1[0]
	ldur	q5, [x8, #8]
	fmla.4s	v6, v7, v2[0]
	fmla.4s	v6, v5, v3[0]
	ldp	q5, q7, [x10, #-16]
	fmla.4s	v6, v5, v4[0]
	ldr	q5, [x8, #16]
	fmul.4s	v17, v23, v0[0]
	fmla.4s	v17, v5, v1[0]
	fmla.4s	v17, v16, v2[0]
	ldur	q5, [x8, #24]
	fmla.4s	v17, v5, v3[0]
	fmla.4s	v17, v7, v4[0]
	stp	q26, q18, [x12]
	stp	q6, q17, [x12, #32]
	add	x9, x9, #16
	add	x17, x17, #64
	cmp	x9, x11
	b.lt	LBB4_5
; %bb.6:                                ;   in Loop: Header=BB4_3 Depth=1
	ldr	w9, [sp, #20]                   ; 4-byte Reload
	b	LBB4_8
LBB4_7:                                 ;   in Loop: Header=BB4_3 Depth=1
	mov	w9, #1                          ; =0x1
LBB4_8:                                 ;   in Loop: Header=BB4_3 Depth=1
	stp	x28, x2, [sp, #64]              ; 16-byte Folded Spill
	add	w8, w9, #4
	cmp	w8, w3
	stp	x6, x25, [sp, #136]             ; 16-byte Folded Spill
	stp	x21, x19, [sp, #120]            ; 16-byte Folded Spill
	stp	x30, x23, [sp, #104]            ; 16-byte Folded Spill
	stp	x26, x27, [sp, #88]             ; 16-byte Folded Spill
	b.ge	LBB4_11
; %bb.9:                                ;   in Loop: Header=BB4_3 Depth=1
	sxtw	x8, w9
	add	x17, x8, #4
	sbfiz	x3, x9, #2, #32
	mov	x12, x30
	mov	x8, x28
	ldr	x30, [sp, #176]                 ; 8-byte Reload
LBB4_10:                                ;   Parent Loop BB4_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q5, [x30, x3]
	add	x10, x8, x3
	ldur	q6, [x10, #-4]
	ldr	q7, [x10]
	ldur	q16, [x10, #4]
	add	x10, x6, x3
	ldur	q17, [x10, #-4]
	ldr	q18, [x10]
	ldur	q19, [x10, #4]
	add	x10, x19, x3
	ldur	q20, [x10, #-4]
	ldr	q21, [x10]
	ldur	q22, [x10, #4]
	add	x10, x21, x3
	ldur	q23, [x10, #-4]
	ldr	q24, [x10]
	ldr	q25, [x23, x3]
	ldur	q26, [x10, #4]
	fmul.4s	v5, v5, v0[0]
	fmla.4s	v5, v6, v1[0]
	fmla.4s	v5, v7, v2[0]
	fmla.4s	v5, v16, v3[0]
	fmla.4s	v5, v18, v4[0]
	fmul.4s	v6, v7, v0[0]
	fmla.4s	v6, v17, v1[0]
	fmla.4s	v6, v18, v2[0]
	fmla.4s	v6, v19, v3[0]
	fmla.4s	v6, v21, v4[0]
	fmul.4s	v7, v18, v0[0]
	fmla.4s	v7, v20, v1[0]
	fmla.4s	v7, v21, v2[0]
	fmla.4s	v7, v22, v3[0]
	fmla.4s	v7, v24, v4[0]
	fmul.4s	v16, v21, v0[0]
	fmla.4s	v16, v23, v1[0]
	str	q5, [x25, x3]
	str	q6, [x26, x3]
	str	q7, [x27, x3]
	fmla.4s	v16, v24, v2[0]
	fmla.4s	v16, v26, v3[0]
	fmla.4s	v16, v25, v4[0]
	str	q16, [x12, x3]
	add	x17, x17, #4
	add	w9, w9, #4
	add	x30, x30, #16
	add	x8, x8, #16
	add	x12, x12, #16
	add	x27, x27, #16
	add	x26, x26, #16
	add	x25, x25, #16
	add	x23, x23, #16
	add	x21, x21, #16
	add	x19, x19, #16
	add	x6, x6, #16
	cmp	x17, x11
	b.lt	LBB4_10
LBB4_11:                                ;   in Loop: Header=BB4_3 Depth=1
	add	x4, x15, #4
	cmp	w9, w13
	b.ge	LBB4_2
; %bb.12:                               ;   in Loop: Header=BB4_3 Depth=1
	ldr	x8, [sp, #192]                  ; 8-byte Reload
	ldr	x10, [sp, #48]                  ; 8-byte Reload
	add	x8, x10, x8
	mov	x10, x14
	and	x14, x8, #0xfffffffffffffffc
	ldr	x8, [sp, #168]                  ; 8-byte Reload
	mvn	x8, x8, lsl #2
	add	x6, x10, x8
	ldr	x8, [sp, #160]                  ; 8-byte Reload
	add	x10, x15, #4
	cmp	w10, w8
	add	x4, x15, #4
	csel	w8, w10, w8, lt
	sxtw	x19, w8
	mov	x8, x9
	sxtw	x9, w9
	cmp	x6, #3
	ldr	x10, [sp, #56]                  ; 8-byte Reload
	ccmp	w10, #1, #0, hi
	cset	w21, eq
	and	x25, x6, #0xfffffffffffffffc
	add	x10, x15, x9
	lsl	x10, x10, #2
	add	x12, x0, #4
	add	x17, x12, x10
	sbfiz	x2, x8, #2, #32
	ldr	x8, [sp, #184]                  ; 8-byte Reload
	add	x27, x8, x2
	ldr	x8, [sp, #200]                  ; 8-byte Reload
	add	x12, x8, x10
	b	LBB4_14
LBB4_13:                                ;   in Loop: Header=BB4_14 Depth=2
	add	x9, x9, #1
	add	x17, x17, #4
	add	x27, x27, #4
	add	x12, x12, #4
	add	x2, x2, #4
	cmp	x9, x13
	b.eq	LBB4_2
LBB4_14:                                ;   Parent Loop BB4_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB4_16 Depth 3
                                        ;       Child Loop BB4_19 Depth 3
	mov	x8, x15
	cbz	w21, LBB4_18
; %bb.15:                               ;   in Loop: Header=BB4_14 Depth=2
	mov	x8, x12
	mov	x30, x27
	mov	x23, x17
	mov	x3, x14
LBB4_16:                                ;   Parent Loop BB4_3 Depth=1
                                        ;     Parent Loop BB4_14 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q5, [x30]
	fmul.4s	v6, v5, v1[0]
	fmla.4s	v6, v5, v0[0]
	ldur	q5, [x30, #4]
	fmla.4s	v6, v5, v2[0]
	ldr	q5, [x23], #16
	fmla.4s	v6, v5, v3[0]
	ldur	q5, [x30, #8]
	fmla.4s	v6, v5, v4[0]
	str	q6, [x8], #16
	add	x30, x30, #16
	subs	x3, x3, #4
	b.ne	LBB4_16
; %bb.17:                               ;   in Loop: Header=BB4_14 Depth=2
	add	x8, x15, x25
	cmp	x6, x25
	b.eq	LBB4_13
LBB4_18:                                ;   in Loop: Header=BB4_14 Depth=2
	madd	x10, x16, x8, x16
	add	x30, x0, x10
	mul	x10, x16, x8
	sub	x3, x0, #4
	add	x23, x3, x10
	ldr	x3, [sp, #200]                  ; 8-byte Reload
	add	x3, x3, x10
	sub	x10, x8, #1
	madd	x10, x16, x10, x0
	mov	x26, x2
LBB4_19:                                ;   Parent Loop BB4_3 Depth=1
                                        ;     Parent Loop BB4_14 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	s5, [x10, x26]
	add	x28, x23, x26
	ldp	s6, s7, [x28]
	fmul	s6, s1, s6
	fmadd	s5, s0, s5, s6
	fmadd	s5, s2, s7, s5
	ldr	s6, [x28, #8]
	fmadd	s5, s3, s6, s5
	ldr	s6, [x30, x26]
	add	x8, x8, #1
	fmadd	s5, s4, s6, s5
	str	s5, [x3, x26]
	add	x26, x26, x16
	cmp	x8, x19
	b.lt	LBB4_19
	b	LBB4_13
LBB4_20:
	mov	w4, #1                          ; =0x1
	mov	x3, x15
LBB4_21:
	cmp	w4, w14
	b.ge	LBB4_46
; %bb.22:
	sub	w8, w3, #1
	subs	w13, w3, #6
	b.lt	LBB4_40
; %bb.23:
	mov	w9, w3
	mov	w10, w4
	and	w15, w13, #0xfffffffc
	add	w23, w15, #5
	add	x24, x15, #5
	sub	x12, x8, #5
	and	x16, x12, #0x3
	sub	x14, x12, x15
	and	x11, x12, #0x3
	str	x11, [sp, #176]                 ; 8-byte Spill
	sub	x16, x14, x16
	add	x11, x24, x16
	str	x11, [sp, #168]                 ; 8-byte Spill
	sub	x16, x10, #1
	mul	x16, x16, x9
	lsl	x17, x16, #2
	add	x1, x0, x17
	mov	x30, x3
	add	x3, x1, #4
	ubfiz	x11, x30, #2, #32
	umull	x25, w4, w30
	lsl	x16, x25, #2
	ldr	x2, [sp, #200]                  ; 8-byte Reload
	add	x2, x16, x2
	add	x6, x2, #4
	add	x16, x16, x0
	add	x7, x16, #8
	umaddl	x5, w4, w30, x9
	lsl	x22, x5, #2
	add	x19, x0, x22
	add	x20, x19, #4
	lsl	x13, x13, #2
	and	x21, x13, #0x3fffffff0
	add	x5, x1, #68
	add	x13, x16, #72
	add	x26, x19, #36
	add	x16, x2, #68
	bfxil	x15, x12, #0, #2
	sub	x12, x15, x8
	add	x12, x12, #5
	stp	x12, x25, [sp, #144]            ; 16-byte Folded Spill
	add	x12, x21, x0
	add	x27, x12, #20
	add	x28, x27, x22
	umaddl	x30, w4, w30, x24
	mov	x4, x23
	add	x15, x27, x17
	sub	x12, x0, #4
	stp	x12, x24, [sp, #184]            ; 16-byte Folded Spill
	mov	x17, x25
	b	LBB4_25
LBB4_24:                                ;   in Loop: Header=BB4_25 Depth=1
	add	x3, x3, x11
	add	x6, x6, x11
	add	x7, x7, x11
	add	x20, x20, x11
	add	x5, x5, x11
	add	x13, x13, x11
	add	x26, x26, x11
	add	x16, x16, x11
	add	x28, x28, x11
	add	x30, x30, x9
	add	x15, x15, x11
	add	x27, x27, x11
	add	x19, x19, x11
	add	x1, x1, x11
	add	x17, x17, x9
	ldr	x12, [sp, #160]                 ; 8-byte Reload
	cmp	x10, x12
	b.eq	LBB4_46
LBB4_25:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_26 Depth 2
                                        ;     Child Loop BB4_32 Depth 2
                                        ;     Child Loop BB4_36 Depth 2
                                        ;     Child Loop BB4_39 Depth 2
	add	x10, x10, #1
	mov	x0, x20
	mov	x22, x7
	mov	x23, x6
	mov	x24, x3
	mov	w25, #5                         ; =0x5
LBB4_26:                                ;   Parent Loop BB4_25 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q5, [x24], #16
	fmul.4s	v5, v5, v0[0]
	ldur	q6, [x22, #-8]
	fmla.4s	v5, v6, v1[0]
	ldur	q6, [x22, #-4]
	fmla.4s	v5, v6, v2[0]
	ldr	q6, [x22], #16
	fmla.4s	v5, v6, v3[0]
	ldr	q6, [x0], #16
	fmla.4s	v5, v6, v4[0]
	str	q5, [x23], #16
	add	x25, x25, #4
	cmp	x25, x9
	b.lo	LBB4_26
; %bb.27:                               ;   in Loop: Header=BB4_25 Depth=1
	cmp	w4, w8
	b.ge	LBB4_24
; %bb.28:                               ;   in Loop: Header=BB4_25 Depth=1
	ldr	x12, [sp, #192]                 ; 8-byte Reload
	cmp	x14, #4
	b.lo	LBB4_38
; %bb.29:                               ;   in Loop: Header=BB4_25 Depth=1
	cmp	x14, #16
	b.hs	LBB4_31
; %bb.30:                               ;   in Loop: Header=BB4_25 Depth=1
	mov	x2, #0                          ; =0x0
	b	LBB4_35
LBB4_31:                                ;   in Loop: Header=BB4_25 Depth=1
	mov	x25, x16
	mov	x24, x26
	mov	x23, x13
	mov	x22, x5
	and	x0, x14, #0xfffffffffffffff0
LBB4_32:                                ;   Parent Loop BB4_25 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x12, x22, x21
	ldp	q5, q6, [x12, #-48]
	ldp	q7, q16, [x12, #-16]
	add	x12, x23, x21
	ldur	q17, [x12, #-56]
	ldur	q18, [x12, #-40]
	ldur	q19, [x12, #-24]
	ldur	q20, [x12, #-8]
	fmul.4s	v17, v17, v1[0]
	fmul.4s	v18, v18, v1[0]
	fmul.4s	v19, v19, v1[0]
	fmul.4s	v20, v20, v1[0]
	fmla.4s	v17, v5, v0[0]
	fmla.4s	v18, v6, v0[0]
	fmla.4s	v19, v7, v0[0]
	fmla.4s	v20, v16, v0[0]
	ldur	q5, [x12, #-52]
	ldur	q6, [x12, #-36]
	ldur	q7, [x12, #-20]
	ldur	q16, [x12, #-4]
	fmla.4s	v17, v5, v2[0]
	fmla.4s	v18, v6, v2[0]
	fmla.4s	v19, v7, v2[0]
	fmla.4s	v20, v16, v2[0]
	ldp	q5, q6, [x12, #-48]
	ldp	q7, q16, [x12, #-16]
	fmla.4s	v17, v5, v3[0]
	fmla.4s	v18, v6, v3[0]
	fmla.4s	v19, v7, v3[0]
	fmla.4s	v20, v16, v3[0]
	add	x12, x24, x21
	ldp	q5, q6, [x12, #-16]
	ldp	q7, q16, [x12, #16]
	fmla.4s	v17, v5, v4[0]
	fmla.4s	v18, v6, v4[0]
	fmla.4s	v19, v7, v4[0]
	fmla.4s	v20, v16, v4[0]
	add	x12, x25, x21
	stp	q17, q18, [x12, #-48]
	add	x22, x22, #64
	stp	q19, q20, [x12, #-16]
	add	x23, x23, #64
	add	x24, x24, #64
	add	x25, x25, #64
	subs	x0, x0, #16
	b.ne	LBB4_32
; %bb.33:                               ;   in Loop: Header=BB4_25 Depth=1
	and	x12, x14, #0xfffffffffffffff0
	cmp	x14, x12
	b.eq	LBB4_24
; %bb.34:                               ;   in Loop: Header=BB4_25 Depth=1
	and	x2, x14, #0xfffffffffffffff0
	ldr	x12, [sp, #192]                 ; 8-byte Reload
	and	x0, x14, #0xfffffffffffffff0
	add	x12, x12, x0
	and	x0, x14, #0xc
	cbz	x0, LBB4_38
LBB4_35:                                ;   in Loop: Header=BB4_25 Depth=1
	mov	x0, #0                          ; =0x0
	ldr	x12, [sp, #144]                 ; 8-byte Reload
	add	x22, x12, x2
	lsl	x12, x2, #2
	add	x23, x28, x12
	add	x25, x2, x30
	add	x24, x15, x12
	ldr	x12, [sp, #152]                 ; 8-byte Reload
	add	x12, x12, x2
	ldr	x2, [sp, #200]                  ; 8-byte Reload
	add	x25, x2, x25, lsl #2
	add	x12, x27, x12, lsl #2
LBB4_36:                                ;   Parent Loop BB4_25 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q5, [x24, x0]
	add	x2, x12, x0
	ldur	q6, [x2, #-4]
	fmul.4s	v6, v6, v1[0]
	fmla.4s	v6, v5, v0[0]
	ldr	q5, [x2]
	fmla.4s	v6, v5, v2[0]
	ldur	q5, [x2, #4]
	ldr	q7, [x23, x0]
	fmla.4s	v6, v5, v3[0]
	fmla.4s	v6, v7, v4[0]
	str	q6, [x25, x0]
	add	x0, x0, #16
	adds	x22, x22, #4
	b.ne	LBB4_36
; %bb.37:                               ;   in Loop: Header=BB4_25 Depth=1
	ldp	x12, x0, [sp, #168]             ; 16-byte Folded Reload
	cbz	x0, LBB4_24
LBB4_38:                                ;   in Loop: Header=BB4_25 Depth=1
	mov	x0, #0                          ; =0x0
	lsl	x2, x12, #2
	add	x22, x19, x2
	add	x23, x1, x2
	sub	x24, x8, x12
	add	x12, x12, x17
	lsl	x12, x12, #2
	ldr	x2, [sp, #200]                  ; 8-byte Reload
	add	x25, x2, x12
	ldr	x2, [sp, #184]                  ; 8-byte Reload
	add	x12, x2, x12
LBB4_39:                                ;   Parent Loop BB4_25 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	s5, [x23, x0]
	add	x2, x12, x0
	ldp	s6, s7, [x2]
	fmul	s6, s1, s6
	fmadd	s5, s0, s5, s6
	fmadd	s5, s2, s7, s5
	ldr	s6, [x2, #8]
	ldr	s7, [x22, x0]
	fmadd	s5, s3, s6, s5
	fmadd	s5, s4, s7, s5
	str	s5, [x25, x0]
	add	x0, x0, #4
	subs	x24, x24, #1
	b.ne	LBB4_39
	b	LBB4_24
LBB4_40:
	cmp	w3, #3
	b.lt	LBB4_46
; %bb.41:
	mov	x9, #0                          ; =0x0
	mov	w12, w4
	mov	w13, w3
	umaddl	x10, w4, w3, x13
	add	x10, x0, x10, lsl #2
	add	x10, x10, #12
	sub	x11, x14, x12
	sub	x12, x12, #1
	mul	x13, x12, x13
	ubfiz	x12, x3, #2, #32
	add	x13, x0, x13, lsl #2
	add	x13, x13, #12
	umull	x14, w4, w3
	lsl	x15, x14, #2
	add	x14, x0, x15
	ldr	x16, [sp, #200]                 ; 8-byte Reload
	add	x15, x15, x16
	add	x15, x15, #8
	b	LBB4_43
LBB4_42:                                ;   in Loop: Header=BB4_43 Depth=1
	add	x9, x9, x12
	subs	x11, x11, #1
	b.eq	LBB4_46
LBB4_43:                                ; =>This Inner Loop Header: Depth=1
	add	x17, x13, x9
	ldur	s5, [x17, #-8]
	add	x16, x14, x9
	ldp	s6, s7, [x16]
	fmul	s6, s1, s6
	fmadd	s5, s0, s5, s6
	fmadd	s5, s2, s7, s5
	ldr	s6, [x16, #8]
	fmadd	s5, s3, s6, s5
	add	x0, x10, x9
	ldur	s6, [x0, #-8]
	fmadd	s5, s4, s6, s5
	add	x1, x15, x9
	stur	s5, [x1, #-4]
	cmp	w8, #2
	b.eq	LBB4_42
; %bb.44:                               ;   in Loop: Header=BB4_43 Depth=1
	ldur	s5, [x17, #-4]
	ldp	s6, s7, [x16, #4]
	fmul	s6, s1, s6
	fmadd	s5, s0, s5, s6
	fmadd	s5, s2, s7, s5
	ldr	s6, [x16, #12]
	fmadd	s5, s3, s6, s5
	ldur	s6, [x0, #-4]
	fmadd	s5, s4, s6, s5
	str	s5, [x15, x9]
	cmp	w8, #3
	b.eq	LBB4_42
; %bb.45:                               ;   in Loop: Header=BB4_43 Depth=1
	ldr	s5, [x13, x9]
	add	x16, x14, x9
	ldp	s6, s7, [x16, #8]
	fmul	s6, s1, s6
	fmadd	s5, s0, s5, s6
	fmadd	s5, s2, s7, s5
	ldr	s6, [x16, #16]
	fmadd	s5, s3, s6, s5
	ldr	s6, [x10, x9]
	fmadd	s5, s4, s6, s5
	add	x16, x15, x9
	str	s5, [x16, #4]
	b	LBB4_42
LBB4_46:
	ldp	x29, x30, [sp, #304]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #288]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #272]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #256]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #240]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #224]            ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #208]              ; 16-byte Folded Reload
	add	sp, sp, #320
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_star3_sve_rb4                  ; -- Begin function star3_sve_rb4
	.p2align	2
_star3_sve_rb4:                         ; @star3_sve_rb4
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #208
	.cfi_def_cfa_offset 208
	stp	d15, d14, [sp, #48]             ; 16-byte Folded Spill
	stp	d13, d12, [sp, #64]             ; 16-byte Folded Spill
	stp	d11, d10, [sp, #80]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #96]               ; 16-byte Folded Spill
	stp	x28, x27, [sp, #112]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #128]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #144]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #160]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #176]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #192]            ; 16-byte Folded Spill
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	.cfi_offset b10, -120
	.cfi_offset b11, -128
	.cfi_offset b12, -136
	.cfi_offset b13, -144
	.cfi_offset b14, -152
	.cfi_offset b15, -160
                                        ; kill: def $w4 killed $w4 def $x4
	mov	x23, x0
	smstart	sm
	ldp	s0, s1, [x1]
	mov	z5.s, s0
	mov	z6.s, s1
	ldp	s2, s3, [x1, #8]
	mov	z7.s, s2
	mov	z16.s, s3
	ldr	s4, [x1, #16]
	mov	z17.s, s4
	sub	w24, w3, #1
	cmp	w3, #6
	str	x4, [sp]                        ; 8-byte Spill
	b.lt	LBB5_12
; %bb.1:
	sub	w8, w4, #1
	sxtw	x9, w4
	sub	w10, w4, #18
	and	w10, w10, #0xfffffff0
	add	w10, w10, #17
	str	w10, [sp, #12]                  ; 4-byte Spill
	sxtw	x11, w8
	sub	x8, x24, #7
	stp	x24, x8, [sp, #32]              ; 16-byte Folded Spill
	sbfiz	x13, x4, #4, #32
	add	x14, x23, x13
	add	x8, x9, w4, sxtw #1
	lsl	x8, x8, #2
	add	x15, x23, x8
	sbfiz	x10, x4, #3, #32
	add	x16, x23, x10
	sbfiz	x17, x4, #2, #32
	add	x1, x23, x17
	add	x12, x13, x2
	add	x3, x12, #4
	add	x8, x8, x2
	add	x5, x8, #4
	add	x8, x10, x2
	add	x6, x8, #4
	stp	x23, x2, [sp, #16]              ; 16-byte Folded Spill
	add	x8, x17, x2
	add	x7, x8, #4
	mov	w8, #20                         ; =0x14
	smaddl	x8, w4, w8, x23
	add	x19, x8, #4
	mov	w0, #1                          ; =0x1
	mov	x20, #1                         ; =0x1
	ptrue	p0.s
	mov	x21, #2                         ; =0x2
	mov	x22, x9
	b	LBB5_3
LBB5_2:                                 ;   in Loop: Header=BB5_3 Depth=1
	add	x14, x14, x13
	add	x15, x15, x13
	add	x16, x16, x13
	add	x1, x1, x13
	add	x3, x3, x13
	add	x5, x5, x13
	add	x6, x6, x13
	add	x7, x7, x13
	add	x19, x19, x13
	add	x23, x23, x13
	add	x22, x22, x17
	ldr	x8, [sp, #40]                   ; 8-byte Reload
	cmp	x24, x8
	b.ge	LBB5_13
LBB5_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_5 Depth 2
                                        ;     Child Loop BB5_9 Depth 2
                                        ;       Child Loop BB5_10 Depth 3
	mov	x24, x0
	cmp	w4, #18
	b.lt	LBB5_7
; %bb.4:                                ;   in Loop: Header=BB5_3 Depth=1
	mov	x8, #0                          ; =0x0
LBB5_5:                                 ;   Parent Loop BB5_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lsl	x10, x8, #2
	add	x12, x23, x10
	ld1w	{ z18.s }, p0/z, [x12, x20, lsl #2]
	add	x12, x1, x10
	ld1w	{ z19.s }, p0/z, [x1, x8, lsl #2]
	ld1w	{ z20.s }, p0/z, [x12, x20, lsl #2]
	ld1w	{ z21.s }, p0/z, [x12, x21, lsl #2]
	add	x12, x16, x10
	ld1w	{ z22.s }, p0/z, [x16, x8, lsl #2]
	ld1w	{ z23.s }, p0/z, [x12, x20, lsl #2]
	ld1w	{ z24.s }, p0/z, [x12, x21, lsl #2]
	add	x12, x15, x10
	ld1w	{ z25.s }, p0/z, [x15, x8, lsl #2]
	ld1w	{ z26.s }, p0/z, [x12, x20, lsl #2]
	ld1w	{ z27.s }, p0/z, [x12, x21, lsl #2]
	add	x10, x14, x10
	ld1w	{ z28.s }, p0/z, [x14, x8, lsl #2]
	ld1w	{ z29.s }, p0/z, [x10, x20, lsl #2]
	ld1w	{ z30.s }, p0/z, [x10, x21, lsl #2]
	ld1w	{ z31.s }, p0/z, [x19, x8, lsl #2]
	fmul	z18.s, z5.s, z18.s
	fmla	z18.s, p0/m, z19.s, z6.s
	fmla	z18.s, p0/m, z20.s, z7.s
	fmla	z18.s, p0/m, z21.s, z16.s
	fmla	z18.s, p0/m, z23.s, z17.s
	fmul	z19.s, z5.s, z20.s
	fmla	z19.s, p0/m, z22.s, z6.s
	fmla	z19.s, p0/m, z23.s, z7.s
	fmla	z19.s, p0/m, z24.s, z16.s
	fmla	z19.s, p0/m, z26.s, z17.s
	fmul	z20.s, z5.s, z23.s
	fmla	z20.s, p0/m, z25.s, z6.s
	fmla	z20.s, p0/m, z26.s, z7.s
	fmla	z20.s, p0/m, z27.s, z16.s
	fmla	z20.s, p0/m, z29.s, z17.s
	fmul	z21.s, z5.s, z26.s
	fmla	z21.s, p0/m, z28.s, z6.s
	fmla	z21.s, p0/m, z29.s, z7.s
	fmla	z21.s, p0/m, z30.s, z16.s
	fmla	z21.s, p0/m, z31.s, z17.s
	st1w	{ z18.s }, p0, [x7, x8, lsl #2]
	st1w	{ z19.s }, p0, [x6, x8, lsl #2]
	st1w	{ z20.s }, p0, [x5, x8, lsl #2]
	st1w	{ z21.s }, p0, [x3, x8, lsl #2]
	add	x10, x8, #33
	add	x8, x8, #16
	cmp	x10, x9
	b.lt	LBB5_5
; %bb.6:                                ;   in Loop: Header=BB5_3 Depth=1
	ldr	w8, [sp, #12]                   ; 4-byte Reload
	add	x0, x24, #4
	cmp	w8, w11
	b.ge	LBB5_2
	b	LBB5_8
LBB5_7:                                 ;   in Loop: Header=BB5_3 Depth=1
	mov	w8, #1                          ; =0x1
	add	x0, x24, #4
	cmp	w8, w11
	b.ge	LBB5_2
LBB5_8:                                 ;   in Loop: Header=BB5_3 Depth=1
	ldp	x2, x10, [sp, #24]              ; 16-byte Folded Reload
	cmp	w0, w10
	csel	w10, w0, w10, lt
	sxtw	x26, w10
	sxtw	x27, w8
	sbfiz	x8, x8, #2, #32
	add	x10, x22, x27
	lsl	x12, x10, #2
	ldr	x10, [sp, #16]                  ; 8-byte Reload
	add	x10, x10, x12
	add	x2, x2, x12
LBB5_9:                                 ;   Parent Loop BB5_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB5_10 Depth 3
	mov	x12, x2
	mov	x30, x10
	mov	x28, x8
	mov	x25, x24
LBB5_10:                                ;   Parent Loop BB5_3 Depth=1
                                        ;     Parent Loop BB5_9 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	s18, [x23, x28]
	ldp	s19, s20, [x30, #-4]
	fmul	s19, s1, s19
	fmadd	s18, s0, s18, s19
	fmadd	s18, s2, s20, s18
	ldr	s19, [x30, #4]
	fmadd	s18, s3, s19, s18
	ldr	s19, [x16, x28]
	add	x25, x25, #1
	fmadd	s18, s4, s19, s18
	str	s18, [x12]
	add	x28, x28, x17
	add	x30, x30, x17
	add	x12, x12, x17
	cmp	x25, x26
	b.lt	LBB5_10
; %bb.11:                               ;   in Loop: Header=BB5_9 Depth=2
	add	x27, x27, #1
	add	x8, x8, #4
	add	x10, x10, #4
	add	x2, x2, #4
	cmp	x27, x11
	b.ne	LBB5_9
	b	LBB5_2
LBB5_12:
	mov	w0, #1                          ; =0x1
	cmp	w0, w24
	b.lt	LBB5_14
	b	LBB5_26
LBB5_13:
	ldp	x2, x24, [sp, #24]              ; 16-byte Folded Reload
	ldr	x23, [sp, #16]                  ; 8-byte Reload
	cmp	w0, w24
	b.ge	LBB5_26
LBB5_14:
	ldr	x16, [sp]                       ; 8-byte Reload
	sub	w9, w16, #1
	subs	w8, w16, #18
	b.lt	LBB5_21
; %bb.15:
	mov	w10, w16
	and	w3, w8, #0xfffffff0
	add	w11, w3, #17
	mov	w12, w0
	sub	x13, x12, #1
	mul	x13, x13, x10
	add	x5, x23, x13, lsl #2
	add	x13, x5, #4
	ubfiz	x14, x16, #2, #32
	umaddl	x15, w0, w16, x10
	add	x1, x23, x15, lsl #2
	umull	x15, w0, w16
	lsl	x17, x15, #2
	add	x15, x23, x17
	add	x16, x1, #4
	add	x4, x17, x2
	add	x17, x4, #4
	lsl	x8, x8, #2
	and	x0, x8, #0x3ffffffc0
	add	x1, x1, #68
	add	x2, x5, #68
	sub	x8, x9, x3
	sub	x3, x8, #17
	add	x4, x4, #68
	add	x5, x15, #64
	ptrue	p0.s
	mov	x6, #1                          ; =0x1
	mov	x7, #2                          ; =0x2
	b	LBB5_17
LBB5_16:                                ;   in Loop: Header=BB5_17 Depth=1
	add	x13, x13, x14
	add	x15, x15, x14
	add	x16, x16, x14
	add	x17, x17, x14
	add	x1, x1, x14
	add	x2, x2, x14
	add	x4, x4, x14
	add	x5, x5, x14
	cmp	x12, x24
	b.eq	LBB5_26
LBB5_17:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_18 Depth 2
                                        ;     Child Loop BB5_20 Depth 2
	mov	x8, #0                          ; =0x0
	add	x12, x12, #1
LBB5_18:                                ;   Parent Loop BB5_17 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld1w	{ z18.s }, p0/z, [x13, x8, lsl #2]
	fmul	z18.s, z5.s, z18.s
	add	x19, x15, x8, lsl #2
	ld1w	{ z19.s }, p0/z, [x15, x8, lsl #2]
	fmla	z18.s, p0/m, z19.s, z6.s
	ld1w	{ z19.s }, p0/z, [x19, x6, lsl #2]
	fmla	z18.s, p0/m, z19.s, z7.s
	ld1w	{ z19.s }, p0/z, [x19, x7, lsl #2]
	fmla	z18.s, p0/m, z19.s, z16.s
	ld1w	{ z19.s }, p0/z, [x16, x8, lsl #2]
	fmla	z18.s, p0/m, z19.s, z17.s
	st1w	{ z18.s }, p0, [x17, x8, lsl #2]
	add	x19, x8, #33
	add	x8, x8, #16
	cmp	x19, x10
	b.lo	LBB5_18
; %bb.19:                               ;   in Loop: Header=BB5_17 Depth=1
	mov	x19, x5
	mov	x20, x4
	mov	x21, x3
	mov	x22, x2
	mov	x23, x1
	cmp	w11, w9
	b.ge	LBB5_16
LBB5_20:                                ;   Parent Loop BB5_17 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x8, x19, x0
	ldr	s18, [x22, x0]
	ldp	s19, s20, [x8]
	fmul	s19, s1, s19
	fmadd	s18, s0, s18, s19
	fmadd	s18, s2, s20, s18
	ldr	s19, [x8, #8]
	fmadd	s18, s3, s19, s18
	ldr	s19, [x23, x0]
	fmadd	s18, s4, s19, s18
	str	s18, [x20, x0]
	add	x23, x23, #4
	add	x22, x22, #4
	add	x20, x20, #4
	add	x19, x19, #4
	subs	x21, x21, #1
	b.ne	LBB5_20
	b	LBB5_16
LBB5_21:
	cmp	w16, #3
	b.lt	LBB5_26
; %bb.22:
	mov	w10, w0
	ldr	x14, [sp]                       ; 8-byte Reload
	mov	w8, w14
	umaddl	x11, w0, w14, x8
	add	x11, x23, x11, lsl #2
	add	x11, x11, #4
	ubfiz	x12, x14, #2, #32
	sub	x13, x10, #1
	mul	x8, x13, x8
	add	x8, x23, x8, lsl #2
	add	x13, x8, #4
	ubfiz	x8, x9, #2, #32
	sub	x9, x8, #4
	umull	x8, w0, w14
	lsl	x8, x8, #2
	add	x14, x8, x2
	add	x14, x14, #4
	add	x15, x23, x8
LBB5_23:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_24 Depth 2
	mov	x8, #0                          ; =0x0
	add	x10, x10, #1
LBB5_24:                                ;   Parent Loop BB5_23 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	s5, [x13, x8]
	add	x16, x15, x8
	ldp	s6, s7, [x16]
	fmul	s6, s1, s6
	fmadd	s5, s0, s5, s6
	fmadd	s5, s2, s7, s5
	ldr	s6, [x16, #8]
	ldr	s7, [x11, x8]
	fmadd	s5, s3, s6, s5
	fmadd	s5, s4, s7, s5
	str	s5, [x14, x8]
	add	x8, x8, #4
	cmp	x9, x8
	b.ne	LBB5_24
; %bb.25:                               ;   in Loop: Header=BB5_23 Depth=1
	add	x11, x11, x12
	add	x13, x13, x12
	add	x14, x14, x12
	add	x15, x15, x12
	cmp	x10, x24
	b.ne	LBB5_23
LBB5_26:
	smstop	sm
	ldp	x29, x30, [sp, #192]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #176]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #160]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #144]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #128]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #112]            ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #96]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #80]             ; 16-byte Folded Reload
	ldp	d13, d12, [sp, #64]             ; 16-byte Folded Reload
	ldp	d15, d14, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #208
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	.cfi_restore w23
	.cfi_restore w24
	.cfi_restore w25
	.cfi_restore w26
	.cfi_restore w27
	.cfi_restore w28
	.cfi_restore b8
	.cfi_restore b9
	.cfi_restore b10
	.cfi_restore b11
	.cfi_restore b12
	.cfi_restore b13
	.cfi_restore b14
	.cfi_restore b15
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	stp	d15, d14, [sp, #-160]!          ; 16-byte Folded Spill
	stp	d13, d12, [sp, #16]             ; 16-byte Folded Spill
	stp	d11, d10, [sp, #32]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #48]               ; 16-byte Folded Spill
	stp	x28, x27, [sp, #64]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #80]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #96]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #112]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #128]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #144]            ; 16-byte Folded Spill
	add	x29, sp, #144
	sub	sp, sp, #432
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	.cfi_offset b10, -120
	.cfi_offset b11, -128
	.cfi_offset b12, -136
	.cfi_offset b13, -144
	.cfi_offset b14, -152
	.cfi_offset b15, -160
Lloh0:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x8, [x8]
	stur	x8, [x29, #-160]
Lloh3:
	adrp	x0, l_str@PAGE
Lloh4:
	add	x0, x0, l_str@PAGEOFF
	bl	_puts
Lloh5:
	adrp	x0, l_str.25@PAGE
Lloh6:
	add	x0, x0, l_str.25@PAGEOFF
	bl	_puts
Lloh7:
	adrp	x0, l_str.26@PAGE
Lloh8:
	add	x0, x0, l_str.26@PAGEOFF
	bl	_puts
Lloh9:
	adrp	x0, l_str.27@PAGE
Lloh10:
	add	x0, x0, l_str.27@PAGEOFF
	bl	_puts
Lloh11:
	adrp	x0, l_str.28@PAGE
Lloh12:
	add	x0, x0, l_str.28@PAGEOFF
	bl	_puts
	mov	x9, #0                          ; =0x0
	mov	w8, #52429                      ; =0xcccd
	movk	w8, #15948, lsl #16
Lloh13:
	adrp	x10, l___const.run_bench.kernel@PAGE
Lloh14:
	add	x10, x10, l___const.run_bench.kernel@PAGEOFF
Lloh15:
	ldr	q0, [x10]
	str	q0, [sp, #80]                   ; 16-byte Spill
	fmov	s8, w8
	dup.4s	v0, w8
	str	q0, [sp, #48]                   ; 16-byte Spill
	mov	w8, #46871                      ; =0xb717
	movk	w8, #14545, lsl #16
	fmov	s9, w8
	mov	x8, #225833675390976            ; =0xcd6500000000
	movk	x8, #16845, lsl #48
	str	x8, [sp, #72]                   ; 8-byte Spill
LBB6_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB6_3 Depth 2
                                        ;     Child Loop BB6_8 Depth 2
                                        ;       Child Loop BB6_13 Depth 3
                                        ;       Child Loop BB6_17 Depth 3
                                        ;       Child Loop BB6_20 Depth 3
                                        ;     Child Loop BB6_23 Depth 2
                                        ;       Child Loop BB6_24 Depth 3
                                        ;       Child Loop BB6_30 Depth 3
                                        ;       Child Loop BB6_34 Depth 3
                                        ;       Child Loop BB6_37 Depth 3
                                        ;     Child Loop BB6_40 Depth 2
                                        ;       Child Loop BB6_43 Depth 3
                                        ;     Child Loop BB6_48 Depth 2
                                        ;       Child Loop BB6_51 Depth 3
                                        ;     Child Loop BB6_56 Depth 2
                                        ;       Child Loop BB6_59 Depth 3
                                        ;     Child Loop BB6_64 Depth 2
                                        ;       Child Loop BB6_67 Depth 3
                                        ;     Child Loop BB6_73 Depth 2
                                        ;       Child Loop BB6_75 Depth 3
                                        ;         Child Loop BB6_80 Depth 4
                                        ;         Child Loop BB6_84 Depth 4
                                        ;         Child Loop BB6_87 Depth 4
                                        ;     Child Loop BB6_89 Depth 2
                                        ;     Child Loop BB6_110 Depth 2
                                        ;       Child Loop BB6_111 Depth 3
                                        ;         Child Loop BB6_112 Depth 4
                                        ;     Child Loop BB6_93 Depth 2
                                        ;       Child Loop BB6_95 Depth 3
                                        ;         Child Loop BB6_96 Depth 4
                                        ;         Child Loop BB6_101 Depth 4
                                        ;         Child Loop BB6_105 Depth 4
                                        ;         Child Loop BB6_108 Depth 4
                                        ;     Child Loop BB6_116 Depth 2
                                        ;     Child Loop BB6_118 Depth 2
                                        ;     Child Loop BB6_120 Depth 2
	str	x9, [sp, #176]                  ; 8-byte Spill
Lloh16:
	adrp	x8, l___const.main.sizes@PAGE
Lloh17:
	add	x8, x8, l___const.main.sizes@PAGEOFF
	add	x8, x8, x9, lsl #3
	ldp	w9, w26, [x8]
                                        ; kill: def $w9 killed $w9 def $x9
	sxtw	x9, w9
	str	x9, [sp, #200]                  ; 8-byte Spill
	mul	w19, w26, w9
	mov	w8, #52429                      ; =0xcccd
	movk	w8, #15948, lsl #16
	stur	w8, [x29, #-176]
	ldr	q0, [sp, #80]                   ; 16-byte Reload
	stur	q0, [x29, #-192]
	sbfiz	x21, x19, #2, #32
	mov	w0, #64                         ; =0x40
	mov	x1, x21
	bl	_aligned_alloc
	mov	x27, x0
	mov	w0, #64                         ; =0x40
	mov	x1, x21
	bl	_aligned_alloc
	stur	x0, [x29, #-248]                ; 8-byte Folded Spill
	mov	w0, #64                         ; =0x40
	mov	x1, x21
	bl	_aligned_alloc
	mov	x22, x0
	mov	w0, #64                         ; =0x40
	mov	x1, x21
	bl	_aligned_alloc
	stur	x0, [x29, #-256]                ; 8-byte Folded Spill
	mov	w0, #64                         ; =0x40
	mov	x1, x21
	bl	_aligned_alloc
	mov	x24, x0
	mov	w0, #64                         ; =0x40
	mov	x1, x21
	bl	_aligned_alloc
	str	x0, [sp, #208]                  ; 8-byte Spill
	mov	w0, #64                         ; =0x40
	mov	x1, x21
	bl	_aligned_alloc
	str	x0, [sp, #288]                  ; 8-byte Spill
	mov	w0, #42                         ; =0x2a
	bl	_srand
	cmp	w19, #1
	b.lt	LBB6_4
; %bb.2:                                ;   in Loop: Header=BB6_1 Depth=1
	mov	x20, x27
	mov	x21, x19
LBB6_3:                                 ;   Parent Loop BB6_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	bl	_rand
	negs	w8, w0
	and	w8, w8, #0xff
	and	w9, w0, #0xff
	csneg	w8, w9, w8, mi
	scvtf	s0, w8
	str	s0, [x20], #4
	subs	x21, x21, #1
	b.ne	LBB6_3
LBB6_4:                                 ;   in Loop: Header=BB6_1 Depth=1
	sxtw	x8, w26
	str	x8, [sp, #192]                  ; 8-byte Spill
	lsl	w8, w19, #2
	sxtw	x23, w8
	ldur	x25, [x29, #-248]               ; 8-byte Folded Reload
	mov	x0, x25
	mov	x1, x23
	bl	_bzero
	str	x22, [sp, #168]                 ; 8-byte Spill
	mov	x0, x22
	mov	x1, x23
	bl	_bzero
	ldur	x0, [x29, #-256]                ; 8-byte Folded Reload
	mov	x1, x23
	bl	_bzero
	str	x24, [sp, #184]                 ; 8-byte Spill
	mov	x0, x24
	mov	x1, x23
	bl	_bzero
	ldr	x0, [sp, #208]                  ; 8-byte Reload
	mov	x1, x23
	bl	_bzero
	ldr	x0, [sp, #288]                  ; 8-byte Reload
	mov	x1, x23
	bl	_bzero
	lsl	x23, x26, #2
	lsl	x24, x26, #3
	ldr	x8, [sp, #176]                  ; 8-byte Reload
	cbz	x8, LBB6_6
; %bb.5:                                ;   in Loop: Header=BB6_1 Depth=1
	ldr	x20, [sp, #200]                 ; 8-byte Reload
	sub	w8, w20, #1
	stur	x8, [x29, #-240]                ; 8-byte Folded Spill
	sub	w22, w26, #1
	ldr	x21, [sp, #192]                 ; 8-byte Reload
	b	LBB6_71
LBB6_6:                                 ;   in Loop: Header=BB6_1 Depth=1
	mov	x11, #0                         ; =0x0
	ldr	x8, [sp, #200]                  ; 8-byte Reload
	sub	w8, w8, #1
	stur	x8, [x29, #-240]                ; 8-byte Folded Spill
	sub	w8, w26, #1
	sub	w13, w26, #1
	sub	x12, x8, #1
	and	x14, x12, #0xfffffffffffffff0
	and	x15, x12, #0xfffffffffffffffc
	add	x8, x25, x23
	add	x16, x8, #36
	add	x8, x27, x24
	add	x17, x8, #52
	add	x0, x27, x23
	add	x9, x27, #4
	add	x1, x26, #1
	neg	x2, x15
	add	x3, x9, x24
	mov	x4, x27
	mov	x5, x26
	add	x6, x27, x24
	add	x7, x27, #4
	mov	w19, #1                         ; =0x1
	ldr	q16, [sp, #48]                  ; 16-byte Reload
	b	LBB6_8
LBB6_7:                                 ;   in Loop: Header=BB6_8 Depth=2
	add	x19, x19, #1
	add	x11, x11, x23
	add	x7, x7, x23
	add	x1, x1, x26
	add	x3, x3, x23
	add	x6, x6, x23
	add	x5, x5, x26
	add	x4, x4, x23
	ldur	x10, [x29, #-240]               ; 8-byte Folded Reload
	cmp	x19, x10
	b.eq	LBB6_21
LBB6_8:                                 ;   Parent Loop BB6_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB6_13 Depth 3
                                        ;       Child Loop BB6_17 Depth 3
                                        ;       Child Loop BB6_20 Depth 3
	cmp	x12, #4
	b.hs	LBB6_10
; %bb.9:                                ;   in Loop: Header=BB6_8 Depth=2
	mov	w22, #1                         ; =0x1
	b	LBB6_19
LBB6_10:                                ;   in Loop: Header=BB6_8 Depth=2
	cmp	x12, #16
	b.hs	LBB6_12
; %bb.11:                               ;   in Loop: Header=BB6_8 Depth=2
	mov	x21, #0                         ; =0x0
	b	LBB6_16
LBB6_12:                                ;   in Loop: Header=BB6_8 Depth=2
	and	x10, x12, #0xfffffffffffffff0
	mov	x20, x11
LBB6_13:                                ;   Parent Loop BB6_1 Depth=1
                                        ;     Parent Loop BB6_8 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	x21, x27, x20
	ldur	q0, [x21, #4]
	ldur	q1, [x21, #20]
	ldur	q2, [x21, #36]
	ldur	q3, [x21, #52]
	add	x21, x0, x20
	ldp	q4, q5, [x21]
	ldp	q6, q7, [x21, #32]
	fmul.4s	v4, v4, v16
	fmul.4s	v5, v5, v16
	fmul.4s	v6, v6, v16
	fmul.4s	v7, v7, v16
	fmla.4s	v4, v16, v0
	fmla.4s	v5, v16, v1
	fmla.4s	v6, v16, v2
	fmla.4s	v7, v16, v3
	ldur	q0, [x21, #4]
	ldur	q1, [x21, #20]
	ldur	q2, [x21, #36]
	ldur	q3, [x21, #52]
	fmla.4s	v4, v16, v0
	fmla.4s	v5, v16, v1
	fmla.4s	v6, v16, v2
	fmla.4s	v7, v16, v3
	ldur	q0, [x21, #8]
	ldur	q1, [x21, #24]
	ldur	q2, [x21, #40]
	ldur	q3, [x21, #56]
	fmla.4s	v4, v16, v0
	fmla.4s	v5, v16, v1
	fmla.4s	v6, v16, v2
	fmla.4s	v7, v16, v3
	add	x21, x17, x20
	ldp	q0, q1, [x21, #-48]
	ldp	q2, q3, [x21, #-16]
	fmla.4s	v4, v16, v0
	fmla.4s	v5, v16, v1
	fmla.4s	v6, v16, v2
	fmla.4s	v7, v16, v3
	add	x21, x16, x20
	stp	q4, q5, [x21, #-32]
	stp	q6, q7, [x21]
	add	x20, x20, #64
	subs	x10, x10, #16
	b.ne	LBB6_13
; %bb.14:                               ;   in Loop: Header=BB6_8 Depth=2
	cmp	x12, x14
	b.eq	LBB6_7
; %bb.15:                               ;   in Loop: Header=BB6_8 Depth=2
	and	x21, x12, #0xfffffffffffffff0
	orr	x22, x14, #0x1
	and	x10, x12, #0xc
	cbz	x10, LBB6_19
LBB6_16:                                ;   in Loop: Header=BB6_8 Depth=2
	lsl	x25, x21, #2
	add	x10, x7, x25
	add	x20, x21, x1
	lsl	x28, x20, #2
	ldur	x20, [x29, #-248]               ; 8-byte Folded Reload
	add	x20, x20, x28
	add	x22, x2, x21
	add	x25, x3, x25
	add	x28, x27, x28
LBB6_17:                                ;   Parent Loop BB6_1 Depth=1
                                        ;     Parent Loop BB6_8 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q0, [x10], #16
	ldur	q1, [x28, #-4]
	fmul.4s	v1, v1, v16
	fmla.4s	v1, v16, v0
	ldr	q0, [x28]
	fmla.4s	v1, v16, v0
	ldur	q0, [x28, #4]
	ldr	q2, [x25], #16
	fmla.4s	v1, v16, v0
	fmla.4s	v1, v16, v2
	str	q1, [x20], #16
	add	x28, x28, #16
	adds	x22, x22, #4
	b.ne	LBB6_17
; %bb.18:                               ;   in Loop: Header=BB6_8 Depth=2
	orr	x22, x15, #0x1
	cmp	x12, x15
	b.eq	LBB6_7
LBB6_19:                                ;   in Loop: Header=BB6_8 Depth=2
	mov	x10, #0                         ; =0x0
	sub	x20, x13, x22
	lsl	x25, x22, #2
	add	x21, x6, x25
	add	x22, x22, x5
	lsl	x28, x22, #2
	ldur	x22, [x29, #-248]               ; 8-byte Folded Reload
	add	x22, x22, x28
	add	x25, x4, x25
	sub	x30, x27, #4
	add	x28, x30, x28
LBB6_20:                                ;   Parent Loop BB6_1 Depth=1
                                        ;     Parent Loop BB6_8 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	s0, [x25, x10]
	add	x30, x28, x10
	ldp	s1, s2, [x30]
	fmul	s1, s1, s8
	fmadd	s0, s0, s8, s1
	fmadd	s0, s2, s8, s0
	ldr	s1, [x30, #8]
	ldr	s2, [x21, x10]
	fmadd	s0, s1, s8, s0
	fmadd	s0, s2, s8, s0
	str	s0, [x22, x10]
	add	x10, x10, #4
	subs	x20, x20, #1
	b.ne	LBB6_20
	b	LBB6_7
LBB6_21:                                ;   in Loop: Header=BB6_1 Depth=1
	ldr	x10, [sp, #192]                 ; 8-byte Reload
	sub	w10, w10, #6
	and	w13, w10, #0xfffffffc
	add	w11, w13, #5
	add	x3, x13, #5
	sub	w17, w26, #1
	sub	x14, x17, #5
	and	x12, x14, #0x3
	sub	x14, x14, x13
	sub	x13, x14, x12
	add	x13, x3, x13
	str	x13, [sp, #296]                 ; 8-byte Spill
	ldur	x13, [x29, #-256]               ; 8-byte Folded Reload
	add	x15, x13, x23
	add	x0, x15, #4
	add	x16, x27, x23
	add	x1, x16, #8
	lsl	x10, x10, #2
	and	x2, x10, #0x3fffffff0
	add	x13, x27, #68
	add	x4, x16, #72
	add	x10, x27, x24
	add	x5, x10, #36
	add	x6, x15, #68
	stp	x12, x3, [sp, #304]             ; 16-byte Folded Spill
	add	x10, x3, x12
	sub	w12, w26, #1
	sub	x10, x10, x17
	str	x10, [sp, #280]                 ; 8-byte Spill
	add	x10, x27, #20
	add	x15, x10, x24
	add	x19, x15, x2
	add	x30, x3, x26
	add	x15, x10, x2
	mov	x16, x27
	mov	x17, x26
	mov	w7, #1                          ; =0x1
	b	LBB6_23
LBB6_22:                                ;   in Loop: Header=BB6_23 Depth=2
	add	x0, x0, x23
	add	x9, x9, x23
	add	x1, x1, x23
	add	x13, x13, x23
	add	x4, x4, x23
	add	x5, x5, x23
	add	x6, x6, x23
	add	x19, x19, x23
	add	x30, x30, x26
	add	x15, x15, x23
	add	x8, x8, x23
	add	x17, x17, x26
	add	x16, x16, x23
	ldur	x10, [x29, #-240]               ; 8-byte Folded Reload
	cmp	x7, x10
	b.eq	LBB6_38
LBB6_23:                                ;   Parent Loop BB6_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB6_24 Depth 3
                                        ;       Child Loop BB6_30 Depth 3
                                        ;       Child Loop BB6_34 Depth 3
                                        ;       Child Loop BB6_37 Depth 3
	add	x7, x7, #1
	mov	x10, x1
	mov	x3, x9
	mov	x20, x0
	mov	w21, #5                         ; =0x5
LBB6_24:                                ;   Parent Loop BB6_1 Depth=1
                                        ;     Parent Loop BB6_23 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q0, [x3]
	fmul.4s	v0, v0, v16
	ldur	q1, [x10, #-8]
	fmla.4s	v0, v16, v1
	ldur	q1, [x10, #-4]
	fmla.4s	v0, v16, v1
	ldr	q1, [x10], #16
	fmla.4s	v0, v16, v1
	ldr	q1, [x3, x24]
	fmla.4s	v0, v16, v1
	str	q0, [x20], #16
	add	x21, x21, #4
	add	x3, x3, #16
	cmp	x21, x26
	b.lo	LBB6_24
; %bb.25:                               ;   in Loop: Header=BB6_23 Depth=2
	cmp	w11, w12
	b.hs	LBB6_22
; %bb.26:                               ;   in Loop: Header=BB6_23 Depth=2
	ldr	x21, [sp, #312]                 ; 8-byte Reload
	cmp	x14, #4
	b.lo	LBB6_36
; %bb.27:                               ;   in Loop: Header=BB6_23 Depth=2
	cmp	x14, #16
	b.hs	LBB6_29
; %bb.28:                               ;   in Loop: Header=BB6_23 Depth=2
	mov	x22, #0                         ; =0x0
	b	LBB6_33
LBB6_29:                                ;   in Loop: Header=BB6_23 Depth=2
	mov	x20, x6
	mov	x22, x5
	mov	x28, x4
	mov	x3, x13
	and	x10, x14, #0xfffffffffffffff0
LBB6_30:                                ;   Parent Loop BB6_1 Depth=1
                                        ;     Parent Loop BB6_23 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	x21, x3, x2
	ldp	q0, q1, [x21, #-48]
	ldp	q2, q3, [x21, #-16]
	add	x21, x28, x2
	ldur	q4, [x21, #-56]
	ldur	q5, [x21, #-40]
	ldur	q6, [x21, #-24]
	ldur	q7, [x21, #-8]
	fmul.4s	v4, v4, v16
	fmul.4s	v5, v5, v16
	fmul.4s	v6, v6, v16
	fmul.4s	v7, v7, v16
	fmla.4s	v4, v16, v0
	fmla.4s	v5, v16, v1
	fmla.4s	v6, v16, v2
	fmla.4s	v7, v16, v3
	ldur	q0, [x21, #-52]
	ldur	q1, [x21, #-36]
	ldur	q2, [x21, #-20]
	ldur	q3, [x21, #-4]
	fmla.4s	v4, v16, v0
	fmla.4s	v5, v16, v1
	fmla.4s	v6, v16, v2
	fmla.4s	v7, v16, v3
	ldp	q0, q1, [x21, #-48]
	ldp	q2, q3, [x21, #-16]
	fmla.4s	v4, v16, v0
	fmla.4s	v5, v16, v1
	fmla.4s	v6, v16, v2
	fmla.4s	v7, v16, v3
	add	x21, x22, x2
	ldp	q0, q1, [x21, #-16]
	ldp	q2, q3, [x21, #16]
	fmla.4s	v4, v16, v0
	fmla.4s	v5, v16, v1
	fmla.4s	v6, v16, v2
	fmla.4s	v7, v16, v3
	add	x21, x20, x2
	stp	q4, q5, [x21, #-48]
	add	x3, x3, #64
	stp	q6, q7, [x21, #-16]
	add	x28, x28, #64
	add	x22, x22, #64
	add	x20, x20, #64
	subs	x10, x10, #16
	b.ne	LBB6_30
; %bb.31:                               ;   in Loop: Header=BB6_23 Depth=2
	and	x10, x14, #0xfffffffffffffff0
	cmp	x14, x10
	b.eq	LBB6_22
; %bb.32:                               ;   in Loop: Header=BB6_23 Depth=2
	and	x22, x14, #0xfffffffffffffff0
	ldr	x10, [sp, #312]                 ; 8-byte Reload
	and	x3, x14, #0xfffffffffffffff0
	add	x21, x10, x3
	and	x10, x14, #0xc
	cbz	x10, LBB6_36
LBB6_33:                                ;   in Loop: Header=BB6_23 Depth=2
	mov	x10, #0                         ; =0x0
	ldr	x3, [sp, #280]                  ; 8-byte Reload
	add	x3, x3, x22
	lsl	x21, x22, #2
	add	x20, x19, x21
	add	x25, x22, x30
	add	x21, x15, x21
	add	x28, x26, x22
	ldur	x22, [x29, #-256]               ; 8-byte Folded Reload
	add	x22, x22, x25, lsl #2
	add	x25, x15, x28, lsl #2
LBB6_34:                                ;   Parent Loop BB6_1 Depth=1
                                        ;     Parent Loop BB6_23 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q0, [x21, x10]
	add	x28, x25, x10
	ldur	q1, [x28, #-4]
	fmul.4s	v1, v1, v16
	fmla.4s	v1, v16, v0
	ldr	q0, [x28]
	fmla.4s	v1, v16, v0
	ldur	q0, [x28, #4]
	ldr	q2, [x20, x10]
	fmla.4s	v1, v16, v0
	fmla.4s	v1, v16, v2
	str	q1, [x22, x10]
	add	x10, x10, #16
	adds	x3, x3, #4
	b.ne	LBB6_34
; %bb.35:                               ;   in Loop: Header=BB6_23 Depth=2
	ldp	x21, x10, [sp, #296]            ; 16-byte Folded Reload
	cbz	x10, LBB6_22
LBB6_36:                                ;   in Loop: Header=BB6_23 Depth=2
	mov	x10, #0                         ; =0x0
	sub	x3, x12, x21
	lsl	x22, x21, #2
	add	x20, x8, x22
	add	x21, x21, x17
	lsl	x25, x21, #2
	ldur	x21, [x29, #-256]               ; 8-byte Folded Reload
	add	x21, x21, x25
	add	x22, x16, x22
	sub	x28, x27, #4
	add	x25, x28, x25
LBB6_37:                                ;   Parent Loop BB6_1 Depth=1
                                        ;     Parent Loop BB6_23 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	s0, [x22, x10]
	add	x28, x25, x10
	ldp	s1, s2, [x28]
	fmul	s1, s1, s8
	fmadd	s0, s0, s8, s1
	fmadd	s0, s2, s8, s0
	ldr	s1, [x28, #8]
	ldr	s2, [x20, x10]
	fmadd	s0, s1, s8, s0
	fmadd	s0, s2, s8, s0
	str	s0, [x21, x10]
	add	x10, x10, #4
	subs	x3, x3, #1
	b.ne	LBB6_37
	b	LBB6_22
LBB6_38:                                ;   in Loop: Header=BB6_1 Depth=1
	mov	x0, x27
Lloh18:
	adrp	x19, l___const.run_bench.kernel@PAGE
Lloh19:
	add	x19, x19, l___const.run_bench.kernel@PAGEOFF
	mov	x1, x19
	ldp	x2, x21, [sp, #184]             ; 16-byte Folded Reload
	ldr	x20, [sp, #200]                 ; 8-byte Reload
	mov	x3, x20
	mov	x4, x21
	bl	_star3_sve_load5
	mov	x0, x27
	mov	x1, x19
	ldr	x2, [sp, #208]                  ; 8-byte Reload
	mov	x3, x20
	mov	x4, x21
	bl	_star3_neon_rb4
	mov	x0, x27
	mov	x1, x19
	ldr	x2, [sp, #288]                  ; 8-byte Reload
	mov	x3, x20
	mov	x4, x21
	bl	_star3_sve_rb4
	mov	w19, #0                         ; =0x0
	ldp	x9, x8, [x29, #-256]            ; 16-byte Folded Reload
	add	x22, x9, x23
	add	x9, x8, x23
	str	x9, [sp, #312]                  ; 8-byte Spill
	add	x20, x8, x23
	mov	w25, #1                         ; =0x1
	sub	w10, w26, #1
	b	LBB6_40
LBB6_39:                                ;   in Loop: Header=BB6_40 Depth=2
	add	x25, x25, #1
	add	x22, x22, x23
	add	x20, x20, x23
	ldur	x8, [x29, #-240]                ; 8-byte Folded Reload
	cmp	x25, x8
	b.eq	LBB6_46
LBB6_40:                                ;   Parent Loop BB6_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB6_43 Depth 3
	mov	x28, x25
	mov	w21, #1                         ; =0x1
	b	LBB6_43
LBB6_41:                                ;   in Loop: Header=BB6_43 Depth=3
	add	w19, w19, #1
LBB6_42:                                ;   in Loop: Header=BB6_43 Depth=3
	add	x21, x21, #1
	cmp	x10, x21
	b.eq	LBB6_39
LBB6_43:                                ;   Parent Loop BB6_1 Depth=1
                                        ;     Parent Loop BB6_40 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	s0, [x20, x21, lsl #2]
	ldr	s1, [x22, x21, lsl #2]
	fabd	s2, s0, s1
	fcmp	s2, s9
	b.le	LBB6_42
; %bb.44:                               ;   in Loop: Header=BB6_43 Depth=3
	cmp	w19, #2
	b.gt	LBB6_41
; %bb.45:                               ;   in Loop: Header=BB6_43 Depth=3
	fcvt	d0, s0
	fcvt	d1, s1
	stp	d0, d1, [sp, #24]
	stp	x28, x21, [sp, #8]
Lloh20:
	adrp	x8, l_.str.6@PAGE
Lloh21:
	add	x8, x8, l_.str.6@PAGEOFF
	str	x8, [sp]
Lloh22:
	adrp	x0, l_.str.24@PAGE
Lloh23:
	add	x0, x0, l_.str.24@PAGEOFF
	bl	_printf
	sub	w10, w26, #1
	b	LBB6_41
LBB6_46:                                ;   in Loop: Header=BB6_1 Depth=1
	mov	w22, #0                         ; =0x0
	ldr	x8, [sp, #184]                  ; 8-byte Reload
	add	x25, x8, x23
	ldur	x8, [x29, #-248]                ; 8-byte Folded Reload
	add	x20, x8, x23
	mov	w28, #1                         ; =0x1
	b	LBB6_48
LBB6_47:                                ;   in Loop: Header=BB6_48 Depth=2
	ldr	x28, [sp, #304]                 ; 8-byte Reload
	add	x28, x28, #1
	add	x25, x25, x23
	add	x20, x20, x23
	ldur	x8, [x29, #-240]                ; 8-byte Folded Reload
	cmp	x28, x8
	b.eq	LBB6_54
LBB6_48:                                ;   Parent Loop BB6_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB6_51 Depth 3
	str	x28, [sp, #304]                 ; 8-byte Spill
                                        ; kill: def $w28 killed $w28 killed $x28 def $x28
	mov	w21, #1                         ; =0x1
	b	LBB6_51
LBB6_49:                                ;   in Loop: Header=BB6_51 Depth=3
	add	w22, w22, #1
LBB6_50:                                ;   in Loop: Header=BB6_51 Depth=3
	add	x21, x21, #1
	cmp	x10, x21
	b.eq	LBB6_47
LBB6_51:                                ;   Parent Loop BB6_1 Depth=1
                                        ;     Parent Loop BB6_48 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	s0, [x20, x21, lsl #2]
	ldr	s1, [x25, x21, lsl #2]
	fabd	s2, s0, s1
	fcmp	s2, s9
	b.le	LBB6_50
; %bb.52:                               ;   in Loop: Header=BB6_51 Depth=3
	cmp	w22, #2
	b.gt	LBB6_49
; %bb.53:                               ;   in Loop: Header=BB6_51 Depth=3
	fcvt	d0, s0
	fcvt	d1, s1
	stp	d0, d1, [sp, #24]
	stp	x28, x21, [sp, #8]
Lloh24:
	adrp	x8, l_.str.9@PAGE
Lloh25:
	add	x8, x8, l_.str.9@PAGEOFF
	str	x8, [sp]
Lloh26:
	adrp	x0, l_.str.24@PAGE
Lloh27:
	add	x0, x0, l_.str.24@PAGEOFF
	bl	_printf
	sub	w10, w26, #1
	b	LBB6_49
LBB6_54:                                ;   in Loop: Header=BB6_1 Depth=1
	mov	w28, #0                         ; =0x0
	ldr	x8, [sp, #208]                  ; 8-byte Reload
	add	x25, x8, x23
	ldur	x8, [x29, #-248]                ; 8-byte Folded Reload
	add	x20, x8, x23
	mov	w11, #1                         ; =0x1
	ldr	x8, [sp, #288]                  ; 8-byte Reload
	b	LBB6_56
LBB6_55:                                ;   in Loop: Header=BB6_56 Depth=2
	ldr	x11, [sp, #296]                 ; 8-byte Reload
	add	x11, x11, #1
	add	x25, x25, x23
	add	x20, x20, x23
	ldur	x9, [x29, #-240]                ; 8-byte Folded Reload
	cmp	x11, x9
	b.eq	LBB6_62
LBB6_56:                                ;   Parent Loop BB6_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB6_59 Depth 3
	str	x11, [sp, #296]                 ; 8-byte Spill
                                        ; kill: def $w11 killed $w11 killed $x11 def $x11
	str	x11, [sp, #304]                 ; 8-byte Spill
	mov	w21, #1                         ; =0x1
	b	LBB6_59
LBB6_57:                                ;   in Loop: Header=BB6_59 Depth=3
	add	w28, w28, #1
LBB6_58:                                ;   in Loop: Header=BB6_59 Depth=3
	add	x21, x21, #1
	cmp	x10, x21
	b.eq	LBB6_55
LBB6_59:                                ;   Parent Loop BB6_1 Depth=1
                                        ;     Parent Loop BB6_56 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	s0, [x20, x21, lsl #2]
	ldr	s1, [x25, x21, lsl #2]
	fabd	s2, s0, s1
	fcmp	s2, s9
	b.le	LBB6_58
; %bb.60:                               ;   in Loop: Header=BB6_59 Depth=3
	cmp	w28, #2
	b.gt	LBB6_57
; %bb.61:                               ;   in Loop: Header=BB6_59 Depth=3
	fcvt	d0, s0
	fcvt	d1, s1
	stp	d0, d1, [sp, #24]
	ldr	x8, [sp, #304]                  ; 8-byte Reload
	stp	x8, x21, [sp, #8]
Lloh28:
	adrp	x8, l_.str.10@PAGE
Lloh29:
	add	x8, x8, l_.str.10@PAGEOFF
	str	x8, [sp]
Lloh30:
	adrp	x0, l_.str.24@PAGE
Lloh31:
	add	x0, x0, l_.str.24@PAGEOFF
	bl	_printf
	sub	w10, w26, #1
	ldr	x8, [sp, #288]                  ; 8-byte Reload
	b	LBB6_57
LBB6_62:                                ;   in Loop: Header=BB6_1 Depth=1
	mov	w25, #0                         ; =0x0
	add	x20, x8, x23
	mov	w9, #1                          ; =0x1
	b	LBB6_64
LBB6_63:                                ;   in Loop: Header=BB6_64 Depth=2
	ldr	x9, [sp, #296]                  ; 8-byte Reload
	add	x9, x9, #1
	add	x20, x20, x23
	add	x8, x8, x23
	str	x8, [sp, #312]                  ; 8-byte Spill
	ldur	x8, [x29, #-240]                ; 8-byte Folded Reload
	cmp	x9, x8
	b.eq	LBB6_70
LBB6_64:                                ;   Parent Loop BB6_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB6_67 Depth 3
	str	x9, [sp, #296]                  ; 8-byte Spill
                                        ; kill: def $w9 killed $w9 killed $x9 def $x9
	str	x9, [sp, #304]                  ; 8-byte Spill
	mov	w21, #1                         ; =0x1
	ldr	x8, [sp, #312]                  ; 8-byte Reload
	b	LBB6_67
LBB6_65:                                ;   in Loop: Header=BB6_67 Depth=3
	add	w25, w25, #1
LBB6_66:                                ;   in Loop: Header=BB6_67 Depth=3
	add	x21, x21, #1
	cmp	x10, x21
	b.eq	LBB6_63
LBB6_67:                                ;   Parent Loop BB6_1 Depth=1
                                        ;     Parent Loop BB6_64 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	s0, [x8, x21, lsl #2]
	ldr	s1, [x20, x21, lsl #2]
	fabd	s2, s0, s1
	fcmp	s2, s9
	b.le	LBB6_66
; %bb.68:                               ;   in Loop: Header=BB6_67 Depth=3
	cmp	w25, #2
	b.gt	LBB6_65
; %bb.69:                               ;   in Loop: Header=BB6_67 Depth=3
	fcvt	d0, s0
	fcvt	d1, s1
	stp	d0, d1, [sp, #24]
	ldr	x8, [sp, #304]                  ; 8-byte Reload
	stp	x8, x21, [sp, #8]
Lloh32:
	adrp	x8, l_.str.11@PAGE
Lloh33:
	add	x8, x8, l_.str.11@PAGEOFF
	str	x8, [sp]
Lloh34:
	adrp	x0, l_.str.24@PAGE
Lloh35:
	add	x0, x0, l_.str.24@PAGEOFF
	bl	_printf
	ldr	x8, [sp, #312]                  ; 8-byte Reload
	sub	w10, w26, #1
	b	LBB6_65
LBB6_70:                                ;   in Loop: Header=BB6_1 Depth=1
	cmp	w19, #0
Lloh36:
	adrp	x11, l_.str.8@PAGE
Lloh37:
	add	x11, x11, l_.str.8@PAGEOFF
Lloh38:
	adrp	x12, l_.str.7@PAGE
Lloh39:
	add	x12, x12, l_.str.7@PAGEOFF
	csel	x8, x12, x11, eq
	cmp	w22, #0
	csel	x9, x12, x11, eq
	cmp	w28, #0
	csel	x10, x12, x11, eq
	cmp	w25, #0
	csel	x11, x12, x11, eq
	ldp	x21, x20, [sp, #192]            ; 16-byte Folded Reload
	stp	x20, x21, [sp]
	stp	x10, x11, [sp, #32]
	stp	x8, x9, [sp, #16]
Lloh40:
	adrp	x0, l_.str.5@PAGE
Lloh41:
	add	x0, x0, l_.str.5@PAGEOFF
	sub	w22, w26, #1
	bl	_printf
	ldur	x25, [x29, #-248]               ; 8-byte Folded Reload
LBB6_71:                                ;   in Loop: Header=BB6_1 Depth=1
	smull	x8, w21, w20
	scvtf	d0, x8
	ldr	d1, [sp, #72]                   ; 8-byte Reload
	fdiv	d0, d1, d0
	fcvtzs	w8, d0
	cmp	w8, #10
	mov	w9, #10                         ; =0xa
	csel	w8, w8, w9, gt
	mov	w9, #5000                       ; =0x1388
	cmp	w8, w9
	csel	w8, w8, w9, lt
	str	x8, [sp, #280]                  ; 8-byte Spill
	sub	x1, x29, #208
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	mov	w8, #0                          ; =0x0
	ldp	s0, s1, [x29, #-192]
	mov	x19, x22
	sub	x9, x22, #1
	ldp	s2, s3, [x29, #-184]
	and	x10, x9, #0xc
	and	x11, x9, #0xfffffffffffffff0
	and	x12, x9, #0xfffffffffffffffc
	add	x13, x25, x23
	add	x13, x13, #36
	add	x14, x27, x24
	add	x14, x14, #52
	ldur	s4, [x29, #-176]
	add	x15, x27, x23
	neg	x17, x12
	b	LBB6_73
LBB6_72:                                ;   in Loop: Header=BB6_73 Depth=2
	add	w8, w8, #1
	ldr	x16, [sp, #280]                 ; 8-byte Reload
	cmp	w8, w16
	b.eq	LBB6_88
LBB6_73:                                ;   Parent Loop BB6_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB6_75 Depth 3
                                        ;         Child Loop BB6_80 Depth 4
                                        ;         Child Loop BB6_84 Depth 4
                                        ;         Child Loop BB6_87 Depth 4
	mov	x0, #0                          ; =0x0
	mov	x1, x27
	mov	x2, x26
	add	x3, x27, x24
	add	x16, x27, #4
	add	x4, x16, x24
	add	x5, x26, #1
	add	x6, x27, #4
	mov	w7, #1                          ; =0x1
	b	LBB6_75
LBB6_74:                                ;   in Loop: Header=BB6_75 Depth=3
	add	x7, x7, #1
	add	x0, x0, x23
	add	x6, x6, x23
	add	x5, x5, x26
	add	x4, x4, x23
	add	x3, x3, x23
	add	x2, x2, x26
	add	x1, x1, x23
	ldur	x16, [x29, #-240]               ; 8-byte Folded Reload
	cmp	x7, x16
	b.eq	LBB6_72
LBB6_75:                                ;   Parent Loop BB6_1 Depth=1
                                        ;     Parent Loop BB6_73 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB6_80 Depth 4
                                        ;         Child Loop BB6_84 Depth 4
                                        ;         Child Loop BB6_87 Depth 4
	cmp	x9, #4
	b.hs	LBB6_77
; %bb.76:                               ;   in Loop: Header=BB6_75 Depth=3
	mov	w25, #1                         ; =0x1
	b	LBB6_86
LBB6_77:                                ;   in Loop: Header=BB6_75 Depth=3
	cmp	x9, #16
	b.hs	LBB6_79
; %bb.78:                               ;   in Loop: Header=BB6_75 Depth=3
	mov	x21, #0                         ; =0x0
	b	LBB6_83
LBB6_79:                                ;   in Loop: Header=BB6_75 Depth=3
	and	x20, x9, #0xfffffffffffffff0
	mov	x22, x0
LBB6_80:                                ;   Parent Loop BB6_1 Depth=1
                                        ;     Parent Loop BB6_73 Depth=2
                                        ;       Parent Loop BB6_75 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	add	x21, x27, x22
	ldur	q5, [x21, #4]
	ldur	q6, [x21, #20]
	ldur	q7, [x21, #36]
	ldur	q16, [x21, #52]
	add	x21, x15, x22
	ldp	q17, q18, [x21]
	ldp	q19, q20, [x21, #32]
	fmul.4s	v17, v17, v1[0]
	fmul.4s	v18, v18, v1[0]
	fmul.4s	v19, v19, v1[0]
	fmul.4s	v20, v20, v1[0]
	fmla.4s	v17, v5, v0[0]
	fmla.4s	v18, v6, v0[0]
	fmla.4s	v19, v7, v0[0]
	fmla.4s	v20, v16, v0[0]
	ldur	q5, [x21, #4]
	ldur	q6, [x21, #20]
	ldur	q7, [x21, #36]
	ldur	q16, [x21, #52]
	fmla.4s	v17, v5, v2[0]
	fmla.4s	v18, v6, v2[0]
	fmla.4s	v19, v7, v2[0]
	fmla.4s	v20, v16, v2[0]
	ldur	q5, [x21, #8]
	ldur	q6, [x21, #24]
	ldur	q7, [x21, #40]
	ldur	q16, [x21, #56]
	fmla.4s	v17, v5, v3[0]
	fmla.4s	v18, v6, v3[0]
	fmla.4s	v19, v7, v3[0]
	fmla.4s	v20, v16, v3[0]
	add	x21, x14, x22
	ldp	q5, q6, [x21, #-48]
	ldp	q7, q16, [x21, #-16]
	fmla.4s	v17, v5, v4[0]
	fmla.4s	v18, v6, v4[0]
	fmla.4s	v19, v7, v4[0]
	fmla.4s	v20, v16, v4[0]
	add	x21, x13, x22
	stp	q17, q18, [x21, #-32]
	stp	q19, q20, [x21]
	add	x22, x22, #64
	subs	x20, x20, #16
	b.ne	LBB6_80
; %bb.81:                               ;   in Loop: Header=BB6_75 Depth=3
	cmp	x9, x11
	b.eq	LBB6_74
; %bb.82:                               ;   in Loop: Header=BB6_75 Depth=3
	and	x21, x9, #0xfffffffffffffff0
	orr	x25, x11, #0x1
	cbz	x10, LBB6_86
LBB6_83:                                ;   in Loop: Header=BB6_75 Depth=3
	lsl	x28, x21, #2
	add	x20, x6, x28
	add	x22, x21, x5
	lsl	x30, x22, #2
	ldur	x16, [x29, #-248]               ; 8-byte Folded Reload
	add	x22, x16, x30
	add	x25, x17, x21
	add	x28, x4, x28
	add	x30, x27, x30
LBB6_84:                                ;   Parent Loop BB6_1 Depth=1
                                        ;     Parent Loop BB6_73 Depth=2
                                        ;       Parent Loop BB6_75 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	q5, [x20], #16
	ldur	q6, [x30, #-4]
	fmul.4s	v6, v6, v1[0]
	fmla.4s	v6, v5, v0[0]
	ldr	q5, [x30]
	fmla.4s	v6, v5, v2[0]
	ldur	q5, [x30, #4]
	ldr	q7, [x28], #16
	fmla.4s	v6, v5, v3[0]
	fmla.4s	v6, v7, v4[0]
	str	q6, [x22], #16
	add	x30, x30, #16
	adds	x25, x25, #4
	b.ne	LBB6_84
; %bb.85:                               ;   in Loop: Header=BB6_75 Depth=3
	orr	x25, x12, #0x1
	cmp	x9, x12
	b.eq	LBB6_74
LBB6_86:                                ;   in Loop: Header=BB6_75 Depth=3
	mov	x20, #0                         ; =0x0
	sub	x21, x19, x25
	lsl	x28, x25, #2
	add	x22, x3, x28
	add	x25, x25, x2
	lsl	x30, x25, #2
	ldur	x16, [x29, #-248]               ; 8-byte Folded Reload
	add	x25, x16, x30
	add	x28, x1, x28
	sub	x16, x27, #4
	add	x30, x16, x30
LBB6_87:                                ;   Parent Loop BB6_1 Depth=1
                                        ;     Parent Loop BB6_73 Depth=2
                                        ;       Parent Loop BB6_75 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	s5, [x28, x20]
	add	x16, x30, x20
	ldp	s6, s7, [x16]
	fmul	s6, s1, s6
	fmadd	s5, s0, s5, s6
	fmadd	s5, s2, s7, s5
	ldr	s6, [x16, #8]
	ldr	s7, [x22, x20]
	fmadd	s5, s3, s6, s5
	fmadd	s5, s4, s7, s5
	str	s5, [x25, x20]
	add	x20, x20, #4
	subs	x21, x21, #1
	b.ne	LBB6_87
	b	LBB6_74
LBB6_88:                                ;   in Loop: Header=BB6_1 Depth=1
	ldr	x8, [sp, #280]                  ; 8-byte Reload
	lsr	w8, w8, #3
	cmp	w8, #3
	mov	w9, #3                          ; =0x3
	csel	w20, w8, w9, hi
	sub	x1, x29, #224
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldp	q0, q1, [x29, #-224]
	stp	q0, q1, [sp, #128]              ; 32-byte Folded Spill
	sub	x1, x29, #208
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	str	w20, [sp, #164]                 ; 4-byte Spill
	ldr	x21, [sp, #168]                 ; 8-byte Reload
	ldr	x22, [sp, #200]                 ; 8-byte Reload
LBB6_89:                                ;   Parent Loop BB6_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sub	x1, x29, #192
	mov	x0, x27
	mov	x2, x21
	mov	x3, x22
	mov	x4, x26
	bl	_star3_scalar_novec
	subs	w20, w20, #1
	b.ne	LBB6_89
; %bb.90:                               ;   in Loop: Header=BB6_1 Depth=1
	sub	x1, x29, #224
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldp	q0, q1, [x29, #-224]
	stp	q0, q1, [sp, #96]               ; 32-byte Folded Spill
	sub	x1, x29, #208
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldp	s0, s1, [x29, #-192]
	ldp	s2, s3, [x29, #-184]
	ldur	s4, [x29, #-176]
	sub	w8, w26, #6
	and	w10, w8, #0xfffffffc
	add	w9, w10, #5
	mov	x13, x19
	cmp	w9, w13
	b.hs	LBB6_109
; %bb.91:                               ;   in Loop: Header=BB6_1 Depth=1
	mov	w14, #0                         ; =0x0
	add	x9, x10, #5
	sub	x11, x13, #5
	and	x15, x11, #0x3
	sub	x11, x11, x10
	sub	x10, x11, x15
	add	x10, x9, x10
	str	x10, [sp, #304]                 ; 8-byte Spill
	ldur	x10, [x29, #-256]               ; 8-byte Folded Reload
	add	x10, x10, x23
	add	x12, x10, #4
	str	x12, [sp, #264]                 ; 8-byte Spill
	add	x12, x27, x23
	add	x16, x12, #8
	lsl	x8, x8, #2
	and	x17, x8, #0x3fffffff0
	add	x8, x12, #72
	stp	x8, x16, [sp, #248]             ; 16-byte Folded Spill
	add	x8, x27, x24
	add	x8, x8, #36
	str	x8, [sp, #240]                  ; 8-byte Spill
	add	x8, x10, #68
	str	x8, [sp, #232]                  ; 8-byte Spill
	str	x15, [sp, #312]                 ; 8-byte Spill
	add	x8, x9, x15
	sub	x8, x8, x13
	str	x8, [sp, #296]                  ; 8-byte Spill
	add	x8, x27, #20
	add	x10, x8, x24
	add	x10, x10, x17
	add	x8, x8, x17
	stp	x8, x10, [sp, #216]             ; 16-byte Folded Spill
	b	LBB6_93
LBB6_92:                                ;   in Loop: Header=BB6_93 Depth=2
	ldr	w14, [sp, #272]                 ; 4-byte Reload
	add	w14, w14, #1
	ldr	x8, [sp, #280]                  ; 8-byte Reload
	cmp	w14, w8
	b.eq	LBB6_115
LBB6_93:                                ;   Parent Loop BB6_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB6_95 Depth 3
                                        ;         Child Loop BB6_96 Depth 4
                                        ;         Child Loop BB6_101 Depth 4
                                        ;         Child Loop BB6_105 Depth 4
                                        ;         Child Loop BB6_108 Depth 4
	str	w14, [sp, #272]                 ; 4-byte Spill
	mov	x6, x27
	mov	x7, x26
	add	x30, x27, x24
	ldp	x5, x4, [sp, #216]              ; 16-byte Folded Reload
	add	x16, x9, x26
	ldp	x2, x8, [sp, #232]              ; 16-byte Folded Reload
	ldp	x10, x20, [sp, #248]            ; 16-byte Folded Reload
	add	x14, x27, #68
	add	x12, x27, #4
	ldr	x13, [sp, #264]                 ; 8-byte Reload
	mov	w22, #1                         ; =0x1
	b	LBB6_95
LBB6_94:                                ;   in Loop: Header=BB6_95 Depth=3
	add	x13, x13, x23
	add	x12, x12, x23
	add	x20, x20, x23
	add	x14, x14, x23
	add	x10, x10, x23
	add	x8, x8, x23
	add	x2, x2, x23
	add	x4, x4, x23
	add	x16, x16, x26
	add	x5, x5, x23
	add	x30, x30, x23
	add	x7, x7, x26
	add	x6, x6, x23
	ldur	x15, [x29, #-240]               ; 8-byte Folded Reload
	cmp	x22, x15
	b.eq	LBB6_92
LBB6_95:                                ;   Parent Loop BB6_1 Depth=1
                                        ;     Parent Loop BB6_93 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB6_96 Depth 4
                                        ;         Child Loop BB6_101 Depth 4
                                        ;         Child Loop BB6_105 Depth 4
                                        ;         Child Loop BB6_108 Depth 4
	add	x22, x22, #1
	mov	x15, x20
	mov	x0, x12
	mov	x1, x13
	mov	w3, #5                          ; =0x5
LBB6_96:                                ;   Parent Loop BB6_1 Depth=1
                                        ;     Parent Loop BB6_93 Depth=2
                                        ;       Parent Loop BB6_95 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	q5, [x0]
	fmul.4s	v5, v5, v0[0]
	ldur	q6, [x15, #-8]
	fmla.4s	v5, v6, v1[0]
	ldur	q6, [x15, #-4]
	fmla.4s	v5, v6, v2[0]
	ldr	q6, [x15], #16
	fmla.4s	v5, v6, v3[0]
	ldr	q6, [x0, x24]
	fmla.4s	v5, v6, v4[0]
	str	q5, [x1], #16
	add	x3, x3, #4
	add	x0, x0, #16
	cmp	x3, x26
	b.lo	LBB6_96
; %bb.97:                               ;   in Loop: Header=BB6_95 Depth=3
	mov	x3, x9
	cmp	x11, #4
	b.lo	LBB6_107
; %bb.98:                               ;   in Loop: Header=BB6_95 Depth=3
	cmp	x11, #16
	b.hs	LBB6_100
; %bb.99:                               ;   in Loop: Header=BB6_95 Depth=3
	mov	x21, #0                         ; =0x0
	b	LBB6_104
LBB6_100:                               ;   in Loop: Header=BB6_95 Depth=3
	mov	x28, x2
	mov	x1, x8
	mov	x0, x10
	mov	x15, x14
	and	x3, x11, #0xfffffffffffffff0
LBB6_101:                               ;   Parent Loop BB6_1 Depth=1
                                        ;     Parent Loop BB6_93 Depth=2
                                        ;       Parent Loop BB6_95 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	add	x21, x15, x17
	ldp	q5, q6, [x21, #-48]
	ldp	q7, q16, [x21, #-16]
	add	x21, x0, x17
	ldur	q17, [x21, #-56]
	ldur	q18, [x21, #-40]
	ldur	q19, [x21, #-24]
	ldur	q20, [x21, #-8]
	fmul.4s	v17, v17, v1[0]
	fmul.4s	v18, v18, v1[0]
	fmul.4s	v19, v19, v1[0]
	fmul.4s	v20, v20, v1[0]
	fmla.4s	v17, v5, v0[0]
	fmla.4s	v18, v6, v0[0]
	fmla.4s	v19, v7, v0[0]
	fmla.4s	v20, v16, v0[0]
	ldur	q5, [x21, #-52]
	ldur	q6, [x21, #-36]
	ldur	q7, [x21, #-20]
	ldur	q16, [x21, #-4]
	fmla.4s	v17, v5, v2[0]
	fmla.4s	v18, v6, v2[0]
	fmla.4s	v19, v7, v2[0]
	fmla.4s	v20, v16, v2[0]
	ldp	q5, q6, [x21, #-48]
	ldp	q7, q16, [x21, #-16]
	fmla.4s	v17, v5, v3[0]
	fmla.4s	v18, v6, v3[0]
	fmla.4s	v19, v7, v3[0]
	fmla.4s	v20, v16, v3[0]
	add	x21, x1, x17
	ldp	q5, q6, [x21, #-16]
	ldp	q7, q16, [x21, #16]
	fmla.4s	v17, v5, v4[0]
	fmla.4s	v18, v6, v4[0]
	fmla.4s	v19, v7, v4[0]
	fmla.4s	v20, v16, v4[0]
	add	x21, x28, x17
	stp	q17, q18, [x21, #-48]
	add	x15, x15, #64
	stp	q19, q20, [x21, #-16]
	add	x0, x0, #64
	add	x1, x1, #64
	add	x28, x28, #64
	subs	x3, x3, #16
	b.ne	LBB6_101
; %bb.102:                              ;   in Loop: Header=BB6_95 Depth=3
	and	x15, x11, #0xfffffffffffffff0
	cmp	x11, x15
	b.eq	LBB6_94
; %bb.103:                              ;   in Loop: Header=BB6_95 Depth=3
	and	x21, x11, #0xfffffffffffffff0
	and	x15, x11, #0xfffffffffffffff0
	add	x3, x9, x15
	and	x15, x11, #0xc
	cbz	x15, LBB6_107
LBB6_104:                               ;   in Loop: Header=BB6_95 Depth=3
	mov	x15, #0                         ; =0x0
	ldr	x0, [sp, #296]                  ; 8-byte Reload
	add	x0, x0, x21
	lsl	x3, x21, #2
	add	x1, x4, x3
	add	x25, x21, x16
	add	x3, x5, x3
	add	x28, x26, x21
	ldur	x21, [x29, #-256]               ; 8-byte Folded Reload
	add	x21, x21, x25, lsl #2
	add	x25, x5, x28, lsl #2
LBB6_105:                               ;   Parent Loop BB6_1 Depth=1
                                        ;     Parent Loop BB6_93 Depth=2
                                        ;       Parent Loop BB6_95 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	q5, [x3, x15]
	add	x28, x25, x15
	ldur	q6, [x28, #-4]
	fmul.4s	v6, v6, v1[0]
	fmla.4s	v6, v5, v0[0]
	ldr	q5, [x28]
	fmla.4s	v6, v5, v2[0]
	ldur	q5, [x28, #4]
	ldr	q7, [x1, x15]
	fmla.4s	v6, v5, v3[0]
	fmla.4s	v6, v7, v4[0]
	str	q6, [x21, x15]
	add	x15, x15, #16
	adds	x0, x0, #4
	b.ne	LBB6_105
; %bb.106:                              ;   in Loop: Header=BB6_95 Depth=3
	ldp	x3, x15, [sp, #304]             ; 16-byte Folded Reload
	cbz	x15, LBB6_94
LBB6_107:                               ;   in Loop: Header=BB6_95 Depth=3
	mov	x15, #0                         ; =0x0
	sub	x0, x19, x3
	lsl	x21, x3, #2
	add	x1, x30, x21
	add	x3, x3, x7
	lsl	x25, x3, #2
	ldur	x3, [x29, #-256]                ; 8-byte Folded Reload
	add	x3, x3, x25
	add	x21, x6, x21
	sub	x28, x27, #4
	add	x25, x28, x25
LBB6_108:                               ;   Parent Loop BB6_1 Depth=1
                                        ;     Parent Loop BB6_93 Depth=2
                                        ;       Parent Loop BB6_95 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	s5, [x21, x15]
	add	x28, x25, x15
	ldp	s6, s7, [x28]
	fmul	s6, s1, s6
	fmadd	s5, s0, s5, s6
	fmadd	s5, s2, s7, s5
	ldr	s6, [x28, #8]
	ldr	s7, [x1, x15]
	fmadd	s5, s3, s6, s5
	fmadd	s5, s4, s7, s5
	str	s5, [x3, x15]
	add	x15, x15, #4
	subs	x0, x0, #1
	b.ne	LBB6_108
	b	LBB6_94
LBB6_109:                               ;   in Loop: Header=BB6_1 Depth=1
	mov	w8, #0                          ; =0x0
	ldur	x9, [x29, #-256]                ; 8-byte Folded Reload
	add	x9, x9, x23
	add	x9, x9, #4
	add	x10, x27, x23
	add	x10, x10, #8
LBB6_110:                               ;   Parent Loop BB6_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB6_111 Depth 3
                                        ;         Child Loop BB6_112 Depth 4
	mov	x11, x10
	add	x12, x27, #4
	mov	x13, x9
	mov	w14, #1                         ; =0x1
LBB6_111:                               ;   Parent Loop BB6_1 Depth=1
                                        ;     Parent Loop BB6_110 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB6_112 Depth 4
	add	x14, x14, #1
	mov	x15, x11
	mov	x16, x12
	mov	x17, x13
	mov	w0, #5                          ; =0x5
LBB6_112:                               ;   Parent Loop BB6_1 Depth=1
                                        ;     Parent Loop BB6_110 Depth=2
                                        ;       Parent Loop BB6_111 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	q5, [x16]
	fmul.4s	v5, v5, v0[0]
	ldur	q6, [x15, #-8]
	fmla.4s	v5, v6, v1[0]
	ldur	q6, [x15, #-4]
	fmla.4s	v5, v6, v2[0]
	ldr	q6, [x15], #16
	fmla.4s	v5, v6, v3[0]
	ldr	q6, [x16, x24]
	fmla.4s	v5, v6, v4[0]
	str	q5, [x17], #16
	add	x0, x0, #4
	add	x16, x16, #16
	cmp	x0, x26
	b.lo	LBB6_112
; %bb.113:                              ;   in Loop: Header=BB6_111 Depth=3
	add	x13, x13, x23
	add	x12, x12, x23
	add	x11, x11, x23
	ldur	x15, [x29, #-240]               ; 8-byte Folded Reload
	cmp	x14, x15
	b.ne	LBB6_111
; %bb.114:                              ;   in Loop: Header=BB6_110 Depth=2
	add	w8, w8, #1
	ldr	x11, [sp, #280]                 ; 8-byte Reload
	cmp	w8, w11
	b.ne	LBB6_110
LBB6_115:                               ;   in Loop: Header=BB6_1 Depth=1
	sub	x1, x29, #224
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldp	x9, x8, [x29, #-208]
	str	x9, [sp, #312]                  ; 8-byte Spill
	stur	x8, [x29, #-240]                ; 8-byte Folded Spill
	ldp	x9, x8, [x29, #-224]
	stp	x9, x8, [sp, #296]              ; 16-byte Folded Spill
	sub	x1, x29, #208
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldr	x8, [sp, #280]                  ; 8-byte Reload
	mov	x19, x8
	ldp	x20, x21, [sp, #184]            ; 16-byte Folded Reload
	ldr	x25, [sp, #200]                 ; 8-byte Reload
LBB6_116:                               ;   Parent Loop BB6_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sub	x1, x29, #192
	mov	x0, x27
	mov	x2, x20
	mov	x3, x25
	mov	x4, x21
	bl	_star3_sve_load5
	subs	w19, w19, #1
	b.ne	LBB6_116
; %bb.117:                              ;   in Loop: Header=BB6_1 Depth=1
	sub	x1, x29, #224
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldp	x9, x8, [x29, #-208]
	stp	x9, x8, [sp, #264]              ; 16-byte Folded Spill
	ldp	x28, x8, [x29, #-224]
	str	x8, [sp, #256]                  ; 8-byte Spill
	sub	x1, x29, #208
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldr	x8, [sp, #280]                  ; 8-byte Reload
	mov	x19, x8
	ldr	x20, [sp, #208]                 ; 8-byte Reload
LBB6_118:                               ;   Parent Loop BB6_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sub	x1, x29, #192
	mov	x0, x27
	mov	x2, x20
	mov	x3, x25
	mov	x4, x21
	bl	_star3_neon_rb4
	subs	w19, w19, #1
	b.ne	LBB6_118
; %bb.119:                              ;   in Loop: Header=BB6_1 Depth=1
	sub	x1, x29, #224
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldp	x20, x19, [x29, #-208]
	ldp	x22, x21, [x29, #-224]
	sub	x1, x29, #208
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldp	x8, x24, [sp, #280]             ; 16-byte Folded Reload
	mov	x23, x8
LBB6_120:                               ;   Parent Loop BB6_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sub	x1, x29, #192
	mov	x0, x27
	mov	x2, x24
	mov	x3, x25
	mov	x4, x26
	bl	_star3_sve_rb4
	subs	w23, w23, #1
	b.ne	LBB6_120
; %bb.121:                              ;   in Loop: Header=BB6_1 Depth=1
	sub	x8, x22, x20
	scvtf	d0, x8
	sub	x8, x21, x19
	scvtf	d1, x8
	mov	x9, #145685290680320            ; =0x848000000000
	movk	x9, #16686, lsl #48
	fmov	d10, x9
	fdiv	d1, d1, d10
	mov	x10, #70368744177664            ; =0x400000000000
	movk	x10, #16527, lsl #48
	fmov	d11, x10
	ldp	x11, x8, [sp, #256]             ; 16-byte Folded Reload
	sub	x8, x28, x8
	scvtf	d2, x8
	ldr	x8, [sp, #272]                  ; 8-byte Reload
	sub	x8, x11, x8
	scvtf	d3, x8
	fmadd	d0, d0, d11, d1
	fdiv	d1, d3, d10
	fmadd	d1, d2, d11, d1
	ldr	x8, [sp, #312]                  ; 8-byte Reload
	ldr	x11, [sp, #296]                 ; 8-byte Reload
	sub	x8, x11, x8
	scvtf	d2, x8
	ldur	x8, [x29, #-240]                ; 8-byte Folded Reload
	ldr	x11, [sp, #304]                 ; 8-byte Reload
	sub	x8, x11, x8
	scvtf	d3, x8
	fdiv	d3, d3, d10
	fmadd	d2, d2, d11, d3
	ldp	q6, q5, [sp, #128]              ; 32-byte Folded Reload
	ldp	q16, q7, [sp, #96]              ; 32-byte Folded Reload
	zip1.2d	v3, v16, v6
	zip1.2d	v4, v7, v5
	sub.2d	v3, v3, v4
	zip2.2d	v4, v16, v6
	zip2.2d	v5, v7, v5
	sub.2d	v4, v4, v5
	ldr	s5, [sp, #164]                  ; 4-byte Reload
	ldr	x20, [sp, #280]                 ; 8-byte Reload
	mov.s	v5[1], w20
	ushll.2d	v5, v5, #0
	ucvtf.2d	v5, v5
	ucvtf	d14, w20
	fdiv	d6, d0, d14
	fdiv	d0, d1, d14
	stp	d0, d6, [sp, #304]              ; 16-byte Folded Spill
	scvtf.2d	v0, v3
	scvtf.2d	v1, v4
	dup.2d	v3, x9
	fdiv.2d	v1, v1, v3
	dup.2d	v3, x10
	fmla.2d	v1, v3, v0
	fdiv.2d	v0, v1, v5
	stur	q0, [x29, #-240]                ; 16-byte Folded Spill
	fdiv	d12, d2, d14
	sub	x1, x29, #224
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldp	x8, x9, [x29, #-208]
	ldp	x10, x11, [x29, #-224]
	sub	x8, x10, x8
	scvtf	d0, x8
	sub	x8, x11, x9
	scvtf	d1, x8
	fdiv	d1, d1, d10
	fmadd	d0, d0, d11, d1
	fdiv	d14, d0, d14
	sub	x8, x25, #2
	ldr	x9, [sp, #192]                  ; 8-byte Reload
	sub	x9, x9, #2
	mul	x19, x9, x8
	scvtf	d10, x19
	ldur	q0, [x29, #-240]                ; 16-byte Folded Reload
	mov	d15, v0[1]
	fdiv	d0, d10, d15
	fdiv	d13, d0, d11
Lloh42:
	adrp	x0, l_str.29@PAGE
Lloh43:
	add	x0, x0, l_str.29@PAGEOFF
	bl	_puts
	mov	x8, #63439                      ; =0xf7cf
	movk	x8, #58195, lsl #16
	movk	x8, #39845, lsl #32
	movk	x8, #8388, lsl #48
	smulh	x8, x19, x8
	asr	x9, x8, #7
	add	x8, x9, x8, lsr #63
	stp	x8, x20, [sp, #16]
	stp	x25, x26, [sp]
Lloh44:
	adrp	x0, l_.str.13@PAGE
Lloh45:
	add	x0, x0, l_.str.13@PAGEOFF
	bl	_printf
Lloh46:
	adrp	x0, l_str.30@PAGE
Lloh47:
	add	x0, x0, l_str.30@PAGEOFF
	bl	_puts
Lloh48:
	adrp	x0, l_str.31@PAGE
Lloh49:
	add	x0, x0, l_str.31@PAGEOFF
	bl	_puts
Lloh50:
	adrp	x19, l_str.34@PAGE
Lloh51:
	add	x19, x19, l_str.34@PAGEOFF
	mov	x0, x19
	bl	_puts
	str	d13, [sp, #8]
	ldur	q0, [x29, #-240]                ; 16-byte Folded Reload
	st1.d	{ v0 }[1], [sp]
Lloh52:
	adrp	x0, l_.str.17@PAGE
Lloh53:
	add	x0, x0, l_.str.17@PAGEOFF
	bl	_printf
	ldur	q2, [x29, #-240]                ; 16-byte Folded Reload
	fdiv	d0, d10, d2
	fdiv	d0, d0, d11
	fdiv	d1, d2, d15
	stp	d0, d1, [sp, #8]
	str	d2, [sp]
Lloh54:
	adrp	x0, l_.str.18@PAGE
Lloh55:
	add	x0, x0, l_.str.18@PAGEOFF
	bl	_printf
	mov	x0, x19
	bl	_puts
	fdiv	d0, d10, d12
	fdiv	d0, d0, d11
	fdiv	d1, d15, d12
	stp	d0, d1, [sp, #8]
	str	d12, [sp]
Lloh56:
	adrp	x0, l_.str.19@PAGE
Lloh57:
	add	x0, x0, l_.str.19@PAGEOFF
	bl	_printf
	ldr	d2, [sp, #304]                  ; 8-byte Reload
	fdiv	d0, d10, d2
	fdiv	d0, d0, d11
	fdiv	d1, d15, d2
	stp	d0, d1, [sp, #8]
	str	d2, [sp]
Lloh58:
	adrp	x0, l_.str.20@PAGE
Lloh59:
	add	x0, x0, l_.str.20@PAGEOFF
	bl	_printf
	mov	x0, x19
	bl	_puts
	ldr	d2, [sp, #312]                  ; 8-byte Reload
	fdiv	d0, d10, d2
	fdiv	d0, d0, d11
	fdiv	d1, d15, d2
	stp	d0, d1, [sp, #8]
	str	d2, [sp]
Lloh60:
	adrp	x0, l_.str.21@PAGE
Lloh61:
	add	x0, x0, l_.str.21@PAGEOFF
	bl	_printf
	fdiv	d0, d10, d14
	fdiv	d0, d0, d11
	fdiv	d1, d15, d14
	stp	d0, d1, [sp, #8]
	str	d14, [sp]
Lloh62:
	adrp	x0, l_.str.22@PAGE
Lloh63:
	add	x0, x0, l_.str.22@PAGEOFF
	bl	_printf
Lloh64:
	adrp	x0, l_str.35@PAGE
Lloh65:
	add	x0, x0, l_str.35@PAGEOFF
	bl	_puts
	mov	x0, x27
	bl	_free
	ldur	x0, [x29, #-248]                ; 8-byte Folded Reload
	bl	_free
	ldr	x0, [sp, #168]                  ; 8-byte Reload
	bl	_free
	ldur	x0, [x29, #-256]                ; 8-byte Folded Reload
	bl	_free
	ldr	x0, [sp, #184]                  ; 8-byte Reload
	bl	_free
	ldr	x0, [sp, #208]                  ; 8-byte Reload
	bl	_free
	mov	x0, x24
	bl	_free
	ldr	x9, [sp, #176]                  ; 8-byte Reload
	add	x9, x9, #1
	cmp	x9, #6
	b.ne	LBB6_1
; %bb.122:
	ldur	x8, [x29, #-160]
Lloh66:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh67:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh68:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB6_124
; %bb.123:
	mov	w0, #0                          ; =0x0
	add	sp, sp, #432
	ldp	x29, x30, [sp, #144]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #64]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #48]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #32]             ; 16-byte Folded Reload
	ldp	d13, d12, [sp, #16]             ; 16-byte Folded Reload
	ldp	d15, d14, [sp], #160            ; 16-byte Folded Reload
	ret
LBB6_124:
	bl	___stack_chk_fail
	.loh AdrpAddLdr	Lloh13, Lloh14, Lloh15
	.loh AdrpAdd	Lloh11, Lloh12
	.loh AdrpAdd	Lloh9, Lloh10
	.loh AdrpAdd	Lloh7, Lloh8
	.loh AdrpAdd	Lloh5, Lloh6
	.loh AdrpAdd	Lloh3, Lloh4
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh22, Lloh23
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpAdd	Lloh26, Lloh27
	.loh AdrpAdd	Lloh24, Lloh25
	.loh AdrpAdd	Lloh30, Lloh31
	.loh AdrpAdd	Lloh28, Lloh29
	.loh AdrpAdd	Lloh34, Lloh35
	.loh AdrpAdd	Lloh32, Lloh33
	.loh AdrpAdd	Lloh40, Lloh41
	.loh AdrpAdd	Lloh38, Lloh39
	.loh AdrpAdd	Lloh36, Lloh37
	.loh AdrpAdd	Lloh64, Lloh65
	.loh AdrpAdd	Lloh62, Lloh63
	.loh AdrpAdd	Lloh60, Lloh61
	.loh AdrpAdd	Lloh58, Lloh59
	.loh AdrpAdd	Lloh56, Lloh57
	.loh AdrpAdd	Lloh54, Lloh55
	.loh AdrpAdd	Lloh52, Lloh53
	.loh AdrpAdd	Lloh50, Lloh51
	.loh AdrpAdd	Lloh48, Lloh49
	.loh AdrpAdd	Lloh46, Lloh47
	.loh AdrpAdd	Lloh44, Lloh45
	.loh AdrpAdd	Lloh42, Lloh43
	.loh AdrpLdrGotLdr	Lloh66, Lloh67, Lloh68
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
	.p2align	2, 0x0                          ; @__const.main.sizes
l___const.main.sizes:
	.long	128                             ; 0x80
	.long	128                             ; 0x80
	.long	256                             ; 0x100
	.long	256                             ; 0x100
	.long	512                             ; 0x200
	.long	512                             ; 0x200
	.long	1024                            ; 0x400
	.long	1024                            ; 0x400
	.long	2048                            ; 0x800
	.long	2048                            ; 0x800
	.long	4096                            ; 0x1000
	.long	4096                            ; 0x1000

	.p2align	2, 0x0                          ; @__const.run_bench.kernel
l___const.run_bench.kernel:
	.long	0x3e4ccccd                      ; float 0.200000003
	.long	0x3e4ccccd                      ; float 0.200000003
	.long	0x3e4ccccd                      ; float 0.200000003
	.long	0x3e4ccccd                      ; float 0.200000003
	.long	0x3e4ccccd                      ; float 0.200000003

	.section	__TEXT,__cstring,cstring_literals
l_.str.5:                               ; @.str.5
	.asciz	"[Verify %dx%d]  neon_x4=%s  sve_load5=%s  neon_rb4=%s  sve_rb4=%s\n\n"

l_.str.6:                               ; @.str.6
	.asciz	"neon_x4"

l_.str.7:                               ; @.str.7
	.asciz	"PASS"

l_.str.8:                               ; @.str.8
	.asciz	"FAIL"

l_.str.9:                               ; @.str.9
	.asciz	"sve_load5"

l_.str.10:                              ; @.str.10
	.asciz	"neon_rb4"

l_.str.11:                              ; @.str.11
	.asciz	"sve_rb4"

l_.str.13:                              ; @.str.13
	.asciz	"\342\224\202 Grid %5dx%-5d  inner=%ldK  runs=%d\n"

l_.str.17:                              ; @.str.17
	.asciz	"\342\224\202 V1 Scalar autovec (O3)           \342\224\202 %7.3f  \342\224\202 %9.1f  \342\224\202    1.00x    \342\224\202\n"

l_.str.18:                              ; @.str.18
	.asciz	"\342\224\202 V2 Scalar novec (optnone)        \342\224\202 %7.3f  \342\224\202 %9.1f  \342\224\202  %6.2fx    \342\224\202\n"

l_.str.19:                              ; @.str.19
	.asciz	"\342\224\202 V3 NEON x4                       \342\224\202 %7.3f  \342\224\202 %9.1f  \342\224\202  %6.2fx    \342\224\202\n"

l_.str.20:                              ; @.str.20
	.asciz	"\342\224\202 V4 SVE streaming load5 (pg_all)  \342\224\202 %7.3f  \342\224\202 %9.1f  \342\224\202  %6.2fx    \342\224\202\n"

l_.str.21:                              ; @.str.21
	.asciz	"\342\224\202 V5 NEON x16 + regblock4          \342\224\202 %7.3f  \342\224\202 %9.1f  \342\224\202  %6.2fx    \342\224\202\n"

l_.str.22:                              ; @.str.22
	.asciz	"\342\224\202 V6 SVE streaming rb4  (pg_all)   \342\224\202 %7.3f  \342\224\202 %9.1f  \342\224\202  %6.2fx    \342\224\202\n"

l_.str.24:                              ; @.str.24
	.asciz	"  [%s] MISMATCH (%d,%d): ref=%.6f got=%.6f\n"

l_str:                                  ; @str
	.asciz	"Star3 Stencil Benchmark  (FP32, 5-point star, 6 versions)"

l_str.25:                               ; @str.25
	.asciz	"============================================================"

l_str.26:                               ; @str.26
	.asciz	"V1: scalar autovec   V2: scalar novec"

l_str.27:                               ; @str.27
	.asciz	"V3: NEON x4          V4: SVE streaming load5"

l_str.28:                               ; @str.28
	.asciz	"V5: NEON x16+rb4     V6: SVE streaming rb4\n"

l_str.29:                               ; @str.29
	.asciz	"\342\224\214\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\220"

l_str.30:                               ; @str.30
	.asciz	"\342\224\234\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\254\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\254\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\254\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\244"

l_str.31:                               ; @str.31
	.asciz	"\342\224\202 Version                          \342\224\202   ms     \342\224\202  Mpix/s    \342\224\202 vs autovec  \342\224\202"

l_str.34:                               ; @str.34
	.asciz	"\342\224\234\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\274\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\274\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\274\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\244"

l_str.35:                               ; @str.35
	.asciz	"\342\224\224\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\264\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\264\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\264\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\230\n"

.subsections_via_symbols
