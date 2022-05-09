#!/usr/bin/node

// Define function to determine if number is even or odd;
// rather than using `!Boolean(n % 2)`, we must use recursion;
// make it function with negative as well as positive input.
// (exercise from Eloquent JavaScript, 2nd ed.; ch. 3, p. 56)

// To use in node:
// var isEven = require('./recursive_isEven.js');
// isEven.isEven(56) // => true
// isEven.isEven(23) // => false

function isEven(n){
  n = Math.abs(n);
  switch(n) {
    case 0:
      // returning value immediately breaks the switch eval; no need
      // for explicit break (would never be reached)
      return true
    case 1:
      return false
    default:
      return isEven(n-2)
  }
}

exports.isEven = isEven
