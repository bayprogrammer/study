#include <stdio.h>

// gcc -Wall -Wextra -Wpedantic -Werror -Wfatal-errors main.c && ./a.out foo
int main(int argc, char** argv) {
  for (int i=0; i < argc; ++i) {
    printf("%s\n", argv[i]);
  }
  printf("Hello, world.\n");
}
