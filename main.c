#include <stdio.h>
#include <string.h>

#include "options.h"

extern void countLU(char *data, int length, int *lower, int *upper);
extern struct options parseOptions(int argc, char *argv[]);

int main(int argc, char *argv[]) {
//    Опции командной строки
//    -i - путь к входному файлу с данными  [ необходима проверка корректного открытия файлов
//    -o - путь к файлу для вывода          ]
//    -h, --help - справка
//    -g - генерация случайных входных данных
//    -r - количество повторений

    struct options opt = parseOptions(argc, argv);
    FILE *input_file = NULL;
    char buffer[1024];
    if (opt.input_mode == FROM_STDIN) {
        input_file = stdin;
    } else if (opt.input_mode == FROM_FILE) {
        input_file = fopen(opt.input_file, "r");
        if (input_file == NULL) {
            fprintf(stderr, "Error opening file");
            return 1;
        }
    }
    int lower = 0, upper = 0;
    while (fread(buffer, 1, sizeof(buffer), input_file) > 0) {
        countLU(buffer, strlen(buffer), &lower, &upper);
    }
    printf("Lowercase: %i, uppercase: %i\n", lower, upper);

    return 0;
}