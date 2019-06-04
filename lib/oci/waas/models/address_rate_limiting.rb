# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The IP rate limiting configuration. Defines the amount of allowed requests from a unique IP address and the resulting block response code when that threshold is exceeded.
  class Waas::Models::AddressRateLimiting
    # **[Required]** Enables or disables the address rate limiting Web Application Firewall feature.
    # @return [BOOLEAN]
    attr_accessor :is_enabled

    # The number of allowed requests per second from one IP address. If unspecified, defaults to `1`.
    # @return [Integer]
    attr_accessor :allowed_rate_per_address

    # The maximum number of requests allowed to be queued before subsequent requests are dropped. If unspecified, defaults to `10`.
    # @return [Integer]
    attr_accessor :max_delayed_count_per_address

    # The response status code returned when a request is blocked. If unspecified, defaults to `503`.
    # @return [Integer]
    attr_accessor :block_response_code

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'is_enabled': :'isEnabled',
        'allowed_rate_per_address': :'allowedRatePerAddress',
        'max_delayed_count_per_address': :'maxDelayedCountPerAddress',
        'block_response_code': :'blockResponseCode'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'is_enabled': :'BOOLEAN',
        'allowed_rate_per_address': :'Integer',
        'max_delayed_count_per_address': :'Integer',
        'block_response_code': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_enabled The value to assign to the {#is_enabled} property
    # @option attributes [Integer] :allowed_rate_per_address The value to assign to the {#allowed_rate_per_address} property
    # @option attributes [Integer] :max_delayed_count_per_address The value to assign to the {#max_delayed_count_per_address} property
    # @option attributes [Integer] :block_response_code The value to assign to the {#block_response_code} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_enabled = attributes[:'isEnabled'] unless attributes[:'isEnabled'].nil?

      raise 'You cannot provide both :isEnabled and :is_enabled' if attributes.key?(:'isEnabled') && attributes.key?(:'is_enabled')

      self.is_enabled = attributes[:'is_enabled'] unless attributes[:'is_enabled'].nil?

      self.allowed_rate_per_address = attributes[:'allowedRatePerAddress'] if attributes[:'allowedRatePerAddress']

      raise 'You cannot provide both :allowedRatePerAddress and :allowed_rate_per_address' if attributes.key?(:'allowedRatePerAddress') && attributes.key?(:'allowed_rate_per_address')

      self.allowed_rate_per_address = attributes[:'allowed_rate_per_address'] if attributes[:'allowed_rate_per_address']

      self.max_delayed_count_per_address = attributes[:'maxDelayedCountPerAddress'] if attributes[:'maxDelayedCountPerAddress']

      raise 'You cannot provide both :maxDelayedCountPerAddress and :max_delayed_count_per_address' if attributes.key?(:'maxDelayedCountPerAddress') && attributes.key?(:'max_delayed_count_per_address')

      self.max_delayed_count_per_address = attributes[:'max_delayed_count_per_address'] if attributes[:'max_delayed_count_per_address']

      self.block_response_code = attributes[:'blockResponseCode'] if attributes[:'blockResponseCode']

      raise 'You cannot provide both :blockResponseCode and :block_response_code' if attributes.key?(:'blockResponseCode') && attributes.key?(:'block_response_code')

      self.block_response_code = attributes[:'block_response_code'] if attributes[:'block_response_code']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        is_enabled == other.is_enabled &&
        allowed_rate_per_address == other.allowed_rate_per_address &&
        max_delayed_count_per_address == other.max_delayed_count_per_address &&
        block_response_code == other.block_response_code
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
      [is_enabled, allowed_rate_per_address, max_delayed_count_per_address, block_response_code].hash
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
