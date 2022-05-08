#!/usr/bin/env ruby

module ANSI

  class EscapeCode

    RESET = "\u001b[0m"

    def initialize(code)
      @code = code
    end

    def to_s
      @code
    end

    def call(str)
      # TODO(zmd): only add reset if it's missing (since these may be nested
      #     together, no need to string together duplicate reset codes)
      @code + str + RESET
    end

    alias :[] :call

  end


  # Codes that use EscapeCode can be applied to strings (things like styles and
  # colors); those that are bare strings are meant to be added into a string or
  # stream, but do not make sense to "apply" to a group (like moving the cursor
  # or resetting)
  CODES = {
    control: {
      :reset => "\u001b[0m",
    },
    style: {
      :bold => EscapeCode.new("\u001b[1m"),
    },
    color: {
      8 => {
        :black   => EscapeCode.new("\u001b[30m"),
        :red     => EscapeCode.new("\u001b[31m"),
        :green   => EscapeCode.new("\u001b[32m"),
        :yellow  => EscapeCode.new("\u001b[33m"),
        :blue    => EscapeCode.new("\u001b[34m"),
        :magenta => EscapeCode.new("\u001b[35m"),
        :cyan    => EscapeCode.new("\u001b[36m"),
        :white   => EscapeCode.new("\u001b[37m")
      },
      16 => {
        # TODO(zmd): complete me
      },
      256 => {
        # TODO(zmd): complete me
      },
      :true => ->(color) {
        if color.is_a?(Number)
          # TODO(zmd): generate escape code for 24 bit color represented by the
          #     number
        else
          # TODO(zmd): parse string in format '#aabbcc' as hex digit
          # TODO(zmd): use number to generate escape code for 24 bit color
        end
      }
    }
  }


  module Color

    BASIC_COLORS = {
      30 => CODES[:color][8][:black],
      31 => CODES[:color][8][:red],
      32 => CODES[:color][8][:green],
      33 => CODES[:color][8][:yellow],
      34 => CODES[:color][8][:blue],
      35 => CODES[:color][8][:magenta],
      36 => CODES[:color][8][:cyan],
      37 => CODES[:color][8][:white],
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
  ANSI::Color[color][str]
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
