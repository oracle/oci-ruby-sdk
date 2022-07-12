# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'
require_relative 'date_range'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The saved dynamic date range (Required when staticDateRange is missing).
  class UsageApi::Models::DynamicDateRange < UsageApi::Models::DateRange
    DYNAMIC_DATE_RANGE_TYPE_ENUM = [
      DYNAMIC_DATE_RANGE_TYPE_LAST_7_DAYS = 'LAST_7_DAYS'.freeze,
      DYNAMIC_DATE_RANGE_TYPE_LAST_CALENDAR_WEEK = 'LAST_CALENDAR_WEEK'.freeze,
      DYNAMIC_DATE_RANGE_TYPE_LAST_CALENDAR_MONTH = 'LAST_CALENDAR_MONTH'.freeze,
      DYNAMIC_DATE_RANGE_TYPE_LAST_30_DAYS = 'LAST_30_DAYS'.freeze,
      DYNAMIC_DATE_RANGE_TYPE_MONTH_TO_DATE = 'MONTH_TO_DATE'.freeze,
      DYNAMIC_DATE_RANGE_TYPE_LAST_YEAR = 'LAST_YEAR'.freeze,
      DYNAMIC_DATE_RANGE_TYPE_YEAR_TODATE = 'YEAR_TODATE'.freeze,
      DYNAMIC_DATE_RANGE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # This attribute is required.
    # @return [String]
    attr_reader :dynamic_date_range_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'date_range_type': :'dateRangeType',
        'dynamic_date_range_type': :'dynamicDateRangeType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'date_range_type': :'String',
        'dynamic_date_range_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :dynamic_date_range_type The value to assign to the {#dynamic_date_range_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['dateRangeType'] = 'DYNAMIC'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.dynamic_date_range_type = attributes[:'dynamicDateRangeType'] if attributes[:'dynamicDateRangeType']

      raise 'You cannot provide both :dynamicDateRangeType and :dynamic_date_range_type' if attributes.key?(:'dynamicDateRangeType') && attributes.key?(:'dynamic_date_range_type')

      self.dynamic_date_range_type = attributes[:'dynamic_date_range_type'] if attributes[:'dynamic_date_range_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] dynamic_date_range_type Object to be assigned
    def dynamic_date_range_type=(dynamic_date_range_type)
      # rubocop:disable Style/ConditionalAssignment
      if dynamic_date_range_type && !DYNAMIC_DATE_RANGE_TYPE_ENUM.include?(dynamic_date_range_type)
        OCI.logger.debug("Unknown value for 'dynamic_date_range_type' [" + dynamic_date_range_type + "]. Mapping to 'DYNAMIC_DATE_RANGE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @dynamic_date_range_type = DYNAMIC_DATE_RANGE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @dynamic_date_range_type = dynamic_date_range_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        date_range_type == other.date_range_type &&
        dynamic_date_range_type == other.dynamic_date_range_type
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
      [date_range_type, dynamic_date_range_type].hash
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
