#!/bin/bash
gcc -masm=intel -fverbose-asm ./countLU.c -S -o ./asm_verb/countLU.s
gcc -masm=intel -fverbose-asm ./main.c -S -o ./asm_verb/main.s
gcc -masm=intel -fverbose-asm ./parseOptions.c -S -o ./asm_verb/parseOptions.s
gcc -masm=intel -fverbose-asm ./printHelp.c -S -o ./asm_verb/printHelp.s
gcc ./asm_verb/countLU.s\
    ./asm_verb/main.s\
    ./asm_verb/parseOptions.s\
    ./asm_verb/printHelp.s -o main
