# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl
# or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

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
