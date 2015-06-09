#!/usr/bin/node

// Simplistic reimplementation of Math.min(n1, n2)
// (exercise from Eloquent JavaScript, 2nd ed.; ch. 3, p. 56)

// Note: unlike the real standard function, ours here only currently
// compares the first two numbers; this will change once I learn how
// to create variadic functions in JavaScript

// To use in node:
// var min = require('./min.js'); min.min(34, 4); // => 4

function min(a, b){
  if (a < b)
    return Number(a);
  else
    return Number(b);
}

exports.min = min;
