#!/bin/bash
gcc -masm=intel -fverbose-asm ./countLU.c -S -o ./asm/countLU.s
gcc -masm=intel -fverbose-asm ./main.c -S -o ./asm/main.s
gcc -masm=intel -fverbose-asm ./parseOptions.c -S -o ./asm/parseOptions.s
gcc -masm=intel -fverbose-asm ./printHelp.c -S -o ./asm/printHelp.s
gcc ./asm/countLU.s\
    ./asm/main.s\
    ./asm/parseOptions.s\
    ./asm/printHelp.s -o 
