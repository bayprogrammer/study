#include <stdio.h>

/* Exercise 01-13 - word_len_histogram.c */

/* <-------- 50 columns wide, 20 lines long ----->

This is the output I want (when I can use functions and perhaps pointers).

                  word length frequency

              |
            20|
              |
              |
              |
 frequency    |       :.
            10|       :: .
              |      .:: :.  :
              | .: ::::::::  :     .: .
              |.:::::::::::.::..: .::::
              |::::::::::::::::::::::::::..
             0+--------------------------------
              0    5    10   15   20   25   30

                           length

For now I'll just go with dead simple...

 */

/* max length tracked is 32 */
#define MAX_LEN 32

int main() {
    int nlen[MAX_LEN];
    int curr_len = 0;
    int c, i, n, disp_cursor;

    for (i = 0; i < MAX_LEN; ++i) {
        nlen[i] = 0;
    }

    while ((c = getchar()) != EOF) {
        if (c == ' ' || c == '\n' || c == '\t') {
            /* word break, record hit for this length in array */
            if (curr_len > 0 && curr_len < MAX_LEN+1) {
                /* TODO(zmd): avoid incrementing beyond maxlen of int? */
                ++nlen[curr_len-1];
            }

            curr_len = 0;
        } else {
            /* increment current word length */
            /* TODO(zmd): avoid incrementing beyond maxlen of int? */
            ++curr_len;
        }
    }

    /* temporary rendering to test general logic */
    for (i = 0; i < 32; ++i) {
        /* printf("%2i: %i\n", i+1, nlen[i]); */
        curr_len = nlen[i];
        printf("%2i: ", i+1);
        for (n = 0; n < curr_len; ++n) {
            printf(".");
        }
        printf("\n");
    }

    return 0;
}
