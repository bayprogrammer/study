#include <stdio.h>

/* Exercise 1-12: split input into words and echo them one per line */

int main() {
    int c;
    int prev_word = 0;
    while ((c = getchar()) != EOF) {
        if (c == ' ' || c == '\n' || c == '\t') {
            if (prev_word) {
                prev_word = 0;
                printf("\n");
            }
        }
        else {
            prev_word = 1;
            putchar(c);
        }
    }

    return 0;
}
