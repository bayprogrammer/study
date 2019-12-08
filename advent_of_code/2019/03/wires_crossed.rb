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

    attr_reader :points

    def initialize(*directions)
      @points = points_from_directions(directions).freeze
      @bounds = nil
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

    def bounds
      unless @bounds
        xs = points.map { |p| p.x }
        ys = points.map { |p| p.y }

        @bounds = [
          Point[xs.min, ys.max],  # bottom left
          Point[xs.max, ys.min]   # top right
        ]
      end

      @bounds
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
    # TODO(zmd): Wire#& -- I want:
    #
    #     panel = wire_1 & wire_2 & wire_3
    #     panel.central_port.nearest(panel.intersections)
    #
    #   to just work
    #
    #   wire  & panel -> panel
    #   panel & wire  -> panel
    #   panel & panel -> panel
    #

    #
    # [P[0, 0], P[0, -7], P[6, -7], P[6, -3], P[2, -3]]
    #
    #                   |
    #                   |
    #                   V
    #
    # [
    #   '+', '-', '-', '-', '-', '-', '+',
    #   '|', ' ', ' ', ' ', ' ', ' ', '|',
    #   '|', ' ', ' ', ' ', ' ', ' ', '|',
    #   '|', ' ', ' ', ' ', ' ', ' ', '|',
    #   '|', ' ', '-', '-', '-', '-', '+',
    #   '|', ' ', ' ', ' ', ' ', ' ', ' ',
    #   '|', ' ', ' ', ' ', ' ', ' ', ' ',
    #   'o', ' ', ' ', ' ', ' ', ' ', ' '
    # ]
    #
    def array_from_points
      array = []

      prev = points.first
      last = points.last

      # TODO(zmd): trace_points(array.&:[]=) or something?
      trace_points do |idx, char|
        array[idx] = char
      end

      # TODO(zmd): ensure any gaps in the array have been turned into ' '

      # TODO(zmd): maybe switch to a custom data structure: Grid (which can
      #   worry about how to generate the array at the end filling in the gaps
      #   and doing any reverse magic it needs to, or else figuring out bounds
      #   ahead of time and then pre-allocating the buffer to fit; etc.)

      array
    end

    #
    # TODO(zmd): need way to translate back and forth from array index and
    #   point instance
    #
    #   going to need to know what the array index is of Point[0, 0]
    #
    #   also need to be able to calculate a range based on the bounds
    #
    def trace_points(&block)
      traverse_points do |prev_p, curr_p, next_p|
        char = point_char(prev_p, curr_p, next_p)

        # TODO(zmd): @LeftOffHere: I don't know how to do what I'm attempting
        #   to do here; need to work it out on graph paper
        target_length = ((bottom_left.x.abs + top_right.x.abs) *
                         (bottom_left.y.abs + top_right.y.abs))
        puts target_length
        (0...target_length).each do |idx|
          block.call(idx, char)
        end
      end
    end

    def bottom_left
      @bottom_left ||= bounds[0]
    end

    def top_right
      @top_right ||= bounds[1]
    end

    def traverse_points(&block)
      points.each_with_index do |curr_p, index|
        prev_p = points[index-1] || curr_p
        next_p = points[index+1]

        block.call(prev_p, curr_p, next_p)
      end
    end

    def point_char(prev_p, curr_p, next_p)
      # TODO(zmd): write me!
      '$'
    end

    def insert_point_into_array!(array, point, char)
      # TODO(zmd): write me! (look up the absolute index based on the stride
      #   and point position)
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
