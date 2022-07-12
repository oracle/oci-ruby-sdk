# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Collection of Resource risk scores
  class CloudGuard::Models::ResourceRiskScoreAggregationCollection
    # **[Required]** Type of filter. Valid Values - problem_id and resource_id
    # @return [String]
    attr_accessor :filter_type

    # **[Required]** Id value on which risk scores are filtered
    # @return [String]
    attr_accessor :filter_id

    # Risk Score
    # @return [Integer]
    attr_accessor :risk_threshold

    # **[Required]** List of ResourceRiskScoreAggregation
    # @return [Array<OCI::CloudGuard::Models::ResourceRiskScoreAggregation>]
    attr_accessor :items

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'filter_type': :'filterType',
        'filter_id': :'filterId',
        'risk_threshold': :'riskThreshold',
        'items': :'items'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'filter_type': :'String',
        'filter_id': :'String',
        'risk_threshold': :'Integer',
        'items': :'Array<OCI::CloudGuard::Models::ResourceRiskScoreAggregation>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :filter_type The value to assign to the {#filter_type} property
    # @option attributes [String] :filter_id The value to assign to the {#filter_id} property
    # @option attributes [Integer] :risk_threshold The value to assign to the {#risk_threshold} property
    # @option attributes [Array<OCI::CloudGuard::Models::ResourceRiskScoreAggregation>] :items The value to assign to the {#items} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.filter_type = attributes[:'filterType'] if attributes[:'filterType']

      raise 'You cannot provide both :filterType and :filter_type' if attributes.key?(:'filterType') && attributes.key?(:'filter_type')

      self.filter_type = attributes[:'filter_type'] if attributes[:'filter_type']

      self.filter_id = attributes[:'filterId'] if attributes[:'filterId']

      raise 'You cannot provide both :filterId and :filter_id' if attributes.key?(:'filterId') && attributes.key?(:'filter_id')

      self.filter_id = attributes[:'filter_id'] if attributes[:'filter_id']

      self.risk_threshold = attributes[:'riskThreshold'] if attributes[:'riskThreshold']

      raise 'You cannot provide both :riskThreshold and :risk_threshold' if attributes.key?(:'riskThreshold') && attributes.key?(:'risk_threshold')

      self.risk_threshold = attributes[:'risk_threshold'] if attributes[:'risk_threshold']

      self.items = attributes[:'items'] if attributes[:'items']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        filter_type == other.filter_type &&
        filter_id == other.filter_id &&
        risk_threshold == other.risk_threshold &&
        items == other.items
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
      [filter_type, filter_id, risk_threshold, items].hash
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