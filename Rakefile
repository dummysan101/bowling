task :default => [:make, :makechecker]

#
# bowling.exe�̍쐬
#
desc "make bowling.exe"
task :make do
  system("ocra main.rb --console --output bowling.exe")
end

#
# checker.exe�̍쐬
#
desc "make checker.exe"
task :makechecker do
  system("ocra checker.rb --console --output checker.exe")
end

#
# �e�X�g�̎��s
#
desc "run test"
task :test do
  system("ruby test/runner.rb")
end
