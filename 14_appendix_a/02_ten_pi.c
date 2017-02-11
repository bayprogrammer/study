// 14_appendix_a/02_ten_pi.c
// Example from 21st Century C, 2nd ed.
// Appendix A, p. 349
#include <stdio.h>

int main() {
    double pi = 3.14159265;
    int count = 10;
    printf("%g times %i = %g.\n", pi, count, pi*count);
}
