#include <stdio.h>
#include "options.h"

struct options parseOptions(int argc, char *argv[]) {
    struct options opt = {
        .input_mode = FROM_STDIN,
        .output_mode = TO_STDOUT,
        .input_file = NULL,
        .output_file = NULL,
        .show_help = 0,
        .valid = 0,
    };

    for (int i = 1; i < argc; ++i) {
        char key = argv[i][1];
        if (key == 'h') {
            opt.show_help = 1;
            opt.valid = 1;
            return opt;
        } else if (key == 'i') {
            if (i + 1 >= argc) {
                fprintf(stderr, "Input file not specified.\n");
                return opt;
            }
            opt.input_file = argv[i + 1];
            opt.input_mode = FROM_FILE;
            ++i;
        } else if (key == 'o') {
            if (i + 1 >= argc) {
                fprintf(stderr, "Output file not specified.\n");
                return opt;
            }
            opt.output_file = argv[i + 1];
            opt.output_mode = TO_FILE;
            ++i;
        } else if (key == 'r') {
            opt.input_mode = FROM_RANDOM;
        } else {
            fprintf(stderr, "Key %s not recognized.\n", argv[i]);
            return opt;
        }
    }
    opt.valid = 1;
    return opt;
}

