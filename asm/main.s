	.file	"main.c"
	.intel_syntax noprefix
# GNU C17 (GCC) version 12.2.0 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 12.2.0, GMP version 6.2.1, MPFR version 4.1.0-p13, MPC version 1.2.1, isl version isl-0.25-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64
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
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 1120	#,
	mov	DWORD PTR -1108[rbp], edi	# argc, argc
	mov	QWORD PTR -1120[rbp], rsi	# argv, argv
# ./main.c:10: int main(int argc, char *argv[]) {
	mov	rax, QWORD PTR fs:40	# tmp124, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.3153, tmp124
	xor	eax, eax	# tmp124
# ./main.c:11:     struct options opt = parseOptions(argc, argv);
	lea	rax, -1072[rbp]	# tmp101,
	mov	rdx, QWORD PTR -1120[rbp]	# tmp102, argv
	mov	ecx, DWORD PTR -1108[rbp]	# tmp103, argc
	mov	esi, ecx	#, tmp103
	mov	rdi, rax	#, tmp101
	call	parseOptions@PLT	#
# ./main.c:12:     if (opt.show_help || !opt.valid) {
	mov	eax, DWORD PTR -1048[rbp]	# _1, opt.show_help
# ./main.c:12:     if (opt.show_help || !opt.valid) {
	test	eax, eax	# _1
	jne	.L2	#,
# ./main.c:12:     if (opt.show_help || !opt.valid) {
	mov	eax, DWORD PTR -1044[rbp]	# _2, opt.valid
# ./main.c:12:     if (opt.show_help || !opt.valid) {
	test	eax, eax	# _2
	jne	.L3	#,
.L2:
# ./main.c:13:         printHelp();
	mov	eax, 0	#,
	call	printHelp@PLT	#
# ./main.c:14:         return 0;
	mov	eax, 0	# _20,
	jmp	.L12	#
.L3:
# ./main.c:17:     FILE *infile_p = NULL;
	mov	QWORD PTR -1096[rbp], 0	# infile_p,
# ./main.c:19:     if (opt.input_mode == FROM_STDIN) {
	mov	eax, DWORD PTR -1072[rbp]	# _3, opt.input_mode
# ./main.c:19:     if (opt.input_mode == FROM_STDIN) {
	test	eax, eax	# _3
	jne	.L5	#,
# ./main.c:20:         infile_p = stdin;
	mov	rax, QWORD PTR stdin[rip]	# tmp104, stdin
	mov	QWORD PTR -1096[rbp], rax	# infile_p, tmp104
	jmp	.L6	#
.L5:
# ./main.c:21:     } else if (opt.input_mode == FROM_FILE) {
	mov	eax, DWORD PTR -1072[rbp]	# _4, opt.input_mode
# ./main.c:21:     } else if (opt.input_mode == FROM_FILE) {
	cmp	eax, 1	# _4,
	jne	.L6	#,
# ./main.c:22:         infile_p = fopen(opt.input_file, "r");
	mov	rax, QWORD PTR -1064[rbp]	# _5, opt.input_file
# ./main.c:22:         infile_p = fopen(opt.input_file, "r");
	lea	rdx, .LC0[rip]	# tmp105,
	mov	rsi, rdx	#, tmp105
	mov	rdi, rax	#, _5
	call	fopen@PLT	#
	mov	QWORD PTR -1096[rbp], rax	# infile_p, tmp106
# ./main.c:23:         if (infile_p == NULL) {
	cmp	QWORD PTR -1096[rbp], 0	# infile_p,
	jne	.L6	#,
# ./main.c:24:             fprintf(stderr, "Error opening input file %s\n", opt.input_file);
	mov	rdx, QWORD PTR -1064[rbp]	# _6, opt.input_file
	mov	rax, QWORD PTR stderr[rip]	# stderr.0_7, stderr
	lea	rcx, .LC1[rip]	# tmp107,
	mov	rsi, rcx	#, tmp107
	mov	rdi, rax	#, stderr.0_7
	mov	eax, 0	#,
	call	fprintf@PLT	#
# ./main.c:25:             return 1;
	mov	eax, 1	# _20,
	jmp	.L12	#
.L6:
# ./main.c:29:     int lower = 0, upper = 0;
	mov	DWORD PTR -1104[rbp], 0	# lower,
# ./main.c:29:     int lower = 0, upper = 0;
	mov	DWORD PTR -1100[rbp], 0	# upper,
.L7:
# ./main.c:32:         size = fread(buffer, 1, 1024, infile_p);
	mov	rdx, QWORD PTR -1096[rbp]	# tmp108, infile_p
	lea	rax, -1040[rbp]	# tmp109,
	mov	rcx, rdx	#, tmp108
	mov	edx, 1024	#,
	mov	esi, 1	#,
	mov	rdi, rax	#, tmp109
	call	fread@PLT	#
	mov	QWORD PTR -1080[rbp], rax	# size, tmp110
