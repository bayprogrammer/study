#!/usr/bin/node

// Create a triangle out of octothorpes
// (exercise from Eloquent JavaScript, 2nd ed.; ch. 2, p. 37)

var line = "#"
for (var len = 0; len < 7; len++) {
  console.log(line);
  line += "#";
}
