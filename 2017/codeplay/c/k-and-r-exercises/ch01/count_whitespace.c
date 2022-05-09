#include <stdio.h>

/* Exercise 01-08 - count_whitespace.c */

/* count blanks, tabs, and newlines */
int main() {
  int current_char, count_blank, count_tab, count_newline;

  count_blank = 0;
  count_tab = 0;
  count_newline = 0;

  while ((current_char = getchar()) != EOF) {
    if (current_char == ' ')
      ++count_blank;
    if (current_char == '\t')
      ++count_tab;
    if (current_char == '\n')
      ++count_newline;
  }
  printf("\t%d\t%d\t%d\n", count_blank, count_tab, count_newline);

  return 0;
}
