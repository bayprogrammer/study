#!/usr/bin/env ruby

require "minitest/autorun"


class TestMeme < Minitest::Test

  def setup
  end

  def test_truth
    assert_equal 2, 2
  end

  def test_lies
    refute_equal 2, 3
  end

end
