	.file	"parseOptions.c"
	.intel_syntax noprefix
# GNU C17 (GCC) version 12.2.0 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 12.2.0, GMP version 6.2.1, MPFR version 4.1.0-p13, MPC version 1.2.1, isl version isl-0.25-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions
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
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 80	#,
	mov	QWORD PTR -56[rbp], rdi	# .result_ptr, .result_ptr
	mov	DWORD PTR -60[rbp], esi	# argc, argc
	mov	QWORD PTR -72[rbp], rdx	# argv, argv
# ./parseOptions.c:5:     struct options opt = {
	mov	DWORD PTR -48[rbp], 0	# opt.input_mode,
	mov	DWORD PTR -44[rbp], 0	# opt.output_mode,
	mov	QWORD PTR -40[rbp], 0	# opt.input_file,
	mov	QWORD PTR -32[rbp], 0	# opt.output_file,
	mov	DWORD PTR -24[rbp], 0	# opt.show_help,
	mov	DWORD PTR -20[rbp], 0	# opt.valid,
# ./parseOptions.c:14:     for (int i = 1; i < argc; ++i) {
	mov	DWORD PTR -4[rbp], 1	# i,
# ./parseOptions.c:14:     for (int i = 1; i < argc; ++i) {
	jmp	.L2	#
.L11:
# ./parseOptions.c:15:         char key = argv[i][1];
	mov	eax, DWORD PTR -4[rbp]	# tmp105, i
	cdqe
	lea	rdx, 0[0+rax*8]	# _2,
	mov	rax, QWORD PTR -72[rbp]	# tmp106, argv
	add	rax, rdx	# _3, _2
	mov	rax, QWORD PTR [rax]	# _4, *_3
# ./parseOptions.c:15:         char key = argv[i][1];
	movzx	eax, BYTE PTR 1[rax]	# tmp107, MEM[(char *)_4 + 1B]
	mov	BYTE PTR -5[rbp], al	# key, tmp107
# ./parseOptions.c:16:         if (key == 'h') {
	cmp	BYTE PTR -5[rbp], 104	# key,
	jne	.L3	#,
# ./parseOptions.c:17:             opt.show_help = 1;
	mov	DWORD PTR -24[rbp], 1	# opt.show_help,
# ./parseOptions.c:18:             opt.valid = 1;
	mov	DWORD PTR -20[rbp], 1	# opt.valid,
# ./parseOptions.c:19:             return opt;
	mov	rcx, QWORD PTR -56[rbp]	# tmp108, .result_ptr
	mov	rax, QWORD PTR -48[rbp]	# tmp109, opt
	mov	rdx, QWORD PTR -40[rbp]	#, opt
	mov	QWORD PTR [rcx], rax	# <retval>, tmp109
	mov	QWORD PTR 8[rcx], rdx	# <retval>,
	mov	rax, QWORD PTR -32[rbp]	# tmp110, opt
	mov	rdx, QWORD PTR -24[rbp]	#, opt
	mov	QWORD PTR 16[rcx], rax	# <retval>, tmp110
	mov	QWORD PTR 24[rcx], rdx	# <retval>,
	jmp	.L12	#
.L3:
# ./parseOptions.c:20:         } else if (key == 'i') {
	cmp	BYTE PTR -5[rbp], 105	# key,
	jne	.L5	#,
# ./parseOptions.c:21:             if (i + 1 >= argc) {
	mov	eax, DWORD PTR -4[rbp]	# tmp111, i
	add	eax, 1	# _5,
# ./parseOptions.c:21:             if (i + 1 >= argc) {
	cmp	DWORD PTR -60[rbp], eax	# argc, _5
	jg	.L6	#,
# ./parseOptions.c:22:                 fprintf(stderr, "Input file not specified.\n");
	mov	rax, QWORD PTR stderr[rip]	# stderr.0_6, stderr
	mov	rcx, rax	#, stderr.0_6
	mov	edx, 26	#,
	mov	esi, 1	#,
	lea	rax, .LC0[rip]	# tmp112,
	mov	rdi, rax	#, tmp112
	call	fwrite@PLT	#
