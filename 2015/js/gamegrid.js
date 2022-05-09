#!/usr/bin/node

// Generate a checker/chess board for any given dimension input
// (exercise from Eloquent JavaScript, 2nd ed.; ch. 2, p. 38)

function odd(number) {
  return Boolean(number % 2)
}

function gen_line(dimension, line_odd, black_tile, white_tile) {
  var line = "";
  var first_tile;
  var last_tile;

  if (line_odd) {
    first_tile = black_tile;
    last_tile = white_tile;
  }
  else {
    first_tile = white_tile;
    last_tile = black_tile;
  }

  for (var column = 1; column <= dimension; column++) {
    if (odd(column))
      line += first_tile;
    else
      line += last_tile;
  }
  return line
}

function display_game_grid(dimension, black_tile, white_tile) {
  var odd_line = gen_line(dimension, true, black_tile, white_tile);
  var even_line = gen_line(dimension, false, black_tile, white_tile);

  var top_border = "+" + odd_line.replace(/./g, '-') + "+";
  console.log(top_border);

  for (var row = 1; row <= dimension; row++) {
    if (odd(row))
      console.log("|" + odd_line + "|");
    else
      console.log("|" + even_line + "|");
  }

  console.log(top_border);
}

function main() {
  // Board size
  var size = process.argv[2] || 8;

  // Board tile representation character(s)
  var black_tile = process.argv[3] || "##"
  var white_tile = process.argv[4] || "  "

  // *whistle* ... I hope you make it.
  display_game_grid(size, black_tile, white_tile);
}

main();
