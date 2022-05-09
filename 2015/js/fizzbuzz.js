#!/usr/bin/node

// FizzBuzz program; print numbers 1..100, except numbers divisible by
// three print "Fizz", and numbers divisible by five (but not also
// three) print "Buzz"; for numbers divisible by both three and five,
// print "FizzBuzz".

// (exercise from Eloquent JavaScript, 2nd ed.; ch. 2, p. 38)

function fizz_the_buzz(number) {
  if (number % 3 == 0 && number % 5 == 0)
    return "FizzBuzz";
  else if (number % 3 == 0)
    return "Fizz";
  else if (number % 5 == 0)
    return "Buzz";
  else
    return number
}

for (var n = 1; n < 101; n++) {
  console.log(fizz_the_buzz(n));
}

console.log("\nNow can I haz job?")