# ./parseOptions.c:23:                 return opt;
	mov	rcx, QWORD PTR -56[rbp]	# tmp113, .result_ptr
	mov	rax, QWORD PTR -48[rbp]	# tmp114, opt
	mov	rdx, QWORD PTR -40[rbp]	#, opt
	mov	QWORD PTR [rcx], rax	# <retval>, tmp114
	mov	QWORD PTR 8[rcx], rdx	# <retval>,
	mov	rax, QWORD PTR -32[rbp]	# tmp115, opt
	mov	rdx, QWORD PTR -24[rbp]	#, opt
	mov	QWORD PTR 16[rcx], rax	# <retval>, tmp115
	mov	QWORD PTR 24[rcx], rdx	# <retval>,
	jmp	.L12	#
.L6:
# ./parseOptions.c:25:             opt.input_file = argv[i + 1];
	mov	eax, DWORD PTR -4[rbp]	# tmp116, i
	cdqe
	add	rax, 1	# _8,
	lea	rdx, 0[0+rax*8]	# _9,
	mov	rax, QWORD PTR -72[rbp]	# tmp117, argv
	add	rax, rdx	# _10, _9
	mov	rax, QWORD PTR [rax]	# _11, *_10
# ./parseOptions.c:25:             opt.input_file = argv[i + 1];
	mov	QWORD PTR -40[rbp], rax	# opt.input_file, _11
# ./parseOptions.c:26:             opt.input_mode = FROM_FILE;
	mov	DWORD PTR -48[rbp], 1	# opt.input_mode,
# ./parseOptions.c:27:             ++i;
	add	DWORD PTR -4[rbp], 1	# i,
	jmp	.L7	#
.L5:
# ./parseOptions.c:28:         } else if (key == 'o') {
	cmp	BYTE PTR -5[rbp], 111	# key,
	jne	.L8	#,
# ./parseOptions.c:29:             if (i + 1 >= argc) {
	mov	eax, DWORD PTR -4[rbp]	# tmp118, i
	add	eax, 1	# _12,
# ./parseOptions.c:29:             if (i + 1 >= argc) {
	cmp	DWORD PTR -60[rbp], eax	# argc, _12
	jg	.L9	#,
# ./parseOptions.c:30:                 fprintf(stderr, "Output file not specified.\n");
	mov	rax, QWORD PTR stderr[rip]	# stderr.1_13, stderr
	mov	rcx, rax	#, stderr.1_13
	mov	edx, 27	#,
	mov	esi, 1	#,
	lea	rax, .LC1[rip]	# tmp119,
	mov	rdi, rax	#, tmp119
	call	fwrite@PLT	#
# ./parseOptions.c:31:                 return opt;
	mov	rcx, QWORD PTR -56[rbp]	# tmp120, .result_ptr
	mov	rax, QWORD PTR -48[rbp]	# tmp121, opt
	mov	rdx, QWORD PTR -40[rbp]	#, opt
	mov	QWORD PTR [rcx], rax	# <retval>, tmp121
	mov	QWORD PTR 8[rcx], rdx	# <retval>,
	mov	rax, QWORD PTR -32[rbp]	# tmp122, opt
	mov	rdx, QWORD PTR -24[rbp]	#, opt
	mov	QWORD PTR 16[rcx], rax	# <retval>, tmp122
	mov	QWORD PTR 24[rcx], rdx	# <retval>,
	jmp	.L12	#
.L9:
# ./parseOptions.c:33:             opt.output_file = argv[i + 1];
	mov	eax, DWORD PTR -4[rbp]	# tmp123, i
	cdqe
	add	rax, 1	# _15,
	lea	rdx, 0[0+rax*8]	# _16,
	mov	rax, QWORD PTR -72[rbp]	# tmp124, argv
	add	rax, rdx	# _17, _16
	mov	rax, QWORD PTR [rax]	# _18, *_17
