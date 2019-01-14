# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require_relative 'config_file_loader'
require_relative 'api_client'
require_relative 'signer'

# Top level module for the Oracle Cloud Infrastructure SDK
module OCI
  # Gets the global Config, or loads the default config file if a Config has not been set.
  #
  # @return [Config]
  def self.config
    @config ||= ConfigFileLoader.load_config
  end

  # Set the global Config
  def self.config=(config)
    @config = config
  end
end
