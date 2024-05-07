# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210610
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # List of available post actions you can execute after the successful Java installation.
  #
  class Jms::Models::PostInstallationActionSettings
    GLOBAL_LOGGING_LEVEL_ENUM = [
      GLOBAL_LOGGING_LEVEL_ALL = 'ALL'.freeze,
      GLOBAL_LOGGING_LEVEL_SEVERE = 'SEVERE'.freeze,
      GLOBAL_LOGGING_LEVEL_WARNING = 'WARNING'.freeze,
      GLOBAL_LOGGING_LEVEL_INFO = 'INFO'.freeze,
      GLOBAL_LOGGING_LEVEL_CONFIG = 'CONFIG'.freeze,
      GLOBAL_LOGGING_LEVEL_FINE = 'FINE'.freeze,
      GLOBAL_LOGGING_LEVEL_FINER = 'FINER'.freeze,
      GLOBAL_LOGGING_LEVEL_FINEST = 'FINEST'.freeze,
      GLOBAL_LOGGING_LEVEL_OFF = 'OFF'.freeze,
      GLOBAL_LOGGING_LEVEL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The following post JRE installation actions are supported by the field:
    # - Disable TLS 1.0 , TLS 1.1
    #
    # @return [Array<OCI::Jms::Models::TlsVersions>]
    attr_accessor :disabled_tls_versions

    # Restores JDK root certificates with the certificates that are available in the operating system.
    # The following action is supported by the field:
    # - Replace JDK root certificates with a list provided by the operating system.
    #
    # @return [BOOLEAN]
    attr_accessor :should_replace_certificates_operating_system

    # @return [OCI::Jms::Models::MinimumKeySizeSettings]
    attr_accessor :minimum_key_size_settings

    # Sets FileHandler and ConsoleHandler as handlers in logging.properties file.
    #
    # @return [BOOLEAN]
    attr_accessor :add_logging_handler

    # Sets the logging level in logging.properties file.
    #
    # @return [String]
    attr_reader :global_logging_level

    # @return [OCI::Jms::Models::Proxies]
    attr_accessor :proxies

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'disabled_tls_versions': :'disabledTlsVersions',
        'should_replace_certificates_operating_system': :'shouldReplaceCertificatesOperatingSystem',
        'minimum_key_size_settings': :'minimumKeySizeSettings',
        'add_logging_handler': :'addLoggingHandler',
        'global_logging_level': :'globalLoggingLevel',
        'proxies': :'proxies'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'disabled_tls_versions': :'Array<OCI::Jms::Models::TlsVersions>',
        'should_replace_certificates_operating_system': :'BOOLEAN',
        'minimum_key_size_settings': :'OCI::Jms::Models::MinimumKeySizeSettings',
        'add_logging_handler': :'BOOLEAN',
        'global_logging_level': :'String',
        'proxies': :'OCI::Jms::Models::Proxies'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<OCI::Jms::Models::TlsVersions>] :disabled_tls_versions The value to assign to the {#disabled_tls_versions} property
    # @option attributes [BOOLEAN] :should_replace_certificates_operating_system The value to assign to the {#should_replace_certificates_operating_system} property
    # @option attributes [OCI::Jms::Models::MinimumKeySizeSettings] :minimum_key_size_settings The value to assign to the {#minimum_key_size_settings} property
    # @option attributes [BOOLEAN] :add_logging_handler The value to assign to the {#add_logging_handler} property
    # @option attributes [String] :global_logging_level The value to assign to the {#global_logging_level} property
    # @option attributes [OCI::Jms::Models::Proxies] :proxies The value to assign to the {#proxies} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.disabled_tls_versions = attributes[:'disabledTlsVersions'] if attributes[:'disabledTlsVersions']

      raise 'You cannot provide both :disabledTlsVersions and :disabled_tls_versions' if attributes.key?(:'disabledTlsVersions') && attributes.key?(:'disabled_tls_versions')

      self.disabled_tls_versions = attributes[:'disabled_tls_versions'] if attributes[:'disabled_tls_versions']

      self.should_replace_certificates_operating_system = attributes[:'shouldReplaceCertificatesOperatingSystem'] unless attributes[:'shouldReplaceCertificatesOperatingSystem'].nil?
      self.should_replace_certificates_operating_system = false if should_replace_certificates_operating_system.nil? && !attributes.key?(:'shouldReplaceCertificatesOperatingSystem') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :shouldReplaceCertificatesOperatingSystem and :should_replace_certificates_operating_system' if attributes.key?(:'shouldReplaceCertificatesOperatingSystem') && attributes.key?(:'should_replace_certificates_operating_system')

      self.should_replace_certificates_operating_system = attributes[:'should_replace_certificates_operating_system'] unless attributes[:'should_replace_certificates_operating_system'].nil?
      self.should_replace_certificates_operating_system = false if should_replace_certificates_operating_system.nil? && !attributes.key?(:'shouldReplaceCertificatesOperatingSystem') && !attributes.key?(:'should_replace_certificates_operating_system') # rubocop:disable Style/StringLiterals

      self.minimum_key_size_settings = attributes[:'minimumKeySizeSettings'] if attributes[:'minimumKeySizeSettings']

      raise 'You cannot provide both :minimumKeySizeSettings and :minimum_key_size_settings' if attributes.key?(:'minimumKeySizeSettings') && attributes.key?(:'minimum_key_size_settings')

      self.minimum_key_size_settings = attributes[:'minimum_key_size_settings'] if attributes[:'minimum_key_size_settings']

      self.add_logging_handler = attributes[:'addLoggingHandler'] unless attributes[:'addLoggingHandler'].nil?
      self.add_logging_handler = false if add_logging_handler.nil? && !attributes.key?(:'addLoggingHandler') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :addLoggingHandler and :add_logging_handler' if attributes.key?(:'addLoggingHandler') && attributes.key?(:'add_logging_handler')

      self.add_logging_handler = attributes[:'add_logging_handler'] unless attributes[:'add_logging_handler'].nil?
      self.add_logging_handler = false if add_logging_handler.nil? && !attributes.key?(:'addLoggingHandler') && !attributes.key?(:'add_logging_handler') # rubocop:disable Style/StringLiterals

      self.global_logging_level = attributes[:'globalLoggingLevel'] if attributes[:'globalLoggingLevel']

      raise 'You cannot provide both :globalLoggingLevel and :global_logging_level' if attributes.key?(:'globalLoggingLevel') && attributes.key?(:'global_logging_level')

      self.global_logging_level = attributes[:'global_logging_level'] if attributes[:'global_logging_level']

      self.proxies = attributes[:'proxies'] if attributes[:'proxies']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] global_logging_level Object to be assigned
    def global_logging_level=(global_logging_level)
      # rubocop:disable Style/ConditionalAssignment
      if global_logging_level && !GLOBAL_LOGGING_LEVEL_ENUM.include?(global_logging_level)
        OCI.logger.debug("Unknown value for 'global_logging_level' [" + global_logging_level + "]. Mapping to 'GLOBAL_LOGGING_LEVEL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @global_logging_level = GLOBAL_LOGGING_LEVEL_UNKNOWN_ENUM_VALUE
      else
        @global_logging_level = global_logging_level
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        disabled_tls_versions == other.disabled_tls_versions &&
        should_replace_certificates_operating_system == other.should_replace_certificates_operating_system &&
        minimum_key_size_settings == other.minimum_key_size_settings &&
        add_logging_handler == other.add_logging_handler &&
        global_logging_level == other.global_logging_level &&
        proxies == other.proxies
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [disabled_tls_versions, should_replace_certificates_operating_system, minimum_key_size_settings, add_logging_handler, global_logging_level, proxies].hash
    end
    # rubocop:enable Metrics/AbcSize, Layout/EmptyLines

    # rubocop:disable Metrics/AbcSize, Layout/EmptyLines


    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)

      self.class.swagger_types.each_pair do |key, type|
        if type =~ /^Array<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            public_method("#{key}=").call(
              attributes[self.class.attribute_map[key]]
                .map { |v| OCI::Internal::Util.convert_to_type(Regexp.last_match(1), v) }
            )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          public_method("#{key}=").call(
            OCI::Internal::Util.convert_to_type(type, attributes[self.class.attribute_map[key]])
          )
        end
        # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end
    # rubocop:enable Metrics/AbcSize, Layout/EmptyLines

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = public_method(attr).call
        next if value.nil? && !instance_variable_defined?("@#{attr}")

        hash[param] = _to_hash(value)
      end
      hash
    end

    private

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
