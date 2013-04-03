#!/usr/bin/ruby -Ks
exit if defined?(Ocra)

unless ARGV.size == 1
  puts "ERROR: Argument!"
  puts
  puts "[Usage]"
  puts "  #{__FILE__} exec-file"
  exit
end

target_file = ARGV[0]

unless File.exist?(target_file)
  puts "ERROR: File not found. -> #{target_file}"
  exit
end

case_file_list = Dir.glob("case/*.txt")
case_file_list.each do |fname|
  data = Array.new
  File.open(fname, "r") do |f|
    f.each_line do |line|
      data.push line.chomp
    end
  end
  
  data.compact!
  expected = data[-2..-1]
  
  # ‹N“®
  actual = `#{target_file} < #{fname}`
  actual = actual.chomp.split("\n")
  
  # Œ‹‰Ê•\Ž¦
  print "#{File.basename(fname)}  "
  if actual == expected
    puts "OK"
  else
    puts "NG"
    puts "  Actual   : #{actual.inspect}"
    puts "  Expected : #{expected.inspect}"
  end
end
