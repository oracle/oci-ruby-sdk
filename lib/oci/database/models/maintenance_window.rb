# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The scheduling details for the quarterly maintenance window. Patching and system updates take place during the maintenance window.
  #
  class Database::Models::MaintenanceWindow
    PREFERENCE_ENUM = [
      PREFERENCE_NO_PREFERENCE = 'NO_PREFERENCE'.freeze,
      PREFERENCE_CUSTOM_PREFERENCE = 'CUSTOM_PREFERENCE'.freeze,
      PREFERENCE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The maintenance window scheduling preference.
    # @return [String]
    attr_reader :preference

    # Months during the year when maintenance should be performed.
    # @return [Array<OCI::Database::Models::Month>]
    attr_accessor :months

    # Weeks during the month when maintenance should be performed. Weeks start on the 1st, 8th, 15th, and 22nd days of the month, and have a duration of 7 days. Weeks start and end based on calendar dates, not days of the week.
    # For example, to allow maintenance during the 2nd week of the month (from the 8th day to the 14th day of the month), use the value 2. Maintenance cannot be scheduled for the fifth week of months that contain more than 28 days.
    # Note that this parameter works in conjunction with the  daysOfWeek and hoursOfDay parameters to allow you to specify specific days of the week and hours that maintenance will be performed.
    #
    # @return [Array<Integer>]
    attr_accessor :weeks_of_month

    # Days during the week when maintenance should be performed.
    # @return [Array<OCI::Database::Models::DayOfWeek>]
    attr_accessor :days_of_week

    # The window of hours during the day when maintenance should be performed. The window is a 4 hour slot. Valid values are
    # - 0 - represents time slot 0:00 - 3:59 UTC - 4 - represents time slot 4:00 - 7:59 UTC - 8 - represents time slot 8:00 - 11:59 UTC - 12 - represents time slot 12:00 - 15:59 UTC - 16 - represents time slot 16:00 - 19:59 UTC - 20 - represents time slot 20:00 - 23:59 UTC
    # @return [Array<Integer>]
    attr_accessor :hours_of_day

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'preference': :'preference',
        'months': :'months',
        'weeks_of_month': :'weeksOfMonth',
        'days_of_week': :'daysOfWeek',
        'hours_of_day': :'hoursOfDay'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'preference': :'String',
        'months': :'Array<OCI::Database::Models::Month>',
        'weeks_of_month': :'Array<Integer>',
        'days_of_week': :'Array<OCI::Database::Models::DayOfWeek>',
        'hours_of_day': :'Array<Integer>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :preference The value to assign to the {#preference} property
    # @option attributes [Array<OCI::Database::Models::Month>] :months The value to assign to the {#months} property
    # @option attributes [Array<Integer>] :weeks_of_month The value to assign to the {#weeks_of_month} property
    # @option attributes [Array<OCI::Database::Models::DayOfWeek>] :days_of_week The value to assign to the {#days_of_week} property
    # @option attributes [Array<Integer>] :hours_of_day The value to assign to the {#hours_of_day} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.preference = attributes[:'preference'] if attributes[:'preference']
      self.preference = "NO_PREFERENCE" if preference.nil? && !attributes.key?(:'preference') # rubocop:disable Style/StringLiterals

      self.months = attributes[:'months'] if attributes[:'months']

      self.weeks_of_month = attributes[:'weeksOfMonth'] if attributes[:'weeksOfMonth']

      raise 'You cannot provide both :weeksOfMonth and :weeks_of_month' if attributes.key?(:'weeksOfMonth') && attributes.key?(:'weeks_of_month')

      self.weeks_of_month = attributes[:'weeks_of_month'] if attributes[:'weeks_of_month']

      self.days_of_week = attributes[:'daysOfWeek'] if attributes[:'daysOfWeek']

      raise 'You cannot provide both :daysOfWeek and :days_of_week' if attributes.key?(:'daysOfWeek') && attributes.key?(:'days_of_week')

      self.days_of_week = attributes[:'days_of_week'] if attributes[:'days_of_week']

      self.hours_of_day = attributes[:'hoursOfDay'] if attributes[:'hoursOfDay']

      raise 'You cannot provide both :hoursOfDay and :hours_of_day' if attributes.key?(:'hoursOfDay') && attributes.key?(:'hours_of_day')

      self.hours_of_day = attributes[:'hours_of_day'] if attributes[:'hours_of_day']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] preference Object to be assigned
    def preference=(preference)
      # rubocop:disable Style/ConditionalAssignment
      if preference && !PREFERENCE_ENUM.include?(preference)
        OCI.logger.debug("Unknown value for 'preference' [" + preference + "]. Mapping to 'PREFERENCE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @preference = PREFERENCE_UNKNOWN_ENUM_VALUE
      else
        @preference = preference
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        preference == other.preference &&
        months == other.months &&
        weeks_of_month == other.weeks_of_month &&
        days_of_week == other.days_of_week &&
        hours_of_day == other.hours_of_day
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
      [preference, months, weeks_of_month, days_of_week, hours_of_day].hash
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
