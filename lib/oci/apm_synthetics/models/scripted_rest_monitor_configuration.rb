# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200630
require 'date'
require 'logger'
require_relative 'monitor_configuration'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Configuration details for the SCRIPTED_REST monitor type.
  class ApmSynthetics::Models::ScriptedRestMonitorConfiguration < ApmSynthetics::Models::MonitorConfiguration
    REQ_AUTHENTICATION_SCHEME_ENUM = [
      REQ_AUTHENTICATION_SCHEME_NONE = 'NONE'.freeze,
      REQ_AUTHENTICATION_SCHEME_RESOURCE_PRINCIPAL = 'RESOURCE_PRINCIPAL'.freeze,
      REQ_AUTHENTICATION_SCHEME_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Request HTTP authentication scheme.
    # @return [String]
    attr_reader :req_authentication_scheme

    # Expected HTTP response codes. For status code range, set values such as 2xx, 3xx.
    #
    # @return [Array<String>]
    attr_accessor :verify_response_codes

    # @return [OCI::ApmSynthetics::Models::NetworkConfiguration]
    attr_accessor :network_configuration

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'config_type': :'configType',
        'is_failure_retried': :'isFailureRetried',
        'dns_configuration': :'dnsConfiguration',
        'req_authentication_scheme': :'reqAuthenticationScheme',
        'verify_response_codes': :'verifyResponseCodes',
        'network_configuration': :'networkConfiguration'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'config_type': :'String',
        'is_failure_retried': :'BOOLEAN',
        'dns_configuration': :'OCI::ApmSynthetics::Models::DnsConfiguration',
        'req_authentication_scheme': :'String',
        'verify_response_codes': :'Array<String>',
        'network_configuration': :'OCI::ApmSynthetics::Models::NetworkConfiguration'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_failure_retried The value to assign to the {OCI::ApmSynthetics::Models::MonitorConfiguration#is_failure_retried #is_failure_retried} proprety
    # @option attributes [OCI::ApmSynthetics::Models::DnsConfiguration] :dns_configuration The value to assign to the {OCI::ApmSynthetics::Models::MonitorConfiguration#dns_configuration #dns_configuration} proprety
    # @option attributes [String] :req_authentication_scheme The value to assign to the {#req_authentication_scheme} property
    # @option attributes [Array<String>] :verify_response_codes The value to assign to the {#verify_response_codes} property
    # @option attributes [OCI::ApmSynthetics::Models::NetworkConfiguration] :network_configuration The value to assign to the {#network_configuration} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['configType'] = 'SCRIPTED_REST_CONFIG'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.req_authentication_scheme = attributes[:'reqAuthenticationScheme'] if attributes[:'reqAuthenticationScheme']

      raise 'You cannot provide both :reqAuthenticationScheme and :req_authentication_scheme' if attributes.key?(:'reqAuthenticationScheme') && attributes.key?(:'req_authentication_scheme')

      self.req_authentication_scheme = attributes[:'req_authentication_scheme'] if attributes[:'req_authentication_scheme']

      self.verify_response_codes = attributes[:'verifyResponseCodes'] if attributes[:'verifyResponseCodes']

      raise 'You cannot provide both :verifyResponseCodes and :verify_response_codes' if attributes.key?(:'verifyResponseCodes') && attributes.key?(:'verify_response_codes')

      self.verify_response_codes = attributes[:'verify_response_codes'] if attributes[:'verify_response_codes']

      self.network_configuration = attributes[:'networkConfiguration'] if attributes[:'networkConfiguration']

      raise 'You cannot provide both :networkConfiguration and :network_configuration' if attributes.key?(:'networkConfiguration') && attributes.key?(:'network_configuration')

      self.network_configuration = attributes[:'network_configuration'] if attributes[:'network_configuration']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] req_authentication_scheme Object to be assigned
    def req_authentication_scheme=(req_authentication_scheme)
      # rubocop:disable Style/ConditionalAssignment
      if req_authentication_scheme && !REQ_AUTHENTICATION_SCHEME_ENUM.include?(req_authentication_scheme)
        OCI.logger.debug("Unknown value for 'req_authentication_scheme' [" + req_authentication_scheme + "]. Mapping to 'REQ_AUTHENTICATION_SCHEME_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @req_authentication_scheme = REQ_AUTHENTICATION_SCHEME_UNKNOWN_ENUM_VALUE
      else
        @req_authentication_scheme = req_authentication_scheme
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        config_type == other.config_type &&
        is_failure_retried == other.is_failure_retried &&
        dns_configuration == other.dns_configuration &&
        req_authentication_scheme == other.req_authentication_scheme &&
        verify_response_codes == other.verify_response_codes &&
        network_configuration == other.network_configuration
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
      [config_type, is_failure_retried, dns_configuration, req_authentication_scheme, verify_response_codes, network_configuration].hash
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
