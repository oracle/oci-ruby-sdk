# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20160918
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Autonomous Virtual Machine details.
  class Database::Models::AutonomousVirtualMachine
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_MAINTENANCE_IN_PROGRESS = 'MAINTENANCE_IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Autonomous Virtual Machine.
    # @return [String]
    attr_accessor :id

    # The name of the Autonomous Virtual Machine.
    # @return [String]
    attr_accessor :vm_name

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Db server associated with the Autonomous Virtual Machine.
    # @return [String]
    attr_accessor :db_server_id

    # The display name of the dbServer associated with the Autonomous Virtual Machine.
    # @return [String]
    attr_accessor :db_server_display_name

    # The number of CPU cores enabled on the Autonomous Virtual Machine.
    # @return [Integer]
    attr_accessor :cpu_core_count

    # The allocated memory in GBs on the Autonomous Virtual Machine.
    # @return [Integer]
    attr_accessor :memory_size_in_gbs

    # The allocated local node storage in GBs on the Autonomous Virtual Machine.
    # @return [Integer]
    attr_accessor :db_node_storage_size_in_gbs

    # **[Required]** The current state of the Autonomous Virtual Machine.
    # @return [String]
    attr_reader :lifecycle_state

    # Client IP Address.
    # @return [String]
    attr_accessor :client_ip_address

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Autonomous VM Cluster associated with the Autonomous Virtual Machine.
    # @return [String]
    attr_accessor :autonomous_vm_cluster_id

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Cloud Autonomous VM Cluster associated with the Autonomous Virtual Machine.
    # @return [String]
    attr_accessor :cloud_autonomous_vm_cluster_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'vm_name': :'vmName',
        'db_server_id': :'dbServerId',
        'db_server_display_name': :'dbServerDisplayName',
        'cpu_core_count': :'cpuCoreCount',
        'memory_size_in_gbs': :'memorySizeInGBs',
        'db_node_storage_size_in_gbs': :'dbNodeStorageSizeInGBs',
        'lifecycle_state': :'lifecycleState',
        'client_ip_address': :'clientIpAddress',
        'compartment_id': :'compartmentId',
        'autonomous_vm_cluster_id': :'autonomousVmClusterId',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'cloud_autonomous_vm_cluster_id': :'cloudAutonomousVmClusterId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'vm_name': :'String',
        'db_server_id': :'String',
        'db_server_display_name': :'String',
        'cpu_core_count': :'Integer',
        'memory_size_in_gbs': :'Integer',
        'db_node_storage_size_in_gbs': :'Integer',
        'lifecycle_state': :'String',
        'client_ip_address': :'String',
        'compartment_id': :'String',
        'autonomous_vm_cluster_id': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'cloud_autonomous_vm_cluster_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :vm_name The value to assign to the {#vm_name} property
    # @option attributes [String] :db_server_id The value to assign to the {#db_server_id} property
    # @option attributes [String] :db_server_display_name The value to assign to the {#db_server_display_name} property
    # @option attributes [Integer] :cpu_core_count The value to assign to the {#cpu_core_count} property
    # @option attributes [Integer] :memory_size_in_gbs The value to assign to the {#memory_size_in_gbs} property
    # @option attributes [Integer] :db_node_storage_size_in_gbs The value to assign to the {#db_node_storage_size_in_gbs} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :client_ip_address The value to assign to the {#client_ip_address} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :autonomous_vm_cluster_id The value to assign to the {#autonomous_vm_cluster_id} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :cloud_autonomous_vm_cluster_id The value to assign to the {#cloud_autonomous_vm_cluster_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      self.id = attributes[:'id'] if attributes[:'id']

      self.vm_name = attributes[:'vmName'] if attributes[:'vmName']

      raise 'You cannot provide both :vmName and :vm_name' if attributes.key?(:'vmName') && attributes.key?(:'vm_name')

      self.vm_name = attributes[:'vm_name'] if attributes[:'vm_name']

      self.db_server_id = attributes[:'dbServerId'] if attributes[:'dbServerId']

      raise 'You cannot provide both :dbServerId and :db_server_id' if attributes.key?(:'dbServerId') && attributes.key?(:'db_server_id')

      self.db_server_id = attributes[:'db_server_id'] if attributes[:'db_server_id']

      self.db_server_display_name = attributes[:'dbServerDisplayName'] if attributes[:'dbServerDisplayName']

      raise 'You cannot provide both :dbServerDisplayName and :db_server_display_name' if attributes.key?(:'dbServerDisplayName') && attributes.key?(:'db_server_display_name')

      self.db_server_display_name = attributes[:'db_server_display_name'] if attributes[:'db_server_display_name']

      self.cpu_core_count = attributes[:'cpuCoreCount'] if attributes[:'cpuCoreCount']

      raise 'You cannot provide both :cpuCoreCount and :cpu_core_count' if attributes.key?(:'cpuCoreCount') && attributes.key?(:'cpu_core_count')

      self.cpu_core_count = attributes[:'cpu_core_count'] if attributes[:'cpu_core_count']

      self.memory_size_in_gbs = attributes[:'memorySizeInGBs'] if attributes[:'memorySizeInGBs']

      raise 'You cannot provide both :memorySizeInGBs and :memory_size_in_gbs' if attributes.key?(:'memorySizeInGBs') && attributes.key?(:'memory_size_in_gbs')

      self.memory_size_in_gbs = attributes[:'memory_size_in_gbs'] if attributes[:'memory_size_in_gbs']

      self.db_node_storage_size_in_gbs = attributes[:'dbNodeStorageSizeInGBs'] if attributes[:'dbNodeStorageSizeInGBs']

      raise 'You cannot provide both :dbNodeStorageSizeInGBs and :db_node_storage_size_in_gbs' if attributes.key?(:'dbNodeStorageSizeInGBs') && attributes.key?(:'db_node_storage_size_in_gbs')

      self.db_node_storage_size_in_gbs = attributes[:'db_node_storage_size_in_gbs'] if attributes[:'db_node_storage_size_in_gbs']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.client_ip_address = attributes[:'clientIpAddress'] if attributes[:'clientIpAddress']

      raise 'You cannot provide both :clientIpAddress and :client_ip_address' if attributes.key?(:'clientIpAddress') && attributes.key?(:'client_ip_address')

      self.client_ip_address = attributes[:'client_ip_address'] if attributes[:'client_ip_address']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.autonomous_vm_cluster_id = attributes[:'autonomousVmClusterId'] if attributes[:'autonomousVmClusterId']

      raise 'You cannot provide both :autonomousVmClusterId and :autonomous_vm_cluster_id' if attributes.key?(:'autonomousVmClusterId') && attributes.key?(:'autonomous_vm_cluster_id')

      self.autonomous_vm_cluster_id = attributes[:'autonomous_vm_cluster_id'] if attributes[:'autonomous_vm_cluster_id']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.cloud_autonomous_vm_cluster_id = attributes[:'cloudAutonomousVmClusterId'] if attributes[:'cloudAutonomousVmClusterId']

      raise 'You cannot provide both :cloudAutonomousVmClusterId and :cloud_autonomous_vm_cluster_id' if attributes.key?(:'cloudAutonomousVmClusterId') && attributes.key?(:'cloud_autonomous_vm_cluster_id')

      self.cloud_autonomous_vm_cluster_id = attributes[:'cloud_autonomous_vm_cluster_id'] if attributes[:'cloud_autonomous_vm_cluster_id']
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
        vm_name == other.vm_name &&
        db_server_id == other.db_server_id &&
        db_server_display_name == other.db_server_display_name &&
        cpu_core_count == other.cpu_core_count &&
        memory_size_in_gbs == other.memory_size_in_gbs &&
        db_node_storage_size_in_gbs == other.db_node_storage_size_in_gbs &&
        lifecycle_state == other.lifecycle_state &&
        client_ip_address == other.client_ip_address &&
        compartment_id == other.compartment_id &&
        autonomous_vm_cluster_id == other.autonomous_vm_cluster_id &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        cloud_autonomous_vm_cluster_id == other.cloud_autonomous_vm_cluster_id
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
      [id, vm_name, db_server_id, db_server_display_name, cpu_core_count, memory_size_in_gbs, db_node_storage_size_in_gbs, lifecycle_state, client_ip_address, compartment_id, autonomous_vm_cluster_id, freeform_tags, defined_tags, cloud_autonomous_vm_cluster_id].hash
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
