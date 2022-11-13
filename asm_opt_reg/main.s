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
.LFB6:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 1120
	mov	DWORD PTR -1108[rbp], edi  # argc
	mov	QWORD PTR -1120[rbp], rsi  # argv
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, -1072[rbp]
	mov	rdx, QWORD PTR -1120[rbp]  # argv
	mov	ecx, DWORD PTR -1108[rbp]  # argc
	mov	esi, ecx  # esi = argc
	mov	rdi, rax  # rdi = argv
	call	parseOptions@PLT
	mov	eax, DWORD PTR -1048[rbp]  # opt.show_help
	test	eax, eax  # if show_help
	jne	.L2
	mov	eax, DWORD PTR -1044[rbp]  # opt.valid
	test	eax, eax  # if !valid
	jne	.L3
.L2:
	mov	eax, 0
	call	printHelp@PLT
	mov	eax, 0
	jmp	.L12
.L3:
	mov	QWORD PTR -1096[rbp], 0  # *infile_p = NULL
	mov	eax, DWORD PTR -1072[rbp]  # opt.input_mode
	test	eax, eax  # if opt.input_mode == FROM_STDIN
	jne	.L5
	mov	rax, QWORD PTR stdin[rip]  # stdin
	mov	QWORD PTR -1096[rbp], rax  # infile_p = stdin
	jmp	.L6
.L5:
	mov	eax, DWORD PTR -1072[rbp]  # opt.input_mode
	cmp	eax, 1  # if input_mode == FROM_FILE
	jne	.L6
	mov	rax, QWORD PTR -1064[rbp]  # opt.input_file
	lea	rdx, .LC0[rip]  # "r"
	mov	rsi, rdx  # rsi = "r"
	mov	rdi, rax  # rdi = input_file
	call	fopen@PLT
	mov	QWORD PTR -1096[rbp], rax
	cmp	QWORD PTR -1096[rbp], 0  # if infile_p == NULL
	jne	.L6
	mov	rdx, QWORD PTR -1064[rbp]  # input_file
	mov	rax, QWORD PTR stderr[rip]  # stderr
	lea	rcx, .LC1[rip]  # "Error opening input file %s\n"
	mov	rsi, rcx  # Error opening input file %s\n"
	mov	rdi, rax  # stderr
	mov	eax, 0
	call	fprintf@PLT
	mov	eax, 1
	jmp	.L12
.L6:
	mov	DWORD PTR -1104[rbp], 0  # lower = 0
	mov	DWORD PTR -1100[rbp], 0  # upper = 0
.L7:
	mov	rdx, QWORD PTR -1096[rbp]  # infile
	lea	rax, -1040[rbp]  # buffer
	mov	rcx, rdx  # rcx = infile
	mov	edx, 1024  # edx = 1024
	mov	esi, 1  # esi = 1
	mov	rdi, rax  # rdi = buffer
	call	fread@PLT
	mov	QWORD PTR -1080[rbp], rax  # size = fread(...)
	mov	rax, QWORD PTR -1080[rbp]  # size
	mov	esi, eax  # esi = size
	lea	rcx, -1100[rbp]  # rcx = &upper 
	lea	rdx, -1104[rbp]  # rdx = &lower
	lea	rax, -1040[rbp]  # buffer
	mov	rdi, rax  # rdi = buffer
	call	countLU@PLT
	cmp	QWORD PTR -1080[rbp], 1024  # while (size == 1024)
	je	.L7
	mov	eax, DWORD PTR -1072[rbp]  # input_mode
	cmp	eax, 1  # if input_mode == FROM_FILE
	jne	.L8
	mov	rax, QWORD PTR -1096[rbp]  # infile_p
	mov	rdi, rax  # rdi = infile_p
	call	fclose@PLT
.L8:
	mov	QWORD PTR -1088[rbp], 0  # *outfile_p = NULL
	mov	eax, DWORD PTR -1068[rbp]  # output_mode
	test	eax, eax
	jne	.L9
	mov	rax, QWORD PTR stdout[rip]
	mov	QWORD PTR -1088[rbp], rax  # outfile_p = stdout
	jmp	.L10
.L9:
	mov	eax, DWORD PTR -1068[rbp]  # output_mode
	cmp	eax, 1
	jne	.L10
	mov	rax, QWORD PTR -1056[rbp]  # output_file
	lea	rdx, .LC2[rip]  # "w"
	mov	rsi, rdx  # rsi = "w"
	mov	rdi, rax  # rdi = output_file
	call	fopen@PLT
	mov	QWORD PTR -1088[rbp], rax  # outfile_p
	cmp	QWORD PTR -1088[rbp], 0
	jne	.L10
	mov	rdx, QWORD PTR -1056[rbp]  # output_file
	mov	rax, QWORD PTR stderr[rip]
	lea	rcx, .LC3[rip]  # Error opening output file %s\n
	mov	rsi, rcx  # rsi = "Error opening output file %s\n"
	mov	rdi, rax  # rdi = stderr
	mov	eax, 0
	call	fprintf@PLT
	mov	eax, 1
	jmp	.L12
.L10:
	mov	ecx, DWORD PTR -1100[rbp]  # ecx = upper
	mov	edx, DWORD PTR -1104[rbp]  # edx = lower
	mov	rax, QWORD PTR -1088[rbp]  # outfile_p
	lea	rsi, .LC4[rip]  # rsi = "Lowercase: %i, uppercase: %i\n"
	mov	rdi, rax  # rdi = outfile_p
	mov	eax, 0
	call	fprintf@PLT
	mov	eax, DWORD PTR -1068[rbp]  # output_mode
	cmp	eax, 1
	jne	.L11
	mov	rax, QWORD PTR -1088[rbp]  # outfile_p
	mov	rdi, rax  # rdi = outfile_p
	call	fclose@PLT
.L11:
	mov	eax, 0
.L12:
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
