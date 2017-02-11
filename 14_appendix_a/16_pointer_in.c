// 14_appendix_a/16_pointer_in.c
// Example from 21st Century C, 2nd ed.
// Appendix A, p. 363
#include <stdlib.h>
#include <stdio.h>

void double_in(int *in) {
    *in *= 2;
}

int main() {
    int x[1];  // declare a one-item array, for demonstration purposes

    /*
    int y, *x;
    x = &y;
    */

    *x = 10;
    double_in(x);

    printf("x now points to %i.\n", *x);

    /*
    printf("y now points to %i.\n", y);

    double_in(&y);

    printf("y now points to %i.\n", y);
    */
}
