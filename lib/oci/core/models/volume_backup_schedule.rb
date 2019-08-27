# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Defines a chronological recurrence pattern for creating scheduled backups at a particular periodicity.
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

    # **[Required]** The type of backup to create.
    # @return [String]
    attr_reader :backup_type

    # The number of seconds that the backup time should be shifted from the default interval boundaries specified by the period. Backup time = Frequency start time + Offset.
    # @return [Integer]
    attr_accessor :offset_seconds

    # **[Required]** How often the backup should occur.
    # @return [String]
    attr_reader :period

    # **[Required]** How long, in seconds, backups created by this schedule should be kept until being automatically deleted.
    # @return [Integer]
    attr_accessor :retention_seconds

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'backup_type': :'backupType',
        'offset_seconds': :'offsetSeconds',
        'period': :'period',
        'retention_seconds': :'retentionSeconds'
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
        'retention_seconds': :'Integer'
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
    # @option attributes [Integer] :retention_seconds The value to assign to the {#retention_seconds} property
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

      self.retention_seconds = attributes[:'retentionSeconds'] if attributes[:'retentionSeconds']

      raise 'You cannot provide both :retentionSeconds and :retention_seconds' if attributes.key?(:'retentionSeconds') && attributes.key?(:'retention_seconds')

      self.retention_seconds = attributes[:'retention_seconds'] if attributes[:'retention_seconds']
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        backup_type == other.backup_type &&
        offset_seconds == other.offset_seconds &&
        period == other.period &&
        retention_seconds == other.retention_seconds
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
      [backup_type, offset_seconds, period, retention_seconds].hash
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
