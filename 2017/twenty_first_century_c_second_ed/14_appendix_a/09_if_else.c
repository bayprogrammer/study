// 14_appendix_a/09_if_else.c
// Example from 21st Century C, 2nd ed.
// Appendix A, p. 358
#include <stdio.h>

int main() {
    if (6 == 9)
        printf("Six is nine.\n");

    int x = 3;
    if (x == 1)
        printf("I found x; it is one.\n");
    else if (x == 2)
        printf("x is definitely two.\n");
    else
        printf("x is neither one nor two.\n");
}
