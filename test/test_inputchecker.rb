#!/usr/bin/ruby -Ks
require 'test/unit'
require File.join( File.dirname(__FILE__), "../inputchecker.rb" )

class InputCheckerTest < Test::Unit::TestCase
  include InputChecker
  
  def setup
  end
  
  def teardown
  end
  
  #
  # check_bowl_result
  #
  def test_check_bowl_result
    dataT = Struct.new(:in_frame, :in_data, :expected)
    
    data = Array.new
    data << dataT.new(-1, [0, 0], false)
    data << dataT.new(0, [0, 0], false)
    data << dataT.new(5, [0, 0], true)
    data << dataT.new(11, [0, 0], false)
    
    data << dataT.new(1, [], false)
    data << dataT.new(1, [0], true)
    data << dataT.new(1, [0, 0], true)
    data << dataT.new(1, [0, 0, 0], false)
    data << dataT.new(10, [], false)
    data << dataT.new(10, [0], true)
    data << dataT.new(10, [0, 0], true)
    data << dataT.new(10, [0, 0, 0], true)  # This pattern is not false.
    data << dataT.new(10, [0, 0, 0, 0], false)
    
    data.each_with_index do |x, i|
      actual = check_bowl_result( x.in_frame, x.in_data )
      assert_equal( x.expected, actual, "identifier: #{i}" )
    end
  end
  
  #
  # check_number
  #
  def test_check_number
    dataT = Struct.new(:input, :expected)
    
    data = Array.new
    data << dataT.new([0, 0], true)
    data << dataT.new([10, 10], true)
    data << dataT.new([0, -1], false)
    data << dataT.new([0, 11], false)
    data << dataT.new([10], true)
    data << dataT.new([5, 6, 7], true)
    
    data.each_with_index do |x, i|
      actual = check_number(x.input)
      assert_equal( x.expected, actual, "identifier: #{i}" )
    end
  end
  
  #
  # check_total
  #
  def test_check_total
    dataT = Struct.new(:input, :expected)
    
    data = Array.new
    data << dataT.new([10], true)
    data << dataT.new([5, 5], true)
    data << dataT.new([10, 10, 10], true)
    data << dataT.new([1, 10], false)
    data << dataT.new([10, 10], false)
    data << dataT.new([10, 10, 10, 10], false)
    
    data.each_with_index do |x, i|
      actual = check_total(x.input)
      expected = x.expected
      assert_equal( expected, actual, "identifier: #{i}" )
    end
  end
  
end
