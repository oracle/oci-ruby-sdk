# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of the Exadata Cloud@Customer Db server.
  #
  class Database::Models::DbServerSummary
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_UNAVAILABLE = 'UNAVAILABLE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_MAINTENANCE_IN_PROGRESS = 'MAINTENANCE_IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Exacc Db server.
    # @return [String]
    attr_accessor :id

    # The user-friendly name for the Db server. The name does not need to be unique.
    # @return [String]
    attr_accessor :display_name

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Exadata infrastructure.
    # @return [String]
    attr_accessor :exadata_infrastructure_id

    # The number of CPU cores enabled on the Db server.
    # @return [Integer]
    attr_accessor :cpu_core_count

    # The allocated memory in GBs on the Db server.
    # @return [Integer]
    attr_accessor :memory_size_in_gbs

    # The allocated local node storage in GBs on the Db server.
    # @return [Integer]
    attr_accessor :db_node_storage_size_in_gbs

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VM Clusters associated with the Db server.
    #
    # @return [Array<String>]
    attr_accessor :vm_cluster_ids

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Db nodes associated with the Db server.
    #
    # @return [Array<String>]
    attr_accessor :db_node_ids

    # The current state of the Db server.
    # @return [String]
    attr_reader :lifecycle_state

    # Additional information about the current lifecycle state.
    # @return [String]
    attr_accessor :lifecycle_details

    # The total number of CPU cores available.
    # @return [Integer]
    attr_accessor :max_cpu_count

    # The total memory available in GBs.
    # @return [Integer]
    attr_accessor :max_memory_in_gbs

    # The total local node storage available in GBs.
    # @return [Integer]
    attr_accessor :max_db_node_storage_in_gbs

    # The date and time that the Db Server was created.
    # @return [DateTime]
    attr_accessor :time_created

    # @return [OCI::Database::Models::DbServerPatchingDetails]
    attr_accessor :db_server_patching_details

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
        'id': :'id',
        'display_name': :'displayName',
        'compartment_id': :'compartmentId',
        'exadata_infrastructure_id': :'exadataInfrastructureId',
        'cpu_core_count': :'cpuCoreCount',
        'memory_size_in_gbs': :'memorySizeInGBs',
        'db_node_storage_size_in_gbs': :'dbNodeStorageSizeInGBs',
        'vm_cluster_ids': :'vmClusterIds',
        'db_node_ids': :'dbNodeIds',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'max_cpu_count': :'maxCpuCount',
        'max_memory_in_gbs': :'maxMemoryInGBs',
        'max_db_node_storage_in_gbs': :'maxDbNodeStorageInGBs',
        'time_created': :'timeCreated',
        'db_server_patching_details': :'dbServerPatchingDetails',
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
        'display_name': :'String',
        'compartment_id': :'String',
        'exadata_infrastructure_id': :'String',
        'cpu_core_count': :'Integer',
        'memory_size_in_gbs': :'Integer',
        'db_node_storage_size_in_gbs': :'Integer',
        'vm_cluster_ids': :'Array<String>',
        'db_node_ids': :'Array<String>',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'max_cpu_count': :'Integer',
        'max_memory_in_gbs': :'Integer',
        'max_db_node_storage_in_gbs': :'Integer',
        'time_created': :'DateTime',
        'db_server_patching_details': :'OCI::Database::Models::DbServerPatchingDetails',
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
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :exadata_infrastructure_id The value to assign to the {#exadata_infrastructure_id} property
    # @option attributes [Integer] :cpu_core_count The value to assign to the {#cpu_core_count} property
    # @option attributes [Integer] :memory_size_in_gbs The value to assign to the {#memory_size_in_gbs} property
    # @option attributes [Integer] :db_node_storage_size_in_gbs The value to assign to the {#db_node_storage_size_in_gbs} property
    # @option attributes [Array<String>] :vm_cluster_ids The value to assign to the {#vm_cluster_ids} property
    # @option attributes [Array<String>] :db_node_ids The value to assign to the {#db_node_ids} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [Integer] :max_cpu_count The value to assign to the {#max_cpu_count} property
    # @option attributes [Integer] :max_memory_in_gbs The value to assign to the {#max_memory_in_gbs} property
    # @option attributes [Integer] :max_db_node_storage_in_gbs The value to assign to the {#max_db_node_storage_in_gbs} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [OCI::Database::Models::DbServerPatchingDetails] :db_server_patching_details The value to assign to the {#db_server_patching_details} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
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

      self.exadata_infrastructure_id = attributes[:'exadataInfrastructureId'] if attributes[:'exadataInfrastructureId']

      raise 'You cannot provide both :exadataInfrastructureId and :exadata_infrastructure_id' if attributes.key?(:'exadataInfrastructureId') && attributes.key?(:'exadata_infrastructure_id')

      self.exadata_infrastructure_id = attributes[:'exadata_infrastructure_id'] if attributes[:'exadata_infrastructure_id']

      self.cpu_core_count = attributes[:'cpuCoreCount'] if attributes[:'cpuCoreCount']

      raise 'You cannot provide both :cpuCoreCount and :cpu_core_count' if attributes.key?(:'cpuCoreCount') && attributes.key?(:'cpu_core_count')

      self.cpu_core_count = attributes[:'cpu_core_count'] if attributes[:'cpu_core_count']

      self.memory_size_in_gbs = attributes[:'memorySizeInGBs'] if attributes[:'memorySizeInGBs']

      raise 'You cannot provide both :memorySizeInGBs and :memory_size_in_gbs' if attributes.key?(:'memorySizeInGBs') && attributes.key?(:'memory_size_in_gbs')

      self.memory_size_in_gbs = attributes[:'memory_size_in_gbs'] if attributes[:'memory_size_in_gbs']

      self.db_node_storage_size_in_gbs = attributes[:'dbNodeStorageSizeInGBs'] if attributes[:'dbNodeStorageSizeInGBs']

      raise 'You cannot provide both :dbNodeStorageSizeInGBs and :db_node_storage_size_in_gbs' if attributes.key?(:'dbNodeStorageSizeInGBs') && attributes.key?(:'db_node_storage_size_in_gbs')

      self.db_node_storage_size_in_gbs = attributes[:'db_node_storage_size_in_gbs'] if attributes[:'db_node_storage_size_in_gbs']

      self.vm_cluster_ids = attributes[:'vmClusterIds'] if attributes[:'vmClusterIds']

      raise 'You cannot provide both :vmClusterIds and :vm_cluster_ids' if attributes.key?(:'vmClusterIds') && attributes.key?(:'vm_cluster_ids')

      self.vm_cluster_ids = attributes[:'vm_cluster_ids'] if attributes[:'vm_cluster_ids']

      self.db_node_ids = attributes[:'dbNodeIds'] if attributes[:'dbNodeIds']

      raise 'You cannot provide both :dbNodeIds and :db_node_ids' if attributes.key?(:'dbNodeIds') && attributes.key?(:'db_node_ids')

      self.db_node_ids = attributes[:'db_node_ids'] if attributes[:'db_node_ids']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.max_cpu_count = attributes[:'maxCpuCount'] if attributes[:'maxCpuCount']

      raise 'You cannot provide both :maxCpuCount and :max_cpu_count' if attributes.key?(:'maxCpuCount') && attributes.key?(:'max_cpu_count')

      self.max_cpu_count = attributes[:'max_cpu_count'] if attributes[:'max_cpu_count']

      self.max_memory_in_gbs = attributes[:'maxMemoryInGBs'] if attributes[:'maxMemoryInGBs']

      raise 'You cannot provide both :maxMemoryInGBs and :max_memory_in_gbs' if attributes.key?(:'maxMemoryInGBs') && attributes.key?(:'max_memory_in_gbs')

      self.max_memory_in_gbs = attributes[:'max_memory_in_gbs'] if attributes[:'max_memory_in_gbs']

      self.max_db_node_storage_in_gbs = attributes[:'maxDbNodeStorageInGBs'] if attributes[:'maxDbNodeStorageInGBs']

      raise 'You cannot provide both :maxDbNodeStorageInGBs and :max_db_node_storage_in_gbs' if attributes.key?(:'maxDbNodeStorageInGBs') && attributes.key?(:'max_db_node_storage_in_gbs')

      self.max_db_node_storage_in_gbs = attributes[:'max_db_node_storage_in_gbs'] if attributes[:'max_db_node_storage_in_gbs']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.db_server_patching_details = attributes[:'dbServerPatchingDetails'] if attributes[:'dbServerPatchingDetails']

      raise 'You cannot provide both :dbServerPatchingDetails and :db_server_patching_details' if attributes.key?(:'dbServerPatchingDetails') && attributes.key?(:'db_server_patching_details')

      self.db_server_patching_details = attributes[:'db_server_patching_details'] if attributes[:'db_server_patching_details']

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
        exadata_infrastructure_id == other.exadata_infrastructure_id &&
        cpu_core_count == other.cpu_core_count &&
        memory_size_in_gbs == other.memory_size_in_gbs &&
        db_node_storage_size_in_gbs == other.db_node_storage_size_in_gbs &&
        vm_cluster_ids == other.vm_cluster_ids &&
        db_node_ids == other.db_node_ids &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        max_cpu_count == other.max_cpu_count &&
        max_memory_in_gbs == other.max_memory_in_gbs &&
        max_db_node_storage_in_gbs == other.max_db_node_storage_in_gbs &&
        time_created == other.time_created &&
        db_server_patching_details == other.db_server_patching_details &&
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
      [id, display_name, compartment_id, exadata_infrastructure_id, cpu_core_count, memory_size_in_gbs, db_node_storage_size_in_gbs, vm_cluster_ids, db_node_ids, lifecycle_state, lifecycle_details, max_cpu_count, max_memory_in_gbs, max_db_node_storage_in_gbs, time_created, db_server_patching_details, freeform_tags, defined_tags].hash
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