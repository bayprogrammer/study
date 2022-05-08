// 14_appendix_a/10_while.c
// Example from 21st Century C, 2nd ed.
// Appendix A, pp. 358-359
#include <stdio.h>

int main() {
    int i = 0;
    while (i < 10) {
        printf("Hello #%i\n", i);
        i++;
    }
}
