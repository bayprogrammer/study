#!/usr/bin/env ruby

ANSI_TABLE = {
  :hide_cursor => "\u001b[?25l",
  :show_cursor => "\u001b[?12l\u001b[?25h",
  :reset   => "\u001b[0m",
  :newline => "\n",
  :return  => "\r",
  :back    => "\u001b[1D",
  :bold    => "\u001b[1m",
  :black   => "\u001b[30m",
  :red     => "\u001b[31m",
  :green   => "\u001b[32m",
  :yellow  => "\u001b[33m",
  :blue    => "\u001b[34m",
  :magenta => "\u001b[35m",
  :cyan    => "\u001b[36m",
  :white   => "\u001b[37m"
}

SYMBOLS = [

]

COLORS = [
  #ANSI_TABLE[:black],
  ANSI_TABLE[:red],
  ANSI_TABLE[:green],
  ANSI_TABLE[:yellow],
  ANSI_TABLE[:blue],
  ANSI_TABLE[:magenta],
  ANSI_TABLE[:cyan],
  ANSI_TABLE[:white]
]

def ansi(sym)
  ANSI_TABLE[sym]
end

def rand_color
  COLORS[(rand * 6).to_i]
end

print ansi(:hide_cursor)
loop do
  80.times do |n|
    c = rand_color

    print ansi(:bold)
    print c
    print "#"
    sleep 0.1

    print ansi(:reset)
    print ansi(:back)
    print c
    print "#"
  end

  print ansi(:return)

  #80.times do |n|
  #  print " "
  #end

  print ansi(:return)
end
print ansi(:show_cursor)
