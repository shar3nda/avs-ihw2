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
	mov	r12, rdi  # data
	mov	r13d, esi  # length
	mov	r14, rdx  # lower
	mov	r15, rcx  # upper
	mov	ebx, 0     # i
	jmp	.L2
.L5:
	mov	eax, ebx
	movsx	rdx, eax
	mov	rax, r12
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]  # eax = data[i] (= al)
	cmp	al, 64  # data[i] > 64 ?
	jle	.L3
	mov	eax, ebx
	movsx	rdx, eax
	mov	rax, r12
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]  # eax = data[i] (= al)
	cmp	al, 90  # data[i] <= 90 ?
	jg	.L3
	mov	rax, r15
	mov	eax, DWORD PTR [rax]
	lea	edx, 1[rax]
	mov	rax, r15
	mov	DWORD PTR [rax], edx  # *upper += 1
	jmp	.L4  # continue
.L3:
	mov	eax, ebx
	movsx	rdx, eax
	mov	rax, r12
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]  # eax = data[i] (= al)
	cmp	al, 96  # data[i] > 96 ?
	jle	.L4  # continue
	mov	eax, ebx
	movsx	rdx, eax
	mov	rax, r12
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]  # eax = data[i] (= al)
	cmp	al, 122  # data[i] <= 122
	jg	.L4  # continue
	mov	rax, r14
	mov	eax, DWORD PTR [rax]
	lea	edx, 1[rax]
	mov	rax, r14
	mov	DWORD PTR [rax], edx  # *lower += 1
.L4:
	add	ebx, 1  # ++i
.L2:
	mov	eax, ebx  # eax = i
	cmp	eax, r13d  # i < length ?
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
