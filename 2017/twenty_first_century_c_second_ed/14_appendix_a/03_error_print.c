// 14_appendix_a/03_error_print.c
// Example from 21st Century C, 2nd ed.
// Appendix A, p. 350
#include <stdio.h>

void error_print(FILE *ef, int error_code, char *msg) {
    fprintf(ef, "Error #%i occured: %s.\n", error_code, msg);
}

int main() {
    FILE *error_file = fopen("example_error_file", "w");  // open for writing
    error_print(error_file, 37, "Out of foo BAR BAZZZ!!!!");
}
