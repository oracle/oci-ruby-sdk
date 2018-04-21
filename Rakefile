# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'rake/testtask'
require 'yard'
require 'os'
require 'rubocop/rake_task'

desc 'Run tests'
task default: :rubocop

YARD::Rake::YardocTask.new do |t|
  t.files   = ['lib/oci/audit/audit.rb',
               'lib/oci/auth/auth.rb',
               'lib/oci/core/core.rb',
               'lib/oci/database/database.rb',
               'lib/oci/dns/dns.rb',
               'lib/oci/email/email.rb',
               'lib/oci/file_storage/file_storage.rb',
               'lib/oci/identity/identity.rb',
               'lib/oci/load_balancer/load_balancer.rb',
               'lib/oci/object_storage/object_storage.rb',
               'lib/',
               '-',
               'LICENSE.txt']
  t.options = ['-m', 'markdown']
end

task doc: :yard

# Run RuboCop and display cop names (-D) for more traceability around failures
RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = ['-D']
end
