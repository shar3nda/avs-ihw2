	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"Error opening input file %s\n"
.LC2:
	.string	"w"
.LC3:
	.string	"Error opening output file %s\n"
.LC4:
	.string	"Lowercase: %i, uppercase: %i\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 1120
	mov	DWORD PTR -1108[rbp], edi
	mov	QWORD PTR -1120[rbp], rsi
	lea	rax, -64[rbp]
	mov	rdx, QWORD PTR -1120[rbp]
	mov	ecx, DWORD PTR -1108[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	parseOptions@PLT
	mov	eax, DWORD PTR -40[rbp]
	test	eax, eax
	jne	.L2
	mov	eax, DWORD PTR -36[rbp]
	test	eax, eax
	jne	.L3
.L2:
	mov	eax, 0
	call	printHelp@PLT
	mov	eax, 0
	jmp	.L12
.L3:
	mov	QWORD PTR -8[rbp], 0
	mov	eax, DWORD PTR -64[rbp]
	test	eax, eax
	jne	.L5
	mov	rax, QWORD PTR stdin[rip]
	mov	QWORD PTR -8[rbp], rax
	jmp	.L6
.L5:
	mov	eax, DWORD PTR -64[rbp]
	cmp	eax, 1
	jne	.L6
	mov	rax, QWORD PTR -56[rbp]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -8[rbp], 0
	jne	.L6
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR stderr[rip]
	lea	rcx, .LC1[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	eax, 1
	jmp	.L12
.L6:
	mov	DWORD PTR -1092[rbp], 0
	mov	DWORD PTR -1096[rbp], 0
.L7:
	mov	rdx, QWORD PTR -8[rbp]
	lea	rax, -1088[rbp]
	mov	rcx, rdx
	mov	edx, 1024
	mov	esi, 1
	mov	rdi, rax
	call	fread@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	esi, eax
	lea	rcx, -1096[rbp]
	lea	rdx, -1092[rbp]
	lea	rax, -1088[rbp]
	mov	rdi, rax
	call	countLU@PLT
	cmp	QWORD PTR -24[rbp], 1024
	je	.L7
	mov	eax, DWORD PTR -64[rbp]
	cmp	eax, 1
	jne	.L8
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT
.L8:
	mov	QWORD PTR -16[rbp], 0
	mov	eax, DWORD PTR -60[rbp]
	test	eax, eax
	jne	.L9
	mov	rax, QWORD PTR stdout[rip]
	mov	QWORD PTR -16[rbp], rax
	jmp	.L10
.L9:
	mov	eax, DWORD PTR -60[rbp]
	cmp	eax, 1
	jne	.L10
	mov	rax, QWORD PTR -48[rbp]
	lea	rdx, .LC2[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	cmp	QWORD PTR -16[rbp], 0
	jne	.L10
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR stderr[rip]
	lea	rcx, .LC3[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	eax, 1
	jmp	.L12
.L10:
	mov	ecx, DWORD PTR -1096[rbp]
	mov	edx, DWORD PTR -1092[rbp]
	mov	rax, QWORD PTR -16[rbp]
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	eax, DWORD PTR -60[rbp]
	cmp	eax, 1
	jne	.L11
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
.L11:
	mov	eax, 0
.L12:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
