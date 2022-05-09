#!/usr/bin/js24

// People used to spend good money for C64s. Compute the value of a
// modern computer in terms of how much it would cost (in dollars
// normalized for inflation) in equivalent 80s era C64s, based on
// memory capacity.

// Trying to teach my son the relative value difference when measured
// in terms of how much people were once willing to spend for just a
// fraction of computing capacity. We have it very good these days.
// Let's try to not forget just how valuable these computers are, even
// when sold for so little.

var kilobyte = 1024;
var megabyte = 1024 * kilobyte;
var gigabyte = 1024 * megabyte;

function number_of_equiv_c64s(modern_memory) {
  var c64_memory = 64 * kilobyte;
  return modern_memory / c64_memory;
}

function value_in_c64_terms(modern_memory) {
  // TODO: maybe get inflation data online in real time
  // normalized to modern prices, according to wikipedia as of 30-may-2015
  var c64_price = 1500;
  num_c64s = number_of_equiv_c64s(modern_memory);
  return num_c64s * c64_price;
}

function main() {
  // TODO: get these values from the user interactively or via args
  var new_computer_price = 279; // not being used yet
  var new_computer_memory = 4 * gigabyte;

  result = ("Your new computer is worth $" +
            value_in_c64_terms(new_computer_memory) +
            " in equivalent Commodore 64s\n(if they were purchased new" +
            " using today's dollars).");
  print(result);
}
main();
