task :default => [:make, :makechecker]

#
# bowling.exeの作成
#
desc "make bowling.exe"
task :make do
  system("ocra main.rb --console --output bowling.exe")
end

#
# checker.exeの作成
#
desc "make checker.exe"
task :makechecker do
  system("ocra checker.rb --console --output checker.exe")
end

#
# テストの実行
#
desc "run test"
task :test do
  system("ruby test/runner.rb")
end
