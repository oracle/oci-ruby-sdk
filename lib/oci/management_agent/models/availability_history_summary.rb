# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Availability history of Management Agent.
  class ManagementAgent::Models::AvailabilityHistorySummary
    AVAILABILITY_STATUS_ENUM = [
      AVAILABILITY_STATUS_ACTIVE = 'ACTIVE'.freeze,
      AVAILABILITY_STATUS_SILENT = 'SILENT'.freeze,
      AVAILABILITY_STATUS_NOT_AVAILABLE = 'NOT_AVAILABLE'.freeze,
      AVAILABILITY_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** agent identifier
    # @return [String]
    attr_accessor :management_agent_id

    # **[Required]** The availability status of managementAgent
    # @return [String]
    attr_reader :availability_status

    # The time at which the Management Agent moved to the availability status. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_availability_status_started

    # The time till which the Management Agent was known to be in the availability status. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_availability_status_ended

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'management_agent_id': :'managementAgentId',
        'availability_status': :'availabilityStatus',
        'time_availability_status_started': :'timeAvailabilityStatusStarted',
        'time_availability_status_ended': :'timeAvailabilityStatusEnded'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'management_agent_id': :'String',
        'availability_status': :'String',
        'time_availability_status_started': :'DateTime',
        'time_availability_status_ended': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :management_agent_id The value to assign to the {#management_agent_id} property
    # @option attributes [String] :availability_status The value to assign to the {#availability_status} property
    # @option attributes [DateTime] :time_availability_status_started The value to assign to the {#time_availability_status_started} property
    # @option attributes [DateTime] :time_availability_status_ended The value to assign to the {#time_availability_status_ended} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.management_agent_id = attributes[:'managementAgentId'] if attributes[:'managementAgentId']

      raise 'You cannot provide both :managementAgentId and :management_agent_id' if attributes.key?(:'managementAgentId') && attributes.key?(:'management_agent_id')

      self.management_agent_id = attributes[:'management_agent_id'] if attributes[:'management_agent_id']

      self.availability_status = attributes[:'availabilityStatus'] if attributes[:'availabilityStatus']

      raise 'You cannot provide both :availabilityStatus and :availability_status' if attributes.key?(:'availabilityStatus') && attributes.key?(:'availability_status')

      self.availability_status = attributes[:'availability_status'] if attributes[:'availability_status']

      self.time_availability_status_started = attributes[:'timeAvailabilityStatusStarted'] if attributes[:'timeAvailabilityStatusStarted']

      raise 'You cannot provide both :timeAvailabilityStatusStarted and :time_availability_status_started' if attributes.key?(:'timeAvailabilityStatusStarted') && attributes.key?(:'time_availability_status_started')

      self.time_availability_status_started = attributes[:'time_availability_status_started'] if attributes[:'time_availability_status_started']

      self.time_availability_status_ended = attributes[:'timeAvailabilityStatusEnded'] if attributes[:'timeAvailabilityStatusEnded']

      raise 'You cannot provide both :timeAvailabilityStatusEnded and :time_availability_status_ended' if attributes.key?(:'timeAvailabilityStatusEnded') && attributes.key?(:'time_availability_status_ended')

      self.time_availability_status_ended = attributes[:'time_availability_status_ended'] if attributes[:'time_availability_status_ended']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] availability_status Object to be assigned
    def availability_status=(availability_status)
      # rubocop:disable Style/ConditionalAssignment
      if availability_status && !AVAILABILITY_STATUS_ENUM.include?(availability_status)
        OCI.logger.debug("Unknown value for 'availability_status' [" + availability_status + "]. Mapping to 'AVAILABILITY_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @availability_status = AVAILABILITY_STATUS_UNKNOWN_ENUM_VALUE
      else
        @availability_status = availability_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        management_agent_id == other.management_agent_id &&
        availability_status == other.availability_status &&
        time_availability_status_started == other.time_availability_status_started &&
        time_availability_status_ended == other.time_availability_status_ended
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
      [management_agent_id, availability_status, time_availability_status_started, time_availability_status_ended].hash
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
