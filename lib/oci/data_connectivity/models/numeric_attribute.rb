# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'attribute_profile_result'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A summary of profiling results of a specefic attribute.
  class DataConnectivity::Models::NumericAttribute < DataConnectivity::Models::AttributeProfileResult
    # @return [OCI::DataConnectivity::Models::ProfileStat]
    attr_accessor :mean

    # @return [OCI::DataConnectivity::Models::ProfileStat]
    attr_accessor :median

    # @return [OCI::DataConnectivity::Models::ProfileStat]
    attr_accessor :standard_deviation

    # @return [OCI::DataConnectivity::Models::ProfileStat]
    attr_accessor :variance

    # @return [OCI::DataConnectivity::Models::Outlier]
    attr_accessor :outlier

    # @return [OCI::DataConnectivity::Models::Histogram]
    attr_accessor :histogram

    # Pattern frequencies for the column as described already in profile config.
    # @return [Array<OCI::DataConnectivity::Models::ObjectFreqStat>]
    attr_accessor :pattern_frequencies

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'name': :'name',
        'min': :'min',
        'max': :'max',
        'null_count': :'nullCount',
        'distinct_count': :'distinctCount',
        'unique_count': :'uniqueCount',
        'duplicate_count': :'duplicateCount',
        'value_frequencies': :'valueFrequencies',
        'mean': :'mean',
        'median': :'median',
        'standard_deviation': :'standardDeviation',
        'variance': :'variance',
        'outlier': :'outlier',
        'histogram': :'histogram',
        'pattern_frequencies': :'patternFrequencies'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'Object',
        'name': :'String',
        'min': :'OCI::DataConnectivity::Models::ProfileStat',
        'max': :'OCI::DataConnectivity::Models::ProfileStat',
        'null_count': :'OCI::DataConnectivity::Models::ProfileStat',
        'distinct_count': :'OCI::DataConnectivity::Models::ProfileStat',
        'unique_count': :'OCI::DataConnectivity::Models::ProfileStat',
        'duplicate_count': :'OCI::DataConnectivity::Models::ProfileStat',
        'value_frequencies': :'Array<OCI::DataConnectivity::Models::ObjectFreqStat>',
        'mean': :'OCI::DataConnectivity::Models::ProfileStat',
        'median': :'OCI::DataConnectivity::Models::ProfileStat',
        'standard_deviation': :'OCI::DataConnectivity::Models::ProfileStat',
        'variance': :'OCI::DataConnectivity::Models::ProfileStat',
        'outlier': :'OCI::DataConnectivity::Models::Outlier',
        'histogram': :'OCI::DataConnectivity::Models::Histogram',
        'pattern_frequencies': :'Array<OCI::DataConnectivity::Models::ObjectFreqStat>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {OCI::DataConnectivity::Models::AttributeProfileResult#name #name} proprety
    # @option attributes [OCI::DataConnectivity::Models::ProfileStat] :min The value to assign to the {OCI::DataConnectivity::Models::AttributeProfileResult#min #min} proprety
    # @option attributes [OCI::DataConnectivity::Models::ProfileStat] :max The value to assign to the {OCI::DataConnectivity::Models::AttributeProfileResult#max #max} proprety
    # @option attributes [OCI::DataConnectivity::Models::ProfileStat] :null_count The value to assign to the {OCI::DataConnectivity::Models::AttributeProfileResult#null_count #null_count} proprety
    # @option attributes [OCI::DataConnectivity::Models::ProfileStat] :distinct_count The value to assign to the {OCI::DataConnectivity::Models::AttributeProfileResult#distinct_count #distinct_count} proprety
    # @option attributes [OCI::DataConnectivity::Models::ProfileStat] :unique_count The value to assign to the {OCI::DataConnectivity::Models::AttributeProfileResult#unique_count #unique_count} proprety
    # @option attributes [OCI::DataConnectivity::Models::ProfileStat] :duplicate_count The value to assign to the {OCI::DataConnectivity::Models::AttributeProfileResult#duplicate_count #duplicate_count} proprety
    # @option attributes [Array<OCI::DataConnectivity::Models::ObjectFreqStat>] :value_frequencies The value to assign to the {OCI::DataConnectivity::Models::AttributeProfileResult#value_frequencies #value_frequencies} proprety
    # @option attributes [OCI::DataConnectivity::Models::ProfileStat] :mean The value to assign to the {#mean} property
    # @option attributes [OCI::DataConnectivity::Models::ProfileStat] :median The value to assign to the {#median} property
    # @option attributes [OCI::DataConnectivity::Models::ProfileStat] :standard_deviation The value to assign to the {#standard_deviation} property
    # @option attributes [OCI::DataConnectivity::Models::ProfileStat] :variance The value to assign to the {#variance} property
    # @option attributes [OCI::DataConnectivity::Models::Outlier] :outlier The value to assign to the {#outlier} property
    # @option attributes [OCI::DataConnectivity::Models::Histogram] :histogram The value to assign to the {#histogram} property
    # @option attributes [Array<OCI::DataConnectivity::Models::ObjectFreqStat>] :pattern_frequencies The value to assign to the {#pattern_frequencies} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'NUMERIC'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.mean = attributes[:'mean'] if attributes[:'mean']

      self.median = attributes[:'median'] if attributes[:'median']

      self.standard_deviation = attributes[:'standardDeviation'] if attributes[:'standardDeviation']

      raise 'You cannot provide both :standardDeviation and :standard_deviation' if attributes.key?(:'standardDeviation') && attributes.key?(:'standard_deviation')

      self.standard_deviation = attributes[:'standard_deviation'] if attributes[:'standard_deviation']

      self.variance = attributes[:'variance'] if attributes[:'variance']

      self.outlier = attributes[:'outlier'] if attributes[:'outlier']

      self.histogram = attributes[:'histogram'] if attributes[:'histogram']

      self.pattern_frequencies = attributes[:'patternFrequencies'] if attributes[:'patternFrequencies']

      raise 'You cannot provide both :patternFrequencies and :pattern_frequencies' if attributes.key?(:'patternFrequencies') && attributes.key?(:'pattern_frequencies')

      self.pattern_frequencies = attributes[:'pattern_frequencies'] if attributes[:'pattern_frequencies']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        name == other.name &&
        min == other.min &&
        max == other.max &&
        null_count == other.null_count &&
        distinct_count == other.distinct_count &&
        unique_count == other.unique_count &&
        duplicate_count == other.duplicate_count &&
        value_frequencies == other.value_frequencies &&
        mean == other.mean &&
        median == other.median &&
        standard_deviation == other.standard_deviation &&
        variance == other.variance &&
        outlier == other.outlier &&
        histogram == other.histogram &&
        pattern_frequencies == other.pattern_frequencies
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
      [type, name, min, max, null_count, distinct_count, unique_count, duplicate_count, value_frequencies, mean, median, standard_deviation, variance, outlier, histogram, pattern_frequencies].hash
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
