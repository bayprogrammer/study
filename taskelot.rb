#!/usr/bin/env ruby

# TODO(zmd): gemspec, etc. (proper project structure)
# TODO(zmd): file per module
# TODO(zmd): defcmd helper "class macro"
module Taskelot
  module Commandable
  end

  class Taskelot::App
    def self.start()
      new().run()
    end

    def initialize()
      @running = false
    end

    def run()
      @running = true
      while @running
        cmd, *args = read_input()
        dispatch_command(cmd, args)
      end
    end

    private

    def read_input()
      print '> '
      if (line = gets)
        line.split()
      else
        []
      end
    end

    def dispatch_command(cmd, args)
      # replace this with instead defcmd and a lookup table
      case cmd
      when nil
        nothing()
      when 'quit'
        quit()
      else
        ok()
      end
    end

    def quit()
      @running = false
      puts 'Goodbye.'
    end

    def nothing()
      puts "quit"
      quit()
    end

    def ok()
      puts 'OK'
    end
  end
end


Taskelot::App.start()
