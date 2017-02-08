#include <stdio.h>

/* Exercise 01-04 - cels_to_fahr.c */

int main() {
  float cels, fahr;
  int lower, upper, step;

  lower = 0;
  upper = 300;
  step = 20;

  printf("Celsius to Fahrenheit Table\n");
  printf("===========================\n");
  printf("%3s\t%6s\n", "C", "F");
  printf("---\t------\n");

  cels = lower;

  while (cels <= upper) {
    /* C(f) -> (5 / 9) * (f - 32) */
    /* F(c) -> (c * (5/9)) + 32   */
    fahr = (cels * (9.0 / 5.0)) + 32.0;
    printf("%3.0f\t%6.1f\n", cels, fahr);
    cels = cels + step;
  }

  return 0;
}
