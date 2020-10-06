# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of a log analytics entity.
  #
  class LogAnalytics::Models::LogAnalyticsEntitySummary
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The log analytics entity OCID. This ID is a reference used by log analytics features and it represents
    # a resource that is provisioned and managed by the customer on their premises or on the cloud.
    #
    # @return [String]
    attr_accessor :id

    # **[Required]** Log analytics entity name. The name must be unique, within the tenancy, and cannot be changed.
    #
    # @return [String]
    attr_accessor :name

    # **[Required]** Compartment Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** Log analytics entity type name.
    #
    # @return [String]
    attr_accessor :entity_type_name

    # **[Required]** Internal name for the log analytics entity type.
    #
    # @return [String]
    attr_accessor :entity_type_internal_name

    # **[Required]** The current state of the log analytics entity.
    #
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** lifecycleDetails has additional information regarding substeps such as management agent plugin deployment.
    #
    # @return [String]
    attr_accessor :lifecycle_details

    # The OCID of the Management Agent.
    #
    # @return [String]
    attr_accessor :management_agent_id

    # The OCID of the Cloud resource which this entity is a representation of. This may be blank when the entity
    # represents a non-cloud resource that the customer may have on their premises.
    #
    # @return [String]
    attr_accessor :cloud_resource_id

    # The timezone region of the log analytics entity.
    #
    # @return [String]
    attr_accessor :timezone_region

    # **[Required]** The date and time the resource was created, in the format defined by RFC3339.
    #
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The date and time the resource was last updated, in the format defined by RFC3339.
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # The Boolean flag to indicate if logs are collected for an entity for log analytics usage.
    #
    # @return [BOOLEAN]
    attr_accessor :are_logs_collected

    # This indicates the type of source. It is primarily for Enterprise Manager Repository ID.
    #
    # @return [String]
    attr_accessor :source_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'name': :'name',
        'compartment_id': :'compartmentId',
        'entity_type_name': :'entityTypeName',
        'entity_type_internal_name': :'entityTypeInternalName',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'management_agent_id': :'managementAgentId',
        'cloud_resource_id': :'cloudResourceId',
        'timezone_region': :'timezoneRegion',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'are_logs_collected': :'areLogsCollected',
        'source_id': :'sourceId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'name': :'String',
        'compartment_id': :'String',
        'entity_type_name': :'String',
        'entity_type_internal_name': :'String',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'management_agent_id': :'String',
        'cloud_resource_id': :'String',
        'timezone_region': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'are_logs_collected': :'BOOLEAN',
        'source_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :entity_type_name The value to assign to the {#entity_type_name} property
    # @option attributes [String] :entity_type_internal_name The value to assign to the {#entity_type_internal_name} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :management_agent_id The value to assign to the {#management_agent_id} property
    # @option attributes [String] :cloud_resource_id The value to assign to the {#cloud_resource_id} property
    # @option attributes [String] :timezone_region The value to assign to the {#timezone_region} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [BOOLEAN] :are_logs_collected The value to assign to the {#are_logs_collected} property
    # @option attributes [String] :source_id The value to assign to the {#source_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.entity_type_name = attributes[:'entityTypeName'] if attributes[:'entityTypeName']

      raise 'You cannot provide both :entityTypeName and :entity_type_name' if attributes.key?(:'entityTypeName') && attributes.key?(:'entity_type_name')

      self.entity_type_name = attributes[:'entity_type_name'] if attributes[:'entity_type_name']

      self.entity_type_internal_name = attributes[:'entityTypeInternalName'] if attributes[:'entityTypeInternalName']

      raise 'You cannot provide both :entityTypeInternalName and :entity_type_internal_name' if attributes.key?(:'entityTypeInternalName') && attributes.key?(:'entity_type_internal_name')

      self.entity_type_internal_name = attributes[:'entity_type_internal_name'] if attributes[:'entity_type_internal_name']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.management_agent_id = attributes[:'managementAgentId'] if attributes[:'managementAgentId']

      raise 'You cannot provide both :managementAgentId and :management_agent_id' if attributes.key?(:'managementAgentId') && attributes.key?(:'management_agent_id')

      self.management_agent_id = attributes[:'management_agent_id'] if attributes[:'management_agent_id']

      self.cloud_resource_id = attributes[:'cloudResourceId'] if attributes[:'cloudResourceId']

      raise 'You cannot provide both :cloudResourceId and :cloud_resource_id' if attributes.key?(:'cloudResourceId') && attributes.key?(:'cloud_resource_id')

      self.cloud_resource_id = attributes[:'cloud_resource_id'] if attributes[:'cloud_resource_id']

      self.timezone_region = attributes[:'timezoneRegion'] if attributes[:'timezoneRegion']

      raise 'You cannot provide both :timezoneRegion and :timezone_region' if attributes.key?(:'timezoneRegion') && attributes.key?(:'timezone_region')

      self.timezone_region = attributes[:'timezone_region'] if attributes[:'timezone_region']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.are_logs_collected = attributes[:'areLogsCollected'] unless attributes[:'areLogsCollected'].nil?

      raise 'You cannot provide both :areLogsCollected and :are_logs_collected' if attributes.key?(:'areLogsCollected') && attributes.key?(:'are_logs_collected')

      self.are_logs_collected = attributes[:'are_logs_collected'] unless attributes[:'are_logs_collected'].nil?

      self.source_id = attributes[:'sourceId'] if attributes[:'sourceId']

      raise 'You cannot provide both :sourceId and :source_id' if attributes.key?(:'sourceId') && attributes.key?(:'source_id')

      self.source_id = attributes[:'source_id'] if attributes[:'source_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

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
        id == other.id &&
        name == other.name &&
        compartment_id == other.compartment_id &&
        entity_type_name == other.entity_type_name &&
        entity_type_internal_name == other.entity_type_internal_name &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        management_agent_id == other.management_agent_id &&
        cloud_resource_id == other.cloud_resource_id &&
        timezone_region == other.timezone_region &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        are_logs_collected == other.are_logs_collected &&
        source_id == other.source_id
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
      [id, name, compartment_id, entity_type_name, entity_type_internal_name, lifecycle_state, lifecycle_details, management_agent_id, cloud_resource_id, timezone_region, time_created, time_updated, are_logs_collected, source_id].hash
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
