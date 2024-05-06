# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220509
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Description of Agent.
  class CloudBridge::Models::Agent
    AGENT_TYPE_ENUM = [
      AGENT_TYPE_APPLIANCE = 'APPLIANCE'.freeze,
      AGENT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    HEART_BEAT_STATUS_ENUM = [
      HEART_BEAT_STATUS_HEALTHY = 'HEALTHY'.freeze,
      HEART_BEAT_STATUS_UNHEALTHY = 'UNHEALTHY'.freeze,
      HEART_BEAT_STATUS_FAILED = 'FAILED'.freeze,
      HEART_BEAT_STATUS_INACTIVE = 'INACTIVE'.freeze,
      HEART_BEAT_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Unique identifier that is immutable on creation.
    # @return [String]
    attr_accessor :id

    # **[Required]** Agent identifier, can be renamed.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** Compartment identifier.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** Type of the Agent.
    # @return [String]
    attr_reader :agent_type

    # **[Required]** Agent identifier.
    # @return [String]
    attr_accessor :agent_version

    # **[Required]** OS version.
    # @return [String]
    attr_accessor :os_version

    # **[Required]** The time when the Agent was created. An RFC3339 formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_created

    # The time when the Agent was updated. An RFC3339 formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_updated

    # The time when the last heartbeat of the Agent was noted. An RFC3339 formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_last_sync_received

    # The current heartbeat status of the Agent based on its timeLastSyncReceived value.
    # @return [String]
    attr_reader :heart_beat_status

    # **[Required]** Environment identifier.
    # @return [String]
    attr_accessor :environment_id

    # Resource principal public key.
    # @return [String]
    attr_accessor :agent_pub_key

    # The time since epoch for when the public key will expire. An RFC3339 formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_expire_agent_key_in_ms

    # **[Required]** The current state of the Agent.
    # @return [String]
    attr_reader :lifecycle_state

    # A message describing the current state of the Agent in more detail. For example, it can be used to provide actionable information for a resource in Failed state.
    # @return [String]
    attr_accessor :lifecycle_details

    # List of plugins associated with the agent.
    # @return [Array<OCI::CloudBridge::Models::PluginSummary>]
    attr_accessor :plugin_list

    # **[Required]** The freeform tags associated with this resource, if any. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace/scope. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # **[Required]** The defined tags associated with this resource, if any. Each key is predefined and scoped to namespaces.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # The system tags associated with this resource, if any. The system tags are set by Oracle cloud infrastructure services. Each key is predefined and scoped to namespaces.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    # Example: `{orcl-cloud: {free-tier-retain: true}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'compartment_id': :'compartmentId',
        'agent_type': :'agentType',
        'agent_version': :'agentVersion',
        'os_version': :'osVersion',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'time_last_sync_received': :'timeLastSyncReceived',
        'heart_beat_status': :'heartBeatStatus',
        'environment_id': :'environmentId',
        'agent_pub_key': :'agentPubKey',
        'time_expire_agent_key_in_ms': :'timeExpireAgentKeyInMs',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'plugin_list': :'pluginList',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'display_name': :'String',
        'compartment_id': :'String',
        'agent_type': :'String',
        'agent_version': :'String',
        'os_version': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'time_last_sync_received': :'DateTime',
        'heart_beat_status': :'String',
        'environment_id': :'String',
        'agent_pub_key': :'String',
        'time_expire_agent_key_in_ms': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'plugin_list': :'Array<OCI::CloudBridge::Models::PluginSummary>',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :agent_type The value to assign to the {#agent_type} property
    # @option attributes [String] :agent_version The value to assign to the {#agent_version} property
    # @option attributes [String] :os_version The value to assign to the {#os_version} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [DateTime] :time_last_sync_received The value to assign to the {#time_last_sync_received} property
    # @option attributes [String] :heart_beat_status The value to assign to the {#heart_beat_status} property
    # @option attributes [String] :environment_id The value to assign to the {#environment_id} property
    # @option attributes [String] :agent_pub_key The value to assign to the {#agent_pub_key} property
    # @option attributes [DateTime] :time_expire_agent_key_in_ms The value to assign to the {#time_expire_agent_key_in_ms} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [Array<OCI::CloudBridge::Models::PluginSummary>] :plugin_list The value to assign to the {#plugin_list} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.agent_type = attributes[:'agentType'] if attributes[:'agentType']

      raise 'You cannot provide both :agentType and :agent_type' if attributes.key?(:'agentType') && attributes.key?(:'agent_type')

      self.agent_type = attributes[:'agent_type'] if attributes[:'agent_type']

      self.agent_version = attributes[:'agentVersion'] if attributes[:'agentVersion']

      raise 'You cannot provide both :agentVersion and :agent_version' if attributes.key?(:'agentVersion') && attributes.key?(:'agent_version')

      self.agent_version = attributes[:'agent_version'] if attributes[:'agent_version']

      self.os_version = attributes[:'osVersion'] if attributes[:'osVersion']

      raise 'You cannot provide both :osVersion and :os_version' if attributes.key?(:'osVersion') && attributes.key?(:'os_version')

      self.os_version = attributes[:'os_version'] if attributes[:'os_version']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.time_last_sync_received = attributes[:'timeLastSyncReceived'] if attributes[:'timeLastSyncReceived']

      raise 'You cannot provide both :timeLastSyncReceived and :time_last_sync_received' if attributes.key?(:'timeLastSyncReceived') && attributes.key?(:'time_last_sync_received')

      self.time_last_sync_received = attributes[:'time_last_sync_received'] if attributes[:'time_last_sync_received']

      self.heart_beat_status = attributes[:'heartBeatStatus'] if attributes[:'heartBeatStatus']

      raise 'You cannot provide both :heartBeatStatus and :heart_beat_status' if attributes.key?(:'heartBeatStatus') && attributes.key?(:'heart_beat_status')

      self.heart_beat_status = attributes[:'heart_beat_status'] if attributes[:'heart_beat_status']

      self.environment_id = attributes[:'environmentId'] if attributes[:'environmentId']

      raise 'You cannot provide both :environmentId and :environment_id' if attributes.key?(:'environmentId') && attributes.key?(:'environment_id')

      self.environment_id = attributes[:'environment_id'] if attributes[:'environment_id']

      self.agent_pub_key = attributes[:'agentPubKey'] if attributes[:'agentPubKey']

      raise 'You cannot provide both :agentPubKey and :agent_pub_key' if attributes.key?(:'agentPubKey') && attributes.key?(:'agent_pub_key')

      self.agent_pub_key = attributes[:'agent_pub_key'] if attributes[:'agent_pub_key']

      self.time_expire_agent_key_in_ms = attributes[:'timeExpireAgentKeyInMs'] if attributes[:'timeExpireAgentKeyInMs']

      raise 'You cannot provide both :timeExpireAgentKeyInMs and :time_expire_agent_key_in_ms' if attributes.key?(:'timeExpireAgentKeyInMs') && attributes.key?(:'time_expire_agent_key_in_ms')

      self.time_expire_agent_key_in_ms = attributes[:'time_expire_agent_key_in_ms'] if attributes[:'time_expire_agent_key_in_ms']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.plugin_list = attributes[:'pluginList'] if attributes[:'pluginList']

      raise 'You cannot provide both :pluginList and :plugin_list' if attributes.key?(:'pluginList') && attributes.key?(:'plugin_list')

      self.plugin_list = attributes[:'plugin_list'] if attributes[:'plugin_list']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] agent_type Object to be assigned
    def agent_type=(agent_type)
      # rubocop:disable Style/ConditionalAssignment
      if agent_type && !AGENT_TYPE_ENUM.include?(agent_type)
        OCI.logger.debug("Unknown value for 'agent_type' [" + agent_type + "]. Mapping to 'AGENT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @agent_type = AGENT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @agent_type = agent_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] heart_beat_status Object to be assigned
    def heart_beat_status=(heart_beat_status)
      # rubocop:disable Style/ConditionalAssignment
      if heart_beat_status && !HEART_BEAT_STATUS_ENUM.include?(heart_beat_status)
        OCI.logger.debug("Unknown value for 'heart_beat_status' [" + heart_beat_status + "]. Mapping to 'HEART_BEAT_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @heart_beat_status = HEART_BEAT_STATUS_UNKNOWN_ENUM_VALUE
      else
        @heart_beat_status = heart_beat_status
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
        id == other.id &&
        display_name == other.display_name &&
        compartment_id == other.compartment_id &&
        agent_type == other.agent_type &&
        agent_version == other.agent_version &&
        os_version == other.os_version &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        time_last_sync_received == other.time_last_sync_received &&
        heart_beat_status == other.heart_beat_status &&
        environment_id == other.environment_id &&
        agent_pub_key == other.agent_pub_key &&
        time_expire_agent_key_in_ms == other.time_expire_agent_key_in_ms &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        plugin_list == other.plugin_list &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags
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
      [id, display_name, compartment_id, agent_type, agent_version, os_version, time_created, time_updated, time_last_sync_received, heart_beat_status, environment_id, agent_pub_key, time_expire_agent_key_in_ms, lifecycle_state, lifecycle_details, plugin_list, freeform_tags, defined_tags, system_tags].hash
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