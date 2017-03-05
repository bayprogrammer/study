// 01_chapter_1/00_erf/erf.c
// Example from 21st Century C, 2nd ed.
// Chapter 1, p. 11
#include <math.h>   // erf, sqrt
#include <stdio.h>  // printf

int main() {
    printf("The integral of a Normal(0, 1) distribution " \
           "between -1.96 and 1.96 is: %g\n", erf(1.96 * sqrt(1/2.0)));
}
