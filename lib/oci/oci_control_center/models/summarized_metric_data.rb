# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20230515
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The recorded metric value at a specific timestamp.
  #
  class OciControlCenter::Models::SummarizedMetricData
    # The time at which the metric data was recorded.
    #
    # @return [DateTime]
    attr_accessor :sample_time

    # The duration over which the metric data is aggregated. Supported values: `1m`-`60m`, `1h`-`24h`, `1d`.
    #
    # @return [String]
    attr_accessor :resolution

    # Qualifiers provided in the definition of the returned metric. Available dimensions vary by metric namespace.
    #
    # @return [Hash<String, OCI::OciControlCenter::Models::DimensionValue>]
    attr_accessor :dimensions

    # The aggregation method used for aggregating the metric values.  The aggregation method depends on the metric itself.
    #
    # @return [String]
    attr_accessor :aggregation_method

    # The aggregated metric value for the specified request.
    #
    # @return [Float]
    attr_accessor :aggregated_value

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'sample_time': :'sampleTime',
        'resolution': :'resolution',
        'dimensions': :'dimensions',
        'aggregation_method': :'aggregationMethod',
        'aggregated_value': :'aggregatedValue'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'sample_time': :'DateTime',
        'resolution': :'String',
        'dimensions': :'Hash<String, OCI::OciControlCenter::Models::DimensionValue>',
        'aggregation_method': :'String',
        'aggregated_value': :'Float'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :sample_time The value to assign to the {#sample_time} property
    # @option attributes [String] :resolution The value to assign to the {#resolution} property
    # @option attributes [Hash<String, OCI::OciControlCenter::Models::DimensionValue>] :dimensions The value to assign to the {#dimensions} property
    # @option attributes [String] :aggregation_method The value to assign to the {#aggregation_method} property
    # @option attributes [Float] :aggregated_value The value to assign to the {#aggregated_value} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.sample_time = attributes[:'sampleTime'] if attributes[:'sampleTime']

      raise 'You cannot provide both :sampleTime and :sample_time' if attributes.key?(:'sampleTime') && attributes.key?(:'sample_time')

      self.sample_time = attributes[:'sample_time'] if attributes[:'sample_time']

      self.resolution = attributes[:'resolution'] if attributes[:'resolution']

      self.dimensions = attributes[:'dimensions'] if attributes[:'dimensions']

      self.aggregation_method = attributes[:'aggregationMethod'] if attributes[:'aggregationMethod']

      raise 'You cannot provide both :aggregationMethod and :aggregation_method' if attributes.key?(:'aggregationMethod') && attributes.key?(:'aggregation_method')

      self.aggregation_method = attributes[:'aggregation_method'] if attributes[:'aggregation_method']

      self.aggregated_value = attributes[:'aggregatedValue'] if attributes[:'aggregatedValue']

      raise 'You cannot provide both :aggregatedValue and :aggregated_value' if attributes.key?(:'aggregatedValue') && attributes.key?(:'aggregated_value')

      self.aggregated_value = attributes[:'aggregated_value'] if attributes[:'aggregated_value']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        sample_time == other.sample_time &&
        resolution == other.resolution &&
        dimensions == other.dimensions &&
        aggregation_method == other.aggregation_method &&
        aggregated_value == other.aggregated_value
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
      [sample_time, resolution, dimensions, aggregation_method, aggregated_value].hash
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
