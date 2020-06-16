# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Enable CORS (Cross-Origin-Resource-Sharing) request handling.
  #
  class Apigateway::Models::CorsPolicy
    # **[Required]** The list of allowed origins that the CORS handler will use to respond to CORS requests. The gateway will
    # send the Access-Control-Allow-Origin header with the best origin match for the circumstances. '*' will match
    # any origins, and 'null' will match queries from 'file:' origins. All other origins must be qualified with the
    # scheme, full hostname, and port if necessary.
    #
    # @return [Array<String>]
    attr_accessor :allowed_origins

    # The list of allowed HTTP methods that will be returned for the preflight OPTIONS request in the
    # Access-Control-Allow-Methods header. '*' will allow all methods.
    #
    # @return [Array<String>]
    attr_accessor :allowed_methods

    # The list of headers that will be allowed from the client via the Access-Control-Allow-Headers header.
    # '*' will allow all headers.
    #
    # @return [Array<String>]
    attr_accessor :allowed_headers

    # The list of headers that the client will be allowed to see from the response as indicated by the
    # Access-Control-Expose-Headers header. '*' will expose all headers.
    #
    # @return [Array<String>]
    attr_accessor :exposed_headers

    # Whether to send the Access-Control-Allow-Credentials header to allow CORS requests with cookies.
    #
    # @return [BOOLEAN]
    attr_accessor :is_allow_credentials_enabled

    # The time in seconds for the client to cache preflight responses. This is sent as the Access-Control-Max-Age
    # if greater than 0.
    #
    # @return [Integer]
    attr_accessor :max_age_in_seconds

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'allowed_origins': :'allowedOrigins',
        'allowed_methods': :'allowedMethods',
        'allowed_headers': :'allowedHeaders',
        'exposed_headers': :'exposedHeaders',
        'is_allow_credentials_enabled': :'isAllowCredentialsEnabled',
        'max_age_in_seconds': :'maxAgeInSeconds'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'allowed_origins': :'Array<String>',
        'allowed_methods': :'Array<String>',
        'allowed_headers': :'Array<String>',
        'exposed_headers': :'Array<String>',
        'is_allow_credentials_enabled': :'BOOLEAN',
        'max_age_in_seconds': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<String>] :allowed_origins The value to assign to the {#allowed_origins} property
    # @option attributes [Array<String>] :allowed_methods The value to assign to the {#allowed_methods} property
    # @option attributes [Array<String>] :allowed_headers The value to assign to the {#allowed_headers} property
    # @option attributes [Array<String>] :exposed_headers The value to assign to the {#exposed_headers} property
    # @option attributes [BOOLEAN] :is_allow_credentials_enabled The value to assign to the {#is_allow_credentials_enabled} property
    # @option attributes [Integer] :max_age_in_seconds The value to assign to the {#max_age_in_seconds} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.allowed_origins = attributes[:'allowedOrigins'] if attributes[:'allowedOrigins']

      raise 'You cannot provide both :allowedOrigins and :allowed_origins' if attributes.key?(:'allowedOrigins') && attributes.key?(:'allowed_origins')

      self.allowed_origins = attributes[:'allowed_origins'] if attributes[:'allowed_origins']

      self.allowed_methods = attributes[:'allowedMethods'] if attributes[:'allowedMethods']

      raise 'You cannot provide both :allowedMethods and :allowed_methods' if attributes.key?(:'allowedMethods') && attributes.key?(:'allowed_methods')

      self.allowed_methods = attributes[:'allowed_methods'] if attributes[:'allowed_methods']

      self.allowed_headers = attributes[:'allowedHeaders'] if attributes[:'allowedHeaders']

      raise 'You cannot provide both :allowedHeaders and :allowed_headers' if attributes.key?(:'allowedHeaders') && attributes.key?(:'allowed_headers')

      self.allowed_headers = attributes[:'allowed_headers'] if attributes[:'allowed_headers']

      self.exposed_headers = attributes[:'exposedHeaders'] if attributes[:'exposedHeaders']

      raise 'You cannot provide both :exposedHeaders and :exposed_headers' if attributes.key?(:'exposedHeaders') && attributes.key?(:'exposed_headers')

      self.exposed_headers = attributes[:'exposed_headers'] if attributes[:'exposed_headers']

      self.is_allow_credentials_enabled = attributes[:'isAllowCredentialsEnabled'] unless attributes[:'isAllowCredentialsEnabled'].nil?
      self.is_allow_credentials_enabled = false if is_allow_credentials_enabled.nil? && !attributes.key?(:'isAllowCredentialsEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isAllowCredentialsEnabled and :is_allow_credentials_enabled' if attributes.key?(:'isAllowCredentialsEnabled') && attributes.key?(:'is_allow_credentials_enabled')

      self.is_allow_credentials_enabled = attributes[:'is_allow_credentials_enabled'] unless attributes[:'is_allow_credentials_enabled'].nil?
      self.is_allow_credentials_enabled = false if is_allow_credentials_enabled.nil? && !attributes.key?(:'isAllowCredentialsEnabled') && !attributes.key?(:'is_allow_credentials_enabled') # rubocop:disable Style/StringLiterals

      self.max_age_in_seconds = attributes[:'maxAgeInSeconds'] if attributes[:'maxAgeInSeconds']

      raise 'You cannot provide both :maxAgeInSeconds and :max_age_in_seconds' if attributes.key?(:'maxAgeInSeconds') && attributes.key?(:'max_age_in_seconds')

      self.max_age_in_seconds = attributes[:'max_age_in_seconds'] if attributes[:'max_age_in_seconds']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        allowed_origins == other.allowed_origins &&
        allowed_methods == other.allowed_methods &&
        allowed_headers == other.allowed_headers &&
        exposed_headers == other.exposed_headers &&
        is_allow_credentials_enabled == other.is_allow_credentials_enabled &&
        max_age_in_seconds == other.max_age_in_seconds
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
      [allowed_origins, allowed_methods, allowed_headers, exposed_headers, is_allow_credentials_enabled, max_age_in_seconds].hash
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
