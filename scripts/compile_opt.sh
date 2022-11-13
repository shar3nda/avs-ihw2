#!/bin/bash
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -fverbose-asm ./countLU.c -S -o ./asm_opt/countLU_opt.s
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -fverbose-asm ./main.c -S -o ./asm_opt/main_opt.s
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -fverbose-asm ./parseOptions.c -S -o ./asm_opt/parseOptions_opt.s
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -fverbose-asm ./printHelp.c -S -o ./asm_opt/printHelp_opt.s
gcc ./asm/countLU.s\
    ./asm/main.s\
    ./asm/parseOptions.s\
    ./asm/printHelp.s -o main_opt
