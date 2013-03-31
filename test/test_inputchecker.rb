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
  # check_number
  #
  def test_check_number
    input_data =
    [
      [ 0, 0 ],
      [ 10, 10 ],
      [ 0, -1 ],
      [ 0, 11 ],
      [ 10 ],
      [ 5, 6, 7 ]
    ]
    expected =
    [
      true,
      true,
      false,
      false,
      true,
      true
    ]
    
    assert( input_data.size == expected.size )
    
    input_data.each_with_index do |x, i|
      actual = check_number(x)
      assert_equal( expected[i], actual, "identifier: #{i}" )
    end
  end
  
end
