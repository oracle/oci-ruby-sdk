# Copyright (c) 2016, 2020, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Defines the backup frequency and retention period for a volume backup policy. For more information,
  # see [Policy-Based Backups](https://docs.cloud.oracle.com/iaas/Content/Block/Tasks/schedulingvolumebackups.htm).
  #
  class Core::Models::VolumeBackupSchedule
    BACKUP_TYPE_ENUM = [
      BACKUP_TYPE_FULL = 'FULL'.freeze,
      BACKUP_TYPE_INCREMENTAL = 'INCREMENTAL'.freeze,
      BACKUP_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PERIOD_ENUM = [
      PERIOD_ONE_HOUR = 'ONE_HOUR'.freeze,
      PERIOD_ONE_DAY = 'ONE_DAY'.freeze,
      PERIOD_ONE_WEEK = 'ONE_WEEK'.freeze,
      PERIOD_ONE_MONTH = 'ONE_MONTH'.freeze,
      PERIOD_ONE_YEAR = 'ONE_YEAR'.freeze,
      PERIOD_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    OFFSET_TYPE_ENUM = [
      OFFSET_TYPE_STRUCTURED = 'STRUCTURED'.freeze,
      OFFSET_TYPE_NUMERIC_SECONDS = 'NUMERIC_SECONDS'.freeze,
      OFFSET_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DAY_OF_WEEK_ENUM = [
      DAY_OF_WEEK_MONDAY = 'MONDAY'.freeze,
      DAY_OF_WEEK_TUESDAY = 'TUESDAY'.freeze,
      DAY_OF_WEEK_WEDNESDAY = 'WEDNESDAY'.freeze,
      DAY_OF_WEEK_THURSDAY = 'THURSDAY'.freeze,
      DAY_OF_WEEK_FRIDAY = 'FRIDAY'.freeze,
      DAY_OF_WEEK_SATURDAY = 'SATURDAY'.freeze,
      DAY_OF_WEEK_SUNDAY = 'SUNDAY'.freeze,
      DAY_OF_WEEK_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    MONTH_ENUM = [
      MONTH_JANUARY = 'JANUARY'.freeze,
      MONTH_FEBRUARY = 'FEBRUARY'.freeze,
      MONTH_MARCH = 'MARCH'.freeze,
      MONTH_APRIL = 'APRIL'.freeze,
      MONTH_MAY = 'MAY'.freeze,
      MONTH_JUNE = 'JUNE'.freeze,
      MONTH_JULY = 'JULY'.freeze,
      MONTH_AUGUST = 'AUGUST'.freeze,
      MONTH_SEPTEMBER = 'SEPTEMBER'.freeze,
      MONTH_OCTOBER = 'OCTOBER'.freeze,
      MONTH_NOVEMBER = 'NOVEMBER'.freeze,
      MONTH_DECEMBER = 'DECEMBER'.freeze,
      MONTH_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    TIME_ZONE_ENUM = [
      TIME_ZONE_UTC = 'UTC'.freeze,
      TIME_ZONE_REGIONAL_DATA_CENTER_TIME = 'REGIONAL_DATA_CENTER_TIME'.freeze,
      TIME_ZONE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The type of volume backup to create.
    # @return [String]
    attr_reader :backup_type

    # The number of seconds that the volume backup start time should be shifted from the default interval boundaries specified by the period. The volume backup start time is the frequency start time plus the offset.
    # @return [Integer]
    attr_accessor :offset_seconds

    # **[Required]** The volume backup frequency.
    # @return [String]
    attr_reader :period

    # Indicates how the offset is defined. If value is `STRUCTURED`, then `hourOfDay`, `dayOfWeek`, `dayOfMonth`, and `month` fields are used and `offsetSeconds` will be ignored in requests and users should ignore its value from the responses.
    #
    # `hourOfDay` is applicable for periods `ONE_DAY`, `ONE_WEEK`, `ONE_MONTH` and `ONE_YEAR`.
    #
    # `dayOfWeek` is applicable for period `ONE_WEEK`.
    #
    # `dayOfMonth` is applicable for periods `ONE_MONTH` and `ONE_YEAR`.
    #
    # 'month' is applicable for period 'ONE_YEAR'.
    #
    # They will be ignored in the requests for inapplicable periods.
    #
    # If value is `NUMERIC_SECONDS`, then `offsetSeconds` will be used for both requests and responses and the structured fields will be ignored in the requests and users should ignore their values from the responses.
    #
    # For clients using older versions of Apis and not sending `offsetType` in their requests, the behaviour is just like `NUMERIC_SECONDS`.
    # @return [String]
    attr_reader :offset_type

    # The hour of the day to schedule the volume backup.
    # @return [Integer]
    attr_accessor :hour_of_day

    # The day of the week to schedule the volume backup.
    # @return [String]
    attr_reader :day_of_week

    # The day of the month to schedule the volume backup.
    # @return [Integer]
    attr_accessor :day_of_month

    # The month of the year to schedule the volume backup.
    # @return [String]
    attr_reader :month

    # **[Required]** How long, in seconds, to keep the volume backups created by this schedule.
    # @return [Integer]
    attr_accessor :retention_seconds

    # Specifies what time zone is the schedule in
    # @return [String]
    attr_reader :time_zone

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'backup_type': :'backupType',
        'offset_seconds': :'offsetSeconds',
        'period': :'period',
        'offset_type': :'offsetType',
        'hour_of_day': :'hourOfDay',
        'day_of_week': :'dayOfWeek',
        'day_of_month': :'dayOfMonth',
        'month': :'month',
        'retention_seconds': :'retentionSeconds',
        'time_zone': :'timeZone'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'backup_type': :'String',
        'offset_seconds': :'Integer',
        'period': :'String',
        'offset_type': :'String',
        'hour_of_day': :'Integer',
        'day_of_week': :'String',
        'day_of_month': :'Integer',
        'month': :'String',
        'retention_seconds': :'Integer',
        'time_zone': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :backup_type The value to assign to the {#backup_type} property
    # @option attributes [Integer] :offset_seconds The value to assign to the {#offset_seconds} property
    # @option attributes [String] :period The value to assign to the {#period} property
    # @option attributes [String] :offset_type The value to assign to the {#offset_type} property
    # @option attributes [Integer] :hour_of_day The value to assign to the {#hour_of_day} property
    # @option attributes [String] :day_of_week The value to assign to the {#day_of_week} property
    # @option attributes [Integer] :day_of_month The value to assign to the {#day_of_month} property
    # @option attributes [String] :month The value to assign to the {#month} property
    # @option attributes [Integer] :retention_seconds The value to assign to the {#retention_seconds} property
    # @option attributes [String] :time_zone The value to assign to the {#time_zone} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.backup_type = attributes[:'backupType'] if attributes[:'backupType']

      raise 'You cannot provide both :backupType and :backup_type' if attributes.key?(:'backupType') && attributes.key?(:'backup_type')

      self.backup_type = attributes[:'backup_type'] if attributes[:'backup_type']

      self.offset_seconds = attributes[:'offsetSeconds'] if attributes[:'offsetSeconds']

      raise 'You cannot provide both :offsetSeconds and :offset_seconds' if attributes.key?(:'offsetSeconds') && attributes.key?(:'offset_seconds')

      self.offset_seconds = attributes[:'offset_seconds'] if attributes[:'offset_seconds']

      self.period = attributes[:'period'] if attributes[:'period']

      self.offset_type = attributes[:'offsetType'] if attributes[:'offsetType']

      raise 'You cannot provide both :offsetType and :offset_type' if attributes.key?(:'offsetType') && attributes.key?(:'offset_type')

      self.offset_type = attributes[:'offset_type'] if attributes[:'offset_type']

      self.hour_of_day = attributes[:'hourOfDay'] if attributes[:'hourOfDay']

      raise 'You cannot provide both :hourOfDay and :hour_of_day' if attributes.key?(:'hourOfDay') && attributes.key?(:'hour_of_day')

      self.hour_of_day = attributes[:'hour_of_day'] if attributes[:'hour_of_day']

      self.day_of_week = attributes[:'dayOfWeek'] if attributes[:'dayOfWeek']

      raise 'You cannot provide both :dayOfWeek and :day_of_week' if attributes.key?(:'dayOfWeek') && attributes.key?(:'day_of_week')

      self.day_of_week = attributes[:'day_of_week'] if attributes[:'day_of_week']

      self.day_of_month = attributes[:'dayOfMonth'] if attributes[:'dayOfMonth']

      raise 'You cannot provide both :dayOfMonth and :day_of_month' if attributes.key?(:'dayOfMonth') && attributes.key?(:'day_of_month')

      self.day_of_month = attributes[:'day_of_month'] if attributes[:'day_of_month']

      self.month = attributes[:'month'] if attributes[:'month']

      self.retention_seconds = attributes[:'retentionSeconds'] if attributes[:'retentionSeconds']

      raise 'You cannot provide both :retentionSeconds and :retention_seconds' if attributes.key?(:'retentionSeconds') && attributes.key?(:'retention_seconds')

      self.retention_seconds = attributes[:'retention_seconds'] if attributes[:'retention_seconds']

      self.time_zone = attributes[:'timeZone'] if attributes[:'timeZone']
      self.time_zone = "UTC" if time_zone.nil? && !attributes.key?(:'timeZone') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :timeZone and :time_zone' if attributes.key?(:'timeZone') && attributes.key?(:'time_zone')

      self.time_zone = attributes[:'time_zone'] if attributes[:'time_zone']
      self.time_zone = "UTC" if time_zone.nil? && !attributes.key?(:'timeZone') && !attributes.key?(:'time_zone') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] backup_type Object to be assigned
    def backup_type=(backup_type)
      # rubocop:disable Style/ConditionalAssignment
      if backup_type && !BACKUP_TYPE_ENUM.include?(backup_type)
        OCI.logger.debug("Unknown value for 'backup_type' [" + backup_type + "]. Mapping to 'BACKUP_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @backup_type = BACKUP_TYPE_UNKNOWN_ENUM_VALUE
      else
        @backup_type = backup_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] period Object to be assigned
    def period=(period)
      # rubocop:disable Style/ConditionalAssignment
      if period && !PERIOD_ENUM.include?(period)
        OCI.logger.debug("Unknown value for 'period' [" + period + "]. Mapping to 'PERIOD_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @period = PERIOD_UNKNOWN_ENUM_VALUE
      else
        @period = period
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] offset_type Object to be assigned
    def offset_type=(offset_type)
      # rubocop:disable Style/ConditionalAssignment
      if offset_type && !OFFSET_TYPE_ENUM.include?(offset_type)
        OCI.logger.debug("Unknown value for 'offset_type' [" + offset_type + "]. Mapping to 'OFFSET_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @offset_type = OFFSET_TYPE_UNKNOWN_ENUM_VALUE
      else
        @offset_type = offset_type
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] month Object to be assigned
    def month=(month)
      # rubocop:disable Style/ConditionalAssignment
      if month && !MONTH_ENUM.include?(month)
        OCI.logger.debug("Unknown value for 'month' [" + month + "]. Mapping to 'MONTH_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @month = MONTH_UNKNOWN_ENUM_VALUE
      else
        @month = month
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] time_zone Object to be assigned
    def time_zone=(time_zone)
      # rubocop:disable Style/ConditionalAssignment
      if time_zone && !TIME_ZONE_ENUM.include?(time_zone)
        OCI.logger.debug("Unknown value for 'time_zone' [" + time_zone + "]. Mapping to 'TIME_ZONE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @time_zone = TIME_ZONE_UNKNOWN_ENUM_VALUE
      else
        @time_zone = time_zone
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        backup_type == other.backup_type &&
        offset_seconds == other.offset_seconds &&
        period == other.period &&
        offset_type == other.offset_type &&
        hour_of_day == other.hour_of_day &&
        day_of_week == other.day_of_week &&
        day_of_month == other.day_of_month &&
        month == other.month &&
        retention_seconds == other.retention_seconds &&
        time_zone == other.time_zone
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
      [backup_type, offset_seconds, period, offset_type, hour_of_day, day_of_week, day_of_month, month, retention_seconds, time_zone].hash
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
