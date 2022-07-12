# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Unit details of a data object column.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Opsi::Models::DataObjectColumnUnit
    UNIT_CATEGORY_ENUM = [
      UNIT_CATEGORY_DATA_SIZE = 'DATA_SIZE'.freeze,
      UNIT_CATEGORY_TIME = 'TIME'.freeze,
      UNIT_CATEGORY_POWER = 'POWER'.freeze,
      UNIT_CATEGORY_TEMPERATURE = 'TEMPERATURE'.freeze,
      UNIT_CATEGORY_CORE = 'CORE'.freeze,
      UNIT_CATEGORY_RATE = 'RATE'.freeze,
      UNIT_CATEGORY_FREQUENCY = 'FREQUENCY'.freeze,
      UNIT_CATEGORY_OTHER_STANDARD = 'OTHER_STANDARD'.freeze,
      UNIT_CATEGORY_CUSTOM = 'CUSTOM'.freeze,
      UNIT_CATEGORY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Category of the column's unit.
    # @return [String]
    attr_reader :unit_category

    # Display name of the column's unit.
    # @return [String]
    attr_accessor :display_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'unit_category': :'unitCategory',
        'display_name': :'displayName'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'unit_category': :'String',
        'display_name': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'unitCategory'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Opsi::Models::DataObjectCoreColumnUnit' if type == 'CORE'
      return 'OCI::Opsi::Models::DataObjectTimeColumnUnit' if type == 'TIME'
      return 'OCI::Opsi::Models::DataObjectOtherStandardColumnUnit' if type == 'OTHER_STANDARD'
      return 'OCI::Opsi::Models::DataObjectCustomColumnUnit' if type == 'CUSTOM'
      return 'OCI::Opsi::Models::DataObjectTemperatureColumnUnit' if type == 'TEMPERATURE'
      return 'OCI::Opsi::Models::DataObjectPowerColumnUnit' if type == 'POWER'
      return 'OCI::Opsi::Models::DataObjectRateColumnUnit' if type == 'RATE'
      return 'OCI::Opsi::Models::DataObjectFrequencyColumnUnit' if type == 'FREQUENCY'
      return 'OCI::Opsi::Models::DataObjectDataSizeColumnUnit' if type == 'DATA_SIZE'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Opsi::Models::DataObjectColumnUnit'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :unit_category The value to assign to the {#unit_category} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.unit_category = attributes[:'unitCategory'] if attributes[:'unitCategory']

      raise 'You cannot provide both :unitCategory and :unit_category' if attributes.key?(:'unitCategory') && attributes.key?(:'unit_category')

      self.unit_category = attributes[:'unit_category'] if attributes[:'unit_category']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] unit_category Object to be assigned
    def unit_category=(unit_category)
      # rubocop:disable Style/ConditionalAssignment
      if unit_category && !UNIT_CATEGORY_ENUM.include?(unit_category)
        OCI.logger.debug("Unknown value for 'unit_category' [" + unit_category + "]. Mapping to 'UNIT_CATEGORY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @unit_category = UNIT_CATEGORY_UNKNOWN_ENUM_VALUE
      else
        @unit_category = unit_category
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        unit_category == other.unit_category &&
        display_name == other.display_name
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
      [unit_category, display_name].hash
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
