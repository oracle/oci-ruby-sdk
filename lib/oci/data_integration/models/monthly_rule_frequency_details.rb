# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'
require_relative 'abstract_frequency_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Frequency Details model for monthly frequency based on week of month and day of week.
  class DataIntegration::Models::MonthlyRuleFrequencyDetails < DataIntegration::Models::AbstractFrequencyDetails
    WEEK_OF_MONTH_ENUM = [
      WEEK_OF_MONTH_FIRST = 'FIRST'.freeze,
      WEEK_OF_MONTH_SECOND = 'SECOND'.freeze,
      WEEK_OF_MONTH_THIRD = 'THIRD'.freeze,
      WEEK_OF_MONTH_FOURTH = 'FOURTH'.freeze,
      WEEK_OF_MONTH_FIFTH = 'FIFTH'.freeze,
      WEEK_OF_MONTH_LAST = 'LAST'.freeze,
      WEEK_OF_MONTH_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DAY_OF_WEEK_ENUM = [
      DAY_OF_WEEK_SUNDAY = 'SUNDAY'.freeze,
      DAY_OF_WEEK_MONDAY = 'MONDAY'.freeze,
      DAY_OF_WEEK_TUESDAY = 'TUESDAY'.freeze,
      DAY_OF_WEEK_WEDNESDAY = 'WEDNESDAY'.freeze,
      DAY_OF_WEEK_THURSDAY = 'THURSDAY'.freeze,
      DAY_OF_WEEK_FRIDAY = 'FRIDAY'.freeze,
      DAY_OF_WEEK_SATURDAY = 'SATURDAY'.freeze,
      DAY_OF_WEEK_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # This holds the week of the month in which the schedule should be triggered.
    # @return [String]
    attr_reader :week_of_month

    # This hold the repeatability aspect of a schedule. i.e. in a monhtly frequency, a task can be scheduled for every month, once in two months, once in tree months etc.
    # @return [Integer]
    attr_accessor :interval

    # @return [OCI::DataIntegration::Models::Time]
    attr_accessor :time

    # This holds the day of the week on which the schedule should be triggered.
    # @return [String]
    attr_reader :day_of_week

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'modelType',
        'frequency': :'frequency',
        'week_of_month': :'weekOfMonth',
        'interval': :'interval',
        'time': :'time',
        'day_of_week': :'dayOfWeek'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'String',
        'frequency': :'String',
        'week_of_month': :'String',
        'interval': :'Integer',
        'time': :'OCI::DataIntegration::Models::Time',
        'day_of_week': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :frequency The value to assign to the {OCI::DataIntegration::Models::AbstractFrequencyDetails#frequency #frequency} proprety
    # @option attributes [String] :week_of_month The value to assign to the {#week_of_month} property
    # @option attributes [Integer] :interval The value to assign to the {#interval} property
    # @option attributes [OCI::DataIntegration::Models::Time] :time The value to assign to the {#time} property
    # @option attributes [String] :day_of_week The value to assign to the {#day_of_week} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['modelType'] = 'MONTHLY_RULE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.week_of_month = attributes[:'weekOfMonth'] if attributes[:'weekOfMonth']

      raise 'You cannot provide both :weekOfMonth and :week_of_month' if attributes.key?(:'weekOfMonth') && attributes.key?(:'week_of_month')

      self.week_of_month = attributes[:'week_of_month'] if attributes[:'week_of_month']

      self.interval = attributes[:'interval'] if attributes[:'interval']

      self.time = attributes[:'time'] if attributes[:'time']

      self.day_of_week = attributes[:'dayOfWeek'] if attributes[:'dayOfWeek']

      raise 'You cannot provide both :dayOfWeek and :day_of_week' if attributes.key?(:'dayOfWeek') && attributes.key?(:'day_of_week')

      self.day_of_week = attributes[:'day_of_week'] if attributes[:'day_of_week']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] week_of_month Object to be assigned
    def week_of_month=(week_of_month)
      # rubocop:disable Style/ConditionalAssignment
      if week_of_month && !WEEK_OF_MONTH_ENUM.include?(week_of_month)
        OCI.logger.debug("Unknown value for 'week_of_month' [" + week_of_month + "]. Mapping to 'WEEK_OF_MONTH_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @week_of_month = WEEK_OF_MONTH_UNKNOWN_ENUM_VALUE
      else
        @week_of_month = week_of_month
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] day_of_week Object to be assigned
    def day_of_week=(day_of_week)
      # rubocop:disable Style/ConditionalAssignment
      if day_of_week && !DAY_OF_WEEK_ENUM.include?(day_of_week)
        OCI.logger.debug("Unknown value for 'day_of_week' [" + day_of_week + "]. Mapping to 'DAY_OF_WEEK_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @day_of_week = DAY_OF_WEEK_UNKNOWN_ENUM_VALUE
      else
        @day_of_week = day_of_week
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        model_type == other.model_type &&
        frequency == other.frequency &&
        week_of_month == other.week_of_month &&
        interval == other.interval &&
        time == other.time &&
        day_of_week == other.day_of_week
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
      [model_type, frequency, week_of_month, interval, time, day_of_week].hash
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