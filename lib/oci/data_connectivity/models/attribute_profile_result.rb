# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A summary of profiling results of a specefic attribute.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class DataConnectivity::Models::AttributeProfileResult
    # Type of attribute
    # @return [Object]
    attr_accessor :type

    # Name of attribute
    # @return [String]
    attr_accessor :name

    # @return [OCI::DataConnectivity::Models::ProfileStat]
    attr_accessor :min

    # @return [OCI::DataConnectivity::Models::ProfileStat]
    attr_accessor :max

    # @return [OCI::DataConnectivity::Models::ProfileStat]
    attr_accessor :null_count

    # @return [OCI::DataConnectivity::Models::ProfileStat]
    attr_accessor :distinct_count

    # @return [OCI::DataConnectivity::Models::ProfileStat]
    attr_accessor :unique_count

    # @return [OCI::DataConnectivity::Models::ProfileStat]
    attr_accessor :duplicate_count

    # Top N value frequencies for the column as described already in profile config topNValueFrequency property.
    # @return [Array<OCI::DataConnectivity::Models::ObjectFreqStat>]
    attr_accessor :value_frequencies

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
        'value_frequencies': :'valueFrequencies'
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
        'value_frequencies': :'Array<OCI::DataConnectivity::Models::ObjectFreqStat>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'type'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::DataConnectivity::Models::StringAttribute' if type == 'STRING'
      return 'OCI::DataConnectivity::Models::NumericAttribute' if type == 'NUMERIC'
      return 'OCI::DataConnectivity::Models::DateAttribute' if type == 'DATE_TIME'

      # TODO: Log a warning when the subtype is not found.
      'OCI::DataConnectivity::Models::AttributeProfileResult'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Object] :type The value to assign to the {#type} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [OCI::DataConnectivity::Models::ProfileStat] :min The value to assign to the {#min} property
    # @option attributes [OCI::DataConnectivity::Models::ProfileStat] :max The value to assign to the {#max} property
    # @option attributes [OCI::DataConnectivity::Models::ProfileStat] :null_count The value to assign to the {#null_count} property
    # @option attributes [OCI::DataConnectivity::Models::ProfileStat] :distinct_count The value to assign to the {#distinct_count} property
    # @option attributes [OCI::DataConnectivity::Models::ProfileStat] :unique_count The value to assign to the {#unique_count} property
    # @option attributes [OCI::DataConnectivity::Models::ProfileStat] :duplicate_count The value to assign to the {#duplicate_count} property
    # @option attributes [Array<OCI::DataConnectivity::Models::ObjectFreqStat>] :value_frequencies The value to assign to the {#value_frequencies} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.type = attributes[:'type'] if attributes[:'type']

      self.name = attributes[:'name'] if attributes[:'name']

      self.min = attributes[:'min'] if attributes[:'min']

      self.max = attributes[:'max'] if attributes[:'max']

      self.null_count = attributes[:'nullCount'] if attributes[:'nullCount']

      raise 'You cannot provide both :nullCount and :null_count' if attributes.key?(:'nullCount') && attributes.key?(:'null_count')

      self.null_count = attributes[:'null_count'] if attributes[:'null_count']

      self.distinct_count = attributes[:'distinctCount'] if attributes[:'distinctCount']

      raise 'You cannot provide both :distinctCount and :distinct_count' if attributes.key?(:'distinctCount') && attributes.key?(:'distinct_count')

      self.distinct_count = attributes[:'distinct_count'] if attributes[:'distinct_count']

      self.unique_count = attributes[:'uniqueCount'] if attributes[:'uniqueCount']

      raise 'You cannot provide both :uniqueCount and :unique_count' if attributes.key?(:'uniqueCount') && attributes.key?(:'unique_count')

      self.unique_count = attributes[:'unique_count'] if attributes[:'unique_count']

      self.duplicate_count = attributes[:'duplicateCount'] if attributes[:'duplicateCount']

      raise 'You cannot provide both :duplicateCount and :duplicate_count' if attributes.key?(:'duplicateCount') && attributes.key?(:'duplicate_count')

      self.duplicate_count = attributes[:'duplicate_count'] if attributes[:'duplicate_count']

      self.value_frequencies = attributes[:'valueFrequencies'] if attributes[:'valueFrequencies']

      raise 'You cannot provide both :valueFrequencies and :value_frequencies' if attributes.key?(:'valueFrequencies') && attributes.key?(:'value_frequencies')

      self.value_frequencies = attributes[:'value_frequencies'] if attributes[:'value_frequencies']
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
        value_frequencies == other.value_frequencies
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
      [type, name, min, max, null_count, distinct_count, unique_count, duplicate_count, value_frequencies].hash
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
