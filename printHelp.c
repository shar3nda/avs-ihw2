#include "stdio.h"

void printHelp() {
    printf("Опции командной строки\n"
           "-i <input_file> - путь к входному файлу с данными\n"
           "-o <output_file> - путь к файлу для вывода\n"
           "-h - справка\n"
           "-r - генерация случайных входных данных\n");
}