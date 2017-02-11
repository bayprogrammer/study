// 14_appendix_a/14_manual_memory.c
// Example from 21st Century C, 2nd ed.
// Appendix A, pp. 361 - 362
#include <stdlib.h>  // malloc and free
#include <stdio.h>

int main() {
    int *intspace = malloc(3000 * sizeof(int));
    for (int i = 0; i < 3000; i++)
        intspace[i] = i;

    FILE *cf = fopen("counter_file", "w");
    for (int i = 0; i < 3000; i++)
        fprintf(cf, "%i :)\n", intspace[i]);

    free(intspace);
    fclose(cf);
}