# ./main.c:33:         countLU(buffer, size, &lower, &upper);
	mov	rax, QWORD PTR -1080[rbp]	# tmp111, size
	mov	esi, eax	# _8, tmp111
	lea	rcx, -1100[rbp]	# tmp112,
	lea	rdx, -1104[rbp]	# tmp113,
	lea	rax, -1040[rbp]	# tmp114,
	mov	rdi, rax	#, tmp114
	call	countLU@PLT	#
# ./main.c:34:     } while (size == sizeof buffer);
	cmp	QWORD PTR -1080[rbp], 1024	# size,
	je	.L7	#,
# ./main.c:36:     if (opt.input_mode == FROM_FILE) {
	mov	eax, DWORD PTR -1072[rbp]	# _9, opt.input_mode
# ./main.c:36:     if (opt.input_mode == FROM_FILE) {
	cmp	eax, 1	# _9,
	jne	.L8	#,
# ./main.c:37:         fclose(infile_p);
	mov	rax, QWORD PTR -1096[rbp]	# tmp115, infile_p
	mov	rdi, rax	#, tmp115
	call	fclose@PLT	#
.L8:
# ./main.c:40:     FILE *outfile_p = NULL;
	mov	QWORD PTR -1088[rbp], 0	# outfile_p,
# ./main.c:41:     if (opt.output_mode == TO_STDOUT) {
	mov	eax, DWORD PTR -1068[rbp]	# _10, opt.output_mode
# ./main.c:41:     if (opt.output_mode == TO_STDOUT) {
	test	eax, eax	# _10
	jne	.L9	#,
# ./main.c:42:         outfile_p = stdout;
	mov	rax, QWORD PTR stdout[rip]	# tmp116, stdout
	mov	QWORD PTR -1088[rbp], rax	# outfile_p, tmp116
	jmp	.L10	#
.L9:
# ./main.c:43:     } else if (opt.output_mode == TO_FILE) {
	mov	eax, DWORD PTR -1068[rbp]	# _11, opt.output_mode
# ./main.c:43:     } else if (opt.output_mode == TO_FILE) {
	cmp	eax, 1	# _11,
	jne	.L10	#,
# ./main.c:44:         outfile_p = fopen(opt.output_file, "w");
	mov	rax, QWORD PTR -1056[rbp]	# _12, opt.output_file
# ./main.c:44:         outfile_p = fopen(opt.output_file, "w");
	lea	rdx, .LC2[rip]	# tmp117,
	mov	rsi, rdx	#, tmp117
	mov	rdi, rax	#, _12
	call	fopen@PLT	#
	mov	QWORD PTR -1088[rbp], rax	# outfile_p, tmp118
# ./main.c:45:         if (outfile_p == NULL) {
	cmp	QWORD PTR -1088[rbp], 0	# outfile_p,
	jne	.L10	#,
# ./main.c:46:             fprintf(stderr, "Error opening output file %s\n", opt.output_file);
	mov	rdx, QWORD PTR -1056[rbp]	# _13, opt.output_file
	mov	rax, QWORD PTR stderr[rip]	# stderr.1_14, stderr
	lea	rcx, .LC3[rip]	# tmp119,
	mov	rsi, rcx	#, tmp119
	mov	rdi, rax	#, stderr.1_14
	mov	eax, 0	#,
	call	fprintf@PLT	#
# ./main.c:47:             return 1;
	mov	eax, 1	# _20,
	jmp	.L12	#
.L10:
# ./main.c:51:     fprintf(outfile_p, "Lowercase: %i, uppercase: %i\n", lower, upper);
	mov	ecx, DWORD PTR -1100[rbp]	# upper.2_15, upper
	mov	edx, DWORD PTR -1104[rbp]	# lower.3_16, lower
	mov	rax, QWORD PTR -1088[rbp]	# tmp120, outfile_p
	lea	rsi, .LC4[rip]	# tmp121,
	mov	rdi, rax	#, tmp120
	mov	eax, 0	#,
	call	fprintf@PLT	#
# ./main.c:53:     if (opt.output_mode == TO_FILE) {
	mov	eax, DWORD PTR -1068[rbp]	# _17, opt.output_mode
# ./main.c:53:     if (opt.output_mode == TO_FILE) {
	cmp	eax, 1	# _17,
	jne	.L11	#,
# ./main.c:54:         fclose(outfile_p);
	mov	rax, QWORD PTR -1088[rbp]	# tmp122, outfile_p
	mov	rdi, rax	#, tmp122
	call	fclose@PLT	#
.L11:
# ./main.c:57:     return 0;
	mov	eax, 0	# _20,
.L12:
# ./main.c:58: }
	mov	rdx, QWORD PTR -8[rbp]	# tmp125, D.3153
	sub	rdx, QWORD PTR fs:40	# tmp125, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L13	#,
# ./main.c:58: }
	call	__stack_chk_fail@PLT	#
.L13:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
