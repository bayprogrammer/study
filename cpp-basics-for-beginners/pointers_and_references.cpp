#include <iostream>

void swap_ref(int& num1, int& num2) {
  int tmp = num1;
  num1 = num2;
  num2 = tmp;
}

void swap_ptr(int* num1, int* num2) {
  int tmp = *num1;
  *num1 = *num2;
  *num2 = tmp;
}

void print_nums(int& num1, int& num2) {
  std::cout << num1 << ", " << num2 << std::endl;
}

int main() {
  int a = 5;
  int b = 10;
  print_nums(a, b);

  swap_ref(a, b);
  print_nums(a, b);

  swap_ptr(&a, &b);
  print_nums(a, b);

  return 0;
}
