# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20221208
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The Oracle Cloud Infrastructure resource representing the connection to the hardware and
  # software located in a customer's data center running the Compute Cloud@Customer IaaS services.
  #
  class ComputeCloudAtCustomer::Models::CccInfrastructure
    CONNECTION_STATE_ENUM = [
      CONNECTION_STATE_REJECT = 'REJECT'.freeze,
      CONNECTION_STATE_REQUEST = 'REQUEST'.freeze,
      CONNECTION_STATE_READY = 'READY'.freeze,
      CONNECTION_STATE_CONNECTED = 'CONNECTED'.freeze,
      CONNECTION_STATE_DISCONNECTED = 'DISCONNECTED'.freeze,
      CONNECTION_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_NEEDS_ATTENTION = 'NEEDS_ATTENTION'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The Compute Cloud@Customer infrastructure [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # This cannot be changed once created.
    #
    # @return [String]
    attr_accessor :id

    # The Compute Cloud@Customer infrastructure short name.
    # This cannot be changed once created. The
    # short name is used to refer to the infrastructure in several contexts and is unique.
    #
    # @return [String]
    attr_accessor :short_name

    # **[Required]** The name that will be used to display the Compute Cloud@Customer infrastructure
    # in the Oracle Cloud Infrastructure console. Does not have to be unique and can be changed.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # A mutable client-meaningful text description of the Compute Cloud@Customer infrastructure.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :description

    # **[Required]** The infrastructure compartment [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the network subnet that is
    # used to communicate with Compute Cloud@Customer infrastructure.
    #
    # @return [String]
    attr_accessor :subnet_id

    # The current connection state of the infrastructure. A user can only update
    # it from REQUEST to READY or from any state back to REJECT. The system automatically
    # handles the REJECT to REQUEST, READY to CONNECTED, or CONNECTED to DISCONNECTED transitions.
    #
    # @return [String]
    attr_reader :connection_state

    # A message describing the current connection state in more detail.
    #
    # @return [String]
    attr_accessor :connection_details

    # Schedule used for upgrades. If no schedule is associated with the infrastructure,
    # it can be updated at any time.
    #
    # @return [String]
    attr_accessor :ccc_upgrade_schedule_id

    # Fingerprint of a Compute Cloud@Customer infrastructure in a data center generated
    # during the initial connection to this resource. The fingerprint should be verified
    # by the administrator when changing the connectionState from REQUEST to READY.
    #
    # @return [String]
    attr_accessor :provisioning_fingerprint

    # Code that is required for service personnel to connect a
    # Compute Cloud@Customer infrastructure in a data center to this resource.
    # This code will only be available when the connectionState is REJECT (usually
    # at create time of the Compute Cloud@Customer infrastructure).
    #
    # @return [String]
    attr_accessor :provisioning_pin

    # **[Required]** Compute Cloud@Customer infrastructure creation date and time, using an RFC3339 formatted
    # datetime string.
    #
    # @return [DateTime]
    attr_accessor :time_created

    # Compute Cloud@Customer infrastructure updated date and time, using an RFC3339 formatted
    # datetime string.
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** The current state of the Compute Cloud@Customer infrastructure.
    # @return [String]
    attr_reader :lifecycle_state

    # A message describing the current lifecycle state in more detail.
    # For example, this can be used to provide actionable information for a resource that is in
    # a Failed state.
    #
    # @return [String]
    attr_accessor :lifecycle_details

    # @return [OCI::ComputeCloudAtCustomer::Models::CccInfrastructureInventory]
    attr_accessor :infrastructure_inventory

    # @return [OCI::ComputeCloudAtCustomer::Models::CccInfrastructureNetworkConfiguration]
    attr_accessor :infrastructure_network_configuration

    # @return [OCI::ComputeCloudAtCustomer::Models::CccUpgradeInformation]
    attr_accessor :upgrade_information

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

    # System tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'short_name': :'shortName',
        'display_name': :'displayName',
        'description': :'description',
        'compartment_id': :'compartmentId',
        'subnet_id': :'subnetId',
        'connection_state': :'connectionState',
        'connection_details': :'connectionDetails',
        'ccc_upgrade_schedule_id': :'cccUpgradeScheduleId',
        'provisioning_fingerprint': :'provisioningFingerprint',
        'provisioning_pin': :'provisioningPin',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'infrastructure_inventory': :'infrastructureInventory',
        'infrastructure_network_configuration': :'infrastructureNetworkConfiguration',
        'upgrade_information': :'upgradeInformation',
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
        'short_name': :'String',
        'display_name': :'String',
        'description': :'String',
        'compartment_id': :'String',
        'subnet_id': :'String',
        'connection_state': :'String',
        'connection_details': :'String',
        'ccc_upgrade_schedule_id': :'String',
        'provisioning_fingerprint': :'String',
        'provisioning_pin': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'infrastructure_inventory': :'OCI::ComputeCloudAtCustomer::Models::CccInfrastructureInventory',
        'infrastructure_network_configuration': :'OCI::ComputeCloudAtCustomer::Models::CccInfrastructureNetworkConfiguration',
        'upgrade_information': :'OCI::ComputeCloudAtCustomer::Models::CccUpgradeInformation',
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
    # @option attributes [String] :short_name The value to assign to the {#short_name} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [String] :connection_state The value to assign to the {#connection_state} property
    # @option attributes [String] :connection_details The value to assign to the {#connection_details} property
    # @option attributes [String] :ccc_upgrade_schedule_id The value to assign to the {#ccc_upgrade_schedule_id} property
    # @option attributes [String] :provisioning_fingerprint The value to assign to the {#provisioning_fingerprint} property
    # @option attributes [String] :provisioning_pin The value to assign to the {#provisioning_pin} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [OCI::ComputeCloudAtCustomer::Models::CccInfrastructureInventory] :infrastructure_inventory The value to assign to the {#infrastructure_inventory} property
    # @option attributes [OCI::ComputeCloudAtCustomer::Models::CccInfrastructureNetworkConfiguration] :infrastructure_network_configuration The value to assign to the {#infrastructure_network_configuration} property
    # @option attributes [OCI::ComputeCloudAtCustomer::Models::CccUpgradeInformation] :upgrade_information The value to assign to the {#upgrade_information} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.short_name = attributes[:'shortName'] if attributes[:'shortName']

      raise 'You cannot provide both :shortName and :short_name' if attributes.key?(:'shortName') && attributes.key?(:'short_name')

      self.short_name = attributes[:'short_name'] if attributes[:'short_name']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.connection_state = attributes[:'connectionState'] if attributes[:'connectionState']

      raise 'You cannot provide both :connectionState and :connection_state' if attributes.key?(:'connectionState') && attributes.key?(:'connection_state')

      self.connection_state = attributes[:'connection_state'] if attributes[:'connection_state']

      self.connection_details = attributes[:'connectionDetails'] if attributes[:'connectionDetails']

      raise 'You cannot provide both :connectionDetails and :connection_details' if attributes.key?(:'connectionDetails') && attributes.key?(:'connection_details')

      self.connection_details = attributes[:'connection_details'] if attributes[:'connection_details']

      self.ccc_upgrade_schedule_id = attributes[:'cccUpgradeScheduleId'] if attributes[:'cccUpgradeScheduleId']

      raise 'You cannot provide both :cccUpgradeScheduleId and :ccc_upgrade_schedule_id' if attributes.key?(:'cccUpgradeScheduleId') && attributes.key?(:'ccc_upgrade_schedule_id')

      self.ccc_upgrade_schedule_id = attributes[:'ccc_upgrade_schedule_id'] if attributes[:'ccc_upgrade_schedule_id']

      self.provisioning_fingerprint = attributes[:'provisioningFingerprint'] if attributes[:'provisioningFingerprint']

      raise 'You cannot provide both :provisioningFingerprint and :provisioning_fingerprint' if attributes.key?(:'provisioningFingerprint') && attributes.key?(:'provisioning_fingerprint')

      self.provisioning_fingerprint = attributes[:'provisioning_fingerprint'] if attributes[:'provisioning_fingerprint']

      self.provisioning_pin = attributes[:'provisioningPin'] if attributes[:'provisioningPin']

      raise 'You cannot provide both :provisioningPin and :provisioning_pin' if attributes.key?(:'provisioningPin') && attributes.key?(:'provisioning_pin')

      self.provisioning_pin = attributes[:'provisioning_pin'] if attributes[:'provisioning_pin']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.infrastructure_inventory = attributes[:'infrastructureInventory'] if attributes[:'infrastructureInventory']

      raise 'You cannot provide both :infrastructureInventory and :infrastructure_inventory' if attributes.key?(:'infrastructureInventory') && attributes.key?(:'infrastructure_inventory')

      self.infrastructure_inventory = attributes[:'infrastructure_inventory'] if attributes[:'infrastructure_inventory']

      self.infrastructure_network_configuration = attributes[:'infrastructureNetworkConfiguration'] if attributes[:'infrastructureNetworkConfiguration']

      raise 'You cannot provide both :infrastructureNetworkConfiguration and :infrastructure_network_configuration' if attributes.key?(:'infrastructureNetworkConfiguration') && attributes.key?(:'infrastructure_network_configuration')

      self.infrastructure_network_configuration = attributes[:'infrastructure_network_configuration'] if attributes[:'infrastructure_network_configuration']

      self.upgrade_information = attributes[:'upgradeInformation'] if attributes[:'upgradeInformation']

      raise 'You cannot provide both :upgradeInformation and :upgrade_information' if attributes.key?(:'upgradeInformation') && attributes.key?(:'upgrade_information')

      self.upgrade_information = attributes[:'upgrade_information'] if attributes[:'upgrade_information']

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
    # @param [Object] connection_state Object to be assigned
    def connection_state=(connection_state)
      # rubocop:disable Style/ConditionalAssignment
      if connection_state && !CONNECTION_STATE_ENUM.include?(connection_state)
        OCI.logger.debug("Unknown value for 'connection_state' [" + connection_state + "]. Mapping to 'CONNECTION_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @connection_state = CONNECTION_STATE_UNKNOWN_ENUM_VALUE
      else
        @connection_state = connection_state
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
        short_name == other.short_name &&
        display_name == other.display_name &&
        description == other.description &&
        compartment_id == other.compartment_id &&
        subnet_id == other.subnet_id &&
        connection_state == other.connection_state &&
        connection_details == other.connection_details &&
        ccc_upgrade_schedule_id == other.ccc_upgrade_schedule_id &&
        provisioning_fingerprint == other.provisioning_fingerprint &&
        provisioning_pin == other.provisioning_pin &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        infrastructure_inventory == other.infrastructure_inventory &&
        infrastructure_network_configuration == other.infrastructure_network_configuration &&
        upgrade_information == other.upgrade_information &&
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
      [id, short_name, display_name, description, compartment_id, subnet_id, connection_state, connection_details, ccc_upgrade_schedule_id, provisioning_fingerprint, provisioning_pin, time_created, time_updated, lifecycle_state, lifecycle_details, infrastructure_inventory, infrastructure_network_configuration, upgrade_information, freeform_tags, defined_tags, system_tags].hash
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
