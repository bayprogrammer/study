// 14_appendix_a/04_item_seven.c
// Example from 21st Century C, 2nd ed.
// Appendix A, pp. 350-351
#include <stdio.h>

int intlist[10];

int main() {
    int len = 20;
    char string[len];

    intlist[7] = 7;
    //snprintf == print formatted into string
    snprintf(string, len, "Item seven is %i.", intlist[7]);
    printf("string says: <<%s>>\n", string);
}
