# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: release
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of auto rotation schedule for the Key being create updated or imported.
  class KeyManagement::Models::AutoKeyRotationDetails
    LAST_ROTATION_STATUS_ENUM = [
      LAST_ROTATION_STATUS_SUCCESS = 'SUCCESS'.freeze,
      LAST_ROTATION_STATUS_FAILED = 'FAILED'.freeze,
      LAST_ROTATION_STATUS_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      LAST_ROTATION_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The interval of auto key rotation. For auto key rotation the interval should between 30 day and 365 days (1 year)
    # @return [Integer]
    attr_accessor :rotation_interval_in_days

    # A property indicating  scheduled start date expressed as date YYYY-MM-DD String. Example: `2023-04-04T00:00:00Z` .
    # @return [DateTime]
    attr_accessor :time_of_schedule_start

    # A property indicating Next estimated scheduled Time, as per the interval, expressed as date YYYY-MM-DD String. Example: `2023-04-04T00:00:00Z` .
    # @return [DateTime]
    attr_accessor :time_of_next_rotation

    # A  property indicating Last rotation Date Example: `2023-04-04T00:00:00Z`.
    # @return [DateTime]
    attr_accessor :time_of_last_rotation

    # The status of last execution of auto key rotation.
    # @return [String]
    attr_reader :last_rotation_status

    # The last execution status message.
    #
    # @return [String]
    attr_accessor :last_rotation_message

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'rotation_interval_in_days': :'rotationIntervalInDays',
        'time_of_schedule_start': :'timeOfScheduleStart',
        'time_of_next_rotation': :'timeOfNextRotation',
        'time_of_last_rotation': :'timeOfLastRotation',
        'last_rotation_status': :'lastRotationStatus',
        'last_rotation_message': :'lastRotationMessage'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'rotation_interval_in_days': :'Integer',
        'time_of_schedule_start': :'DateTime',
        'time_of_next_rotation': :'DateTime',
        'time_of_last_rotation': :'DateTime',
        'last_rotation_status': :'String',
        'last_rotation_message': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :rotation_interval_in_days The value to assign to the {#rotation_interval_in_days} property
    # @option attributes [DateTime] :time_of_schedule_start The value to assign to the {#time_of_schedule_start} property
    # @option attributes [DateTime] :time_of_next_rotation The value to assign to the {#time_of_next_rotation} property
    # @option attributes [DateTime] :time_of_last_rotation The value to assign to the {#time_of_last_rotation} property
    # @option attributes [String] :last_rotation_status The value to assign to the {#last_rotation_status} property
    # @option attributes [String] :last_rotation_message The value to assign to the {#last_rotation_message} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.rotation_interval_in_days = attributes[:'rotationIntervalInDays'] if attributes[:'rotationIntervalInDays']

      raise 'You cannot provide both :rotationIntervalInDays and :rotation_interval_in_days' if attributes.key?(:'rotationIntervalInDays') && attributes.key?(:'rotation_interval_in_days')

      self.rotation_interval_in_days = attributes[:'rotation_interval_in_days'] if attributes[:'rotation_interval_in_days']

      self.time_of_schedule_start = attributes[:'timeOfScheduleStart'] if attributes[:'timeOfScheduleStart']

      raise 'You cannot provide both :timeOfScheduleStart and :time_of_schedule_start' if attributes.key?(:'timeOfScheduleStart') && attributes.key?(:'time_of_schedule_start')

      self.time_of_schedule_start = attributes[:'time_of_schedule_start'] if attributes[:'time_of_schedule_start']

      self.time_of_next_rotation = attributes[:'timeOfNextRotation'] if attributes[:'timeOfNextRotation']

      raise 'You cannot provide both :timeOfNextRotation and :time_of_next_rotation' if attributes.key?(:'timeOfNextRotation') && attributes.key?(:'time_of_next_rotation')

      self.time_of_next_rotation = attributes[:'time_of_next_rotation'] if attributes[:'time_of_next_rotation']

      self.time_of_last_rotation = attributes[:'timeOfLastRotation'] if attributes[:'timeOfLastRotation']

      raise 'You cannot provide both :timeOfLastRotation and :time_of_last_rotation' if attributes.key?(:'timeOfLastRotation') && attributes.key?(:'time_of_last_rotation')

      self.time_of_last_rotation = attributes[:'time_of_last_rotation'] if attributes[:'time_of_last_rotation']

      self.last_rotation_status = attributes[:'lastRotationStatus'] if attributes[:'lastRotationStatus']

      raise 'You cannot provide both :lastRotationStatus and :last_rotation_status' if attributes.key?(:'lastRotationStatus') && attributes.key?(:'last_rotation_status')

      self.last_rotation_status = attributes[:'last_rotation_status'] if attributes[:'last_rotation_status']

      self.last_rotation_message = attributes[:'lastRotationMessage'] if attributes[:'lastRotationMessage']

      raise 'You cannot provide both :lastRotationMessage and :last_rotation_message' if attributes.key?(:'lastRotationMessage') && attributes.key?(:'last_rotation_message')

      self.last_rotation_message = attributes[:'last_rotation_message'] if attributes[:'last_rotation_message']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] last_rotation_status Object to be assigned
    def last_rotation_status=(last_rotation_status)
      # rubocop:disable Style/ConditionalAssignment
      if last_rotation_status && !LAST_ROTATION_STATUS_ENUM.include?(last_rotation_status)
        OCI.logger.debug("Unknown value for 'last_rotation_status' [" + last_rotation_status + "]. Mapping to 'LAST_ROTATION_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @last_rotation_status = LAST_ROTATION_STATUS_UNKNOWN_ENUM_VALUE
      else
        @last_rotation_status = last_rotation_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        rotation_interval_in_days == other.rotation_interval_in_days &&
        time_of_schedule_start == other.time_of_schedule_start &&
        time_of_next_rotation == other.time_of_next_rotation &&
        time_of_last_rotation == other.time_of_last_rotation &&
        last_rotation_status == other.last_rotation_status &&
        last_rotation_message == other.last_rotation_message
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
      [rotation_interval_in_days, time_of_schedule_start, time_of_next_rotation, time_of_last_rotation, last_rotation_status, last_rotation_message].hash
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