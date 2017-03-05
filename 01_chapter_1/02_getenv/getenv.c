// 01_chapter_1/02_getenv/getenv.c
// Example from 21st Century C, 2nd ed.
// Chapter 1, pp. 19 - 20
#include <stdlib.h>  // getenv, atoi
#include <stdio.h>   // printf

int main() {
    char *repstext = getenv("reps");
    int reps = repstext ? atoi(repstext) : 10;

    char *msg = getenv("msg");
    if (!msg) msg = "Hello.";

    for (int i=0; i < reps; i++)
        printf("%s\n", msg);
}
