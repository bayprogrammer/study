#!/usr/bin/node

// 1. Define a function to count the number of "B"s in a given string.
// 2. Define a function to count the number of a given char in a string.
// (exercise from Eloquent JavaScript, 2nd ed.; ch. 3, p. 56)

// To use in node:
// var count_char = require('./count_char.js');
// count_char.countBs("Baffled Bafoon Baloons For Sale Because");
// // => 4
// count_char.countChar("Baffled Bafoon Baloons For Sale Because", "a");
// // => 5

function countChar(str, chr){
  count = 0;
  for (var i = str.length - 1; i >= 0; i--)
    if (chr == str.charAt(i))
      count++;
  return count
}

function countBs(str){
  return countChar(str, "B");
}

exports.countBs = countBs;
exports.countChar = countChar;
