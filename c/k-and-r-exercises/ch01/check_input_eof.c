#include <stdio.h>

/* Exercise 01-06 - check_input_eof.c */

int main() {
  int c;
  int e;

  c = getchar();
  e = c != EOF;
  printf("getchar() != EOF: %d\n", e);
  printf("getchar() returned: %d\n", c);

  return 0;
}
