#!/bin/bash
gcc -masm=intel ./countLU.c -S -o ./asm/countLU.s
gcc -masm=intel ./main.c -S -o ./asm/main.s
gcc -masm=intel ./parseOptions.c -S -o ./asm/parseOptions.s
gcc -masm=intel ./printHelp.c -S -o ./asm/printHelp.s
gcc ./asm/countLU.s\
    ./asm/main.s\
    ./asm/parseOptions.s\
    ./asm/printHelp.s -o main
