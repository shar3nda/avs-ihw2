	.file	"countLU.c"
	.intel_syntax noprefix
	.text
	.globl	countLU
	.type	countLU, @function
countLU:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi  # data
	mov	DWORD PTR -28[rbp], esi  # length
	mov	QWORD PTR -40[rbp], rdx  # lower
	mov	QWORD PTR -48[rbp], rcx  # upper
	mov	DWORD PTR -4[rbp], 0     # i
	jmp	.L2
.L5:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]  # eax = data[i] (= al)
	cmp	al, 64  # data[i] > 64 ?
	jle	.L3
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]  # eax = data[i] (= al)
	cmp	al, 90  # data[i] <= 90 ?
	jg	.L3
	mov	rax, QWORD PTR -48[rbp]
	mov	eax, DWORD PTR [rax]
	lea	edx, 1[rax]
	mov	rax, QWORD PTR -48[rbp]
	mov	DWORD PTR [rax], edx  # *upper += 1
	jmp	.L4  # continue
.L3:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]  # eax = data[i] (= al)
	cmp	al, 96  # data[i] > 96 ?
	jle	.L4  # continue
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]  # eax = data[i] (= al)
	cmp	al, 122  # data[i] <= 122
	jg	.L4  # continue
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR [rax]
	lea	edx, 1[rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	DWORD PTR [rax], edx  # *lower += 1
.L4:
	add	DWORD PTR -4[rbp], 1  # ++i
.L2:
	mov	eax, DWORD PTR -4[rbp]  # eax = i
	cmp	eax, DWORD PTR -28[rbp]  # i < length ?
	jl	.L5
	nop
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	countLU, .-countLU
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