# ./parseOptions.c:33:             opt.output_file = argv[i + 1];
	mov	QWORD PTR -32[rbp], rax	# opt.output_file, _18
# ./parseOptions.c:34:             opt.output_mode = TO_FILE;
	mov	DWORD PTR -44[rbp], 1	# opt.output_mode,
# ./parseOptions.c:35:             ++i;
	add	DWORD PTR -4[rbp], 1	# i,
	jmp	.L7	#
.L8:
# ./parseOptions.c:36:         } else if (key == 'r') {
	cmp	BYTE PTR -5[rbp], 114	# key,
	jne	.L10	#,
# ./parseOptions.c:37:             opt.input_mode = FROM_RANDOM;
	mov	DWORD PTR -48[rbp], 2	# opt.input_mode,
	jmp	.L7	#
.L10:
# ./parseOptions.c:39:             fprintf(stderr, "Key %s not recognized.\n", argv[i]);
	mov	eax, DWORD PTR -4[rbp]	# tmp125, i
	cdqe
	lea	rdx, 0[0+rax*8]	# _20,
	mov	rax, QWORD PTR -72[rbp]	# tmp126, argv
	add	rax, rdx	# _21, _20
# ./parseOptions.c:39:             fprintf(stderr, "Key %s not recognized.\n", argv[i]);
	mov	rdx, QWORD PTR [rax]	# _22, *_21
	mov	rax, QWORD PTR stderr[rip]	# stderr.2_23, stderr
	lea	rcx, .LC2[rip]	# tmp127,
	mov	rsi, rcx	#, tmp127
	mov	rdi, rax	#, stderr.2_23
	mov	eax, 0	#,
	call	fprintf@PLT	#
# ./parseOptions.c:40:             return opt;
	mov	rcx, QWORD PTR -56[rbp]	# tmp128, .result_ptr
	mov	rax, QWORD PTR -48[rbp]	# tmp129, opt
	mov	rdx, QWORD PTR -40[rbp]	#, opt
	mov	QWORD PTR [rcx], rax	# <retval>, tmp129
	mov	QWORD PTR 8[rcx], rdx	# <retval>,
	mov	rax, QWORD PTR -32[rbp]	# tmp130, opt
	mov	rdx, QWORD PTR -24[rbp]	#, opt
	mov	QWORD PTR 16[rcx], rax	# <retval>, tmp130
	mov	QWORD PTR 24[rcx], rdx	# <retval>,
	jmp	.L12	#
.L7:
# ./parseOptions.c:14:     for (int i = 1; i < argc; ++i) {
	add	DWORD PTR -4[rbp], 1	# i,
.L2:
# ./parseOptions.c:14:     for (int i = 1; i < argc; ++i) {
	mov	eax, DWORD PTR -4[rbp]	# tmp131, i
	cmp	eax, DWORD PTR -60[rbp]	# tmp131, argc
	jl	.L11	#,
# ./parseOptions.c:43:     opt.valid = 1;
	mov	DWORD PTR -20[rbp], 1	# opt.valid,
# ./parseOptions.c:44:     return opt;
	mov	rcx, QWORD PTR -56[rbp]	# tmp132, .result_ptr
	mov	rax, QWORD PTR -48[rbp]	# tmp133, opt
	mov	rdx, QWORD PTR -40[rbp]	#, opt
	mov	QWORD PTR [rcx], rax	# <retval>, tmp133
	mov	QWORD PTR 8[rcx], rdx	# <retval>,
	mov	rax, QWORD PTR -32[rbp]	# tmp134, opt
	mov	rdx, QWORD PTR -24[rbp]	#, opt
	mov	QWORD PTR 16[rcx], rax	# <retval>, tmp134
	mov	QWORD PTR 24[rcx], rdx	# <retval>,
.L12:
# ./parseOptions.c:45: }
	mov	rax, QWORD PTR -56[rbp]	#, .result_ptr
	leave	
	ret	
	.size	parseOptions, .-parseOptions
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
