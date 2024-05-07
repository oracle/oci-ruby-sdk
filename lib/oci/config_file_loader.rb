# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'inifile'
require 'logger'
require_relative 'config'

module OCI
  # Module for loading Config from a file
  module ConfigFileLoader
    module Errors
      class ConfigFileNotFoundError < RuntimeError; end
      class ProfileNotFoundError < RuntimeError; end
      class DefaultProfileDoesNotExistError < RuntimeError; end
    end

    # Name of the default profile to load from a config file
    DEFAULT_PROFILE = 'DEFAULT'.freeze

    # Default config file name and location
    DEFAULT_CONFIG_FILE = "#{Dir.home}/.oci/config".freeze
    FALLBACK_DEFAULT_CONFIG_FILE = "#{Dir.home}/.oraclebmc/config".freeze
    OCI_CONFIG_FILE_ENV_VAR_NAME = 'OCI_CONFIG_FILE'.freeze

    # rubocop:disable Metrics/CyclomaticComplexity
    # Loads the a Config from the specified file and profile.
    #
    # @param [String] config_file_location Filename and path of the config file.
    # Defaults to "~/.oci/config" (on windows "C:\Users\{user}\.oci\config") with a fallback to
    # "~/.oraclebmc/config" (on windows "C:\Users\{user}\.oraclebmc\config")
    # If all the above fallbacks failed, it will use ENV VAR "OCI_CONFIG_FILE" to retrieve the path
    # @param [String] profile_name Name of the profile from the file. Defaults to "DEFAULT".
    # @return [Config] A Config
    def self.load_config(config_file_location: DEFAULT_CONFIG_FILE, profile_name: DEFAULT_PROFILE)
      env_var_config_path = ENV[OCI_CONFIG_FILE_ENV_VAR_NAME]
      if config_file_location == DEFAULT_CONFIG_FILE
        configs = if File.exist?(File.expand_path(config_file_location))
                    load_configs(config_file_location)
                  elsif File.exist?(File.expand_path(FALLBACK_DEFAULT_CONFIG_FILE))
                    load_configs(FALLBACK_DEFAULT_CONFIG_FILE)
                  elsif !env_var_config_path.nil? && File.exist?(File.expand_path(env_var_config_path))
                    load_configs(env_var_config_path)
                  else
                    raise Errors::ConfigFileNotFoundError, 'Config file does not exist.'
                  end
      else
        configs = load_configs(config_file_location)
      end

      return configs[profile_name] if configs && configs.key?(profile_name)

      raise Errors::ProfileNotFoundError, 'Profile not found in the given config file.'
    end
    # rubocop:enable Metrics/CyclomaticComplexity

    # Loads all of the Configs from the specified file.
    #
    # @param [String] config_file_location Filename and path of the config file.
    # @return [Array<Config>] An array containing all the configs found in the given file.
    def self.load_configs(config_file_location)
      config_file_location = File.expand_path(config_file_location)
      raise Errors::ConfigFileNotFoundError, 'Config file does not exist.' unless File.file?(config_file_location)

      config_file = IniFile.load(config_file_location)
      configs = {}

      if config_file.nil? || !config_file.has_section?(DEFAULT_PROFILE)
        raise Errors::DefaultProfileDoesNotExistError, 'The DEFAULT profile does not exist.'
      end

      config_file.each_section do |section|
        config = Config.new

        load_section(config_file[DEFAULT_PROFILE], config) unless section.equal? DEFAULT_PROFILE
        load_section(config_file[section], config)

        configs[section] = config
      end

      configs
    end

    def self.load_section(section, config)
      section.each_key do |key|
        value = section[key]
        value = File.expand_path(value) if key == 'key_file'

        # key_content is not allowed in configuration file
        next if key == 'key_content'

        config.instance_variable_set('@' + key, value) if config.respond_to?("#{key}=") && config.respond_to?(key)
        # TODO: log the key been ignored by Ruby SDK
      end
    end

    private_class_method :load_section
  end
end
