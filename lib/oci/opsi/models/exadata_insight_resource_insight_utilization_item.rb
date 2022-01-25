# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Object containing current utilization, projected utilization, id and daysToReach high and low utilization value.
  class Opsi::Models::ExadataInsightResourceInsightUtilizationItem
    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the Exadata insight.
    # @return [String]
    attr_accessor :exadata_insight_id

    # **[Required]** Current utilization
    # @return [Float]
    attr_accessor :current_utilization

    # **[Required]** Projected utilization
    # @return [Float]
    attr_accessor :projected_utilization

    # **[Required]** Days to reach projected high utilization
    # @return [Integer]
    attr_accessor :days_to_reach_high_utilization

    # **[Required]** Days to reach projected low utilization
    # @return [Integer]
    attr_accessor :days_to_reach_low_utilization

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'exadata_insight_id': :'exadataInsightId',
        'current_utilization': :'currentUtilization',
        'projected_utilization': :'projectedUtilization',
        'days_to_reach_high_utilization': :'daysToReachHighUtilization',
        'days_to_reach_low_utilization': :'daysToReachLowUtilization'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'exadata_insight_id': :'String',
        'current_utilization': :'Float',
        'projected_utilization': :'Float',
        'days_to_reach_high_utilization': :'Integer',
        'days_to_reach_low_utilization': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :exadata_insight_id The value to assign to the {#exadata_insight_id} property
    # @option attributes [Float] :current_utilization The value to assign to the {#current_utilization} property
    # @option attributes [Float] :projected_utilization The value to assign to the {#projected_utilization} property
    # @option attributes [Integer] :days_to_reach_high_utilization The value to assign to the {#days_to_reach_high_utilization} property
    # @option attributes [Integer] :days_to_reach_low_utilization The value to assign to the {#days_to_reach_low_utilization} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.exadata_insight_id = attributes[:'exadataInsightId'] if attributes[:'exadataInsightId']

      raise 'You cannot provide both :exadataInsightId and :exadata_insight_id' if attributes.key?(:'exadataInsightId') && attributes.key?(:'exadata_insight_id')

      self.exadata_insight_id = attributes[:'exadata_insight_id'] if attributes[:'exadata_insight_id']

      self.current_utilization = attributes[:'currentUtilization'] if attributes[:'currentUtilization']

      raise 'You cannot provide both :currentUtilization and :current_utilization' if attributes.key?(:'currentUtilization') && attributes.key?(:'current_utilization')

      self.current_utilization = attributes[:'current_utilization'] if attributes[:'current_utilization']

      self.projected_utilization = attributes[:'projectedUtilization'] if attributes[:'projectedUtilization']

      raise 'You cannot provide both :projectedUtilization and :projected_utilization' if attributes.key?(:'projectedUtilization') && attributes.key?(:'projected_utilization')

      self.projected_utilization = attributes[:'projected_utilization'] if attributes[:'projected_utilization']

      self.days_to_reach_high_utilization = attributes[:'daysToReachHighUtilization'] if attributes[:'daysToReachHighUtilization']

      raise 'You cannot provide both :daysToReachHighUtilization and :days_to_reach_high_utilization' if attributes.key?(:'daysToReachHighUtilization') && attributes.key?(:'days_to_reach_high_utilization')

      self.days_to_reach_high_utilization = attributes[:'days_to_reach_high_utilization'] if attributes[:'days_to_reach_high_utilization']

      self.days_to_reach_low_utilization = attributes[:'daysToReachLowUtilization'] if attributes[:'daysToReachLowUtilization']

      raise 'You cannot provide both :daysToReachLowUtilization and :days_to_reach_low_utilization' if attributes.key?(:'daysToReachLowUtilization') && attributes.key?(:'days_to_reach_low_utilization')

      self.days_to_reach_low_utilization = attributes[:'days_to_reach_low_utilization'] if attributes[:'days_to_reach_low_utilization']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        exadata_insight_id == other.exadata_insight_id &&
        current_utilization == other.current_utilization &&
        projected_utilization == other.projected_utilization &&
        days_to_reach_high_utilization == other.days_to_reach_high_utilization &&
        days_to_reach_low_utilization == other.days_to_reach_low_utilization
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
      [exadata_insight_id, current_utilization, projected_utilization, days_to_reach_high_utilization, days_to_reach_low_utilization].hash
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
