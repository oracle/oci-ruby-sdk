# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A container for your OCI GoldenGate resources, such as the OCI GoldenGate deployment console.
  #
  class GoldenGate::Models::Deployment
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_NEEDS_ATTENTION = 'NEEDS_ATTENTION'.freeze,
      LIFECYCLE_STATE_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_CANCELING = 'CANCELING'.freeze,
      LIFECYCLE_STATE_CANCELED = 'CANCELED'.freeze,
      LIFECYCLE_STATE_SUCCEEDED = 'SUCCEEDED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_SUB_STATE_ENUM = [
      LIFECYCLE_SUB_STATE_RECOVERING = 'RECOVERING'.freeze,
      LIFECYCLE_SUB_STATE_STARTING = 'STARTING'.freeze,
      LIFECYCLE_SUB_STATE_STOPPING = 'STOPPING'.freeze,
      LIFECYCLE_SUB_STATE_MOVING = 'MOVING'.freeze,
      LIFECYCLE_SUB_STATE_UPGRADING = 'UPGRADING'.freeze,
      LIFECYCLE_SUB_STATE_RESTORING = 'RESTORING'.freeze,
      LIFECYCLE_SUB_STATE_BACKUP_IN_PROGRESS = 'BACKUP_IN_PROGRESS'.freeze,
      LIFECYCLE_SUB_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LICENSE_MODEL_ENUM = [
      LICENSE_MODEL_LICENSE_INCLUDED = 'LICENSE_INCLUDED'.freeze,
      LICENSE_MODEL_BRING_YOUR_OWN_LICENSE = 'BRING_YOUR_OWN_LICENSE'.freeze,
      LICENSE_MODEL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DEPLOYMENT_TYPE_ENUM = [
      DEPLOYMENT_TYPE_OGG = 'OGG'.freeze,
      DEPLOYMENT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the deployment being referenced.
    #
    # @return [String]
    attr_accessor :id

    # An object's Display Name.
    #
    # @return [String]
    attr_accessor :display_name

    # Metadata about this specific object.
    #
    # @return [String]
    attr_accessor :description

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment being referenced.
    #
    # @return [String]
    attr_accessor :compartment_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the backup being referenced.
    #
    # @return [String]
    attr_accessor :deployment_backup_id

    # The time the resource was created. The format is defined by [RFC3339](https://tools.ietf.org/html/rfc3339), such as `2016-08-25T21:10:29.600Z`.
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The time the resource was last updated. The format is defined by [RFC3339](https://tools.ietf.org/html/rfc3339), such as `2016-08-25T21:10:29.600Z`.
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # Possible lifecycle states.
    #
    # @return [String]
    attr_reader :lifecycle_state

    # Possible GGS lifecycle sub-states.
    #
    # @return [String]
    attr_reader :lifecycle_sub_state

    # Describes the object's current state in detail. For example, it can be used to provide actionable information for a resource in a Failed state.
    #
    # @return [String]
    attr_accessor :lifecycle_details

    # A simple key-value pair that is applied without any predefined name, type, or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Tags defined for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # True if all of the aggregate resources are working correctly.
    #
    # @return [BOOLEAN]
    attr_accessor :is_healthy

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the subnet being referenced.
    #
    # @return [String]
    attr_accessor :subnet_id

    # A three-label Fully Qualified Domain Name (FQDN) for a resource.
    #
    # @return [String]
    attr_accessor :fqdn

    # **[Required]** The Oracle license model that applies to a Deployment.
    #
    # @return [String]
    attr_reader :license_model

    # **[Required]** The Minimum number of OCPUs to be made available for this Deployment.
    #
    # @return [Integer]
    attr_accessor :cpu_core_count

    # **[Required]** Indicates if auto scaling is enabled for the Deployment's CPU core count.
    #
    # @return [BOOLEAN]
    attr_accessor :is_auto_scaling_enabled

    # An array of [Network Security Group](https://docs.cloud.oracle.com/Content/Network/Concepts/networksecuritygroups.htm) OCIDs used to define network access for a deployment.
    #
    # @return [Array<String>]
    attr_accessor :nsg_ids

    # True if this object is publicly available.
    #
    # @return [BOOLEAN]
    attr_accessor :is_public

    # The public IP address representing the access point for the Deployment.
    #
    # @return [String]
    attr_accessor :public_ip_address

    # The private IP address in the customer's VCN representing the access point for the associated endpoint service in the GoldenGate service VCN.
    #
    # @return [String]
    attr_accessor :private_ip_address

    # The URL of a resource.
    #
    # @return [String]
    attr_accessor :deployment_url

    # The system tags associated with this resource, if any. The system tags are set by Oracle Cloud Infrastructure services. Each key is predefined and scoped to namespaces.  For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    # Example: `{orcl-cloud: {free-tier-retain: true}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Indicates if the resource is the the latest available version.
    #
    # @return [BOOLEAN]
    attr_accessor :is_latest_version

    # The date the existing version in use will no longer be considered as usable and an upgrade will be required.  This date is typically 6 months after the version was released for use by GGS.  The format is defined by [RFC3339](https://tools.ietf.org/html/rfc3339), such as `2016-08-25T21:10:29.600Z`.
    #
    # @return [DateTime]
    attr_accessor :time_upgrade_required

    # The amount of storage being utilized (in bytes)
    #
    # @return [Integer]
    attr_accessor :storage_utilization_in_bytes

    # Indicator will be true if the amount of storage being utilized exceeds the allowable storage utilization limit.  Exceeding the limit may be an indication of a misconfiguration of the deployment's GoldenGate service.
    #
    # @return [BOOLEAN]
    attr_accessor :is_storage_utilization_limit_exceeded

    # **[Required]** The deployment type.
    #
    # @return [String]
    attr_reader :deployment_type

    # @return [OCI::GoldenGate::Models::OggDeployment]
    attr_accessor :ogg_data

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'description': :'description',
        'compartment_id': :'compartmentId',
        'deployment_backup_id': :'deploymentBackupId',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_sub_state': :'lifecycleSubState',
        'lifecycle_details': :'lifecycleDetails',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'is_healthy': :'isHealthy',
        'subnet_id': :'subnetId',
        'fqdn': :'fqdn',
        'license_model': :'licenseModel',
        'cpu_core_count': :'cpuCoreCount',
        'is_auto_scaling_enabled': :'isAutoScalingEnabled',
        'nsg_ids': :'nsgIds',
        'is_public': :'isPublic',
        'public_ip_address': :'publicIpAddress',
        'private_ip_address': :'privateIpAddress',
        'deployment_url': :'deploymentUrl',
        'system_tags': :'systemTags',
        'is_latest_version': :'isLatestVersion',
        'time_upgrade_required': :'timeUpgradeRequired',
        'storage_utilization_in_bytes': :'storageUtilizationInBytes',
        'is_storage_utilization_limit_exceeded': :'isStorageUtilizationLimitExceeded',
        'deployment_type': :'deploymentType',
        'ogg_data': :'oggData'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'display_name': :'String',
        'description': :'String',
        'compartment_id': :'String',
        'deployment_backup_id': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_sub_state': :'String',
        'lifecycle_details': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'is_healthy': :'BOOLEAN',
        'subnet_id': :'String',
        'fqdn': :'String',
        'license_model': :'String',
        'cpu_core_count': :'Integer',
        'is_auto_scaling_enabled': :'BOOLEAN',
        'nsg_ids': :'Array<String>',
        'is_public': :'BOOLEAN',
        'public_ip_address': :'String',
        'private_ip_address': :'String',
        'deployment_url': :'String',
        'system_tags': :'Hash<String, Hash<String, Object>>',
        'is_latest_version': :'BOOLEAN',
        'time_upgrade_required': :'DateTime',
        'storage_utilization_in_bytes': :'Integer',
        'is_storage_utilization_limit_exceeded': :'BOOLEAN',
        'deployment_type': :'String',
        'ogg_data': :'OCI::GoldenGate::Models::OggDeployment'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :deployment_backup_id The value to assign to the {#deployment_backup_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_sub_state The value to assign to the {#lifecycle_sub_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [BOOLEAN] :is_healthy The value to assign to the {#is_healthy} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [String] :fqdn The value to assign to the {#fqdn} property
    # @option attributes [String] :license_model The value to assign to the {#license_model} property
    # @option attributes [Integer] :cpu_core_count The value to assign to the {#cpu_core_count} property
    # @option attributes [BOOLEAN] :is_auto_scaling_enabled The value to assign to the {#is_auto_scaling_enabled} property
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {#nsg_ids} property
    # @option attributes [BOOLEAN] :is_public The value to assign to the {#is_public} property
    # @option attributes [String] :public_ip_address The value to assign to the {#public_ip_address} property
    # @option attributes [String] :private_ip_address The value to assign to the {#private_ip_address} property
    # @option attributes [String] :deployment_url The value to assign to the {#deployment_url} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    # @option attributes [BOOLEAN] :is_latest_version The value to assign to the {#is_latest_version} property
    # @option attributes [DateTime] :time_upgrade_required The value to assign to the {#time_upgrade_required} property
    # @option attributes [Integer] :storage_utilization_in_bytes The value to assign to the {#storage_utilization_in_bytes} property
    # @option attributes [BOOLEAN] :is_storage_utilization_limit_exceeded The value to assign to the {#is_storage_utilization_limit_exceeded} property
    # @option attributes [String] :deployment_type The value to assign to the {#deployment_type} property
    # @option attributes [OCI::GoldenGate::Models::OggDeployment] :ogg_data The value to assign to the {#ogg_data} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.deployment_backup_id = attributes[:'deploymentBackupId'] if attributes[:'deploymentBackupId']

      raise 'You cannot provide both :deploymentBackupId and :deployment_backup_id' if attributes.key?(:'deploymentBackupId') && attributes.key?(:'deployment_backup_id')

      self.deployment_backup_id = attributes[:'deployment_backup_id'] if attributes[:'deployment_backup_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_sub_state = attributes[:'lifecycleSubState'] if attributes[:'lifecycleSubState']

      raise 'You cannot provide both :lifecycleSubState and :lifecycle_sub_state' if attributes.key?(:'lifecycleSubState') && attributes.key?(:'lifecycle_sub_state')

      self.lifecycle_sub_state = attributes[:'lifecycle_sub_state'] if attributes[:'lifecycle_sub_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.is_healthy = attributes[:'isHealthy'] unless attributes[:'isHealthy'].nil?

      raise 'You cannot provide both :isHealthy and :is_healthy' if attributes.key?(:'isHealthy') && attributes.key?(:'is_healthy')

      self.is_healthy = attributes[:'is_healthy'] unless attributes[:'is_healthy'].nil?

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.fqdn = attributes[:'fqdn'] if attributes[:'fqdn']

      self.license_model = attributes[:'licenseModel'] if attributes[:'licenseModel']

      raise 'You cannot provide both :licenseModel and :license_model' if attributes.key?(:'licenseModel') && attributes.key?(:'license_model')

      self.license_model = attributes[:'license_model'] if attributes[:'license_model']

      self.cpu_core_count = attributes[:'cpuCoreCount'] if attributes[:'cpuCoreCount']

      raise 'You cannot provide both :cpuCoreCount and :cpu_core_count' if attributes.key?(:'cpuCoreCount') && attributes.key?(:'cpu_core_count')

      self.cpu_core_count = attributes[:'cpu_core_count'] if attributes[:'cpu_core_count']

      self.is_auto_scaling_enabled = attributes[:'isAutoScalingEnabled'] unless attributes[:'isAutoScalingEnabled'].nil?

      raise 'You cannot provide both :isAutoScalingEnabled and :is_auto_scaling_enabled' if attributes.key?(:'isAutoScalingEnabled') && attributes.key?(:'is_auto_scaling_enabled')

      self.is_auto_scaling_enabled = attributes[:'is_auto_scaling_enabled'] unless attributes[:'is_auto_scaling_enabled'].nil?

      self.nsg_ids = attributes[:'nsgIds'] if attributes[:'nsgIds']

      raise 'You cannot provide both :nsgIds and :nsg_ids' if attributes.key?(:'nsgIds') && attributes.key?(:'nsg_ids')

      self.nsg_ids = attributes[:'nsg_ids'] if attributes[:'nsg_ids']

      self.is_public = attributes[:'isPublic'] unless attributes[:'isPublic'].nil?

      raise 'You cannot provide both :isPublic and :is_public' if attributes.key?(:'isPublic') && attributes.key?(:'is_public')

      self.is_public = attributes[:'is_public'] unless attributes[:'is_public'].nil?

      self.public_ip_address = attributes[:'publicIpAddress'] if attributes[:'publicIpAddress']

      raise 'You cannot provide both :publicIpAddress and :public_ip_address' if attributes.key?(:'publicIpAddress') && attributes.key?(:'public_ip_address')

      self.public_ip_address = attributes[:'public_ip_address'] if attributes[:'public_ip_address']

      self.private_ip_address = attributes[:'privateIpAddress'] if attributes[:'privateIpAddress']

      raise 'You cannot provide both :privateIpAddress and :private_ip_address' if attributes.key?(:'privateIpAddress') && attributes.key?(:'private_ip_address')

      self.private_ip_address = attributes[:'private_ip_address'] if attributes[:'private_ip_address']

      self.deployment_url = attributes[:'deploymentUrl'] if attributes[:'deploymentUrl']

      raise 'You cannot provide both :deploymentUrl and :deployment_url' if attributes.key?(:'deploymentUrl') && attributes.key?(:'deployment_url')

      self.deployment_url = attributes[:'deployment_url'] if attributes[:'deployment_url']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']

      self.is_latest_version = attributes[:'isLatestVersion'] unless attributes[:'isLatestVersion'].nil?

      raise 'You cannot provide both :isLatestVersion and :is_latest_version' if attributes.key?(:'isLatestVersion') && attributes.key?(:'is_latest_version')

      self.is_latest_version = attributes[:'is_latest_version'] unless attributes[:'is_latest_version'].nil?

      self.time_upgrade_required = attributes[:'timeUpgradeRequired'] if attributes[:'timeUpgradeRequired']

      raise 'You cannot provide both :timeUpgradeRequired and :time_upgrade_required' if attributes.key?(:'timeUpgradeRequired') && attributes.key?(:'time_upgrade_required')

      self.time_upgrade_required = attributes[:'time_upgrade_required'] if attributes[:'time_upgrade_required']

      self.storage_utilization_in_bytes = attributes[:'storageUtilizationInBytes'] if attributes[:'storageUtilizationInBytes']

      raise 'You cannot provide both :storageUtilizationInBytes and :storage_utilization_in_bytes' if attributes.key?(:'storageUtilizationInBytes') && attributes.key?(:'storage_utilization_in_bytes')

      self.storage_utilization_in_bytes = attributes[:'storage_utilization_in_bytes'] if attributes[:'storage_utilization_in_bytes']

      self.is_storage_utilization_limit_exceeded = attributes[:'isStorageUtilizationLimitExceeded'] unless attributes[:'isStorageUtilizationLimitExceeded'].nil?

      raise 'You cannot provide both :isStorageUtilizationLimitExceeded and :is_storage_utilization_limit_exceeded' if attributes.key?(:'isStorageUtilizationLimitExceeded') && attributes.key?(:'is_storage_utilization_limit_exceeded')

      self.is_storage_utilization_limit_exceeded = attributes[:'is_storage_utilization_limit_exceeded'] unless attributes[:'is_storage_utilization_limit_exceeded'].nil?

      self.deployment_type = attributes[:'deploymentType'] if attributes[:'deploymentType']

      raise 'You cannot provide both :deploymentType and :deployment_type' if attributes.key?(:'deploymentType') && attributes.key?(:'deployment_type')

      self.deployment_type = attributes[:'deployment_type'] if attributes[:'deployment_type']

      self.ogg_data = attributes[:'oggData'] if attributes[:'oggData']

      raise 'You cannot provide both :oggData and :ogg_data' if attributes.key?(:'oggData') && attributes.key?(:'ogg_data')

      self.ogg_data = attributes[:'ogg_data'] if attributes[:'ogg_data']
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
    # @param [Object] lifecycle_sub_state Object to be assigned
    def lifecycle_sub_state=(lifecycle_sub_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_sub_state && !LIFECYCLE_SUB_STATE_ENUM.include?(lifecycle_sub_state)
        OCI.logger.debug("Unknown value for 'lifecycle_sub_state' [" + lifecycle_sub_state + "]. Mapping to 'LIFECYCLE_SUB_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_sub_state = LIFECYCLE_SUB_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_sub_state = lifecycle_sub_state
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] deployment_type Object to be assigned
    def deployment_type=(deployment_type)
      # rubocop:disable Style/ConditionalAssignment
      if deployment_type && !DEPLOYMENT_TYPE_ENUM.include?(deployment_type)
        OCI.logger.debug("Unknown value for 'deployment_type' [" + deployment_type + "]. Mapping to 'DEPLOYMENT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @deployment_type = DEPLOYMENT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @deployment_type = deployment_type
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
        description == other.description &&
        compartment_id == other.compartment_id &&
        deployment_backup_id == other.deployment_backup_id &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_sub_state == other.lifecycle_sub_state &&
        lifecycle_details == other.lifecycle_details &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        is_healthy == other.is_healthy &&
        subnet_id == other.subnet_id &&
        fqdn == other.fqdn &&
        license_model == other.license_model &&
        cpu_core_count == other.cpu_core_count &&
        is_auto_scaling_enabled == other.is_auto_scaling_enabled &&
        nsg_ids == other.nsg_ids &&
        is_public == other.is_public &&
        public_ip_address == other.public_ip_address &&
        private_ip_address == other.private_ip_address &&
        deployment_url == other.deployment_url &&
        system_tags == other.system_tags &&
        is_latest_version == other.is_latest_version &&
        time_upgrade_required == other.time_upgrade_required &&
        storage_utilization_in_bytes == other.storage_utilization_in_bytes &&
        is_storage_utilization_limit_exceeded == other.is_storage_utilization_limit_exceeded &&
        deployment_type == other.deployment_type &&
        ogg_data == other.ogg_data
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
      [id, display_name, description, compartment_id, deployment_backup_id, time_created, time_updated, lifecycle_state, lifecycle_sub_state, lifecycle_details, freeform_tags, defined_tags, is_healthy, subnet_id, fqdn, license_model, cpu_core_count, is_auto_scaling_enabled, nsg_ids, is_public, public_ip_address, private_ip_address, deployment_url, system_tags, is_latest_version, time_upgrade_required, storage_utilization_in_bytes, is_storage_utilization_limit_exceeded, deployment_type, ogg_data].hash
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
