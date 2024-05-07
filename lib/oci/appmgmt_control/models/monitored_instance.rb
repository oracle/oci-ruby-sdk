# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210330
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Description of Monitored Instance.
  class AppmgmtControl::Models::MonitoredInstance
    MONITORING_STATE_ENUM = [
      MONITORING_STATE_ENABLED = 'ENABLED'.freeze,
      MONITORING_STATE_DISABLED = 'DISABLED'.freeze,
      MONITORING_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of monitored instance.
    # @return [String]
    attr_accessor :instance_id

    # **[Required]** Compartment Identifier [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm)
    # @return [String]
    attr_accessor :compartment_id

    # A user-friendly name of the monitored instance. It is binded to [Compute Instance](https://docs.cloud.oracle.com/Content/Compute/Concepts/computeoverview.htm).
    # DisplayName is fetched from [Core Service API](https://docs.cloud.oracle.com/api/#/en/iaas/20160918/Instance/).
    #
    # @return [String]
    attr_accessor :display_name

    # Management Agent Identifier [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # Used to invoke manage operations on Management Agent Cloud Service.
    #
    # @return [String]
    attr_accessor :management_agent_id

    # The time the MonitoredInstance was created. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_created

    # The time the MonitoredInstance was updated. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_updated

    # Monitoring status. Can be either enabled or disabled.
    # @return [String]
    attr_reader :monitoring_state

    # The current state of the monitored instance.
    # @return [String]
    attr_reader :lifecycle_state

    # A message describing the current state in more detail. For example, can be used to provide actionable information for a resource in Failed state.
    # @return [String]
    attr_accessor :lifecycle_details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'instance_id': :'instanceId',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'management_agent_id': :'managementAgentId',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'monitoring_state': :'monitoringState',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'instance_id': :'String',
        'compartment_id': :'String',
        'display_name': :'String',
        'management_agent_id': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'monitoring_state': :'String',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :instance_id The value to assign to the {#instance_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :management_agent_id The value to assign to the {#management_agent_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :monitoring_state The value to assign to the {#monitoring_state} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.instance_id = attributes[:'instanceId'] if attributes[:'instanceId']

      raise 'You cannot provide both :instanceId and :instance_id' if attributes.key?(:'instanceId') && attributes.key?(:'instance_id')

      self.instance_id = attributes[:'instance_id'] if attributes[:'instance_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.management_agent_id = attributes[:'managementAgentId'] if attributes[:'managementAgentId']

      raise 'You cannot provide both :managementAgentId and :management_agent_id' if attributes.key?(:'managementAgentId') && attributes.key?(:'management_agent_id')

      self.management_agent_id = attributes[:'management_agent_id'] if attributes[:'management_agent_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.monitoring_state = attributes[:'monitoringState'] if attributes[:'monitoringState']
      self.monitoring_state = "DISABLED" if monitoring_state.nil? && !attributes.key?(:'monitoringState') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :monitoringState and :monitoring_state' if attributes.key?(:'monitoringState') && attributes.key?(:'monitoring_state')

      self.monitoring_state = attributes[:'monitoring_state'] if attributes[:'monitoring_state']
      self.monitoring_state = "DISABLED" if monitoring_state.nil? && !attributes.key?(:'monitoringState') && !attributes.key?(:'monitoring_state') # rubocop:disable Style/StringLiterals

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] monitoring_state Object to be assigned
    def monitoring_state=(monitoring_state)
      # rubocop:disable Style/ConditionalAssignment
      if monitoring_state && !MONITORING_STATE_ENUM.include?(monitoring_state)
        OCI.logger.debug("Unknown value for 'monitoring_state' [" + monitoring_state + "]. Mapping to 'MONITORING_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @monitoring_state = MONITORING_STATE_UNKNOWN_ENUM_VALUE
      else
        @monitoring_state = monitoring_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        instance_id == other.instance_id &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        management_agent_id == other.management_agent_id &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        monitoring_state == other.monitoring_state &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details
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
      [instance_id, compartment_id, display_name, management_agent_id, time_created, time_updated, monitoring_state, lifecycle_state, lifecycle_details].hash
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
