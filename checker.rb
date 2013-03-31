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
  # ���Ғl�̓t�@�C���ŏI�s�ɋL����Ă���.
  expected = nil
  File.open(fname, "r") do |f|
    f.each_line do |line|
      expected = f.gets.chomp
    end
  end
  
  # �N��
  actual = `#{target_file} < #{fname}`
  actual.chomp!
  
  # ���ʕ\��
  print "#{File.basename(fname)}  "
  if actual == expected
    puts "OK"
  else
    puts "NG"
    puts "  Actual   : #{actual}"
    puts "  Expected : #{expected}"
  end
end
