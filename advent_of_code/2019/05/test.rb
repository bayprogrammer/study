#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'computer'


class TestWiresCrossed < Minitest::Test

  def setup
  end

  TEST_PROGRAMS = [
    {
      start: '1,9,10,3,2,3,11,0,99,30,40,50',
      final: '3500,9,10,70,2,3,11,0,99,30,40,50'
    },
    {
      start: '1,0,0,0,99',
      final: '2,0,0,0,99'
    },
    {
      start: '2,3,0,3,99',
      final: '2,3,0,6,99'
    },
    {
      start: '2,4,4,5,99,0',
      final: '2,4,4,5,99,9801'
    },
    {
      start: '1,1,1,4,99,5,6,0,99',
      final: '30,1,1,4,2,5,6,0,99'
    }
  ]

  def test_basic_functionality
    TEST_PROGRAMS.each do |states|
      c = Computer.new_from_s(states[:start])
      c.run!
      assert_equal(states[:final], c.to_s)
    end
  end

  def test_reset
    program = TEST_PROGRAMS[0][:start]
    c = Computer.new_from_s(program)

    c.run!
    refute_equal(program, c.to_s)

    c.reset!
    assert_equal(program, c.to_s)
  end

  def test_read_valid_memory
    program = TEST_PROGRAMS[0][:start]
    c = Computer.new_from_s(program)
    assert_equal(99, c[8])
  end

  def test_read_invalid_memory
    program = TEST_PROGRAMS[0][:start]
    c = Computer.new_from_s(program)
    assert_raises(Computer::SegFault) { c[42] }
  end

  def test_write_valid_memory
    program = TEST_PROGRAMS[0][:start]
    c = Computer.new_from_s(program)
    c[0] = 42
    assert_equal(42, c[0])
  end

  def test_write_invalid_memory
    program = TEST_PROGRAMS[0][:start]
    c = Computer.new_from_s(program)
    assert_raises(Computer::SegFault) { c[42] = 0 }
  end

  def test_step
    program = TEST_PROGRAMS[0][:start]
    c = Computer.new_from_s(program)

    assert_equal(0, c.inspect[:instruction_pointer])

    c.step!
    assert_equal(4, c.inspect[:instruction_pointer])
  end

  def test_raises_if_encountering_invalid_opcode
    c = Computer.new_from_s('1,1,1,1,-4')
    assert_raises(Computer::InvalidOperation) { c.run! }
  end

  def test_add_op
    c = Computer.new_from_s('1,5,6,7,99,2,3,0')
    c.run!
    assert_equal(5, c[7])
  end

  def test_mult_op
    c = Computer.new_from_s('2,5,6,7,99,2,3,0')
    c.run!
    assert_equal(6, c[7])
  end

  def test_stop_op
    c = Computer.new_from_s('99,1,5,6,7,99,2,3,42')
    c.run!
    assert_equal(42, c[8])
  end

  def test_input_op
    flunk
  end

  def test_output_op
    # TODO(zmd): implement me
  end

end
