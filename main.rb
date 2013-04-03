#!/usr/bin/ruby -Ks
require "inputchecker.rb"
require "bowlingscore.rb"

exit if defined?(Ocra)

include InputChecker

bowling = BowlingScore.new
1.upto(10) do |frame|
  input_data = $stdin.gets.chomp.split.map(&:to_i)
  
  if check_bowl_result(frame, input_data)
    bowling.set_data(frame, input_data)
  else
    $stderr.puts "ERROR: ILLEGAL INPUT!"
    exit
  end
end

puts bowling.total_score
puts bowling.total_score_on_each_frame.join(" ")
