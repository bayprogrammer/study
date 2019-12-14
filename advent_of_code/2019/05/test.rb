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

end
