	.file	"printHelp.c"
	.intel_syntax noprefix
# GNU C17 (GCC) version 12.2.0 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 12.2.0, GMP version 6.2.1, MPFR version 4.1.0-p13, MPC version 1.2.1, isl version isl-0.25-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions
	.text
	.section	.rodata
	.align 8
.LC0:
	.ascii	"\320\236\320\277\321\206\320\270\320\270 \320\272\320\276"
	.string	"\320\274\320\260\320\275\320\264\320\275\320\276\320\271 \321\201\321\202\321\200\320\276\320\272\320\270\n-i <input_file> - \320\277\321\203\321\202\321\214 \320\272 \320\262\321\205\320\276\320\264\320\275\320\276\320\274\321\203 \321\204\320\260\320\271\320\273\321\203 \321\201 \320\264\320\260\320\275\320\275\321\213\320\274\320\270\n-o <output_file> - \320\277\321\203\321\202\321\214 \320\272 \321\204\320\260\320\271\320\273\321\203 \320\264\320\273\321\217 \320\262\321\213\320\262\320\276\320\264\320\260\n-h - \321\201\320\277\321\200\320\260\320\262\320\272\320\260\n-r - \320\263\320\265\320\275\320\265\321\200\320\260\321\206\320\270\321\217 \321\201\320\273\321\203\321\207\320\260\320\271\320\275\321\213\321\205 \320\262\321\205\320\276\320\264\320\275\321\213\321\205 \320\264\320\260\320\275\320\275\321\213\321\205"
	.text
	.globl	printHelp
	.type	printHelp, @function
printHelp:
	push	rbp	#
	mov	rbp, rsp	#,
# ./printHelp.c:4:     printf("Опции командной строки\n"
	lea	rax, .LC0[rip]	# tmp82,
	mov	rdi, rax	#, tmp82
	call	puts@PLT	#
# ./printHelp.c:9: }
	nop	
	pop	rbp	#
	ret	
	.size	printHelp, .-printHelp
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
