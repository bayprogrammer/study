#include <stdio.h>

/* Exercise 1-9 */

/* collapse duplicate blanks in input */
int main() {
  int current_char, previous_blank;

  previous_blank = 0;

  while ((current_char = getchar()) != EOF) {
    if (current_char != ' ') {
      putchar(current_char);
      previous_blank = 0;
    }

    if (current_char == ' ') {
      if (!previous_blank)
        putchar(current_char);
      previous_blank = 1;
    }
  }

  return 0;
}
