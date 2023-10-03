# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl
# or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))

require 'oci/version'

Gem::Specification.new do |s|
  s.name        = "oci"
  s.version     = OCI::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Oracle"]
  s.email       = ["joe.levy@oracle.com"]
  s.homepage    = "https://docs.cloud.oracle.com/tools/ruby/latest/frames.html"
  s.summary     = "Oracle Cloud Infrastructure Ruby SDK"
  s.description = <<~DESC
    Ruby SDK for Oracle Cloud Infrastructure.
    Are you a Developer using the OCI SDK? If so, please fill out our survey to help us make the OCI SDK better for you. 
    https://oracle.questionpro.com/t/APeMlZka26?custom3=rubygems
  DESC

  s.licenses     = ["UPL-1.0", "Apache-2.0"]

  s.required_ruby_version = '>= 2.2.0'

  s.add_runtime_dependency 'json', '>= 1.4.6', '< 3.0.0'
  s.add_runtime_dependency 'inifile', '~> 3.0', '>= 3.0.0'
  s.add_runtime_dependency 'jwt', '~> 2.1'
  s.add_runtime_dependency 'psych', '>= 3.1.0', '< 5.0.0'
  s.add_development_dependency 'webmock', '~> 3.5', '>=3.5.1'
  s.add_development_dependency 'vcr', '~> 4.0'
  s.add_development_dependency 'yard', '~> 0.9', '>= 0.9.12'
  s.add_development_dependency 'os', '~> 1.0'
  s.add_development_dependency 'rubocop', '>= 0.55', '<= 0.67.1'
  s.add_development_dependency 'mocha', '~> 1.7'
  s.add_development_dependency 'nokogiri', '~> 1.9'
  s.add_development_dependency 'rspec', '~> 3.8'
  s.add_development_dependency 'activesupport', '~> 5.2.2'
  s.add_development_dependency 'rspec_junit_formatter', '~> 0.3.0'
  s.executables   = nil
  s.require_paths = ["lib"]
  s.files         = Dir["./lib/**/*.rb", "README.md", "LICENSE.txt", "NOTICE.txt"]
end
