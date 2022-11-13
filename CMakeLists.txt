cmake_minimum_required(VERSION 3.23)
project(avs-ihw2)

set(CMAKE_C_STANDARD 11)

add_executable(main
        main.c
        parseOptions.c
        countLU.c
        options.h
        printHelp.c)
