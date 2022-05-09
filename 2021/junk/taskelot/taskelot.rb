#!/usr/bin/env ruby

require 'set'


# TODO(zmd): gemspec, etc. (proper project structure)
# TODO(zmd): file per module
# TODO(zmd): tests!
# TODO(zmd): rdoc!
# TODO(zmd): Taskelot::CLI
# TODO(zmd): text editor delegation support
# TODO(zmd): @StretchGoal: metadata & descriptions / notes
# TODO(zmd): @StretchGoal: rudimentary line-based text editor? (for comments)
module Taskelot
  # TODO(zmd): extract Commandable to stand-alone gem, once I've worked it out
  #   well for Taskelot
  module Commandable
    module InstanceMethods
      def dispatch_command(cmd, *args)
        cmd_str = cmd.to_s

        if cmd_sym = defcmd_registry[cmd_str]
          send(cmd_sym, *args)
        else
          case cmd
          when ''
            send(:_nothing, *args)
          when nil
            send(:_ctrl_d, *args)
          else
            send(:_unknown, *args)
          end
        end
      end

      def running?
        @running = false unless defined?(@running)
        @running
      end

      def start!
        @running = true
      end

      def stop!
        @running = false
      end

      def _nothing(*_args)
      end

      def _ctrl_d(*_args)
        raise NotImplementedError, "Please define the :_ctrl_d command to implement."
      end

      def _unknown(*_args)
        raise NotImplementedError, "Please define the :_unknown command to implement."
      end

      def defcmd_registry
        self.class.defcmd_registry
      end
    end

    module ClassMethods
      def defcmd(key, &block)
        key_sym = key.to_sym
        key_str = key.to_s

        defcmd_registry[key_str] = key_sym

        define_method(key_sym, &block)
      end

      def defcmd_registry
        @@defcmd_registry ||= {}
      end
    end

    def self.included(m)
      m.include(InstanceMethods)
      m.extend(ClassMethods)
    end
  end

  class Taskelot::App
    include Commandable

    def self.start()
      new().run()
    end

    # TODO(zmd): remove once run & running helpers defined in Commandable
    def initialize()
      @running = false
    end

    # TODO(zmd): move to Commandable
    # TODO(zmd): add helpers for running= running?
    def run()
      @running = true
      while @running
        cmd, *args = read_input()
        dispatch_command(cmd, *args)
      end
    end

    # TODO(zmd): no need for private declaration here
    private

    # TODO(zmd): move to Commandable
    # TODO(zmd): customizeable prompt (controllable by command, dynamically)
    def read_input()
      print '> '

      if (line = gets)
        line = line.strip

        if line.length == 0
          [line]
        else
          line.split()
        end
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

    defcmd :_unknown do
      puts '?'
    end

    defcmd :_ctrl_d do
      puts "quit"
      dispatch_command(:quit)
    end
  end
end


Taskelot::App.start()
