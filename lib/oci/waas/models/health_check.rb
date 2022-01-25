# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Health checks monitor the status of your origin servers and only route traffic to the origins that pass the health check. If the health check fails, origin is automatically removed from the load balancing.
  # There is roughly one health check per EDGE POP per period. Any checks that pass will be reported as \"healthy\".
  class Waas::Models::HealthCheck
    METHOD_ENUM = [
      METHOD_GET = 'GET'.freeze,
      METHOD_HEAD = 'HEAD'.freeze,
      METHOD_POST = 'POST'.freeze,
      METHOD_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    EXPECTED_RESPONSE_CODE_GROUP_ENUM = [
      EXPECTED_RESPONSE_CODE_GROUP_2_XX = '2XX'.freeze,
      EXPECTED_RESPONSE_CODE_GROUP_3_XX = '3XX'.freeze,
      EXPECTED_RESPONSE_CODE_GROUP_4_XX = '4XX'.freeze,
      EXPECTED_RESPONSE_CODE_GROUP_5_XX = '5XX'.freeze,
      EXPECTED_RESPONSE_CODE_GROUP_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Enables or disables the health checks.
    # @return [BOOLEAN]
    attr_accessor :is_enabled

    # An HTTP verb (i.e. HEAD, GET, or POST) to use when performing the health check.
    # @return [String]
    attr_reader :method

    # Path to visit on your origins when performing the health check.
    # @return [String]
    attr_accessor :path

    # HTTP header fields to include in health check requests, expressed as `\"name\": \"value\"` properties. Because HTTP header field names are case-insensitive, any use of names that are case-insensitive equal to other names will be rejected. If Host is not specified, requests will include a Host header field with value matching the policy's protected domain. If User-Agent is not specified, requests will include a User-Agent header field with value \"waf health checks\".
    #
    # **Note:** The only currently-supported header fields are Host and User-Agent.
    # @return [Hash<String, String>]
    attr_accessor :headers

    # The HTTP response codes that signify a healthy state.
    # - **2XX:** Success response code group.
    # - **3XX:** Redirection response code group.
    # - **4XX:** Client errors response code group.
    # - **5XX:** Server errors response code group.
    # @return [Array<String>]
    attr_reader :expected_response_code_group

    # Enables or disables additional check for predefined text in addition to response code.
    # @return [BOOLEAN]
    attr_accessor :is_response_text_check_enabled

    # Health check will search for the given text in a case-sensitive manner within the response body and will fail if the text is not found.
    # @return [String]
    attr_accessor :expected_response_text

    # Time between health checks of an individual origin server, in seconds.
    # @return [Integer]
    attr_accessor :interval_in_seconds

    # Response timeout represents wait time until request is considered failed, in seconds.
    # @return [Integer]
    attr_accessor :timeout_in_seconds

    # Number of successful health checks after which the server is marked up.
    # @return [Integer]
    attr_accessor :healthy_threshold

    # Number of failed health checks after which the server is marked down.
    # @return [Integer]
    attr_accessor :unhealthy_threshold

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'is_enabled': :'isEnabled',
        'method': :'method',
        'path': :'path',
        'headers': :'headers',
        'expected_response_code_group': :'expectedResponseCodeGroup',
        'is_response_text_check_enabled': :'isResponseTextCheckEnabled',
        'expected_response_text': :'expectedResponseText',
        'interval_in_seconds': :'intervalInSeconds',
        'timeout_in_seconds': :'timeoutInSeconds',
        'healthy_threshold': :'healthyThreshold',
        'unhealthy_threshold': :'unhealthyThreshold'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'is_enabled': :'BOOLEAN',
        'method': :'String',
        'path': :'String',
        'headers': :'Hash<String, String>',
        'expected_response_code_group': :'Array<String>',
        'is_response_text_check_enabled': :'BOOLEAN',
        'expected_response_text': :'String',
        'interval_in_seconds': :'Integer',
        'timeout_in_seconds': :'Integer',
        'healthy_threshold': :'Integer',
        'unhealthy_threshold': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_enabled The value to assign to the {#is_enabled} property
    # @option attributes [String] :method The value to assign to the {#method} property
    # @option attributes [String] :path The value to assign to the {#path} property
    # @option attributes [Hash<String, String>] :headers The value to assign to the {#headers} property
    # @option attributes [Array<String>] :expected_response_code_group The value to assign to the {#expected_response_code_group} property
    # @option attributes [BOOLEAN] :is_response_text_check_enabled The value to assign to the {#is_response_text_check_enabled} property
    # @option attributes [String] :expected_response_text The value to assign to the {#expected_response_text} property
    # @option attributes [Integer] :interval_in_seconds The value to assign to the {#interval_in_seconds} property
    # @option attributes [Integer] :timeout_in_seconds The value to assign to the {#timeout_in_seconds} property
    # @option attributes [Integer] :healthy_threshold The value to assign to the {#healthy_threshold} property
    # @option attributes [Integer] :unhealthy_threshold The value to assign to the {#unhealthy_threshold} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_enabled = attributes[:'isEnabled'] unless attributes[:'isEnabled'].nil?
      self.is_enabled = false if is_enabled.nil? && !attributes.key?(:'isEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isEnabled and :is_enabled' if attributes.key?(:'isEnabled') && attributes.key?(:'is_enabled')

      self.is_enabled = attributes[:'is_enabled'] unless attributes[:'is_enabled'].nil?
      self.is_enabled = false if is_enabled.nil? && !attributes.key?(:'isEnabled') && !attributes.key?(:'is_enabled') # rubocop:disable Style/StringLiterals

      self.method = attributes[:'method'] if attributes[:'method']
      self.method = "HEAD" if method.nil? && !attributes.key?(:'method') # rubocop:disable Style/StringLiterals

      self.path = attributes[:'path'] if attributes[:'path']
      self.path = "/" if path.nil? && !attributes.key?(:'path') # rubocop:disable Style/StringLiterals

      self.headers = attributes[:'headers'] if attributes[:'headers']

      self.expected_response_code_group = attributes[:'expectedResponseCodeGroup'] if attributes[:'expectedResponseCodeGroup']

      raise 'You cannot provide both :expectedResponseCodeGroup and :expected_response_code_group' if attributes.key?(:'expectedResponseCodeGroup') && attributes.key?(:'expected_response_code_group')

      self.expected_response_code_group = attributes[:'expected_response_code_group'] if attributes[:'expected_response_code_group']

      self.is_response_text_check_enabled = attributes[:'isResponseTextCheckEnabled'] unless attributes[:'isResponseTextCheckEnabled'].nil?
      self.is_response_text_check_enabled = false if is_response_text_check_enabled.nil? && !attributes.key?(:'isResponseTextCheckEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isResponseTextCheckEnabled and :is_response_text_check_enabled' if attributes.key?(:'isResponseTextCheckEnabled') && attributes.key?(:'is_response_text_check_enabled')

      self.is_response_text_check_enabled = attributes[:'is_response_text_check_enabled'] unless attributes[:'is_response_text_check_enabled'].nil?
      self.is_response_text_check_enabled = false if is_response_text_check_enabled.nil? && !attributes.key?(:'isResponseTextCheckEnabled') && !attributes.key?(:'is_response_text_check_enabled') # rubocop:disable Style/StringLiterals

      self.expected_response_text = attributes[:'expectedResponseText'] if attributes[:'expectedResponseText']
      self.expected_response_text = "success" if expected_response_text.nil? && !attributes.key?(:'expectedResponseText') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :expectedResponseText and :expected_response_text' if attributes.key?(:'expectedResponseText') && attributes.key?(:'expected_response_text')

      self.expected_response_text = attributes[:'expected_response_text'] if attributes[:'expected_response_text']
      self.expected_response_text = "success" if expected_response_text.nil? && !attributes.key?(:'expectedResponseText') && !attributes.key?(:'expected_response_text') # rubocop:disable Style/StringLiterals

      self.interval_in_seconds = attributes[:'intervalInSeconds'] if attributes[:'intervalInSeconds']

      raise 'You cannot provide both :intervalInSeconds and :interval_in_seconds' if attributes.key?(:'intervalInSeconds') && attributes.key?(:'interval_in_seconds')

      self.interval_in_seconds = attributes[:'interval_in_seconds'] if attributes[:'interval_in_seconds']

      self.timeout_in_seconds = attributes[:'timeoutInSeconds'] if attributes[:'timeoutInSeconds']

      raise 'You cannot provide both :timeoutInSeconds and :timeout_in_seconds' if attributes.key?(:'timeoutInSeconds') && attributes.key?(:'timeout_in_seconds')

      self.timeout_in_seconds = attributes[:'timeout_in_seconds'] if attributes[:'timeout_in_seconds']

      self.healthy_threshold = attributes[:'healthyThreshold'] if attributes[:'healthyThreshold']

      raise 'You cannot provide both :healthyThreshold and :healthy_threshold' if attributes.key?(:'healthyThreshold') && attributes.key?(:'healthy_threshold')

      self.healthy_threshold = attributes[:'healthy_threshold'] if attributes[:'healthy_threshold']

      self.unhealthy_threshold = attributes[:'unhealthyThreshold'] if attributes[:'unhealthyThreshold']

      raise 'You cannot provide both :unhealthyThreshold and :unhealthy_threshold' if attributes.key?(:'unhealthyThreshold') && attributes.key?(:'unhealthy_threshold')

      self.unhealthy_threshold = attributes[:'unhealthy_threshold'] if attributes[:'unhealthy_threshold']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] method Object to be assigned
    def method=(method)
      # rubocop:disable Style/ConditionalAssignment
      if method && !METHOD_ENUM.include?(method)
        OCI.logger.debug("Unknown value for 'method' [" + method + "]. Mapping to 'METHOD_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @method = METHOD_UNKNOWN_ENUM_VALUE
      else
        @method = method
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] expected_response_code_group Object to be assigned
    def expected_response_code_group=(expected_response_code_group)
      # rubocop:disable Style/ConditionalAssignment
      if expected_response_code_group.nil?
        @expected_response_code_group = nil
      else
        @expected_response_code_group =
          expected_response_code_group.collect do |item|
            if EXPECTED_RESPONSE_CODE_GROUP_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'expected_response_code_group' [#{item}]. Mapping to 'EXPECTED_RESPONSE_CODE_GROUP_UNKNOWN_ENUM_VALUE'") if OCI.logger
              EXPECTED_RESPONSE_CODE_GROUP_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        is_enabled == other.is_enabled &&
        method == other.method &&
        path == other.path &&
        headers == other.headers &&
        expected_response_code_group == other.expected_response_code_group &&
        is_response_text_check_enabled == other.is_response_text_check_enabled &&
        expected_response_text == other.expected_response_text &&
        interval_in_seconds == other.interval_in_seconds &&
        timeout_in_seconds == other.timeout_in_seconds &&
        healthy_threshold == other.healthy_threshold &&
        unhealthy_threshold == other.unhealthy_threshold
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
      [is_enabled, method, path, headers, expected_response_code_group, is_response_text_check_enabled, expected_response_text, interval_in_seconds, timeout_in_seconds, healthy_threshold, unhealthy_threshold].hash
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
