# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of the Integration Instance.
  class Integration::Models::IntegrationInstanceSummary
    INTEGRATION_INSTANCE_TYPE_ENUM = [
      INTEGRATION_INSTANCE_TYPE_STANDARD = 'STANDARD'.freeze,
      INTEGRATION_INSTANCE_TYPE_ENTERPRISE = 'ENTERPRISE'.freeze,
      INTEGRATION_INSTANCE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
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

    CONSUMPTION_MODEL_ENUM = [
      CONSUMPTION_MODEL_UCM = 'UCM'.freeze,
      CONSUMPTION_MODEL_GOV = 'GOV'.freeze,
      CONSUMPTION_MODEL_OIC4_SAAS = 'OIC4SAAS'.freeze,
      CONSUMPTION_MODEL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Unique identifier that is immutable on creation.
    # @return [String]
    attr_accessor :id

    # **[Required]** Integration Instance Identifier, can be renamed.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** Compartment Identifier.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** Standard or Enterprise type
    # @return [String]
    attr_reader :integration_instance_type

    # The time the the Integration Instance was created. An RFC3339 formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_created

    # The time the IntegrationInstance was updated. An RFC3339 formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_updated

    # The current state of the Integration Instance.
    # @return [String]
    attr_reader :lifecycle_state

    # An message describing the current state in more detail. For example, can be used to provide actionable information for a resource in Failed state.
    # @return [String]
    attr_accessor :state_message

    # **[Required]** Bring your own license.
    # @return [BOOLEAN]
    attr_accessor :is_byol

    # **[Required]** The Integration Instance URL.
    # @return [String]
    attr_accessor :instance_url

    # **[Required]** The number of configured message packs (if any)
    # @return [Integer]
    attr_accessor :message_packs

    # The file server is enabled or not.
    # @return [BOOLEAN]
    attr_accessor :is_file_server_enabled

    # The entitlement used for billing purposes.
    # @return [String]
    attr_reader :consumption_model

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'compartment_id': :'compartmentId',
        'integration_instance_type': :'integrationInstanceType',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'state_message': :'stateMessage',
        'is_byol': :'isByol',
        'instance_url': :'instanceUrl',
        'message_packs': :'messagePacks',
        'is_file_server_enabled': :'isFileServerEnabled',
        'consumption_model': :'consumptionModel'
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
        'integration_instance_type': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'state_message': :'String',
        'is_byol': :'BOOLEAN',
        'instance_url': :'String',
        'message_packs': :'Integer',
        'is_file_server_enabled': :'BOOLEAN',
        'consumption_model': :'String'
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
    # @option attributes [String] :integration_instance_type The value to assign to the {#integration_instance_type} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :state_message The value to assign to the {#state_message} property
    # @option attributes [BOOLEAN] :is_byol The value to assign to the {#is_byol} property
    # @option attributes [String] :instance_url The value to assign to the {#instance_url} property
    # @option attributes [Integer] :message_packs The value to assign to the {#message_packs} property
    # @option attributes [BOOLEAN] :is_file_server_enabled The value to assign to the {#is_file_server_enabled} property
    # @option attributes [String] :consumption_model The value to assign to the {#consumption_model} property
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

      self.integration_instance_type = attributes[:'integrationInstanceType'] if attributes[:'integrationInstanceType']

      raise 'You cannot provide both :integrationInstanceType and :integration_instance_type' if attributes.key?(:'integrationInstanceType') && attributes.key?(:'integration_instance_type')

      self.integration_instance_type = attributes[:'integration_instance_type'] if attributes[:'integration_instance_type']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.state_message = attributes[:'stateMessage'] if attributes[:'stateMessage']

      raise 'You cannot provide both :stateMessage and :state_message' if attributes.key?(:'stateMessage') && attributes.key?(:'state_message')

      self.state_message = attributes[:'state_message'] if attributes[:'state_message']

      self.is_byol = attributes[:'isByol'] unless attributes[:'isByol'].nil?

      raise 'You cannot provide both :isByol and :is_byol' if attributes.key?(:'isByol') && attributes.key?(:'is_byol')

      self.is_byol = attributes[:'is_byol'] unless attributes[:'is_byol'].nil?

      self.instance_url = attributes[:'instanceUrl'] if attributes[:'instanceUrl']

      raise 'You cannot provide both :instanceUrl and :instance_url' if attributes.key?(:'instanceUrl') && attributes.key?(:'instance_url')

      self.instance_url = attributes[:'instance_url'] if attributes[:'instance_url']

      self.message_packs = attributes[:'messagePacks'] if attributes[:'messagePacks']

      raise 'You cannot provide both :messagePacks and :message_packs' if attributes.key?(:'messagePacks') && attributes.key?(:'message_packs')

      self.message_packs = attributes[:'message_packs'] if attributes[:'message_packs']

      self.is_file_server_enabled = attributes[:'isFileServerEnabled'] unless attributes[:'isFileServerEnabled'].nil?

      raise 'You cannot provide both :isFileServerEnabled and :is_file_server_enabled' if attributes.key?(:'isFileServerEnabled') && attributes.key?(:'is_file_server_enabled')

      self.is_file_server_enabled = attributes[:'is_file_server_enabled'] unless attributes[:'is_file_server_enabled'].nil?

      self.consumption_model = attributes[:'consumptionModel'] if attributes[:'consumptionModel']

      raise 'You cannot provide both :consumptionModel and :consumption_model' if attributes.key?(:'consumptionModel') && attributes.key?(:'consumption_model')

      self.consumption_model = attributes[:'consumption_model'] if attributes[:'consumption_model']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] integration_instance_type Object to be assigned
    def integration_instance_type=(integration_instance_type)
      # rubocop:disable Style/ConditionalAssignment
      if integration_instance_type && !INTEGRATION_INSTANCE_TYPE_ENUM.include?(integration_instance_type)
        OCI.logger.debug("Unknown value for 'integration_instance_type' [" + integration_instance_type + "]. Mapping to 'INTEGRATION_INSTANCE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @integration_instance_type = INTEGRATION_INSTANCE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @integration_instance_type = integration_instance_type
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] consumption_model Object to be assigned
    def consumption_model=(consumption_model)
      # rubocop:disable Style/ConditionalAssignment
      if consumption_model && !CONSUMPTION_MODEL_ENUM.include?(consumption_model)
        OCI.logger.debug("Unknown value for 'consumption_model' [" + consumption_model + "]. Mapping to 'CONSUMPTION_MODEL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @consumption_model = CONSUMPTION_MODEL_UNKNOWN_ENUM_VALUE
      else
        @consumption_model = consumption_model
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
        integration_instance_type == other.integration_instance_type &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        state_message == other.state_message &&
        is_byol == other.is_byol &&
        instance_url == other.instance_url &&
        message_packs == other.message_packs &&
        is_file_server_enabled == other.is_file_server_enabled &&
        consumption_model == other.consumption_model
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
      [id, display_name, compartment_id, integration_instance_type, time_created, time_updated, lifecycle_state, state_message, is_byol, instance_url, message_packs, is_file_server_enabled, consumption_model].hash
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
