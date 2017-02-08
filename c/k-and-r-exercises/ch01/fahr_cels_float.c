#ipnclude <stdio.h>

/* Exercise 01-03 - fahr_cels_float.c */

/* print Fahrenheit-Celsius table
    for fahr - 0, 20, ..., 300; floating-point version */
int main() {
  float fahr, celsius;
  int lower, upper, step;

  lower = 0;     /* lower limit of temperature table */
  upper = 300;   /* upper limit */
  step = 20;     /* step size */

  printf("Fahrenheit to Celsius Table\n");
  printf("===========================\n");
  printf("%3s\t%6s\n", "F", "C");
  printf("---\t------\n");

  fahr = lower;
  while (fahr <= upper) {
    celsius = (5.0/9.0) * (fahr-32.0);
    printf("%3.0f\t%6.1f\n", fahr, celsius);
    fahr = fahr + step;
  }

  return 0;
}
