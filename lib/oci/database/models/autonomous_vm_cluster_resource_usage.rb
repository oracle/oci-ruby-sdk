# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20160918
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Autonomous VM Cluster usage details, including the Autonomous Container Databases usage.
  #
  class Database::Models::AutonomousVmClusterResourceUsage
    # **[Required]** The user-friendly name for the Autonomous VM cluster. The name does not need to be unique.
    # @return [String]
    attr_accessor :display_name

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Autonomous VM cluster.
    # @return [String]
    attr_accessor :id

    # The data disk group size allocated for Autonomous Databases, in TBs.
    # @return [Float]
    attr_accessor :autonomous_data_storage_size_in_tbs

    # The local node storage allocated in GBs.
    # @return [Integer]
    attr_accessor :db_node_storage_size_in_gbs

    # The memory allocated in GBs.
    # @return [Integer]
    attr_accessor :memory_size_in_gbs

    # The total number of Autonomous Container Databases that can be created.
    # @return [Integer]
    attr_accessor :total_container_databases

    # The data disk group size available for Autonomous Databases, in TBs.
    # @return [Float]
    attr_accessor :available_autonomous_data_storage_size_in_tbs

    # The data disk group size used for Autonomous Databases, in TBs.
    # @return [Float]
    attr_accessor :used_autonomous_data_storage_size_in_tbs

    # If true, database backup on local Exadata storage is configured for the Autonomous VM cluster. If false, database backup on local Exadata storage is not available in the Autonomous VM cluster.
    # @return [BOOLEAN]
    attr_accessor :is_local_backup_enabled

    # Total exadata storage allocated for the Autonomous VM Cluster. DATA + RECOVERY + SPARSE + any overhead in TBs.
    # @return [Float]
    attr_accessor :exadata_storage_in_tbs

    # The amount of memory (in GBs) to be enabled per each CPU core.
    # @return [Integer]
    attr_accessor :memory_per_oracle_compute_unit_in_gbs

    # The number of CPU cores enabled on the Autonomous VM cluster.
    # @return [Float]
    attr_accessor :total_cpus

    # The number of CPU cores alloted to the Autonomous Container Databases in an Autonomous VM cluster.
    # @return [Float]
    attr_accessor :used_cpus

    # The number of CPU cores available.
    # @return [Float]
    attr_accessor :available_cpus

    # CPU cores that continue to be included in the count of OCPUs available to the
    # Autonomous Container Database even after one of its Autonomous Database is terminated or scaled down.
    # You can release them to the available OCPUs at its parent AVMC level by restarting the Autonomous Container Database.
    #
    # @return [Float]
    attr_accessor :reclaimable_cpus

    # The number of CPUs provisioned in an Autonomous VM Cluster.
    # @return [Float]
    attr_accessor :provisioned_cpus

    # The number of CPUs reserved in an Autonomous VM Cluster.
    # @return [Float]
    attr_accessor :reserved_cpus

    # The number of provisionable Autonomous Container Databases in an Autonomous VM Cluster.
    # @return [Integer]
    attr_accessor :provisionable_autonomous_container_databases

    # The number of provisioned Autonomous Container Databases in an Autonomous VM Cluster.
    # @return [Integer]
    attr_accessor :provisioned_autonomous_container_databases

    # The number of non-provisionable Autonomous Container Databases in an Autonomous VM Cluster.
    # @return [Integer]
    attr_accessor :non_provisionable_autonomous_container_databases

    # List of autonomous vm cluster resource usages.
    # @return [Array<OCI::Database::Models::AutonomousVmResourceUsage>]
    attr_accessor :autonomous_vm_resource_usage

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'id': :'id',
        'autonomous_data_storage_size_in_tbs': :'autonomousDataStorageSizeInTBs',
        'db_node_storage_size_in_gbs': :'dbNodeStorageSizeInGBs',
        'memory_size_in_gbs': :'memorySizeInGBs',
        'total_container_databases': :'totalContainerDatabases',
        'available_autonomous_data_storage_size_in_tbs': :'availableAutonomousDataStorageSizeInTBs',
        'used_autonomous_data_storage_size_in_tbs': :'usedAutonomousDataStorageSizeInTBs',
        'is_local_backup_enabled': :'isLocalBackupEnabled',
        'exadata_storage_in_tbs': :'exadataStorageInTBs',
        'memory_per_oracle_compute_unit_in_gbs': :'memoryPerOracleComputeUnitInGBs',
        'total_cpus': :'totalCpus',
        'used_cpus': :'usedCpus',
        'available_cpus': :'availableCpus',
        'reclaimable_cpus': :'reclaimableCpus',
        'provisioned_cpus': :'provisionedCpus',
        'reserved_cpus': :'reservedCpus',
        'provisionable_autonomous_container_databases': :'provisionableAutonomousContainerDatabases',
        'provisioned_autonomous_container_databases': :'provisionedAutonomousContainerDatabases',
        'non_provisionable_autonomous_container_databases': :'nonProvisionableAutonomousContainerDatabases',
        'autonomous_vm_resource_usage': :'autonomousVmResourceUsage'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'id': :'String',
        'autonomous_data_storage_size_in_tbs': :'Float',
        'db_node_storage_size_in_gbs': :'Integer',
        'memory_size_in_gbs': :'Integer',
        'total_container_databases': :'Integer',
        'available_autonomous_data_storage_size_in_tbs': :'Float',
        'used_autonomous_data_storage_size_in_tbs': :'Float',
        'is_local_backup_enabled': :'BOOLEAN',
        'exadata_storage_in_tbs': :'Float',
        'memory_per_oracle_compute_unit_in_gbs': :'Integer',
        'total_cpus': :'Float',
        'used_cpus': :'Float',
        'available_cpus': :'Float',
        'reclaimable_cpus': :'Float',
        'provisioned_cpus': :'Float',
        'reserved_cpus': :'Float',
        'provisionable_autonomous_container_databases': :'Integer',
        'provisioned_autonomous_container_databases': :'Integer',
        'non_provisionable_autonomous_container_databases': :'Integer',
        'autonomous_vm_resource_usage': :'Array<OCI::Database::Models::AutonomousVmResourceUsage>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [Float] :autonomous_data_storage_size_in_tbs The value to assign to the {#autonomous_data_storage_size_in_tbs} property
    # @option attributes [Integer] :db_node_storage_size_in_gbs The value to assign to the {#db_node_storage_size_in_gbs} property
    # @option attributes [Integer] :memory_size_in_gbs The value to assign to the {#memory_size_in_gbs} property
    # @option attributes [Integer] :total_container_databases The value to assign to the {#total_container_databases} property
    # @option attributes [Float] :available_autonomous_data_storage_size_in_tbs The value to assign to the {#available_autonomous_data_storage_size_in_tbs} property
    # @option attributes [Float] :used_autonomous_data_storage_size_in_tbs The value to assign to the {#used_autonomous_data_storage_size_in_tbs} property
    # @option attributes [BOOLEAN] :is_local_backup_enabled The value to assign to the {#is_local_backup_enabled} property
    # @option attributes [Float] :exadata_storage_in_tbs The value to assign to the {#exadata_storage_in_tbs} property
    # @option attributes [Integer] :memory_per_oracle_compute_unit_in_gbs The value to assign to the {#memory_per_oracle_compute_unit_in_gbs} property
    # @option attributes [Float] :total_cpus The value to assign to the {#total_cpus} property
    # @option attributes [Float] :used_cpus The value to assign to the {#used_cpus} property
    # @option attributes [Float] :available_cpus The value to assign to the {#available_cpus} property
    # @option attributes [Float] :reclaimable_cpus The value to assign to the {#reclaimable_cpus} property
    # @option attributes [Float] :provisioned_cpus The value to assign to the {#provisioned_cpus} property
    # @option attributes [Float] :reserved_cpus The value to assign to the {#reserved_cpus} property
    # @option attributes [Integer] :provisionable_autonomous_container_databases The value to assign to the {#provisionable_autonomous_container_databases} property
    # @option attributes [Integer] :provisioned_autonomous_container_databases The value to assign to the {#provisioned_autonomous_container_databases} property
    # @option attributes [Integer] :non_provisionable_autonomous_container_databases The value to assign to the {#non_provisionable_autonomous_container_databases} property
    # @option attributes [Array<OCI::Database::Models::AutonomousVmResourceUsage>] :autonomous_vm_resource_usage The value to assign to the {#autonomous_vm_resource_usage} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.id = attributes[:'id'] if attributes[:'id']

      self.autonomous_data_storage_size_in_tbs = attributes[:'autonomousDataStorageSizeInTBs'] if attributes[:'autonomousDataStorageSizeInTBs']

      raise 'You cannot provide both :autonomousDataStorageSizeInTBs and :autonomous_data_storage_size_in_tbs' if attributes.key?(:'autonomousDataStorageSizeInTBs') && attributes.key?(:'autonomous_data_storage_size_in_tbs')

      self.autonomous_data_storage_size_in_tbs = attributes[:'autonomous_data_storage_size_in_tbs'] if attributes[:'autonomous_data_storage_size_in_tbs']

      self.db_node_storage_size_in_gbs = attributes[:'dbNodeStorageSizeInGBs'] if attributes[:'dbNodeStorageSizeInGBs']

      raise 'You cannot provide both :dbNodeStorageSizeInGBs and :db_node_storage_size_in_gbs' if attributes.key?(:'dbNodeStorageSizeInGBs') && attributes.key?(:'db_node_storage_size_in_gbs')

      self.db_node_storage_size_in_gbs = attributes[:'db_node_storage_size_in_gbs'] if attributes[:'db_node_storage_size_in_gbs']

      self.memory_size_in_gbs = attributes[:'memorySizeInGBs'] if attributes[:'memorySizeInGBs']

      raise 'You cannot provide both :memorySizeInGBs and :memory_size_in_gbs' if attributes.key?(:'memorySizeInGBs') && attributes.key?(:'memory_size_in_gbs')

      self.memory_size_in_gbs = attributes[:'memory_size_in_gbs'] if attributes[:'memory_size_in_gbs']

      self.total_container_databases = attributes[:'totalContainerDatabases'] if attributes[:'totalContainerDatabases']

      raise 'You cannot provide both :totalContainerDatabases and :total_container_databases' if attributes.key?(:'totalContainerDatabases') && attributes.key?(:'total_container_databases')

      self.total_container_databases = attributes[:'total_container_databases'] if attributes[:'total_container_databases']

      self.available_autonomous_data_storage_size_in_tbs = attributes[:'availableAutonomousDataStorageSizeInTBs'] if attributes[:'availableAutonomousDataStorageSizeInTBs']

      raise 'You cannot provide both :availableAutonomousDataStorageSizeInTBs and :available_autonomous_data_storage_size_in_tbs' if attributes.key?(:'availableAutonomousDataStorageSizeInTBs') && attributes.key?(:'available_autonomous_data_storage_size_in_tbs')

      self.available_autonomous_data_storage_size_in_tbs = attributes[:'available_autonomous_data_storage_size_in_tbs'] if attributes[:'available_autonomous_data_storage_size_in_tbs']

      self.used_autonomous_data_storage_size_in_tbs = attributes[:'usedAutonomousDataStorageSizeInTBs'] if attributes[:'usedAutonomousDataStorageSizeInTBs']

      raise 'You cannot provide both :usedAutonomousDataStorageSizeInTBs and :used_autonomous_data_storage_size_in_tbs' if attributes.key?(:'usedAutonomousDataStorageSizeInTBs') && attributes.key?(:'used_autonomous_data_storage_size_in_tbs')

      self.used_autonomous_data_storage_size_in_tbs = attributes[:'used_autonomous_data_storage_size_in_tbs'] if attributes[:'used_autonomous_data_storage_size_in_tbs']

      self.is_local_backup_enabled = attributes[:'isLocalBackupEnabled'] unless attributes[:'isLocalBackupEnabled'].nil?

      raise 'You cannot provide both :isLocalBackupEnabled and :is_local_backup_enabled' if attributes.key?(:'isLocalBackupEnabled') && attributes.key?(:'is_local_backup_enabled')

      self.is_local_backup_enabled = attributes[:'is_local_backup_enabled'] unless attributes[:'is_local_backup_enabled'].nil?

      self.exadata_storage_in_tbs = attributes[:'exadataStorageInTBs'] if attributes[:'exadataStorageInTBs']

      raise 'You cannot provide both :exadataStorageInTBs and :exadata_storage_in_tbs' if attributes.key?(:'exadataStorageInTBs') && attributes.key?(:'exadata_storage_in_tbs')

      self.exadata_storage_in_tbs = attributes[:'exadata_storage_in_tbs'] if attributes[:'exadata_storage_in_tbs']

      self.memory_per_oracle_compute_unit_in_gbs = attributes[:'memoryPerOracleComputeUnitInGBs'] if attributes[:'memoryPerOracleComputeUnitInGBs']

      raise 'You cannot provide both :memoryPerOracleComputeUnitInGBs and :memory_per_oracle_compute_unit_in_gbs' if attributes.key?(:'memoryPerOracleComputeUnitInGBs') && attributes.key?(:'memory_per_oracle_compute_unit_in_gbs')

      self.memory_per_oracle_compute_unit_in_gbs = attributes[:'memory_per_oracle_compute_unit_in_gbs'] if attributes[:'memory_per_oracle_compute_unit_in_gbs']

      self.total_cpus = attributes[:'totalCpus'] if attributes[:'totalCpus']

      raise 'You cannot provide both :totalCpus and :total_cpus' if attributes.key?(:'totalCpus') && attributes.key?(:'total_cpus')

      self.total_cpus = attributes[:'total_cpus'] if attributes[:'total_cpus']

      self.used_cpus = attributes[:'usedCpus'] if attributes[:'usedCpus']

      raise 'You cannot provide both :usedCpus and :used_cpus' if attributes.key?(:'usedCpus') && attributes.key?(:'used_cpus')

      self.used_cpus = attributes[:'used_cpus'] if attributes[:'used_cpus']

      self.available_cpus = attributes[:'availableCpus'] if attributes[:'availableCpus']

      raise 'You cannot provide both :availableCpus and :available_cpus' if attributes.key?(:'availableCpus') && attributes.key?(:'available_cpus')

      self.available_cpus = attributes[:'available_cpus'] if attributes[:'available_cpus']

      self.reclaimable_cpus = attributes[:'reclaimableCpus'] if attributes[:'reclaimableCpus']

      raise 'You cannot provide both :reclaimableCpus and :reclaimable_cpus' if attributes.key?(:'reclaimableCpus') && attributes.key?(:'reclaimable_cpus')

      self.reclaimable_cpus = attributes[:'reclaimable_cpus'] if attributes[:'reclaimable_cpus']

      self.provisioned_cpus = attributes[:'provisionedCpus'] if attributes[:'provisionedCpus']

      raise 'You cannot provide both :provisionedCpus and :provisioned_cpus' if attributes.key?(:'provisionedCpus') && attributes.key?(:'provisioned_cpus')

      self.provisioned_cpus = attributes[:'provisioned_cpus'] if attributes[:'provisioned_cpus']

      self.reserved_cpus = attributes[:'reservedCpus'] if attributes[:'reservedCpus']

      raise 'You cannot provide both :reservedCpus and :reserved_cpus' if attributes.key?(:'reservedCpus') && attributes.key?(:'reserved_cpus')

      self.reserved_cpus = attributes[:'reserved_cpus'] if attributes[:'reserved_cpus']

      self.provisionable_autonomous_container_databases = attributes[:'provisionableAutonomousContainerDatabases'] if attributes[:'provisionableAutonomousContainerDatabases']

      raise 'You cannot provide both :provisionableAutonomousContainerDatabases and :provisionable_autonomous_container_databases' if attributes.key?(:'provisionableAutonomousContainerDatabases') && attributes.key?(:'provisionable_autonomous_container_databases')

      self.provisionable_autonomous_container_databases = attributes[:'provisionable_autonomous_container_databases'] if attributes[:'provisionable_autonomous_container_databases']

      self.provisioned_autonomous_container_databases = attributes[:'provisionedAutonomousContainerDatabases'] if attributes[:'provisionedAutonomousContainerDatabases']

      raise 'You cannot provide both :provisionedAutonomousContainerDatabases and :provisioned_autonomous_container_databases' if attributes.key?(:'provisionedAutonomousContainerDatabases') && attributes.key?(:'provisioned_autonomous_container_databases')

      self.provisioned_autonomous_container_databases = attributes[:'provisioned_autonomous_container_databases'] if attributes[:'provisioned_autonomous_container_databases']

      self.non_provisionable_autonomous_container_databases = attributes[:'nonProvisionableAutonomousContainerDatabases'] if attributes[:'nonProvisionableAutonomousContainerDatabases']

      raise 'You cannot provide both :nonProvisionableAutonomousContainerDatabases and :non_provisionable_autonomous_container_databases' if attributes.key?(:'nonProvisionableAutonomousContainerDatabases') && attributes.key?(:'non_provisionable_autonomous_container_databases')

      self.non_provisionable_autonomous_container_databases = attributes[:'non_provisionable_autonomous_container_databases'] if attributes[:'non_provisionable_autonomous_container_databases']

      self.autonomous_vm_resource_usage = attributes[:'autonomousVmResourceUsage'] if attributes[:'autonomousVmResourceUsage']

      raise 'You cannot provide both :autonomousVmResourceUsage and :autonomous_vm_resource_usage' if attributes.key?(:'autonomousVmResourceUsage') && attributes.key?(:'autonomous_vm_resource_usage')

      self.autonomous_vm_resource_usage = attributes[:'autonomous_vm_resource_usage'] if attributes[:'autonomous_vm_resource_usage']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        id == other.id &&
        autonomous_data_storage_size_in_tbs == other.autonomous_data_storage_size_in_tbs &&
        db_node_storage_size_in_gbs == other.db_node_storage_size_in_gbs &&
        memory_size_in_gbs == other.memory_size_in_gbs &&
        total_container_databases == other.total_container_databases &&
        available_autonomous_data_storage_size_in_tbs == other.available_autonomous_data_storage_size_in_tbs &&
        used_autonomous_data_storage_size_in_tbs == other.used_autonomous_data_storage_size_in_tbs &&
        is_local_backup_enabled == other.is_local_backup_enabled &&
        exadata_storage_in_tbs == other.exadata_storage_in_tbs &&
        memory_per_oracle_compute_unit_in_gbs == other.memory_per_oracle_compute_unit_in_gbs &&
        total_cpus == other.total_cpus &&
        used_cpus == other.used_cpus &&
        available_cpus == other.available_cpus &&
        reclaimable_cpus == other.reclaimable_cpus &&
        provisioned_cpus == other.provisioned_cpus &&
        reserved_cpus == other.reserved_cpus &&
        provisionable_autonomous_container_databases == other.provisionable_autonomous_container_databases &&
        provisioned_autonomous_container_databases == other.provisioned_autonomous_container_databases &&
        non_provisionable_autonomous_container_databases == other.non_provisionable_autonomous_container_databases &&
        autonomous_vm_resource_usage == other.autonomous_vm_resource_usage
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
      [display_name, id, autonomous_data_storage_size_in_tbs, db_node_storage_size_in_gbs, memory_size_in_gbs, total_container_databases, available_autonomous_data_storage_size_in_tbs, used_autonomous_data_storage_size_in_tbs, is_local_backup_enabled, exadata_storage_in_tbs, memory_per_oracle_compute_unit_in_gbs, total_cpus, used_cpus, available_cpus, reclaimable_cpus, provisioned_cpus, reserved_cpus, provisionable_autonomous_container_databases, provisioned_autonomous_container_databases, non_provisionable_autonomous_container_databases, autonomous_vm_resource_usage].hash
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
