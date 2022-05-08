#!/usr/bin/env ruby

ANSI_TABLE = {
  :hide_cursor => "\e[?25l",
  :show_cursor => "\e[?12l\e[?25h",
  :reset   => "\e[0m",
  :newline => "\n",
  :return  => "\r",
  :back    => "\e[1D",
  :bold    => "\e[1m",
  :black   => "\e[30m",
  :red     => "\e[31m",
  :green   => "\e[32m",
  :yellow  => "\e[33m",
  :blue    => "\e[34m",
  :magenta => "\e[35m",
  :cyan    => "\e[36m",
  :white   => "\e[37m"
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

running = true

Signal.trap('INT') do
  running = false
end

print ansi(:hide_cursor)
while running
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

    break unless running
  end

  print ansi(:return)

  #80.times do |n|
  #  print " "
  #end

  print ansi(:return)
end
print ansi(:show_cursor)
