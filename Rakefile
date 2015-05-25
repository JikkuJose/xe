require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new("test:all") do |task|
  task.libs << %w(test lib)
  task.test_files = FileList["test/**/test_*"]
end

task :default => "test:all"
