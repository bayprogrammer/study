#!/usr/bin/env ruby

module ANSI


  module Color

    BASIC_COLORS = {
      30 => "\u001b[30m",
      31 => "\u001b[31m",
      32 => "\u001b[32m",
      33 => "\u001b[33m",
      34 => "\u001b[34m",
      35 => "\u001b[35m",
      36 => "\u001b[36m",
      37 => "\u001b[37m",
    }

    COLOR_NAMES = {
      :black   => 30,
      :red     => 31,
      :green   => 32,
      :yellow  => 33,
      :blue    => 34,
      :magenta => 35,
      :cyan    => 36,
      :white   => 37
    }

    def self.[](key)
      if key.is_a?(Symbol)
        BASIC_COLORS[COLOR_NAMES[key]]
      else
        BASIC_COLORS[key]
      end
    end

  end


  module Effect
  end


  module Control
    CONTROL_CODES = {
      :reset => "\u001b[0m"
    }

    def self.[](key)
      CONTROL_CODES[key]
    end
  end


end


# TODO(zmd): these will become convenience mixin methods
def black(str)
  color(:black, str)
end

def red(str)
  color(:red, str)
end

def green(str)
  color(:green, str)
end

def yellow(str)
  color(:yellow, str)
end

def blue(str)
  color(:blue, str)
end

def magenta(str)
  color(:magenta, str)
end

def cyan(str)
  color(:cyan, str)
end

def white(str)
  color(:white, str)
end

def color(color, str)
  ANSI::Color[color] + str + reset
end

def reset()
  ANSI::Control[:reset]
end

puts blue("Hello Ruby #{RUBY_VERSION}")
puts green("Hello, dude.")
print(
     blue("H"),
    green("e"),
     cyan("l"),
  magenta("l"),
   yellow("o"),
          " ",
      red("BEN!!!"),
          "\n"
)
