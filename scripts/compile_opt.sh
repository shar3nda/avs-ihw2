#!/bin/bash
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -fverbose-asm ./countLU.c -S -o ./asm_opt/countLU.s
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -fverbose-asm ./main.c -S -o ./asm_opt/main.s
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -fverbose-asm ./parseOptions.c -S -o ./asm_opt/parseOptions.s
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -fverbose-asm ./printHelp.c -S -o ./asm_opt/printHelp.s
gcc ./asm_opt/countLU.s\
    ./asm_opt/main.s\
    ./asm_opt/parseOptions.s\
    ./asm_opt/printHelp.s -o main_opt
