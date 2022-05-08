// 01_chapter_1/03_gsl_erf/gsl_erf.c
// Example from 21st Century C, 2nd ed.
// Chapter 1, p. 25
#include <gsl/gsl_cdf.h>
#include <stdio.h>

int main() {
    double bottom_tail = gsl_cdf_gaussian_P(-1.96, 1);
    printf("Area between [-1.96, 1.96]: %g\n", 1 - 2 * bottom_tail);
}
