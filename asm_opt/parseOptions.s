	.file	"parseOptions.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"Input file not specified.\n"
.LC1:
	.string	"Output file not specified.\n"
.LC2:
	.string	"Key %s not recognized.\n"
	.text
	.globl	parseOptions
	.type	parseOptions, @function
parseOptions:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 80
	mov	QWORD PTR -56[rbp], rdi
	mov	DWORD PTR -60[rbp], esi
	mov	QWORD PTR -72[rbp], rdx
	mov	DWORD PTR -48[rbp], 0
	mov	DWORD PTR -44[rbp], 0
	mov	QWORD PTR -40[rbp], 0
	mov	QWORD PTR -32[rbp], 0
	mov	DWORD PTR -24[rbp], 0
	mov	DWORD PTR -20[rbp], 0
	mov	DWORD PTR -4[rbp], 1
	jmp	.L2
.L11:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -72[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	movzx	eax, BYTE PTR 1[rax]
	mov	BYTE PTR -5[rbp], al
	cmp	BYTE PTR -5[rbp], 104
	jne	.L3
	mov	DWORD PTR -24[rbp], 1
	mov	DWORD PTR -20[rbp], 1
	mov	rcx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR [rcx], rax
	mov	QWORD PTR 8[rcx], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR 16[rcx], rax
	mov	QWORD PTR 24[rcx], rdx
	jmp	.L12
.L3:
	cmp	BYTE PTR -5[rbp], 105
	jne	.L5
	mov	eax, DWORD PTR -4[rbp]
	add	eax, 1
	cmp	DWORD PTR -60[rbp], eax
	jg	.L6
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 26
	mov	esi, 1
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	fwrite@PLT
	mov	rcx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR [rcx], rax
	mov	QWORD PTR 8[rcx], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR 16[rcx], rax
	mov	QWORD PTR 24[rcx], rdx
	jmp	.L12
.L6:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -72[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	DWORD PTR -48[rbp], 1
	add	DWORD PTR -4[rbp], 1
	jmp	.L7
.L5:
	cmp	BYTE PTR -5[rbp], 111
	jne	.L8
	mov	eax, DWORD PTR -4[rbp]
	add	eax, 1
	cmp	DWORD PTR -60[rbp], eax
	jg	.L9
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 27
	mov	esi, 1
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	fwrite@PLT
	mov	rcx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR [rcx], rax
	mov	QWORD PTR 8[rcx], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR 16[rcx], rax
	mov	QWORD PTR 24[rcx], rdx
	jmp	.L12
.L9:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -72[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	DWORD PTR -44[rbp], 1
	add	DWORD PTR -4[rbp], 1
	jmp	.L7
.L8:
	cmp	BYTE PTR -5[rbp], 114
	jne	.L10
	mov	DWORD PTR -48[rbp], 2
	jmp	.L7
.L10:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -72[rbp]
	add	rax, rdx
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR stderr[rip]
	lea	rcx, .LC2[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	rcx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR [rcx], rax
	mov	QWORD PTR 8[rcx], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR 16[rcx], rax
	mov	QWORD PTR 24[rcx], rdx
	jmp	.L12
.L7:
	add	DWORD PTR -4[rbp], 1
.L2:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -60[rbp]
	jl	.L11
	mov	DWORD PTR -20[rbp], 1
	mov	rcx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR [rcx], rax
	mov	QWORD PTR 8[rcx], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR 16[rcx], rax
	mov	QWORD PTR 24[rcx], rdx
.L12:
	mov	rax, QWORD PTR -56[rbp]
	leave
	ret
	.size	parseOptions, .-parseOptions
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
