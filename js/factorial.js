#!/usr/bin/js24

fact = function(n) {
  // compute factorial of n, where n is 0 or greater
  // n! == (if n > 0 { (n - 1)! * n } else { 1 })
  if (n == 0)
    return 1;
  else
    return n * fact(n - 1);
};

putstr("Please input a number n: ");
n = readline();
print(fact(n));
