# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of the cloud Autonomous VM cluster.
  #
  class Database::Models::CloudAutonomousVmClusterSummary
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

    LICENSE_MODEL_ENUM = [
      LICENSE_MODEL_LICENSE_INCLUDED = 'LICENSE_INCLUDED'.freeze,
      LICENSE_MODEL_BRING_YOUR_OWN_LICENSE = 'BRING_YOUR_OWN_LICENSE'.freeze,
      LICENSE_MODEL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Cloud Autonomous VM cluster.
    # @return [String]
    attr_accessor :id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # User defined description of the cloud Autonomous VM cluster.
    # @return [String]
    attr_accessor :description

    # **[Required]** The name of the availability domain that the cloud Autonomous VM cluster is located in.
    # @return [String]
    attr_accessor :availability_domain

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the subnet the cloud Autonomous VM Cluster is associated with.
    #
    # **Subnet Restrictions:**
    # - For Exadata and virtual machine 2-node RAC DB systems, do not use a subnet that overlaps with 192.168.128.0/20.
    #
    # These subnets are used by the Oracle Clusterware private interconnect on the database instance.
    # Specifying an overlapping subnet will cause the private interconnect to malfunction.
    # This restriction applies to both the client subnet and backup subnet.
    #
    # @return [String]
    attr_accessor :subnet_id

    # A list of the [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network security groups (NSGs) that this resource belongs to. Setting this to an empty array after the list is created removes the resource from all NSGs. For more information about NSGs, see [Security Rules](https://docs.cloud.oracle.com/Content/Network/Concepts/securityrules.htm).
    # **NsgIds restrictions:**
    # - Autonomous Databases with private access require at least 1 Network Security Group (NSG). The nsgIds array cannot be empty.
    #
    # @return [Array<String>]
    attr_accessor :nsg_ids

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the last maintenance update history. This value is updated when a maintenance update starts.
    # @return [String]
    attr_accessor :last_update_history_entry_id

    # **[Required]** The current state of the cloud Autonomous VM cluster.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** The user-friendly name for the cloud Autonomous VM cluster. The name does not need to be unique.
    # @return [String]
    attr_accessor :display_name

    # The date and time that the cloud Autonomous VM cluster was created.
    # @return [DateTime]
    attr_accessor :time_created

    # The last date and time that the cloud Autonomous VM cluster was updated.
    # @return [DateTime]
    attr_accessor :time_updated

    # Additional information about the current lifecycle state.
    # @return [String]
    attr_accessor :lifecycle_details

    # The hostname for the cloud Autonomous VM cluster.
    # @return [String]
    attr_accessor :hostname

    # The domain name for the cloud Autonomous VM cluster.
    # @return [String]
    attr_accessor :domain

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the cloud Exadata infrastructure.
    # @return [String]
    attr_accessor :cloud_exadata_infrastructure_id

    # The model name of the Exadata hardware running the cloud Autonomous VM cluster.
    #
    # @return [String]
    attr_accessor :shape

    # The number of database servers in the cloud VM cluster.
    #
    # @return [Integer]
    attr_accessor :node_count

    # The total data storage allocated, in terabytes (TB).
    # @return [Float]
    attr_accessor :data_storage_size_in_tbs

    # The total data storage allocated, in gigabytes (GB).
    # @return [Float]
    attr_accessor :data_storage_size_in_gbs

    # The number of CPU cores enabled on the cloud Autonomous VM cluster.
    # @return [Integer]
    attr_accessor :cpu_core_count

    # The number of CPU cores enabled on the cloud Autonomous VM cluster. Only 1 decimal place is allowed for the fractional part.
    # @return [Float]
    attr_accessor :ocpu_count

    # The memory allocated in GBs.
    # @return [Integer]
    attr_accessor :memory_size_in_gbs

    # The Oracle license model that applies to the Oracle Autonomous Database. Bring your own license (BYOL) allows you to apply your current on-premises Oracle software licenses to equivalent, highly automated Oracle PaaS and IaaS services in the cloud.
    # License Included allows you to subscribe to new Oracle Database software licenses and the Database service.
    # Note that when provisioning an Autonomous Database on [dedicated Exadata infrastructure](https://docs.oracle.com/en/cloud/paas/autonomous-database/index.html), this attribute must be null because the attribute is already set at the
    # Autonomous Exadata Infrastructure level. When using [shared Exadata infrastructure](https://docs.oracle.com/en/cloud/paas/autonomous-database/index.html), if a value is not specified, the system will supply the value of `BRING_YOUR_OWN_LICENSE`.
    #
    # @return [String]
    attr_reader :license_model

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the last maintenance run.
    # @return [String]
    attr_accessor :last_maintenance_run_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the next maintenance run.
    # @return [String]
    attr_accessor :next_maintenance_run_id

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
        'compartment_id': :'compartmentId',
        'description': :'description',
        'availability_domain': :'availabilityDomain',
        'subnet_id': :'subnetId',
        'nsg_ids': :'nsgIds',
        'last_update_history_entry_id': :'lastUpdateHistoryEntryId',
        'lifecycle_state': :'lifecycleState',
        'display_name': :'displayName',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_details': :'lifecycleDetails',
        'hostname': :'hostname',
        'domain': :'domain',
        'cloud_exadata_infrastructure_id': :'cloudExadataInfrastructureId',
        'shape': :'shape',
        'node_count': :'nodeCount',
        'data_storage_size_in_tbs': :'dataStorageSizeInTBs',
        'data_storage_size_in_gbs': :'dataStorageSizeInGBs',
        'cpu_core_count': :'cpuCoreCount',
        'ocpu_count': :'ocpuCount',
        'memory_size_in_gbs': :'memorySizeInGBs',
        'license_model': :'licenseModel',
        'last_maintenance_run_id': :'lastMaintenanceRunId',
        'next_maintenance_run_id': :'nextMaintenanceRunId',
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
        'compartment_id': :'String',
        'description': :'String',
        'availability_domain': :'String',
        'subnet_id': :'String',
        'nsg_ids': :'Array<String>',
        'last_update_history_entry_id': :'String',
        'lifecycle_state': :'String',
        'display_name': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_details': :'String',
        'hostname': :'String',
        'domain': :'String',
        'cloud_exadata_infrastructure_id': :'String',
        'shape': :'String',
        'node_count': :'Integer',
        'data_storage_size_in_tbs': :'Float',
        'data_storage_size_in_gbs': :'Float',
        'cpu_core_count': :'Integer',
        'ocpu_count': :'Float',
        'memory_size_in_gbs': :'Integer',
        'license_model': :'String',
        'last_maintenance_run_id': :'String',
        'next_maintenance_run_id': :'String',
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
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {#nsg_ids} property
    # @option attributes [String] :last_update_history_entry_id The value to assign to the {#last_update_history_entry_id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :hostname The value to assign to the {#hostname} property
    # @option attributes [String] :domain The value to assign to the {#domain} property
    # @option attributes [String] :cloud_exadata_infrastructure_id The value to assign to the {#cloud_exadata_infrastructure_id} property
    # @option attributes [String] :shape The value to assign to the {#shape} property
    # @option attributes [Integer] :node_count The value to assign to the {#node_count} property
    # @option attributes [Float] :data_storage_size_in_tbs The value to assign to the {#data_storage_size_in_tbs} property
    # @option attributes [Float] :data_storage_size_in_gbs The value to assign to the {#data_storage_size_in_gbs} property
    # @option attributes [Integer] :cpu_core_count The value to assign to the {#cpu_core_count} property
    # @option attributes [Float] :ocpu_count The value to assign to the {#ocpu_count} property
    # @option attributes [Integer] :memory_size_in_gbs The value to assign to the {#memory_size_in_gbs} property
    # @option attributes [String] :license_model The value to assign to the {#license_model} property
    # @option attributes [String] :last_maintenance_run_id The value to assign to the {#last_maintenance_run_id} property
    # @option attributes [String] :next_maintenance_run_id The value to assign to the {#next_maintenance_run_id} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.description = attributes[:'description'] if attributes[:'description']

      self.availability_domain = attributes[:'availabilityDomain'] if attributes[:'availabilityDomain']

      raise 'You cannot provide both :availabilityDomain and :availability_domain' if attributes.key?(:'availabilityDomain') && attributes.key?(:'availability_domain')

      self.availability_domain = attributes[:'availability_domain'] if attributes[:'availability_domain']

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.nsg_ids = attributes[:'nsgIds'] if attributes[:'nsgIds']

      raise 'You cannot provide both :nsgIds and :nsg_ids' if attributes.key?(:'nsgIds') && attributes.key?(:'nsg_ids')

      self.nsg_ids = attributes[:'nsg_ids'] if attributes[:'nsg_ids']

      self.last_update_history_entry_id = attributes[:'lastUpdateHistoryEntryId'] if attributes[:'lastUpdateHistoryEntryId']

      raise 'You cannot provide both :lastUpdateHistoryEntryId and :last_update_history_entry_id' if attributes.key?(:'lastUpdateHistoryEntryId') && attributes.key?(:'last_update_history_entry_id')

      self.last_update_history_entry_id = attributes[:'last_update_history_entry_id'] if attributes[:'last_update_history_entry_id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.hostname = attributes[:'hostname'] if attributes[:'hostname']

      self.domain = attributes[:'domain'] if attributes[:'domain']

      self.cloud_exadata_infrastructure_id = attributes[:'cloudExadataInfrastructureId'] if attributes[:'cloudExadataInfrastructureId']

      raise 'You cannot provide both :cloudExadataInfrastructureId and :cloud_exadata_infrastructure_id' if attributes.key?(:'cloudExadataInfrastructureId') && attributes.key?(:'cloud_exadata_infrastructure_id')

      self.cloud_exadata_infrastructure_id = attributes[:'cloud_exadata_infrastructure_id'] if attributes[:'cloud_exadata_infrastructure_id']

      self.shape = attributes[:'shape'] if attributes[:'shape']

      self.node_count = attributes[:'nodeCount'] if attributes[:'nodeCount']

      raise 'You cannot provide both :nodeCount and :node_count' if attributes.key?(:'nodeCount') && attributes.key?(:'node_count')

      self.node_count = attributes[:'node_count'] if attributes[:'node_count']

      self.data_storage_size_in_tbs = attributes[:'dataStorageSizeInTBs'] if attributes[:'dataStorageSizeInTBs']

      raise 'You cannot provide both :dataStorageSizeInTBs and :data_storage_size_in_tbs' if attributes.key?(:'dataStorageSizeInTBs') && attributes.key?(:'data_storage_size_in_tbs')

      self.data_storage_size_in_tbs = attributes[:'data_storage_size_in_tbs'] if attributes[:'data_storage_size_in_tbs']

      self.data_storage_size_in_gbs = attributes[:'dataStorageSizeInGBs'] if attributes[:'dataStorageSizeInGBs']

      raise 'You cannot provide both :dataStorageSizeInGBs and :data_storage_size_in_gbs' if attributes.key?(:'dataStorageSizeInGBs') && attributes.key?(:'data_storage_size_in_gbs')

      self.data_storage_size_in_gbs = attributes[:'data_storage_size_in_gbs'] if attributes[:'data_storage_size_in_gbs']

      self.cpu_core_count = attributes[:'cpuCoreCount'] if attributes[:'cpuCoreCount']

      raise 'You cannot provide both :cpuCoreCount and :cpu_core_count' if attributes.key?(:'cpuCoreCount') && attributes.key?(:'cpu_core_count')

      self.cpu_core_count = attributes[:'cpu_core_count'] if attributes[:'cpu_core_count']

      self.ocpu_count = attributes[:'ocpuCount'] if attributes[:'ocpuCount']

      raise 'You cannot provide both :ocpuCount and :ocpu_count' if attributes.key?(:'ocpuCount') && attributes.key?(:'ocpu_count')

      self.ocpu_count = attributes[:'ocpu_count'] if attributes[:'ocpu_count']

      self.memory_size_in_gbs = attributes[:'memorySizeInGBs'] if attributes[:'memorySizeInGBs']

      raise 'You cannot provide both :memorySizeInGBs and :memory_size_in_gbs' if attributes.key?(:'memorySizeInGBs') && attributes.key?(:'memory_size_in_gbs')

      self.memory_size_in_gbs = attributes[:'memory_size_in_gbs'] if attributes[:'memory_size_in_gbs']

      self.license_model = attributes[:'licenseModel'] if attributes[:'licenseModel']

      raise 'You cannot provide both :licenseModel and :license_model' if attributes.key?(:'licenseModel') && attributes.key?(:'license_model')

      self.license_model = attributes[:'license_model'] if attributes[:'license_model']

      self.last_maintenance_run_id = attributes[:'lastMaintenanceRunId'] if attributes[:'lastMaintenanceRunId']

      raise 'You cannot provide both :lastMaintenanceRunId and :last_maintenance_run_id' if attributes.key?(:'lastMaintenanceRunId') && attributes.key?(:'last_maintenance_run_id')

      self.last_maintenance_run_id = attributes[:'last_maintenance_run_id'] if attributes[:'last_maintenance_run_id']

      self.next_maintenance_run_id = attributes[:'nextMaintenanceRunId'] if attributes[:'nextMaintenanceRunId']

      raise 'You cannot provide both :nextMaintenanceRunId and :next_maintenance_run_id' if attributes.key?(:'nextMaintenanceRunId') && attributes.key?(:'next_maintenance_run_id')

      self.next_maintenance_run_id = attributes[:'next_maintenance_run_id'] if attributes[:'next_maintenance_run_id']

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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] license_model Object to be assigned
    def license_model=(license_model)
      # rubocop:disable Style/ConditionalAssignment
      if license_model && !LICENSE_MODEL_ENUM.include?(license_model)
        OCI.logger.debug("Unknown value for 'license_model' [" + license_model + "]. Mapping to 'LICENSE_MODEL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @license_model = LICENSE_MODEL_UNKNOWN_ENUM_VALUE
      else
        @license_model = license_model
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
        compartment_id == other.compartment_id &&
        description == other.description &&
        availability_domain == other.availability_domain &&
        subnet_id == other.subnet_id &&
        nsg_ids == other.nsg_ids &&
        last_update_history_entry_id == other.last_update_history_entry_id &&
        lifecycle_state == other.lifecycle_state &&
        display_name == other.display_name &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_details == other.lifecycle_details &&
        hostname == other.hostname &&
        domain == other.domain &&
        cloud_exadata_infrastructure_id == other.cloud_exadata_infrastructure_id &&
        shape == other.shape &&
        node_count == other.node_count &&
        data_storage_size_in_tbs == other.data_storage_size_in_tbs &&
        data_storage_size_in_gbs == other.data_storage_size_in_gbs &&
        cpu_core_count == other.cpu_core_count &&
        ocpu_count == other.ocpu_count &&
        memory_size_in_gbs == other.memory_size_in_gbs &&
        license_model == other.license_model &&
        last_maintenance_run_id == other.last_maintenance_run_id &&
        next_maintenance_run_id == other.next_maintenance_run_id &&
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
      [id, compartment_id, description, availability_domain, subnet_id, nsg_ids, last_update_history_entry_id, lifecycle_state, display_name, time_created, time_updated, lifecycle_details, hostname, domain, cloud_exadata_infrastructure_id, shape, node_count, data_storage_size_in_tbs, data_storage_size_in_gbs, cpu_core_count, ocpu_count, memory_size_in_gbs, license_model, last_maintenance_run_id, next_maintenance_run_id, freeform_tags, defined_tags].hash
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
