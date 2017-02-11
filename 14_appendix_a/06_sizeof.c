// 14_appendix_a/06_sizeof.c
// Example from 21st Century C, 2nd ed.
// Appendix A, pp. 352-353
#include <stdio.h>

typedef struct {
    int numerator, denominator;
    double value;
} ratio_s;

int main() {
    printf("size of two ints: %zu\n", 2 * sizeof(int));
    printf("size of two ints: %zu\n", sizeof(int[2]));
    printf("size of a double: %zu\n", sizeof(double));
    printf("size of a ratio_s struct: %zu\n", sizeof(ratio_s));
}
