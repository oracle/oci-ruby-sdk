# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of the Management Agent inventory including the associated plugins.
  class ManagementAgent::Models::ManagementAgent
    PLATFORM_TYPE_ENUM = [
      PLATFORM_TYPE_LINUX = 'LINUX'.freeze,
      PLATFORM_TYPE_WINDOWS = 'WINDOWS'.freeze,
      PLATFORM_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    AVAILABILITY_STATUS_ENUM = [
      AVAILABILITY_STATUS_ACTIVE = 'ACTIVE'.freeze,
      AVAILABILITY_STATUS_SILENT = 'SILENT'.freeze,
      AVAILABILITY_STATUS_NOT_AVAILABLE = 'NOT_AVAILABLE'.freeze,
      AVAILABILITY_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** agent identifier
    # @return [String]
    attr_accessor :id

    # agent install key identifier
    # @return [String]
    attr_accessor :install_key_id

    # Management Agent Name
    # @return [String]
    attr_accessor :display_name

    # Platform Type
    # @return [String]
    attr_reader :platform_type

    # Platform Name
    # @return [String]
    attr_accessor :platform_name

    # Platform Version
    # @return [String]
    attr_accessor :platform_version

    # **[Required]** Management Agent Version
    # @return [String]
    attr_accessor :version

    # Management Agent host machine name
    # @return [String]
    attr_accessor :host

    # Path where Management Agent is installed
    # @return [String]
    attr_accessor :install_path

    # list of managementAgentPlugins associated with the agent
    # @return [Array<OCI::ManagementAgent::Models::ManagementAgentPluginDetails>]
    attr_accessor :plugin_list

    # **[Required]** Compartment Identifier
    # @return [String]
    attr_accessor :compartment_id

    # true if the agent can be upgraded automatically; false if it must be upgraded manually. true is currently unsupported.
    # @return [BOOLEAN]
    attr_accessor :is_agent_auto_upgradable

    # The time the Management Agent was created. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_created

    # The time the Management Agent was updated. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_updated

    # The time the Management Agent has last recorded its health status in telemetry. This value will be null if the agent has not recorded its health status in last 7 days. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_last_heartbeat

    # The current availability status of managementAgent
    # @return [String]
    attr_reader :availability_status

    # The current state of managementAgent
    # @return [String]
    attr_reader :lifecycle_state

    # A message describing the current state in more detail. For example, can be used to provide actionable information for a resource in Failed state.
    # @return [String]
    attr_accessor :lifecycle_details

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'install_key_id': :'installKeyId',
        'display_name': :'displayName',
        'platform_type': :'platformType',
        'platform_name': :'platformName',
        'platform_version': :'platformVersion',
        'version': :'version',
        'host': :'host',
        'install_path': :'installPath',
        'plugin_list': :'pluginList',
        'compartment_id': :'compartmentId',
        'is_agent_auto_upgradable': :'isAgentAutoUpgradable',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'time_last_heartbeat': :'timeLastHeartbeat',
        'availability_status': :'availabilityStatus',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'install_key_id': :'String',
        'display_name': :'String',
        'platform_type': :'String',
        'platform_name': :'String',
        'platform_version': :'String',
        'version': :'String',
        'host': :'String',
        'install_path': :'String',
        'plugin_list': :'Array<OCI::ManagementAgent::Models::ManagementAgentPluginDetails>',
        'compartment_id': :'String',
        'is_agent_auto_upgradable': :'BOOLEAN',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'time_last_heartbeat': :'DateTime',
        'availability_status': :'String',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :install_key_id The value to assign to the {#install_key_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :platform_type The value to assign to the {#platform_type} property
    # @option attributes [String] :platform_name The value to assign to the {#platform_name} property
    # @option attributes [String] :platform_version The value to assign to the {#platform_version} property
    # @option attributes [String] :version The value to assign to the {#version} property
    # @option attributes [String] :host The value to assign to the {#host} property
    # @option attributes [String] :install_path The value to assign to the {#install_path} property
    # @option attributes [Array<OCI::ManagementAgent::Models::ManagementAgentPluginDetails>] :plugin_list The value to assign to the {#plugin_list} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [BOOLEAN] :is_agent_auto_upgradable The value to assign to the {#is_agent_auto_upgradable} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [DateTime] :time_last_heartbeat The value to assign to the {#time_last_heartbeat} property
    # @option attributes [String] :availability_status The value to assign to the {#availability_status} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.install_key_id = attributes[:'installKeyId'] if attributes[:'installKeyId']

      raise 'You cannot provide both :installKeyId and :install_key_id' if attributes.key?(:'installKeyId') && attributes.key?(:'install_key_id')

      self.install_key_id = attributes[:'install_key_id'] if attributes[:'install_key_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.platform_type = attributes[:'platformType'] if attributes[:'platformType']

      raise 'You cannot provide both :platformType and :platform_type' if attributes.key?(:'platformType') && attributes.key?(:'platform_type')

      self.platform_type = attributes[:'platform_type'] if attributes[:'platform_type']

      self.platform_name = attributes[:'platformName'] if attributes[:'platformName']

      raise 'You cannot provide both :platformName and :platform_name' if attributes.key?(:'platformName') && attributes.key?(:'platform_name')

      self.platform_name = attributes[:'platform_name'] if attributes[:'platform_name']

      self.platform_version = attributes[:'platformVersion'] if attributes[:'platformVersion']

      raise 'You cannot provide both :platformVersion and :platform_version' if attributes.key?(:'platformVersion') && attributes.key?(:'platform_version')

      self.platform_version = attributes[:'platform_version'] if attributes[:'platform_version']

      self.version = attributes[:'version'] if attributes[:'version']

      self.host = attributes[:'host'] if attributes[:'host']

      self.install_path = attributes[:'installPath'] if attributes[:'installPath']

      raise 'You cannot provide both :installPath and :install_path' if attributes.key?(:'installPath') && attributes.key?(:'install_path')

      self.install_path = attributes[:'install_path'] if attributes[:'install_path']

      self.plugin_list = attributes[:'pluginList'] if attributes[:'pluginList']

      raise 'You cannot provide both :pluginList and :plugin_list' if attributes.key?(:'pluginList') && attributes.key?(:'plugin_list')

      self.plugin_list = attributes[:'plugin_list'] if attributes[:'plugin_list']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.is_agent_auto_upgradable = attributes[:'isAgentAutoUpgradable'] unless attributes[:'isAgentAutoUpgradable'].nil?

      raise 'You cannot provide both :isAgentAutoUpgradable and :is_agent_auto_upgradable' if attributes.key?(:'isAgentAutoUpgradable') && attributes.key?(:'is_agent_auto_upgradable')

      self.is_agent_auto_upgradable = attributes[:'is_agent_auto_upgradable'] unless attributes[:'is_agent_auto_upgradable'].nil?

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.time_last_heartbeat = attributes[:'timeLastHeartbeat'] if attributes[:'timeLastHeartbeat']

      raise 'You cannot provide both :timeLastHeartbeat and :time_last_heartbeat' if attributes.key?(:'timeLastHeartbeat') && attributes.key?(:'time_last_heartbeat')

      self.time_last_heartbeat = attributes[:'time_last_heartbeat'] if attributes[:'time_last_heartbeat']

      self.availability_status = attributes[:'availabilityStatus'] if attributes[:'availabilityStatus']

      raise 'You cannot provide both :availabilityStatus and :availability_status' if attributes.key?(:'availabilityStatus') && attributes.key?(:'availability_status')

      self.availability_status = attributes[:'availability_status'] if attributes[:'availability_status']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] platform_type Object to be assigned
    def platform_type=(platform_type)
      # rubocop:disable Style/ConditionalAssignment
      if platform_type && !PLATFORM_TYPE_ENUM.include?(platform_type)
        OCI.logger.debug("Unknown value for 'platform_type' [" + platform_type + "]. Mapping to 'PLATFORM_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @platform_type = PLATFORM_TYPE_UNKNOWN_ENUM_VALUE
      else
        @platform_type = platform_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

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
        install_key_id == other.install_key_id &&
        display_name == other.display_name &&
        platform_type == other.platform_type &&
        platform_name == other.platform_name &&
        platform_version == other.platform_version &&
        version == other.version &&
        host == other.host &&
        install_path == other.install_path &&
        plugin_list == other.plugin_list &&
        compartment_id == other.compartment_id &&
        is_agent_auto_upgradable == other.is_agent_auto_upgradable &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        time_last_heartbeat == other.time_last_heartbeat &&
        availability_status == other.availability_status &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
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
      [id, install_key_id, display_name, platform_type, platform_name, platform_version, version, host, install_path, plugin_list, compartment_id, is_agent_auto_upgradable, time_created, time_updated, time_last_heartbeat, availability_status, lifecycle_state, lifecycle_details, freeform_tags, defined_tags].hash
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
