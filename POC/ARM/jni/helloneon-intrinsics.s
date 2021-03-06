	.syntax unified
	.arch armv7-a
	.eabi_attribute 27, 3
	.fpu neon
	.eabi_attribute 23, 1
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.thumb
	.file	"helloneon-intrinsics.c"
	.section	.text.neon_interlace,"ax",%progbits
	.align	2
	.global	neon_interlace
	.thumb
	.thumb_func
	.type	neon_interlace, %function
neon_interlace:
	.fnstart
.LFB1871:
	@ args = 8, pretend = 0, frame = 104
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, r9, sl, fp}
	.save {r4, r5, r6, r7, r8, r9, sl, fp}
.LCFI0:
	.pad #64
	sub	sp, sp, #64
	ldr	r4, [sp, #96]
	ldr	r5, [sp, #100]
	mul     r6,r4,r5
        asr	r6, r6, #3	
  .loop:
      vld1.8      {d0}, [r1]!
      vld1.8      {d1}, [r2]!
      vld1.8      {d2}, [r3]!
      vst3.8      {d0-d2},[r0]!
      subs r6,r6,#1    
      bne         .loop

      add	sp, sp, #64
      pop	{r4, r5, r6, r7, r8, r9, sl, fp}
      bx	lr
.LFE1871:
	.fnend
	.size	neon_interlace, .-neon_interlace
	.section	.text.neon_deinterlace,"ax",%progbits
	.align	2
	.global	neon_deinterlace
	.thumb
	.thumb_func
	.type	neon_deinterlace, %function
neon_deinterlace:
	.fnstart
.LFB1870:
	@ args = 8, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, r9, sl, fp}
	.save {r4, r5, r6, r7, r8, r9, sl, fp}
.LCFI2:
	.pad #64
	sub	sp, sp, #64
	mov	r7, r0
	ldr	r4, [sp, #96]
	ldr	r5, [sp, #100]
	mul     r6,r4,r5
        asr	r6, r6, #3	
  .loop1:
      vld3.8      {d0-d2},[r0]!
      vst1.8      {d0}, [r1]!
      vst1.8      {d1}, [r2]!
      vst1.8      {d2}, [r3]!
      subs        r6, r6, #1
      bne         .loop1

      add	sp, sp, #64
      pop	{r4, r5, r6, r7, r8, r9, sl, fp}
      bx	lr
.LFE1870:
	.fnend
	.size	neon_deinterlace, .-neon_deinterlace
	.ident	"GCC: (GNU) 4.4.3"
	.section	.note.GNU-stack,"",%progbits
