#!/usr/bin/env ruby

# frozen_string_literal: true


module WiresCrossed

  class FrontPanel

    def self.parse_directions(input)
      wires = input.strip.split("\n").map do |wire_string|
        wire_string.split(',').map do |dir_string|
          dir = dir_string[0]
          steps = dir_string.slice(1..).to_i

          case dir
          when "L"
            Left[steps]
          when "R"
            Right[steps]
          when "U"
            Up[steps]
          when "D"
            Down[steps]
          end
        end
      end
    end

    def self.wires_from(dirs_collections)
      dirs_collections.map { |directions| Wire.new(*directions) }
    end

    def initialize(*wires)
    end

  end


  class Wire

    attr_reader :directions
    attr_reader :points

    def initialize(*directions)
      @points = points_from_directions(directions).freeze
    end

    def to_a
      @array ||= array_from_points
    end

    def ==(other)
      points == other.points
    end

    def to_s
      'o'
    end

    private

    def points_from_directions(directions)
      points = []
      cursor = [0, 0]
      points << Point[*cursor]

      directions.each do |direction|
        case direction
        when Left
          x, y = cursor
          cursor = [x - direction.steps, y]
        when Up
          x, y = cursor
          cursor = [x, y - direction.steps]
        when Right
          x, y = cursor
          cursor = [x + direction.steps, y]
        when Down
          x, y = cursor
          cursor = [x, y + direction.steps]
        end

        points << Point[*cursor]
      end

      points
    end


    #
    # [P[0, 0], P[0, -7], P[6, -7], P[6, -3], P[2, -3]]
    #
    #                   |
    #                   |
    #                   V
    #
    # [
    #   ['+', '-', '-', '-', '-', '-', '+'],
    #   ['|', ' ', ' ', ' ', ' ', ' ', '|'],
    #   ['|', ' ', ' ', ' ', ' ', ' ', '|'],
    #   ['|', ' ', ' ', ' ', ' ', ' ', '|'],
    #   ['|', ' ', '-', '-', '-', '-', '+'],
    #   ['|', ' ', ' ', ' ', ' ', ' ', ' '],
    #   ['|', ' ', ' ', ' ', ' ', ' ', ' '],
    #   ['o', ' ', ' ', ' ', ' ', ' ', ' ']
    # ]
    #
    def array_from_points
      array = []

      prev = points.first
      last = points.last

      points.each do |point|
        x, y = point
        # TODO(zmd) <-- LEFT OFF HERE: figure out angle, calculate char based on prev, last, and angle
        char = point_char(point, prev, last)
        # TODO(zmd): insert_point_into_array!(array)
      end

      # TODO(zmd): ensure any gaps in the array have been turned into ' '
      # TODO(zmd): maybe switch to a custom data structure: Grid (which can worry about how to generate the array at the end filling in the gaps and doing any reverse magic it needs to, or else figuring out bounds ahead of time and then pre-allocating the buffer to fit; etc.)

      array
    end

    def point_char(point, prev, last)
      return 'o' if point == prev
      # TODO(zmd): finish me!
      '$'
    end

    def insert_point_into_array!(array)
    end

  end


  #
  #  .---- +x
  #  |
  #  |
  # +y
  #
  class Point

    class << self
      alias_method :[], :new
    end

    attr_reader :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def ==(other)
      (x == other.x) && (y == other.y)
    end

  end


  class Direction

    attr_reader :steps

    class << self
      alias_method :[], :new
    end

    def initialize(steps)
      @steps = steps
    end

    def dir
      self.class
    end

    def ==(other)
      (dir == other.dir) && (steps == other.steps)
    end

  end

  class Left < Direction; end

  class Right < Direction; end

  class Up < Direction; end

  class Down < Direction; end

end
