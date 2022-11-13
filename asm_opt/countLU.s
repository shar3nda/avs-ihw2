	.file	"countLU.c"
	.intel_syntax noprefix
# GNU C17 (GCC) version 12.2.0 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 12.2.0, GMP version 6.2.1, MPFR version 4.1.0-p13, MPC version 1.2.1, isl version isl-0.25-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions
	.text
	.globl	countLU
	.type	countLU, @function
countLU:
	push	rbp	#
	mov	rbp, rsp	#,
	mov	QWORD PTR -24[rbp], rdi	# data, data
	mov	DWORD PTR -28[rbp], esi	# length, length
	mov	QWORD PTR -40[rbp], rdx	# lower, lower
	mov	QWORD PTR -48[rbp], rcx	# upper, upper
# ./countLU.c:2:     for (int i = 0; i < length; ++i) {
	mov	DWORD PTR -4[rbp], 0	# i,
# ./countLU.c:2:     for (int i = 0; i < length; ++i) {
	jmp	.L2	#
.L5:
# ./countLU.c:3:         if ((data[i] >= 65) && (data[i] <= 90)) {
	mov	eax, DWORD PTR -4[rbp]	# tmp98, i
	movsx	rdx, eax	# _1, tmp98
	mov	rax, QWORD PTR -24[rbp]	# tmp99, data
	add	rax, rdx	# _2, _1
	movzx	eax, BYTE PTR [rax]	# _3, *_2
# ./countLU.c:3:         if ((data[i] >= 65) && (data[i] <= 90)) {
	cmp	al, 64	# _3,
	jle	.L3	#,
# ./countLU.c:3:         if ((data[i] >= 65) && (data[i] <= 90)) {
	mov	eax, DWORD PTR -4[rbp]	# tmp100, i
	movsx	rdx, eax	# _4, tmp100
	mov	rax, QWORD PTR -24[rbp]	# tmp101, data
	add	rax, rdx	# _5, _4
	movzx	eax, BYTE PTR [rax]	# _6, *_5
# ./countLU.c:3:         if ((data[i] >= 65) && (data[i] <= 90)) {
	cmp	al, 90	# _6,
	jg	.L3	#,
# ./countLU.c:4:             *upper += 1;
	mov	rax, QWORD PTR -48[rbp]	# tmp102, upper
	mov	eax, DWORD PTR [rax]	# _7, *upper_24(D)
# ./countLU.c:4:             *upper += 1;
	lea	edx, 1[rax]	# _8,
	mov	rax, QWORD PTR -48[rbp]	# tmp103, upper
	mov	DWORD PTR [rax], edx	# *upper_24(D), _8
	jmp	.L4	#
.L3:
# ./countLU.c:5:         } else if ((data[i] >= 97) && (data[i] <= 122)) {
	mov	eax, DWORD PTR -4[rbp]	# tmp104, i
	movsx	rdx, eax	# _9, tmp104
	mov	rax, QWORD PTR -24[rbp]	# tmp105, data
	add	rax, rdx	# _10, _9
	movzx	eax, BYTE PTR [rax]	# _11, *_10
# ./countLU.c:5:         } else if ((data[i] >= 97) && (data[i] <= 122)) {
	cmp	al, 96	# _11,
	jle	.L4	#,
# ./countLU.c:5:         } else if ((data[i] >= 97) && (data[i] <= 122)) {
	mov	eax, DWORD PTR -4[rbp]	# tmp106, i
	movsx	rdx, eax	# _12, tmp106
	mov	rax, QWORD PTR -24[rbp]	# tmp107, data
	add	rax, rdx	# _13, _12
	movzx	eax, BYTE PTR [rax]	# _14, *_13
# ./countLU.c:5:         } else if ((data[i] >= 97) && (data[i] <= 122)) {
	cmp	al, 122	# _14,
	jg	.L4	#,
# ./countLU.c:6:             *lower += 1;
	mov	rax, QWORD PTR -40[rbp]	# tmp108, lower
	mov	eax, DWORD PTR [rax]	# _15, *lower_26(D)
# ./countLU.c:6:             *lower += 1;
	lea	edx, 1[rax]	# _16,
	mov	rax, QWORD PTR -40[rbp]	# tmp109, lower
	mov	DWORD PTR [rax], edx	# *lower_26(D), _16
.L4:
# ./countLU.c:2:     for (int i = 0; i < length; ++i) {
	add	DWORD PTR -4[rbp], 1	# i,
.L2:
# ./countLU.c:2:     for (int i = 0; i < length; ++i) {
	mov	eax, DWORD PTR -4[rbp]	# tmp110, i
	cmp	eax, DWORD PTR -28[rbp]	# tmp110, length
	jl	.L5	#,
# ./countLU.c:9: }
	nop	
	nop	
	pop	rbp	#
	ret	
	.size	countLU, .-countLU
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
