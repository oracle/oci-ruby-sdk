# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The availability of a given resource limit, based on the usage, tenant service limits and quotas set for the tenancy.
  # Note: We cannot guarantee this data for all the limits. In those cases, these fields will be empty.
  #
  class Limits::Models::ResourceAvailability
    # The current usage in the given compartment. Because we have introduced resources with fractional counts,
    # the field will round up to the nearest integer.
    #
    # @return [Integer]
    attr_accessor :used

    # The count of available resources. Because we have introduced resources with fractional counts,
    # the field will round down to the nearest integer.
    #
    # @return [Integer]
    attr_accessor :available

    # The current most accurate usage in the given compartment.
    #
    # @return [Float]
    attr_accessor :fractional_usage

    # The most accurate count of available resources.
    #
    # @return [Float]
    attr_accessor :fractional_availability

    # The effective quota value for given compartment. This field is only present if there is a
    # current quota policy affecting the current resource in the target region or availability domain.
    #
    # @return [Float]
    attr_accessor :effective_quota_value

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'used': :'used',
        'available': :'available',
        'fractional_usage': :'fractionalUsage',
        'fractional_availability': :'fractionalAvailability',
        'effective_quota_value': :'effectiveQuotaValue'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'used': :'Integer',
        'available': :'Integer',
        'fractional_usage': :'Float',
        'fractional_availability': :'Float',
        'effective_quota_value': :'Float'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :used The value to assign to the {#used} property
    # @option attributes [Integer] :available The value to assign to the {#available} property
    # @option attributes [Float] :fractional_usage The value to assign to the {#fractional_usage} property
    # @option attributes [Float] :fractional_availability The value to assign to the {#fractional_availability} property
    # @option attributes [Float] :effective_quota_value The value to assign to the {#effective_quota_value} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.used = attributes[:'used'] if attributes[:'used']

      self.available = attributes[:'available'] if attributes[:'available']

      self.fractional_usage = attributes[:'fractionalUsage'] if attributes[:'fractionalUsage']

      raise 'You cannot provide both :fractionalUsage and :fractional_usage' if attributes.key?(:'fractionalUsage') && attributes.key?(:'fractional_usage')

      self.fractional_usage = attributes[:'fractional_usage'] if attributes[:'fractional_usage']

      self.fractional_availability = attributes[:'fractionalAvailability'] if attributes[:'fractionalAvailability']

      raise 'You cannot provide both :fractionalAvailability and :fractional_availability' if attributes.key?(:'fractionalAvailability') && attributes.key?(:'fractional_availability')

      self.fractional_availability = attributes[:'fractional_availability'] if attributes[:'fractional_availability']

      self.effective_quota_value = attributes[:'effectiveQuotaValue'] if attributes[:'effectiveQuotaValue']

      raise 'You cannot provide both :effectiveQuotaValue and :effective_quota_value' if attributes.key?(:'effectiveQuotaValue') && attributes.key?(:'effective_quota_value')

      self.effective_quota_value = attributes[:'effective_quota_value'] if attributes[:'effective_quota_value']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        used == other.used &&
        available == other.available &&
        fractional_usage == other.fractional_usage &&
        fractional_availability == other.fractional_availability &&
        effective_quota_value == other.effective_quota_value
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
      [used, available, fractional_usage, fractional_availability, effective_quota_value].hash
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
