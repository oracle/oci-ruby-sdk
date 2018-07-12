# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'rake/testtask'
require 'yard'
require 'os'
require 'rubocop/rake_task'

desc 'Run tests'
task default: :rubocop

files = File.open('.yarddoc-files').readlines.map(&:strip)
YARD::Rake::YardocTask.new do |t|
  t.files   = files
  t.options = ['-m', 'markdown']
end

task doc: :yard

# Run RuboCop and display cop names (-D) for more traceability around failures
RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = ['-D']
end
