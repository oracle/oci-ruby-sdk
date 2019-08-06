# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The backoff retry portion of the subscription delivery policy.
  #
  class Ons::Models::BackoffRetryPolicy
    POLICY_TYPE_ENUM = [
      POLICY_TYPE_EXPONENTIAL = 'EXPONENTIAL'.freeze,
      POLICY_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The maximum retry duration in milliseconds. Default value is `7200000` (2 hours).
    # @return [Integer]
    attr_accessor :max_retry_duration

    # **[Required]** The type of delivery policy.
    #
    # @return [String]
    attr_reader :policy_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'max_retry_duration': :'maxRetryDuration',
        'policy_type': :'policyType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'max_retry_duration': :'Integer',
        'policy_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :max_retry_duration The value to assign to the {#max_retry_duration} property
    # @option attributes [String] :policy_type The value to assign to the {#policy_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.max_retry_duration = attributes[:'maxRetryDuration'] if attributes[:'maxRetryDuration']

      raise 'You cannot provide both :maxRetryDuration and :max_retry_duration' if attributes.key?(:'maxRetryDuration') && attributes.key?(:'max_retry_duration')

      self.max_retry_duration = attributes[:'max_retry_duration'] if attributes[:'max_retry_duration']

      self.policy_type = attributes[:'policyType'] if attributes[:'policyType']
      self.policy_type = "EXPONENTIAL" if policy_type.nil? && !attributes.key?(:'policyType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :policyType and :policy_type' if attributes.key?(:'policyType') && attributes.key?(:'policy_type')

      self.policy_type = attributes[:'policy_type'] if attributes[:'policy_type']
      self.policy_type = "EXPONENTIAL" if policy_type.nil? && !attributes.key?(:'policyType') && !attributes.key?(:'policy_type') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] policy_type Object to be assigned
    def policy_type=(policy_type)
      # rubocop:disable Style/ConditionalAssignment
      if policy_type && !POLICY_TYPE_ENUM.include?(policy_type)
        OCI.logger.debug("Unknown value for 'policy_type' [" + policy_type + "]. Mapping to 'POLICY_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @policy_type = POLICY_TYPE_UNKNOWN_ENUM_VALUE
      else
        @policy_type = policy_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        max_retry_duration == other.max_retry_duration &&
        policy_type == other.policy_type
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
      [max_retry_duration, policy_type].hash
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
