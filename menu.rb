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


  def self.putsc(color, text)
    print ANSI::Color[color]
    puts text
    print ANSI::Control[:reset]
  end


  def self.printc(color, text)
    print ANSI::Color[color]
    print text
    print ANSI::Control[:reset]
  end


end



ANSI.putsc :blue, "Hello Ruby #{RUBY_VERSION}"
ANSI.putsc :green, "Hello, dude."
ANSI.printc :blue, "H"
ANSI.printc :green, "e"
ANSI.printc :cyan, "l"
ANSI.printc :magenta, "l"
ANSI.printc :yellow, "o"
ANSI.putsc :red, " BEN!!!"
