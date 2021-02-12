#!/usr/bin/env ruby

# TODO(zmd): gemspec, etc. (proper project structure)
# TODO(zmd): file per module
# TODO(zmd): defcmd helper "class macro"
module Taskelot
  module Commandable
    module InstanceMethods
      def register_command(cmd, &block)
        cmd_lookup[cmd] ||= block
      end

      def dispatch_command(cmd, *args)
        cmd_lookup[cmd].call(*args)
      end

      def cmd_lookup
        @cmd_lookup ||= {}
      end
    end

    # TODO(zmd): NEXT: this is all wrong; not thinking clearly about what is
    #   bound at class construction vs. instance time.

    module ClassMethods
      def defcmd(key, &block)
      end
    end

    # TODO(zmd): provide a defcmd class macro
    def self.included(m)
      m.include(InstanceMethods)
      m.extend(ClassMethods)
    end
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
        dispatch_command(cmd, *args)
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

    defcmd :push do |*args|
      puts 'OK'
    end

    defcmd :add do |*args|
      puts 'OK'
    end

    defcmd :quit do
      @running = false
      puts 'Goodbye.'
    end

    defcmd :_nothing do
      print "\n"
    end

    defcmd :_unknown do
      puts '?'
    end

    defcmd :_ctrl_d do
      puts "quit"
      dispatch(:quit)
    end
  end
end


Taskelot::App.start()
