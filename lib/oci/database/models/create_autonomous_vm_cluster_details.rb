# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details for the create Autonomous VM cluster operation.
  #
  class Database::Models::CreateAutonomousVmClusterDetails
    LICENSE_MODEL_ENUM = [
      LICENSE_MODEL_LICENSE_INCLUDED = 'LICENSE_INCLUDED'.freeze,
      LICENSE_MODEL_BRING_YOUR_OWN_LICENSE = 'BRING_YOUR_OWN_LICENSE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The user-friendly name for the Autonomous VM cluster. The name does not need to be unique.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Exadata infrastructure.
    # @return [String]
    attr_accessor :exadata_infrastructure_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VM cluster network.
    # @return [String]
    attr_accessor :vm_cluster_network_id

    # The time zone to use for the Autonomous VM cluster. For details, see [DB System Time Zones](https://docs.cloud.oracle.com/Content/Database/References/timezones.htm).
    # @return [String]
    attr_accessor :time_zone

    # If true, database backup on local Exadata storage is configured for the Autonomous VM cluster. If false, database backup on local Exadata storage is not available in the Autonomous VM cluster.
    #
    # @return [BOOLEAN]
    attr_accessor :is_local_backup_enabled

    # The Oracle license model that applies to the Autonomous VM cluster. The default is BRING_YOUR_OWN_LICENSE.
    #
    # @return [String]
    attr_reader :license_model

    # The total number of Autonomous Container Databases that can be created.
    # @return [Integer]
    attr_accessor :total_container_databases

    # The number of OCPU cores to enable per VM cluster node.
    # @return [Integer]
    attr_accessor :cpu_core_count_per_node

    # The amount of memory (in GBs) to be enabled per each OCPU core.
    # @return [Integer]
    attr_accessor :memory_per_oracle_compute_unit_in_gbs

    # The data disk group size to be allocated for Autonomous Databases, in TBs.
    # @return [Float]
    attr_accessor :autonomous_data_storage_size_in_tbs

    # @return [OCI::Database::Models::MaintenanceWindow]
    attr_accessor :maintenance_window_details

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

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'exadata_infrastructure_id': :'exadataInfrastructureId',
        'vm_cluster_network_id': :'vmClusterNetworkId',
        'time_zone': :'timeZone',
        'is_local_backup_enabled': :'isLocalBackupEnabled',
        'license_model': :'licenseModel',
        'total_container_databases': :'totalContainerDatabases',
        'cpu_core_count_per_node': :'cpuCoreCountPerNode',
        'memory_per_oracle_compute_unit_in_gbs': :'memoryPerOracleComputeUnitInGBs',
        'autonomous_data_storage_size_in_tbs': :'autonomousDataStorageSizeInTBs',
        'maintenance_window_details': :'maintenanceWindowDetails',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'display_name': :'String',
        'exadata_infrastructure_id': :'String',
        'vm_cluster_network_id': :'String',
        'time_zone': :'String',
        'is_local_backup_enabled': :'BOOLEAN',
        'license_model': :'String',
        'total_container_databases': :'Integer',
        'cpu_core_count_per_node': :'Integer',
        'memory_per_oracle_compute_unit_in_gbs': :'Integer',
        'autonomous_data_storage_size_in_tbs': :'Float',
        'maintenance_window_details': :'OCI::Database::Models::MaintenanceWindow',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :exadata_infrastructure_id The value to assign to the {#exadata_infrastructure_id} property
    # @option attributes [String] :vm_cluster_network_id The value to assign to the {#vm_cluster_network_id} property
    # @option attributes [String] :time_zone The value to assign to the {#time_zone} property
    # @option attributes [BOOLEAN] :is_local_backup_enabled The value to assign to the {#is_local_backup_enabled} property
    # @option attributes [String] :license_model The value to assign to the {#license_model} property
    # @option attributes [Integer] :total_container_databases The value to assign to the {#total_container_databases} property
    # @option attributes [Integer] :cpu_core_count_per_node The value to assign to the {#cpu_core_count_per_node} property
    # @option attributes [Integer] :memory_per_oracle_compute_unit_in_gbs The value to assign to the {#memory_per_oracle_compute_unit_in_gbs} property
    # @option attributes [Float] :autonomous_data_storage_size_in_tbs The value to assign to the {#autonomous_data_storage_size_in_tbs} property
    # @option attributes [OCI::Database::Models::MaintenanceWindow] :maintenance_window_details The value to assign to the {#maintenance_window_details} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.exadata_infrastructure_id = attributes[:'exadataInfrastructureId'] if attributes[:'exadataInfrastructureId']

      raise 'You cannot provide both :exadataInfrastructureId and :exadata_infrastructure_id' if attributes.key?(:'exadataInfrastructureId') && attributes.key?(:'exadata_infrastructure_id')

      self.exadata_infrastructure_id = attributes[:'exadata_infrastructure_id'] if attributes[:'exadata_infrastructure_id']

      self.vm_cluster_network_id = attributes[:'vmClusterNetworkId'] if attributes[:'vmClusterNetworkId']

      raise 'You cannot provide both :vmClusterNetworkId and :vm_cluster_network_id' if attributes.key?(:'vmClusterNetworkId') && attributes.key?(:'vm_cluster_network_id')

      self.vm_cluster_network_id = attributes[:'vm_cluster_network_id'] if attributes[:'vm_cluster_network_id']

      self.time_zone = attributes[:'timeZone'] if attributes[:'timeZone']

      raise 'You cannot provide both :timeZone and :time_zone' if attributes.key?(:'timeZone') && attributes.key?(:'time_zone')

      self.time_zone = attributes[:'time_zone'] if attributes[:'time_zone']

      self.is_local_backup_enabled = attributes[:'isLocalBackupEnabled'] unless attributes[:'isLocalBackupEnabled'].nil?

      raise 'You cannot provide both :isLocalBackupEnabled and :is_local_backup_enabled' if attributes.key?(:'isLocalBackupEnabled') && attributes.key?(:'is_local_backup_enabled')

      self.is_local_backup_enabled = attributes[:'is_local_backup_enabled'] unless attributes[:'is_local_backup_enabled'].nil?

      self.license_model = attributes[:'licenseModel'] if attributes[:'licenseModel']

      raise 'You cannot provide both :licenseModel and :license_model' if attributes.key?(:'licenseModel') && attributes.key?(:'license_model')

      self.license_model = attributes[:'license_model'] if attributes[:'license_model']

      self.total_container_databases = attributes[:'totalContainerDatabases'] if attributes[:'totalContainerDatabases']

      raise 'You cannot provide both :totalContainerDatabases and :total_container_databases' if attributes.key?(:'totalContainerDatabases') && attributes.key?(:'total_container_databases')

      self.total_container_databases = attributes[:'total_container_databases'] if attributes[:'total_container_databases']

      self.cpu_core_count_per_node = attributes[:'cpuCoreCountPerNode'] if attributes[:'cpuCoreCountPerNode']

      raise 'You cannot provide both :cpuCoreCountPerNode and :cpu_core_count_per_node' if attributes.key?(:'cpuCoreCountPerNode') && attributes.key?(:'cpu_core_count_per_node')

      self.cpu_core_count_per_node = attributes[:'cpu_core_count_per_node'] if attributes[:'cpu_core_count_per_node']

      self.memory_per_oracle_compute_unit_in_gbs = attributes[:'memoryPerOracleComputeUnitInGBs'] if attributes[:'memoryPerOracleComputeUnitInGBs']

      raise 'You cannot provide both :memoryPerOracleComputeUnitInGBs and :memory_per_oracle_compute_unit_in_gbs' if attributes.key?(:'memoryPerOracleComputeUnitInGBs') && attributes.key?(:'memory_per_oracle_compute_unit_in_gbs')

      self.memory_per_oracle_compute_unit_in_gbs = attributes[:'memory_per_oracle_compute_unit_in_gbs'] if attributes[:'memory_per_oracle_compute_unit_in_gbs']

      self.autonomous_data_storage_size_in_tbs = attributes[:'autonomousDataStorageSizeInTBs'] if attributes[:'autonomousDataStorageSizeInTBs']

      raise 'You cannot provide both :autonomousDataStorageSizeInTBs and :autonomous_data_storage_size_in_tbs' if attributes.key?(:'autonomousDataStorageSizeInTBs') && attributes.key?(:'autonomous_data_storage_size_in_tbs')

      self.autonomous_data_storage_size_in_tbs = attributes[:'autonomous_data_storage_size_in_tbs'] if attributes[:'autonomous_data_storage_size_in_tbs']

      self.maintenance_window_details = attributes[:'maintenanceWindowDetails'] if attributes[:'maintenanceWindowDetails']

      raise 'You cannot provide both :maintenanceWindowDetails and :maintenance_window_details' if attributes.key?(:'maintenanceWindowDetails') && attributes.key?(:'maintenance_window_details')

      self.maintenance_window_details = attributes[:'maintenance_window_details'] if attributes[:'maintenance_window_details']

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
    # @param [Object] license_model Object to be assigned
    def license_model=(license_model)
      raise "Invalid value for 'license_model': this must be one of the values in LICENSE_MODEL_ENUM." if license_model && !LICENSE_MODEL_ENUM.include?(license_model)

      @license_model = license_model
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        exadata_infrastructure_id == other.exadata_infrastructure_id &&
        vm_cluster_network_id == other.vm_cluster_network_id &&
        time_zone == other.time_zone &&
        is_local_backup_enabled == other.is_local_backup_enabled &&
        license_model == other.license_model &&
        total_container_databases == other.total_container_databases &&
        cpu_core_count_per_node == other.cpu_core_count_per_node &&
        memory_per_oracle_compute_unit_in_gbs == other.memory_per_oracle_compute_unit_in_gbs &&
        autonomous_data_storage_size_in_tbs == other.autonomous_data_storage_size_in_tbs &&
        maintenance_window_details == other.maintenance_window_details &&
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
      [compartment_id, display_name, exadata_infrastructure_id, vm_cluster_network_id, time_zone, is_local_backup_enabled, license_model, total_container_databases, cpu_core_count_per_node, memory_per_oracle_compute_unit_in_gbs, autonomous_data_storage_size_in_tbs, maintenance_window_details, freeform_tags, defined_tags].hash
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
