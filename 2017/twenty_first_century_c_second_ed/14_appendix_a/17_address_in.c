// 14_appendix_a/17_address_in.c
// Example from 21st Century C, 2nd ed.
// Appendix A, pp. 363 - 364
#include <stdlib.h>
#include <stdio.h>

void double_in(int *in) {
    *in *= 2;
}

int main() {
    int x = 10;
    double_in(&x);
    printf("x is now %i.\n", x);
}
