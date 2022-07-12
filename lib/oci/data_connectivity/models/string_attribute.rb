# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'attribute_profile_result'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A summary of profiling results of a specefic attribute.
  class DataConnectivity::Models::StringAttribute < DataConnectivity::Models::AttributeProfileResult
    # @return [OCI::DataConnectivity::Models::ProfileStat]
    attr_accessor :min_length

    # @return [OCI::DataConnectivity::Models::ProfileStat]
    attr_accessor :max_length

    # @return [OCI::DataConnectivity::Models::ProfileStat]
    attr_accessor :mean_length

    # Pattern frequencies for the column as described already in profile config.
    # @return [Array<OCI::DataConnectivity::Models::ObjectFreqStat>]
    attr_accessor :pattern_frequencies

    # Inferred DataType for the column.
    # @return [Array<OCI::DataConnectivity::Models::DataTypeStat>]
    attr_accessor :inferred_data_types

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
        'min_length': :'minLength',
        'max_length': :'maxLength',
        'mean_length': :'meanLength',
        'pattern_frequencies': :'patternFrequencies',
        'inferred_data_types': :'inferredDataTypes'
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
        'min_length': :'OCI::DataConnectivity::Models::ProfileStat',
        'max_length': :'OCI::DataConnectivity::Models::ProfileStat',
        'mean_length': :'OCI::DataConnectivity::Models::ProfileStat',
        'pattern_frequencies': :'Array<OCI::DataConnectivity::Models::ObjectFreqStat>',
        'inferred_data_types': :'Array<OCI::DataConnectivity::Models::DataTypeStat>'
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
    # @option attributes [OCI::DataConnectivity::Models::ProfileStat] :min_length The value to assign to the {#min_length} property
    # @option attributes [OCI::DataConnectivity::Models::ProfileStat] :max_length The value to assign to the {#max_length} property
    # @option attributes [OCI::DataConnectivity::Models::ProfileStat] :mean_length The value to assign to the {#mean_length} property
    # @option attributes [Array<OCI::DataConnectivity::Models::ObjectFreqStat>] :pattern_frequencies The value to assign to the {#pattern_frequencies} property
    # @option attributes [Array<OCI::DataConnectivity::Models::DataTypeStat>] :inferred_data_types The value to assign to the {#inferred_data_types} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'STRING'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.min_length = attributes[:'minLength'] if attributes[:'minLength']

      raise 'You cannot provide both :minLength and :min_length' if attributes.key?(:'minLength') && attributes.key?(:'min_length')

      self.min_length = attributes[:'min_length'] if attributes[:'min_length']

      self.max_length = attributes[:'maxLength'] if attributes[:'maxLength']

      raise 'You cannot provide both :maxLength and :max_length' if attributes.key?(:'maxLength') && attributes.key?(:'max_length')

      self.max_length = attributes[:'max_length'] if attributes[:'max_length']

      self.mean_length = attributes[:'meanLength'] if attributes[:'meanLength']

      raise 'You cannot provide both :meanLength and :mean_length' if attributes.key?(:'meanLength') && attributes.key?(:'mean_length')

      self.mean_length = attributes[:'mean_length'] if attributes[:'mean_length']

      self.pattern_frequencies = attributes[:'patternFrequencies'] if attributes[:'patternFrequencies']

      raise 'You cannot provide both :patternFrequencies and :pattern_frequencies' if attributes.key?(:'patternFrequencies') && attributes.key?(:'pattern_frequencies')

      self.pattern_frequencies = attributes[:'pattern_frequencies'] if attributes[:'pattern_frequencies']

      self.inferred_data_types = attributes[:'inferredDataTypes'] if attributes[:'inferredDataTypes']

      raise 'You cannot provide both :inferredDataTypes and :inferred_data_types' if attributes.key?(:'inferredDataTypes') && attributes.key?(:'inferred_data_types')

      self.inferred_data_types = attributes[:'inferred_data_types'] if attributes[:'inferred_data_types']
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
        min_length == other.min_length &&
        max_length == other.max_length &&
        mean_length == other.mean_length &&
        pattern_frequencies == other.pattern_frequencies &&
        inferred_data_types == other.inferred_data_types
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
      [type, name, min, max, null_count, distinct_count, unique_count, duplicate_count, value_frequencies, min_length, max_length, mean_length, pattern_frequencies, inferred_data_types].hash
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
