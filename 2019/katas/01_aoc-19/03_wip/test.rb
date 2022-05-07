#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'wires_crossed'
require 'set'


class TestWiresCrossed < Minitest::Test

  FrontPanel = WiresCrossed::FrontPanel
  Wire = WiresCrossed::Wire

  P = WiresCrossed::Point

  L = WiresCrossed::Left
  R = WiresCrossed::Right
  U = WiresCrossed::Up
  D = WiresCrossed::Down

  def setup
  end

  SAMPLE_DATA = [

    # sample_1
    {
      input: "R8,U5,L5,D3\nU7,R6,D4,L4",
      directions:     [[ R[8], U[5], L[5], D[3] ],
                       [ U[7], R[6], D[4], L[4] ]],
      wires: [ Wire.new( R[8], U[5], L[5], D[3] ),     # wire_1
               Wire.new( U[7], R[6], D[4], L[4] ) ],   # wire_2
      result: 6
    },

    {
      input: "R75,D30,R83,U83,L12,D49,R71,U7,L72\nU62,R66,U55,R34,D71,R55,D58,R83",
      directions:     [[ R[75], D[30], R[83], U[83], L[12], D[49], R[71], U[ 7], L[72] ],
                       [ U[62], R[66], U[55], R[34], D[71], R[55], D[58], R[83]        ]],
      wires: [ Wire.new( R[75], D[30], R[83], U[83], L[12], D[49], R[71], U[ 7], L[72] ),
               Wire.new( U[62], R[66], U[55], R[34], D[71], R[55], D[58], R[83]        )],
      panel_display: %Q(
      ).strip,
      result: 159
    },

    {
      input: "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51\nU98,R91,D20,R16,D67,R40,U7,R15,U6,R7",
      directions:     [[ R[98], U[47], R[26], D[63], R[33], U[87], L[62], D[20], R[33], U[53], R[51] ],
                       [ U[98], R[91], D[20], R[16], D[67], R[40], U[ 7], R[15], U[6],  R[ 7]        ]],
      wires: [ Wire.new( R[98], U[47], R[26], D[63], R[33], U[87], L[62], D[20], R[33], U[53], R[51] ),
               Wire.new( U[98], R[91], D[20], R[16], D[67], R[40], U[ 7], R[15], U[6],  R[ 7]        )],
      result: 135
    }

  ]

  def sample_1_intersection_distances
    Set[11, 6]
  end

  def wire_1
    SAMPLE_DATA[0][:wires][0]
  end

  def wire_1_string
    <<~END_OF_DISPLAY
         +----+
         |    |
         |    |
         |    |
              |
      o-------+
    END_OF_DISPLAY
  end

  def wire_1_points
    [P[0, 0], P[8, 0], P[8, -5], P[3, -5], P[3, -2]]
  end

  def wire_1_bounds
    [
      P[0,  0],
      P[8, -5]
    ]
  end

  def wire_1_array
    [
      ' ', ' ', ' ', '+', '-', '-', '-', '-', '+',
      ' ', ' ', ' ', '|', ' ', ' ', ' ', ' ', '|',
      ' ', ' ', ' ', '|', ' ', ' ', ' ', ' ', '|',
      ' ', ' ', ' ', '|', ' ', ' ', ' ', ' ', '|',
      ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '|',
      'o', '-', '-', '-', '-', '-', '-', '-', '+'
    ]
  end

  def wire_2
    SAMPLE_DATA[0][:wires][1]
  end

  def wire_2_string
    <<~END_OF_DISPLAY
      +-----+
      |     |
      |     |
      |     |
      | ----+
      |
      |
      o
    END_OF_DISPLAY
  end

  def wire_2_points
    [P[0, 0], P[0, -7], P[6, -7], P[6, -3], P[2, -3]]
  end

  def wire_2_bounds
    [
      P[0,  0],
      P[6, -7]
    ]
  end

  def wire_2_array
    [
      '+', '-', '-', '-', '-', '-', '+',
      '|', ' ', ' ', ' ', ' ', ' ', '|',
      '|', ' ', ' ', ' ', ' ', ' ', '|',
      '|', ' ', ' ', ' ', ' ', ' ', '|',
      '|', ' ', '-', '-', '-', '-', '+',
      '|', ' ', ' ', ' ', ' ', ' ', ' ',
      '|', ' ', ' ', ' ', ' ', ' ', ' ',
      'o', ' ', ' ', ' ', ' ', ' ', ' '
    ]
  end

  def test_point_equality
    assert_equal(P[0, 0], P[0, 0])
    assert_equal(P[-4, 5], P[-4, 5])
    refute_equal(P[-4, 5], P[-5, 4])
  end

  def test_direction_equality
    assert_equal(R[98], R[98])
    refute_equal(R[98], L[98])
    refute_equal(R[98], R[97])
  end

  def test_wire_equality
    assert_equal(Wire.new(R[98], R[98]), Wire.new(R[98], R[98]))
    refute_equal(Wire.new(R[98], R[98]), Wire.new(R[98], L[98]))
    refute_equal(Wire.new(R[98], R[98]), Wire.new(R[98], R[97]))
  end

  def test_parse_directions
    SAMPLE_DATA.each do |sample|
      assert_equal(sample[:directions], FrontPanel.parse_directions(sample[:input]))
    end
  end

  def test_wires_from
    SAMPLE_DATA.each do |sample|
      assert_equal(sample[:wires], FrontPanel.wires_from(sample[:directions]))
    end
  end

  def test_wire_points
    assert_equal(wire_1_points, wire_1.points)
    assert_equal(wire_2_points, wire_2.points)
  end

  def test_wire_bounds
    assert_equal(wire_1_bounds, wire_1.bounds)
    assert_equal(wire_2_bounds, wire_2.bounds)
  end

  def test_wire_to_a
    assert_equal(wire_1_array.length, wire_1.to_a.length)
    assert_equal(wire_2_array.length, wire_2.to_a.length)

    assert_equal(wire_1_array, wire_1.to_a)
    assert_equal(wire_2_array, wire_2.to_a)
  end

  def test_wire_to_s
    skip("can't convert wire to string until we have the wire's buffer")
    assert_equal(wire_1_string, wire_1.to_s)
    assert_equal(wire_2_string, wire_2.to_s)
  end

  # TODO(zmd): panel_display

  # panel_display = %Q(
  #   +-----+
  #   |     |
  #   |  +--X-+
  #   |  |  | |
  #   | -X--+ |
  #   |  |    |
  #   |       |
  #   o-------+
  # ).strip

end
