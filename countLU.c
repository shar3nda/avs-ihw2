void countLU(char *data, int length, int *lower, int *upper) {
    for (int i = 0; i < length; ++i) {
        if ((data[i] >= 65) && (data[i] <= 90)) {
            *upper += 1;
        } else if ((data[i] >= 97) && (data[i] <= 122)) {
            *lower += 1;
        }
    }
}