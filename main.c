#include <stdio.h>
#include <string.h>

#include "options.h"

extern void countLU(char *data, int length, int *lower, int *upper);
extern struct options parseOptions(int argc, char *argv[]);
extern void printHelp();

int main(int argc, char *argv[]) {
    struct options opt = parseOptions(argc, argv);
    if (opt.show_help || !opt.valid) {
        printHelp();
        return 0;
    }

    FILE *infile_p = NULL;
    char buffer[1024];
    if (opt.input_mode == FROM_STDIN) {
        infile_p = stdin;
    } else if (opt.input_mode == FROM_FILE) {
        infile_p = fopen(opt.input_file, "r");
        if (infile_p == NULL) {
            fprintf(stderr, "Error opening input file %s\n", opt.input_file);
            return 1;
        }
    }

    int lower = 0, upper = 0;
    size_t size;
    do {
        size = fread(buffer, 1, 1024, infile_p);
        countLU(buffer, size, &lower, &upper);
    } while (size == sizeof buffer);

    if (opt.input_mode == FROM_FILE) {
        fclose(infile_p);
    }

    FILE *outfile_p = NULL;
    if (opt.output_mode == TO_STDOUT) {
        outfile_p = stdout;
    } else if (opt.output_mode == TO_FILE) {
        outfile_p = fopen(opt.output_file, "w");
        if (outfile_p == NULL) {
            fprintf(stderr, "Error opening output file %s\n", opt.output_file);
            return 1;
        }
    }

    fprintf(outfile_p, "Lowercase: %i, uppercase: %i\n", lower, upper);

    if (opt.output_mode == TO_FILE) {
        fclose(outfile_p);
    }

    return 0;
}