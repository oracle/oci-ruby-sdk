# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of a maintenance run.
  #
  class Database::Models::MaintenanceRunSummary
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_SCHEDULED = 'SCHEDULED'.freeze,
      LIFECYCLE_STATE_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_SUCCEEDED = 'SUCCEEDED'.freeze,
      LIFECYCLE_STATE_SKIPPED = 'SKIPPED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_CANCELED = 'CANCELED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    TARGET_RESOURCE_TYPE_ENUM = [
      TARGET_RESOURCE_TYPE_AUTONOMOUS_EXADATA_INFRASTRUCTURE = 'AUTONOMOUS_EXADATA_INFRASTRUCTURE'.freeze,
      TARGET_RESOURCE_TYPE_AUTONOMOUS_CONTAINER_DATABASE = 'AUTONOMOUS_CONTAINER_DATABASE'.freeze,
      TARGET_RESOURCE_TYPE_EXADATA_DB_SYSTEM = 'EXADATA_DB_SYSTEM'.freeze,
      TARGET_RESOURCE_TYPE_CLOUD_EXADATA_INFRASTRUCTURE = 'CLOUD_EXADATA_INFRASTRUCTURE'.freeze,
      TARGET_RESOURCE_TYPE_EXACC_INFRASTRUCTURE = 'EXACC_INFRASTRUCTURE'.freeze,
      TARGET_RESOURCE_TYPE_AUTONOMOUS_VM_CLUSTER = 'AUTONOMOUS_VM_CLUSTER'.freeze,
      TARGET_RESOURCE_TYPE_AUTONOMOUS_DATABASE = 'AUTONOMOUS_DATABASE'.freeze,
      TARGET_RESOURCE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    MAINTENANCE_TYPE_ENUM = [
      MAINTENANCE_TYPE_PLANNED = 'PLANNED'.freeze,
      MAINTENANCE_TYPE_UNPLANNED = 'UNPLANNED'.freeze,
      MAINTENANCE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    MAINTENANCE_SUBTYPE_ENUM = [
      MAINTENANCE_SUBTYPE_QUARTERLY = 'QUARTERLY'.freeze,
      MAINTENANCE_SUBTYPE_HARDWARE = 'HARDWARE'.freeze,
      MAINTENANCE_SUBTYPE_CRITICAL = 'CRITICAL'.freeze,
      MAINTENANCE_SUBTYPE_INFRASTRUCTURE = 'INFRASTRUCTURE'.freeze,
      MAINTENANCE_SUBTYPE_DATABASE = 'DATABASE'.freeze,
      MAINTENANCE_SUBTYPE_ONEOFF = 'ONEOFF'.freeze,
      MAINTENANCE_SUBTYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PATCHING_MODE_ENUM = [
      PATCHING_MODE_ROLLING = 'ROLLING'.freeze,
      PATCHING_MODE_NONROLLING = 'NONROLLING'.freeze,
      PATCHING_MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PATCHING_STATUS_ENUM = [
      PATCHING_STATUS_PATCHING = 'PATCHING'.freeze,
      PATCHING_STATUS_WAITING = 'WAITING'.freeze,
      PATCHING_STATUS_SCHEDULED = 'SCHEDULED'.freeze,
      PATCHING_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the maintenance run.
    # @return [String]
    attr_accessor :id

    # **[Required]** The OCID of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The user-friendly name for the maintenance run.
    # @return [String]
    attr_accessor :display_name

    # Description of the maintenance run.
    # @return [String]
    attr_accessor :description

    # **[Required]** The current state of the maintenance run. For Autonomous Database on shared Exadata infrastructure, valid states are IN_PROGRESS, SUCCEEDED and FAILED.
    #
    # @return [String]
    attr_reader :lifecycle_state

    # Additional information about the current lifecycle state.
    # @return [String]
    attr_accessor :lifecycle_details

    # **[Required]** The date and time the maintenance run is scheduled to occur.
    # @return [DateTime]
    attr_accessor :time_scheduled

    # The date and time the maintenance run starts.
    # @return [DateTime]
    attr_accessor :time_started

    # The date and time the maintenance run was completed.
    # @return [DateTime]
    attr_accessor :time_ended

    # The type of the target resource on which the maintenance run occurs.
    # @return [String]
    attr_reader :target_resource_type

    # The ID of the target resource on which the maintenance run occurs.
    # @return [String]
    attr_accessor :target_resource_id

    # Maintenance type.
    # @return [String]
    attr_reader :maintenance_type

    # The unique identifier of the patch. The identifier string includes the patch type, the Oracle Database version, and the patch creation date (using the format YYMMDD). For example, the identifier `ru_patch_19.9.0.0_201030` is used for an RU patch for Oracle Database 19.9.0.0 that was released October 30, 2020.
    # @return [String]
    attr_accessor :patch_id

    # Maintenance sub-type.
    # @return [String]
    attr_reader :maintenance_subtype

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the maintenance run for the Autonomous Data Guard association's peer container database.
    # @return [String]
    attr_accessor :peer_maintenance_run_id

    # Cloud Exadata infrastructure node patching method, either \"ROLLING\" or \"NONROLLING\". Default value is ROLLING.
    #
    # *IMPORTANT*: Non-rolling infrastructure patching involves system down time. See [Oracle-Managed Infrastructure Maintenance Updates](https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/examaintenance.htm#Oracle) for more information.
    #
    # @return [String]
    attr_reader :patching_mode

    # Contain the patch failure count.
    # @return [Integer]
    attr_accessor :patch_failure_count

    # The target software version for the database server patching operation.
    # @return [String]
    attr_accessor :target_db_server_version

    # The target Cell version that is to be patched to.
    # @return [String]
    attr_accessor :target_storage_server_version

    # If true, enables the configuration of a custom action timeout (waiting period) between database servers patching operations.
    # @return [BOOLEAN]
    attr_accessor :is_custom_action_timeout_enabled

    # Determines the amount of time the system will wait before the start of each database server patching operation.
    # Specify a number of minutes, from 15 to 120.
    #
    # @return [Integer]
    attr_accessor :custom_action_timeout_in_mins

    # Extend current custom action timeout between the current database servers during waiting state, from 0 (zero) to 30 minutes.
    # @return [Integer]
    attr_accessor :current_custom_action_timeout_in_mins

    # The status of the patching operation.
    # @return [String]
    attr_reader :patching_status

    # The time when the patching operation started.
    # @return [DateTime]
    attr_accessor :patching_start_time

    # The time when the patching operation ended.
    # @return [DateTime]
    attr_accessor :patching_end_time

    # @return [OCI::Database::Models::EstimatedPatchingTime]
    attr_accessor :estimated_patching_time

    # The name of the current infrastruture component that is getting patched.
    # @return [String]
    attr_accessor :current_patching_component

    # The estimated start time of the next infrastruture component patching operation.
    # @return [DateTime]
    attr_accessor :estimated_component_patching_start_time

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'description': :'description',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'time_scheduled': :'timeScheduled',
        'time_started': :'timeStarted',
        'time_ended': :'timeEnded',
        'target_resource_type': :'targetResourceType',
        'target_resource_id': :'targetResourceId',
        'maintenance_type': :'maintenanceType',
        'patch_id': :'patchId',
        'maintenance_subtype': :'maintenanceSubtype',
        'peer_maintenance_run_id': :'peerMaintenanceRunId',
        'patching_mode': :'patchingMode',
        'patch_failure_count': :'patchFailureCount',
        'target_db_server_version': :'targetDbServerVersion',
        'target_storage_server_version': :'targetStorageServerVersion',
        'is_custom_action_timeout_enabled': :'isCustomActionTimeoutEnabled',
        'custom_action_timeout_in_mins': :'customActionTimeoutInMins',
        'current_custom_action_timeout_in_mins': :'currentCustomActionTimeoutInMins',
        'patching_status': :'patchingStatus',
        'patching_start_time': :'patchingStartTime',
        'patching_end_time': :'patchingEndTime',
        'estimated_patching_time': :'estimatedPatchingTime',
        'current_patching_component': :'currentPatchingComponent',
        'estimated_component_patching_start_time': :'estimatedComponentPatchingStartTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'display_name': :'String',
        'description': :'String',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'time_scheduled': :'DateTime',
        'time_started': :'DateTime',
        'time_ended': :'DateTime',
        'target_resource_type': :'String',
        'target_resource_id': :'String',
        'maintenance_type': :'String',
        'patch_id': :'String',
        'maintenance_subtype': :'String',
        'peer_maintenance_run_id': :'String',
        'patching_mode': :'String',
        'patch_failure_count': :'Integer',
        'target_db_server_version': :'String',
        'target_storage_server_version': :'String',
        'is_custom_action_timeout_enabled': :'BOOLEAN',
        'custom_action_timeout_in_mins': :'Integer',
        'current_custom_action_timeout_in_mins': :'Integer',
        'patching_status': :'String',
        'patching_start_time': :'DateTime',
        'patching_end_time': :'DateTime',
        'estimated_patching_time': :'OCI::Database::Models::EstimatedPatchingTime',
        'current_patching_component': :'String',
        'estimated_component_patching_start_time': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [DateTime] :time_scheduled The value to assign to the {#time_scheduled} property
    # @option attributes [DateTime] :time_started The value to assign to the {#time_started} property
    # @option attributes [DateTime] :time_ended The value to assign to the {#time_ended} property
    # @option attributes [String] :target_resource_type The value to assign to the {#target_resource_type} property
    # @option attributes [String] :target_resource_id The value to assign to the {#target_resource_id} property
    # @option attributes [String] :maintenance_type The value to assign to the {#maintenance_type} property
    # @option attributes [String] :patch_id The value to assign to the {#patch_id} property
    # @option attributes [String] :maintenance_subtype The value to assign to the {#maintenance_subtype} property
    # @option attributes [String] :peer_maintenance_run_id The value to assign to the {#peer_maintenance_run_id} property
    # @option attributes [String] :patching_mode The value to assign to the {#patching_mode} property
    # @option attributes [Integer] :patch_failure_count The value to assign to the {#patch_failure_count} property
    # @option attributes [String] :target_db_server_version The value to assign to the {#target_db_server_version} property
    # @option attributes [String] :target_storage_server_version The value to assign to the {#target_storage_server_version} property
    # @option attributes [BOOLEAN] :is_custom_action_timeout_enabled The value to assign to the {#is_custom_action_timeout_enabled} property
    # @option attributes [Integer] :custom_action_timeout_in_mins The value to assign to the {#custom_action_timeout_in_mins} property
    # @option attributes [Integer] :current_custom_action_timeout_in_mins The value to assign to the {#current_custom_action_timeout_in_mins} property
    # @option attributes [String] :patching_status The value to assign to the {#patching_status} property
    # @option attributes [DateTime] :patching_start_time The value to assign to the {#patching_start_time} property
    # @option attributes [DateTime] :patching_end_time The value to assign to the {#patching_end_time} property
    # @option attributes [OCI::Database::Models::EstimatedPatchingTime] :estimated_patching_time The value to assign to the {#estimated_patching_time} property
    # @option attributes [String] :current_patching_component The value to assign to the {#current_patching_component} property
    # @option attributes [DateTime] :estimated_component_patching_start_time The value to assign to the {#estimated_component_patching_start_time} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.time_scheduled = attributes[:'timeScheduled'] if attributes[:'timeScheduled']

      raise 'You cannot provide both :timeScheduled and :time_scheduled' if attributes.key?(:'timeScheduled') && attributes.key?(:'time_scheduled')

      self.time_scheduled = attributes[:'time_scheduled'] if attributes[:'time_scheduled']

      self.time_started = attributes[:'timeStarted'] if attributes[:'timeStarted']

      raise 'You cannot provide both :timeStarted and :time_started' if attributes.key?(:'timeStarted') && attributes.key?(:'time_started')

      self.time_started = attributes[:'time_started'] if attributes[:'time_started']

      self.time_ended = attributes[:'timeEnded'] if attributes[:'timeEnded']

      raise 'You cannot provide both :timeEnded and :time_ended' if attributes.key?(:'timeEnded') && attributes.key?(:'time_ended')

      self.time_ended = attributes[:'time_ended'] if attributes[:'time_ended']

      self.target_resource_type = attributes[:'targetResourceType'] if attributes[:'targetResourceType']

      raise 'You cannot provide both :targetResourceType and :target_resource_type' if attributes.key?(:'targetResourceType') && attributes.key?(:'target_resource_type')

      self.target_resource_type = attributes[:'target_resource_type'] if attributes[:'target_resource_type']

      self.target_resource_id = attributes[:'targetResourceId'] if attributes[:'targetResourceId']

      raise 'You cannot provide both :targetResourceId and :target_resource_id' if attributes.key?(:'targetResourceId') && attributes.key?(:'target_resource_id')

      self.target_resource_id = attributes[:'target_resource_id'] if attributes[:'target_resource_id']

      self.maintenance_type = attributes[:'maintenanceType'] if attributes[:'maintenanceType']

      raise 'You cannot provide both :maintenanceType and :maintenance_type' if attributes.key?(:'maintenanceType') && attributes.key?(:'maintenance_type')

      self.maintenance_type = attributes[:'maintenance_type'] if attributes[:'maintenance_type']

      self.patch_id = attributes[:'patchId'] if attributes[:'patchId']

      raise 'You cannot provide both :patchId and :patch_id' if attributes.key?(:'patchId') && attributes.key?(:'patch_id')

      self.patch_id = attributes[:'patch_id'] if attributes[:'patch_id']

      self.maintenance_subtype = attributes[:'maintenanceSubtype'] if attributes[:'maintenanceSubtype']

      raise 'You cannot provide both :maintenanceSubtype and :maintenance_subtype' if attributes.key?(:'maintenanceSubtype') && attributes.key?(:'maintenance_subtype')

      self.maintenance_subtype = attributes[:'maintenance_subtype'] if attributes[:'maintenance_subtype']

      self.peer_maintenance_run_id = attributes[:'peerMaintenanceRunId'] if attributes[:'peerMaintenanceRunId']

      raise 'You cannot provide both :peerMaintenanceRunId and :peer_maintenance_run_id' if attributes.key?(:'peerMaintenanceRunId') && attributes.key?(:'peer_maintenance_run_id')

      self.peer_maintenance_run_id = attributes[:'peer_maintenance_run_id'] if attributes[:'peer_maintenance_run_id']

      self.patching_mode = attributes[:'patchingMode'] if attributes[:'patchingMode']

      raise 'You cannot provide both :patchingMode and :patching_mode' if attributes.key?(:'patchingMode') && attributes.key?(:'patching_mode')

      self.patching_mode = attributes[:'patching_mode'] if attributes[:'patching_mode']

      self.patch_failure_count = attributes[:'patchFailureCount'] if attributes[:'patchFailureCount']

      raise 'You cannot provide both :patchFailureCount and :patch_failure_count' if attributes.key?(:'patchFailureCount') && attributes.key?(:'patch_failure_count')

      self.patch_failure_count = attributes[:'patch_failure_count'] if attributes[:'patch_failure_count']

      self.target_db_server_version = attributes[:'targetDbServerVersion'] if attributes[:'targetDbServerVersion']

      raise 'You cannot provide both :targetDbServerVersion and :target_db_server_version' if attributes.key?(:'targetDbServerVersion') && attributes.key?(:'target_db_server_version')

      self.target_db_server_version = attributes[:'target_db_server_version'] if attributes[:'target_db_server_version']

      self.target_storage_server_version = attributes[:'targetStorageServerVersion'] if attributes[:'targetStorageServerVersion']

      raise 'You cannot provide both :targetStorageServerVersion and :target_storage_server_version' if attributes.key?(:'targetStorageServerVersion') && attributes.key?(:'target_storage_server_version')

      self.target_storage_server_version = attributes[:'target_storage_server_version'] if attributes[:'target_storage_server_version']

      self.is_custom_action_timeout_enabled = attributes[:'isCustomActionTimeoutEnabled'] unless attributes[:'isCustomActionTimeoutEnabled'].nil?

      raise 'You cannot provide both :isCustomActionTimeoutEnabled and :is_custom_action_timeout_enabled' if attributes.key?(:'isCustomActionTimeoutEnabled') && attributes.key?(:'is_custom_action_timeout_enabled')

      self.is_custom_action_timeout_enabled = attributes[:'is_custom_action_timeout_enabled'] unless attributes[:'is_custom_action_timeout_enabled'].nil?

      self.custom_action_timeout_in_mins = attributes[:'customActionTimeoutInMins'] if attributes[:'customActionTimeoutInMins']

      raise 'You cannot provide both :customActionTimeoutInMins and :custom_action_timeout_in_mins' if attributes.key?(:'customActionTimeoutInMins') && attributes.key?(:'custom_action_timeout_in_mins')

      self.custom_action_timeout_in_mins = attributes[:'custom_action_timeout_in_mins'] if attributes[:'custom_action_timeout_in_mins']

      self.current_custom_action_timeout_in_mins = attributes[:'currentCustomActionTimeoutInMins'] if attributes[:'currentCustomActionTimeoutInMins']

      raise 'You cannot provide both :currentCustomActionTimeoutInMins and :current_custom_action_timeout_in_mins' if attributes.key?(:'currentCustomActionTimeoutInMins') && attributes.key?(:'current_custom_action_timeout_in_mins')

      self.current_custom_action_timeout_in_mins = attributes[:'current_custom_action_timeout_in_mins'] if attributes[:'current_custom_action_timeout_in_mins']

      self.patching_status = attributes[:'patchingStatus'] if attributes[:'patchingStatus']

      raise 'You cannot provide both :patchingStatus and :patching_status' if attributes.key?(:'patchingStatus') && attributes.key?(:'patching_status')

      self.patching_status = attributes[:'patching_status'] if attributes[:'patching_status']

      self.patching_start_time = attributes[:'patchingStartTime'] if attributes[:'patchingStartTime']

      raise 'You cannot provide both :patchingStartTime and :patching_start_time' if attributes.key?(:'patchingStartTime') && attributes.key?(:'patching_start_time')

      self.patching_start_time = attributes[:'patching_start_time'] if attributes[:'patching_start_time']

      self.patching_end_time = attributes[:'patchingEndTime'] if attributes[:'patchingEndTime']

      raise 'You cannot provide both :patchingEndTime and :patching_end_time' if attributes.key?(:'patchingEndTime') && attributes.key?(:'patching_end_time')

      self.patching_end_time = attributes[:'patching_end_time'] if attributes[:'patching_end_time']

      self.estimated_patching_time = attributes[:'estimatedPatchingTime'] if attributes[:'estimatedPatchingTime']

      raise 'You cannot provide both :estimatedPatchingTime and :estimated_patching_time' if attributes.key?(:'estimatedPatchingTime') && attributes.key?(:'estimated_patching_time')

      self.estimated_patching_time = attributes[:'estimated_patching_time'] if attributes[:'estimated_patching_time']

      self.current_patching_component = attributes[:'currentPatchingComponent'] if attributes[:'currentPatchingComponent']

      raise 'You cannot provide both :currentPatchingComponent and :current_patching_component' if attributes.key?(:'currentPatchingComponent') && attributes.key?(:'current_patching_component')

      self.current_patching_component = attributes[:'current_patching_component'] if attributes[:'current_patching_component']

      self.estimated_component_patching_start_time = attributes[:'estimatedComponentPatchingStartTime'] if attributes[:'estimatedComponentPatchingStartTime']

      raise 'You cannot provide both :estimatedComponentPatchingStartTime and :estimated_component_patching_start_time' if attributes.key?(:'estimatedComponentPatchingStartTime') && attributes.key?(:'estimated_component_patching_start_time')

      self.estimated_component_patching_start_time = attributes[:'estimated_component_patching_start_time'] if attributes[:'estimated_component_patching_start_time']
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
    # @param [Object] target_resource_type Object to be assigned
    def target_resource_type=(target_resource_type)
      # rubocop:disable Style/ConditionalAssignment
      if target_resource_type && !TARGET_RESOURCE_TYPE_ENUM.include?(target_resource_type)
        OCI.logger.debug("Unknown value for 'target_resource_type' [" + target_resource_type + "]. Mapping to 'TARGET_RESOURCE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @target_resource_type = TARGET_RESOURCE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @target_resource_type = target_resource_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] maintenance_type Object to be assigned
    def maintenance_type=(maintenance_type)
      # rubocop:disable Style/ConditionalAssignment
      if maintenance_type && !MAINTENANCE_TYPE_ENUM.include?(maintenance_type)
        OCI.logger.debug("Unknown value for 'maintenance_type' [" + maintenance_type + "]. Mapping to 'MAINTENANCE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @maintenance_type = MAINTENANCE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @maintenance_type = maintenance_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] maintenance_subtype Object to be assigned
    def maintenance_subtype=(maintenance_subtype)
      # rubocop:disable Style/ConditionalAssignment
      if maintenance_subtype && !MAINTENANCE_SUBTYPE_ENUM.include?(maintenance_subtype)
        OCI.logger.debug("Unknown value for 'maintenance_subtype' [" + maintenance_subtype + "]. Mapping to 'MAINTENANCE_SUBTYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @maintenance_subtype = MAINTENANCE_SUBTYPE_UNKNOWN_ENUM_VALUE
      else
        @maintenance_subtype = maintenance_subtype
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] patching_mode Object to be assigned
    def patching_mode=(patching_mode)
      # rubocop:disable Style/ConditionalAssignment
      if patching_mode && !PATCHING_MODE_ENUM.include?(patching_mode)
        OCI.logger.debug("Unknown value for 'patching_mode' [" + patching_mode + "]. Mapping to 'PATCHING_MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @patching_mode = PATCHING_MODE_UNKNOWN_ENUM_VALUE
      else
        @patching_mode = patching_mode
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] patching_status Object to be assigned
    def patching_status=(patching_status)
      # rubocop:disable Style/ConditionalAssignment
      if patching_status && !PATCHING_STATUS_ENUM.include?(patching_status)
        OCI.logger.debug("Unknown value for 'patching_status' [" + patching_status + "]. Mapping to 'PATCHING_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @patching_status = PATCHING_STATUS_UNKNOWN_ENUM_VALUE
      else
        @patching_status = patching_status
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
        display_name == other.display_name &&
        description == other.description &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        time_scheduled == other.time_scheduled &&
        time_started == other.time_started &&
        time_ended == other.time_ended &&
        target_resource_type == other.target_resource_type &&
        target_resource_id == other.target_resource_id &&
        maintenance_type == other.maintenance_type &&
        patch_id == other.patch_id &&
        maintenance_subtype == other.maintenance_subtype &&
        peer_maintenance_run_id == other.peer_maintenance_run_id &&
        patching_mode == other.patching_mode &&
        patch_failure_count == other.patch_failure_count &&
        target_db_server_version == other.target_db_server_version &&
        target_storage_server_version == other.target_storage_server_version &&
        is_custom_action_timeout_enabled == other.is_custom_action_timeout_enabled &&
        custom_action_timeout_in_mins == other.custom_action_timeout_in_mins &&
        current_custom_action_timeout_in_mins == other.current_custom_action_timeout_in_mins &&
        patching_status == other.patching_status &&
        patching_start_time == other.patching_start_time &&
        patching_end_time == other.patching_end_time &&
        estimated_patching_time == other.estimated_patching_time &&
        current_patching_component == other.current_patching_component &&
        estimated_component_patching_start_time == other.estimated_component_patching_start_time
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
      [id, compartment_id, display_name, description, lifecycle_state, lifecycle_details, time_scheduled, time_started, time_ended, target_resource_type, target_resource_id, maintenance_type, patch_id, maintenance_subtype, peer_maintenance_run_id, patching_mode, patch_failure_count, target_db_server_version, target_storage_server_version, is_custom_action_timeout_enabled, custom_action_timeout_in_mins, current_custom_action_timeout_in_mins, patching_status, patching_start_time, patching_end_time, estimated_patching_time, current_patching_component, estimated_component_patching_start_time].hash
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
