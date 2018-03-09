#!/usr/bin/env ruby

RESET = "\u001b[0m"
COLORS = {
  :black => "\u001b[30m",
  30     => "\u001b[30m",

  :red => "\u001b[31m",
  31   => "\u001b[31m",

  :green => "\u001b[32m",
  32     => "\u001b[32m",

  :yellow => "\u001b[33m",
  33      => "\u001b[33m",

  :blue => "\u001b[34m",
  34    => "\u001b[34m",

  :magenta => "\u001b[35m",
  35       => "\u001b[35m",

  :cyan => "\u001b[36m",
  36    => "\u001b[36m",

  :white => "\u001b[37m",
  37     => "\u001b[37m",
}

def putsc(color, text)
  print COLORS[color]
  puts text
  print RESET
end

def printc(color, text)
  print COLORS[color]
  print text
  print RESET
end

puts "#{COLORS[:blue]}Hello Ruby #{RUBY_VERSION}#{RESET}"
putsc :green, "Hello, dude."
printc :blue, "H"
printc :green, "e"
printc :cyan, "l"
printc :magenta, "l"
printc :yellow, "o"
putsc :red, " BEN!!!"
