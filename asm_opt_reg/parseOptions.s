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
.LFB6:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 80
	mov	QWORD PTR -56[rbp], rdi  # opt
	mov	DWORD PTR -60[rbp], esi  # argc
	mov	QWORD PTR -72[rbp], rdx  # argv
	mov	DWORD PTR -32[rbp], 0  # input_mode = FROM_STDIN
	mov	DWORD PTR -28[rbp], 0  # output_mode = TO_STDOUT
	mov	QWORD PTR -24[rbp], 0  # input_file = NULL
	mov	QWORD PTR -16[rbp], 0  # output_file = NULL
	mov	DWORD PTR -8[rbp], 0  # show_help = 0
	mov	DWORD PTR -4[rbp], 0  # valid = 0
	mov	DWORD PTR -36[rbp], 1  # i = 1
	jmp	.L2
.L11:
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -72[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	movzx	eax, BYTE PTR 1[rax]
	mov	BYTE PTR -37[rbp], al  # key = argv[i][1]
	cmp	BYTE PTR -37[rbp], 104   # if key == h
	jne	.L3
	mov	DWORD PTR -8[rbp], 1  # show_help = 1
	mov	DWORD PTR -4[rbp], 1  # valid = 1
	mov	rcx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR [rcx], rax
	mov	QWORD PTR 8[rcx], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rcx], rax
	mov	QWORD PTR 24[rcx], rdx    # return opt
	jmp	.L12
.L3:
	cmp	BYTE PTR -37[rbp], 105  # if key == i
	jne	.L5
	mov	eax, DWORD PTR -36[rbp]
	add	eax, 1
	cmp	DWORD PTR -60[rbp], eax  # if i + 1 >= argc
	jg	.L6
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 26
	mov	esi, 1
	lea	rax, .LC0[rip]  # "Input file not specified"
	mov	rdi, rax
	call	fwrite@PLT
	mov	rcx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR [rcx], rax
	mov	QWORD PTR 8[rcx], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rcx], rax
	mov	QWORD PTR 24[rcx], rdx
	jmp	.L12  # return opt
.L6:
	mov	eax, DWORD PTR -36[rbp]  # input_file
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -72[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]  # argv[i + 1]
	mov	QWORD PTR -24[rbp], rax
	mov	DWORD PTR -32[rbp], 1  # input_mode = FROM_FILE
	add	DWORD PTR -36[rbp], 1  # ++i
	jmp	.L7
.L5:
	cmp	BYTE PTR -37[rbp], 111  # else if key == 'o'
	jne	.L8
	mov	eax, DWORD PTR -36[rbp]  # i
	add	eax, 1  # i += 1
	cmp	DWORD PTR -60[rbp], eax  # if i + 1 >= argc
	jg	.L9
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 27
	mov	esi, 1
	lea	rax, .LC1[rip]  # "Output file not specified.\n"
	mov	rdi, rax
	call	fwrite@PLT
	mov	rcx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR [rcx], rax
	mov	QWORD PTR 8[rcx], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rcx], rax
	mov	QWORD PTR 24[rcx], rdx
	jmp	.L12  # return opt
.L9:
	mov	eax, DWORD PTR -36[rbp]  # i
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -72[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]  # argv[i + 1]
	mov	QWORD PTR -16[rbp], rax  # output_file = argv[i + 1]
	mov	DWORD PTR -28[rbp], 1  # output_mode = TO_FILE
	add	DWORD PTR -36[rbp], 1  # ++i
	jmp	.L7
.L8:
	cmp	BYTE PTR -37[rbp], 114  # if key == 'r'
	jne	.L10
	mov	DWORD PTR -32[rbp], 2  # input_mode = FROM_RANDOM
	jmp	.L7
.L10:
	mov	eax, DWORD PTR -36[rbp]  # i
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -72[rbp]
	add	rax, rdx
	mov	rdx, QWORD PTR [rax]  # rdx = argv[i]
	mov	rax, QWORD PTR stderr[rip]
	lea	rcx, .LC2[rip]  # "Key %s not recognized.\n"
	mov	rsi, rcx  # rsi = "Key %s not recognized.\n"
	mov	rdi, rax  # rdi = stderr
	mov	eax, 0
	call	fprintf@PLT
	mov	rcx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR [rcx], rax
	mov	QWORD PTR 8[rcx], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rcx], rax
	mov	QWORD PTR 24[rcx], rdx
	jmp	.L12  # return opt
.L7:
	add	DWORD PTR -36[rbp], 1  # i = 1
.L2:
	mov	eax, DWORD PTR -36[rbp]  # i
	cmp	eax, DWORD PTR -60[rbp]  # argc
	jl	.L11
	mov	DWORD PTR -4[rbp], 1  # valid
	mov	rcx, QWORD PTR -56[rbp]  
	mov	rax, QWORD PTR -32[rbp]  # input_mode
	mov	rdx, QWORD PTR -24[rbp]  # opt
	mov	QWORD PTR [rcx], rax
	mov	QWORD PTR 8[rcx], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rcx], rax
	mov	QWORD PTR 24[rcx], rdx
.L12:
	mov	rax, QWORD PTR -56[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	parseOptions, .-parseOptions
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
