# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200407
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A container for your OCI GoldenGate Upgrade information.
  #
  class GoldenGate::Models::DeploymentUpgrade
    DEPLOYMENT_UPGRADE_TYPE_ENUM = [
      DEPLOYMENT_UPGRADE_TYPE_MANUAL = 'MANUAL'.freeze,
      DEPLOYMENT_UPGRADE_TYPE_AUTOMATIC = 'AUTOMATIC'.freeze,
      DEPLOYMENT_UPGRADE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

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
      LIFECYCLE_STATE_WAITING = 'WAITING'.freeze,
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
      LIFECYCLE_SUB_STATE_ROLLBACK_IN_PROGRESS = 'ROLLBACK_IN_PROGRESS'.freeze,
      LIFECYCLE_SUB_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    RELEASE_TYPE_ENUM = [
      RELEASE_TYPE_MAJOR = 'MAJOR'.freeze,
      RELEASE_TYPE_BUNDLE = 'BUNDLE'.freeze,
      RELEASE_TYPE_MINOR = 'MINOR'.freeze,
      RELEASE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the deployment upgrade being referenced.
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

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the deployment being referenced.
    #
    # @return [String]
    attr_accessor :deployment_id

    # **[Required]** The type of the deployment upgrade: MANUAL or AUTOMATIC
    #
    # @return [String]
    attr_reader :deployment_upgrade_type

    # The date and time the request was started. The format is defined by
    # [RFC3339](https://tools.ietf.org/html/rfc3339), such as `2016-08-25T21:10:29.600Z`.
    #
    # @return [DateTime]
    attr_accessor :time_started

    # The date and time the request was finished. The format is defined by
    # [RFC3339](https://tools.ietf.org/html/rfc3339), such as `2016-08-25T21:10:29.600Z`.
    #
    # @return [DateTime]
    attr_accessor :time_finished

    # Version of OGG
    #
    # @return [String]
    attr_accessor :ogg_version

    # The time the resource was created. The format is defined by
    # [RFC3339](https://tools.ietf.org/html/rfc3339), such as `2016-08-25T21:10:29.600Z`.
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The time the resource was last updated. The format is defined by
    # [RFC3339](https://tools.ietf.org/html/rfc3339), such as `2016-08-25T21:10:29.600Z`.
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

    # Describes the object's current state in detail. For example, it can be used to provide
    # actionable information for a resource in a Failed state.
    #
    # @return [String]
    attr_accessor :lifecycle_details

    # A simple key-value pair that is applied without any predefined name, type, or scope. Exists
    # for cross-compatibility only.
    #
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Tags defined for this resource. Each key is predefined and scoped to a namespace.
    #
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # The system tags associated with this resource, if any. The system tags are set by Oracle
    # Cloud Infrastructure services. Each key is predefined and scoped to namespaces.  For more
    # information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{orcl-cloud: {free-tier-retain: true}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Version of OGG
    #
    # @return [String]
    attr_accessor :previous_ogg_version

    # The time of upgrade schedule. The format is defined by
    # [RFC3339](https://tools.ietf.org/html/rfc3339), such as `2016-08-25T21:10:29.600Z`.
    #
    # @return [DateTime]
    attr_accessor :time_schedule

    # Indicates if upgrade notifications are snoozed or not.
    #
    # @return [BOOLEAN]
    attr_accessor :is_snoozed

    # The time the upgrade notifications are snoozed until. The format is defined by
    # [RFC3339](https://tools.ietf.org/html/rfc3339), such as `2016-08-25T21:10:29.600Z`.
    #
    # @return [DateTime]
    attr_accessor :time_snoozed_until

    # The time the resource was released. The format is defined by
    # [RFC3339](https://tools.ietf.org/html/rfc3339), such as `2016-08-25T21:10:29.600Z`.
    #
    # @return [DateTime]
    attr_accessor :time_released

    # The type of release.
    #
    # @return [String]
    attr_reader :release_type

    # Indicates if OGG release contains security fix.
    #
    # @return [BOOLEAN]
    attr_accessor :is_security_fix

    # Indicates if rollback is allowed. In practice only the last upgrade can be rolled back.
    # - Manual upgrade is allowed to rollback only until the old version isn't deprecated yet.
    # - Automatic upgrade by default is not allowed, unless a serious issue does not justify.
    #
    # @return [BOOLEAN]
    attr_accessor :is_rollback_allowed

    # The time until OGG version is supported. After this date has passed OGG version will not be available anymore. The format is defined by
    # [RFC3339](https://tools.ietf.org/html/rfc3339), such as `2016-08-25T21:10:29.600Z`.
    #
    # @return [DateTime]
    attr_accessor :time_ogg_version_supported_until

    # Indicates if cancel is allowed. Scheduled upgrade can be cancelled only if target version is not forced by service,
    # otherwise only reschedule allowed.
    #
    # @return [BOOLEAN]
    attr_accessor :is_cancel_allowed

    # Indicates if reschedule is allowed. Upgrade can be rescheduled postponed until the end of the service defined auto-upgrade period.
    #
    # @return [BOOLEAN]
    attr_accessor :is_reschedule_allowed

    # Indicates the latest time until the deployment upgrade could be rescheduled. The format is defined by
    # [RFC3339](https://tools.ietf.org/html/rfc3339), such as `2016-08-25T21:10:29.600Z`.
    #
    # @return [DateTime]
    attr_accessor :time_schedule_max

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'description': :'description',
        'compartment_id': :'compartmentId',
        'deployment_id': :'deploymentId',
        'deployment_upgrade_type': :'deploymentUpgradeType',
        'time_started': :'timeStarted',
        'time_finished': :'timeFinished',
        'ogg_version': :'oggVersion',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_sub_state': :'lifecycleSubState',
        'lifecycle_details': :'lifecycleDetails',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags',
        'previous_ogg_version': :'previousOggVersion',
        'time_schedule': :'timeSchedule',
        'is_snoozed': :'isSnoozed',
        'time_snoozed_until': :'timeSnoozedUntil',
        'time_released': :'timeReleased',
        'release_type': :'releaseType',
        'is_security_fix': :'isSecurityFix',
        'is_rollback_allowed': :'isRollbackAllowed',
        'time_ogg_version_supported_until': :'timeOggVersionSupportedUntil',
        'is_cancel_allowed': :'isCancelAllowed',
        'is_reschedule_allowed': :'isRescheduleAllowed',
        'time_schedule_max': :'timeScheduleMax'
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
        'deployment_id': :'String',
        'deployment_upgrade_type': :'String',
        'time_started': :'DateTime',
        'time_finished': :'DateTime',
        'ogg_version': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_sub_state': :'String',
        'lifecycle_details': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>',
        'previous_ogg_version': :'String',
        'time_schedule': :'DateTime',
        'is_snoozed': :'BOOLEAN',
        'time_snoozed_until': :'DateTime',
        'time_released': :'DateTime',
        'release_type': :'String',
        'is_security_fix': :'BOOLEAN',
        'is_rollback_allowed': :'BOOLEAN',
        'time_ogg_version_supported_until': :'DateTime',
        'is_cancel_allowed': :'BOOLEAN',
        'is_reschedule_allowed': :'BOOLEAN',
        'time_schedule_max': :'DateTime'
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
    # @option attributes [String] :deployment_id The value to assign to the {#deployment_id} property
    # @option attributes [String] :deployment_upgrade_type The value to assign to the {#deployment_upgrade_type} property
    # @option attributes [DateTime] :time_started The value to assign to the {#time_started} property
    # @option attributes [DateTime] :time_finished The value to assign to the {#time_finished} property
    # @option attributes [String] :ogg_version The value to assign to the {#ogg_version} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_sub_state The value to assign to the {#lifecycle_sub_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    # @option attributes [String] :previous_ogg_version The value to assign to the {#previous_ogg_version} property
    # @option attributes [DateTime] :time_schedule The value to assign to the {#time_schedule} property
    # @option attributes [BOOLEAN] :is_snoozed The value to assign to the {#is_snoozed} property
    # @option attributes [DateTime] :time_snoozed_until The value to assign to the {#time_snoozed_until} property
    # @option attributes [DateTime] :time_released The value to assign to the {#time_released} property
    # @option attributes [String] :release_type The value to assign to the {#release_type} property
    # @option attributes [BOOLEAN] :is_security_fix The value to assign to the {#is_security_fix} property
    # @option attributes [BOOLEAN] :is_rollback_allowed The value to assign to the {#is_rollback_allowed} property
    # @option attributes [DateTime] :time_ogg_version_supported_until The value to assign to the {#time_ogg_version_supported_until} property
    # @option attributes [BOOLEAN] :is_cancel_allowed The value to assign to the {#is_cancel_allowed} property
    # @option attributes [BOOLEAN] :is_reschedule_allowed The value to assign to the {#is_reschedule_allowed} property
    # @option attributes [DateTime] :time_schedule_max The value to assign to the {#time_schedule_max} property
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

      self.deployment_id = attributes[:'deploymentId'] if attributes[:'deploymentId']

      raise 'You cannot provide both :deploymentId and :deployment_id' if attributes.key?(:'deploymentId') && attributes.key?(:'deployment_id')

      self.deployment_id = attributes[:'deployment_id'] if attributes[:'deployment_id']

      self.deployment_upgrade_type = attributes[:'deploymentUpgradeType'] if attributes[:'deploymentUpgradeType']

      raise 'You cannot provide both :deploymentUpgradeType and :deployment_upgrade_type' if attributes.key?(:'deploymentUpgradeType') && attributes.key?(:'deployment_upgrade_type')

      self.deployment_upgrade_type = attributes[:'deployment_upgrade_type'] if attributes[:'deployment_upgrade_type']

      self.time_started = attributes[:'timeStarted'] if attributes[:'timeStarted']

      raise 'You cannot provide both :timeStarted and :time_started' if attributes.key?(:'timeStarted') && attributes.key?(:'time_started')

      self.time_started = attributes[:'time_started'] if attributes[:'time_started']

      self.time_finished = attributes[:'timeFinished'] if attributes[:'timeFinished']

      raise 'You cannot provide both :timeFinished and :time_finished' if attributes.key?(:'timeFinished') && attributes.key?(:'time_finished')

      self.time_finished = attributes[:'time_finished'] if attributes[:'time_finished']

      self.ogg_version = attributes[:'oggVersion'] if attributes[:'oggVersion']

      raise 'You cannot provide both :oggVersion and :ogg_version' if attributes.key?(:'oggVersion') && attributes.key?(:'ogg_version')

      self.ogg_version = attributes[:'ogg_version'] if attributes[:'ogg_version']

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

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']

      self.previous_ogg_version = attributes[:'previousOggVersion'] if attributes[:'previousOggVersion']

      raise 'You cannot provide both :previousOggVersion and :previous_ogg_version' if attributes.key?(:'previousOggVersion') && attributes.key?(:'previous_ogg_version')

      self.previous_ogg_version = attributes[:'previous_ogg_version'] if attributes[:'previous_ogg_version']

      self.time_schedule = attributes[:'timeSchedule'] if attributes[:'timeSchedule']

      raise 'You cannot provide both :timeSchedule and :time_schedule' if attributes.key?(:'timeSchedule') && attributes.key?(:'time_schedule')

      self.time_schedule = attributes[:'time_schedule'] if attributes[:'time_schedule']

      self.is_snoozed = attributes[:'isSnoozed'] unless attributes[:'isSnoozed'].nil?

      raise 'You cannot provide both :isSnoozed and :is_snoozed' if attributes.key?(:'isSnoozed') && attributes.key?(:'is_snoozed')

      self.is_snoozed = attributes[:'is_snoozed'] unless attributes[:'is_snoozed'].nil?

      self.time_snoozed_until = attributes[:'timeSnoozedUntil'] if attributes[:'timeSnoozedUntil']

      raise 'You cannot provide both :timeSnoozedUntil and :time_snoozed_until' if attributes.key?(:'timeSnoozedUntil') && attributes.key?(:'time_snoozed_until')

      self.time_snoozed_until = attributes[:'time_snoozed_until'] if attributes[:'time_snoozed_until']

      self.time_released = attributes[:'timeReleased'] if attributes[:'timeReleased']

      raise 'You cannot provide both :timeReleased and :time_released' if attributes.key?(:'timeReleased') && attributes.key?(:'time_released')

      self.time_released = attributes[:'time_released'] if attributes[:'time_released']

      self.release_type = attributes[:'releaseType'] if attributes[:'releaseType']

      raise 'You cannot provide both :releaseType and :release_type' if attributes.key?(:'releaseType') && attributes.key?(:'release_type')

      self.release_type = attributes[:'release_type'] if attributes[:'release_type']

      self.is_security_fix = attributes[:'isSecurityFix'] unless attributes[:'isSecurityFix'].nil?

      raise 'You cannot provide both :isSecurityFix and :is_security_fix' if attributes.key?(:'isSecurityFix') && attributes.key?(:'is_security_fix')

      self.is_security_fix = attributes[:'is_security_fix'] unless attributes[:'is_security_fix'].nil?

      self.is_rollback_allowed = attributes[:'isRollbackAllowed'] unless attributes[:'isRollbackAllowed'].nil?

      raise 'You cannot provide both :isRollbackAllowed and :is_rollback_allowed' if attributes.key?(:'isRollbackAllowed') && attributes.key?(:'is_rollback_allowed')

      self.is_rollback_allowed = attributes[:'is_rollback_allowed'] unless attributes[:'is_rollback_allowed'].nil?

      self.time_ogg_version_supported_until = attributes[:'timeOggVersionSupportedUntil'] if attributes[:'timeOggVersionSupportedUntil']

      raise 'You cannot provide both :timeOggVersionSupportedUntil and :time_ogg_version_supported_until' if attributes.key?(:'timeOggVersionSupportedUntil') && attributes.key?(:'time_ogg_version_supported_until')

      self.time_ogg_version_supported_until = attributes[:'time_ogg_version_supported_until'] if attributes[:'time_ogg_version_supported_until']

      self.is_cancel_allowed = attributes[:'isCancelAllowed'] unless attributes[:'isCancelAllowed'].nil?

      raise 'You cannot provide both :isCancelAllowed and :is_cancel_allowed' if attributes.key?(:'isCancelAllowed') && attributes.key?(:'is_cancel_allowed')

      self.is_cancel_allowed = attributes[:'is_cancel_allowed'] unless attributes[:'is_cancel_allowed'].nil?

      self.is_reschedule_allowed = attributes[:'isRescheduleAllowed'] unless attributes[:'isRescheduleAllowed'].nil?

      raise 'You cannot provide both :isRescheduleAllowed and :is_reschedule_allowed' if attributes.key?(:'isRescheduleAllowed') && attributes.key?(:'is_reschedule_allowed')

      self.is_reschedule_allowed = attributes[:'is_reschedule_allowed'] unless attributes[:'is_reschedule_allowed'].nil?

      self.time_schedule_max = attributes[:'timeScheduleMax'] if attributes[:'timeScheduleMax']

      raise 'You cannot provide both :timeScheduleMax and :time_schedule_max' if attributes.key?(:'timeScheduleMax') && attributes.key?(:'time_schedule_max')

      self.time_schedule_max = attributes[:'time_schedule_max'] if attributes[:'time_schedule_max']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] deployment_upgrade_type Object to be assigned
    def deployment_upgrade_type=(deployment_upgrade_type)
      # rubocop:disable Style/ConditionalAssignment
      if deployment_upgrade_type && !DEPLOYMENT_UPGRADE_TYPE_ENUM.include?(deployment_upgrade_type)
        OCI.logger.debug("Unknown value for 'deployment_upgrade_type' [" + deployment_upgrade_type + "]. Mapping to 'DEPLOYMENT_UPGRADE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @deployment_upgrade_type = DEPLOYMENT_UPGRADE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @deployment_upgrade_type = deployment_upgrade_type
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
    # @param [Object] release_type Object to be assigned
    def release_type=(release_type)
      # rubocop:disable Style/ConditionalAssignment
      if release_type && !RELEASE_TYPE_ENUM.include?(release_type)
        OCI.logger.debug("Unknown value for 'release_type' [" + release_type + "]. Mapping to 'RELEASE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @release_type = RELEASE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @release_type = release_type
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
        deployment_id == other.deployment_id &&
        deployment_upgrade_type == other.deployment_upgrade_type &&
        time_started == other.time_started &&
        time_finished == other.time_finished &&
        ogg_version == other.ogg_version &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_sub_state == other.lifecycle_sub_state &&
        lifecycle_details == other.lifecycle_details &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags &&
        previous_ogg_version == other.previous_ogg_version &&
        time_schedule == other.time_schedule &&
        is_snoozed == other.is_snoozed &&
        time_snoozed_until == other.time_snoozed_until &&
        time_released == other.time_released &&
        release_type == other.release_type &&
        is_security_fix == other.is_security_fix &&
        is_rollback_allowed == other.is_rollback_allowed &&
        time_ogg_version_supported_until == other.time_ogg_version_supported_until &&
        is_cancel_allowed == other.is_cancel_allowed &&
        is_reschedule_allowed == other.is_reschedule_allowed &&
        time_schedule_max == other.time_schedule_max
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
      [id, display_name, description, compartment_id, deployment_id, deployment_upgrade_type, time_started, time_finished, ogg_version, time_created, time_updated, lifecycle_state, lifecycle_sub_state, lifecycle_details, freeform_tags, defined_tags, system_tags, previous_ogg_version, time_schedule, is_snoozed, time_snoozed_until, time_released, release_type, is_security_fix, is_rollback_allowed, time_ogg_version_supported_until, is_cancel_allowed, is_reschedule_allowed, time_schedule_max].hash
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
