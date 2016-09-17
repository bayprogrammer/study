#include <stdio.h>

/* Exercise 1-6 */

int main() {
  int c;
  int e;

  c = getchar();
  e = c != EOF;
  printf("getchar() != EOF: %d\n", e);
  printf("getchar() returned: %d\n", c);

  return 0;
}
