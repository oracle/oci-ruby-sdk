# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Settings for protection capabilities
  #
  class Waf::Models::ProtectionCapabilitySettings
    # Maximum number of arguments allowed. Used in protection capability 920380: Number of Arguments Limits.
    #
    # @return [Integer]
    attr_accessor :max_number_of_arguments

    # Maximum allowed length of a single argument. Used in protection capability 920370: Limit argument value length.
    #
    # @return [Integer]
    attr_accessor :max_single_argument_length

    # Maximum allowed total length of all arguments. Used in protection capability 920390: Limit arguments total length.
    #
    # @return [Integer]
    attr_accessor :max_total_argument_length

    # Maximum number of headers allowed in an HTTP request. Used in protection capability 9200014: Limit Number of Request Headers.
    #
    # @return [Integer]
    attr_accessor :max_http_request_headers

    # Maximum allowed length of headers in an HTTP request. Used in protection capability: 9200024: Limit length of request header size.
    #
    # @return [Integer]
    attr_accessor :max_http_request_header_length

    # List of allowed HTTP methods. Each value as a RFC7230 formated token string.
    # Used in protection capability 911100: Restrict HTTP Request Methods.
    #
    # @return [Array<String>]
    attr_accessor :allowed_http_methods

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'max_number_of_arguments': :'maxNumberOfArguments',
        'max_single_argument_length': :'maxSingleArgumentLength',
        'max_total_argument_length': :'maxTotalArgumentLength',
        'max_http_request_headers': :'maxHttpRequestHeaders',
        'max_http_request_header_length': :'maxHttpRequestHeaderLength',
        'allowed_http_methods': :'allowedHttpMethods'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'max_number_of_arguments': :'Integer',
        'max_single_argument_length': :'Integer',
        'max_total_argument_length': :'Integer',
        'max_http_request_headers': :'Integer',
        'max_http_request_header_length': :'Integer',
        'allowed_http_methods': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :max_number_of_arguments The value to assign to the {#max_number_of_arguments} property
    # @option attributes [Integer] :max_single_argument_length The value to assign to the {#max_single_argument_length} property
    # @option attributes [Integer] :max_total_argument_length The value to assign to the {#max_total_argument_length} property
    # @option attributes [Integer] :max_http_request_headers The value to assign to the {#max_http_request_headers} property
    # @option attributes [Integer] :max_http_request_header_length The value to assign to the {#max_http_request_header_length} property
    # @option attributes [Array<String>] :allowed_http_methods The value to assign to the {#allowed_http_methods} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.max_number_of_arguments = attributes[:'maxNumberOfArguments'] if attributes[:'maxNumberOfArguments']

      raise 'You cannot provide both :maxNumberOfArguments and :max_number_of_arguments' if attributes.key?(:'maxNumberOfArguments') && attributes.key?(:'max_number_of_arguments')

      self.max_number_of_arguments = attributes[:'max_number_of_arguments'] if attributes[:'max_number_of_arguments']

      self.max_single_argument_length = attributes[:'maxSingleArgumentLength'] if attributes[:'maxSingleArgumentLength']

      raise 'You cannot provide both :maxSingleArgumentLength and :max_single_argument_length' if attributes.key?(:'maxSingleArgumentLength') && attributes.key?(:'max_single_argument_length')

      self.max_single_argument_length = attributes[:'max_single_argument_length'] if attributes[:'max_single_argument_length']

      self.max_total_argument_length = attributes[:'maxTotalArgumentLength'] if attributes[:'maxTotalArgumentLength']

      raise 'You cannot provide both :maxTotalArgumentLength and :max_total_argument_length' if attributes.key?(:'maxTotalArgumentLength') && attributes.key?(:'max_total_argument_length')

      self.max_total_argument_length = attributes[:'max_total_argument_length'] if attributes[:'max_total_argument_length']

      self.max_http_request_headers = attributes[:'maxHttpRequestHeaders'] if attributes[:'maxHttpRequestHeaders']

      raise 'You cannot provide both :maxHttpRequestHeaders and :max_http_request_headers' if attributes.key?(:'maxHttpRequestHeaders') && attributes.key?(:'max_http_request_headers')

      self.max_http_request_headers = attributes[:'max_http_request_headers'] if attributes[:'max_http_request_headers']

      self.max_http_request_header_length = attributes[:'maxHttpRequestHeaderLength'] if attributes[:'maxHttpRequestHeaderLength']

      raise 'You cannot provide both :maxHttpRequestHeaderLength and :max_http_request_header_length' if attributes.key?(:'maxHttpRequestHeaderLength') && attributes.key?(:'max_http_request_header_length')

      self.max_http_request_header_length = attributes[:'max_http_request_header_length'] if attributes[:'max_http_request_header_length']

      self.allowed_http_methods = attributes[:'allowedHttpMethods'] if attributes[:'allowedHttpMethods']

      raise 'You cannot provide both :allowedHttpMethods and :allowed_http_methods' if attributes.key?(:'allowedHttpMethods') && attributes.key?(:'allowed_http_methods')

      self.allowed_http_methods = attributes[:'allowed_http_methods'] if attributes[:'allowed_http_methods']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        max_number_of_arguments == other.max_number_of_arguments &&
        max_single_argument_length == other.max_single_argument_length &&
        max_total_argument_length == other.max_total_argument_length &&
        max_http_request_headers == other.max_http_request_headers &&
        max_http_request_header_length == other.max_http_request_header_length &&
        allowed_http_methods == other.allowed_http_methods
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
      [max_number_of_arguments, max_single_argument_length, max_total_argument_length, max_http_request_headers, max_http_request_header_length, allowed_http_methods].hash
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
