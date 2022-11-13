#include <linux/limits.h>
#include "stdlib.h"

struct options {
    enum {FROM_STDIN, FROM_FILE, FROM_RANDOM} input_mode;
    enum {TO_STDOUT, TO_FILE} output_mode;
    char *input_file;
    char *output_file;
    int show_help;
    int valid;
};