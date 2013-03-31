#!/usr/bin/ruby -Ks
exit if defined?(Ocra)

unless ARGV.size == 1
  puts "[Usage]"
  puts "  #{__FILE__} test-file"
  exit
end

target_file = ARGV[0]

case_file_list = Dir.glob("case/*.txt")
case_file_list.each do |fname|
  # 期待値はファイル最終行に記されている.
  expected = nil
  File.open(fname, "r") do |f|
    f.each_line do |line|
      expected = f.gets.chomp
    end
  end
  
  # 起動
  actual = `#{target_file} < #{fname}`
  actual.chomp!
  
  # 結果表示
  print "#{File.basename(fname)}  "
  if actual == expected
    puts "OK"
  else
    puts "NG"
    puts "  Actual   : #{actual}"
    puts "  Expected : #{expected}"
  end
end
