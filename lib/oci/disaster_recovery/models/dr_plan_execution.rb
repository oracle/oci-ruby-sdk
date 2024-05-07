# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220125
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of a DR plan execution.
  class DisasterRecovery::Models::DrPlanExecution
    PLAN_EXECUTION_TYPE_ENUM = [
      PLAN_EXECUTION_TYPE_SWITCHOVER = 'SWITCHOVER'.freeze,
      PLAN_EXECUTION_TYPE_SWITCHOVER_PRECHECK = 'SWITCHOVER_PRECHECK'.freeze,
      PLAN_EXECUTION_TYPE_FAILOVER = 'FAILOVER'.freeze,
      PLAN_EXECUTION_TYPE_FAILOVER_PRECHECK = 'FAILOVER_PRECHECK'.freeze,
      PLAN_EXECUTION_TYPE_START_DRILL = 'START_DRILL'.freeze,
      PLAN_EXECUTION_TYPE_START_DRILL_PRECHECK = 'START_DRILL_PRECHECK'.freeze,
      PLAN_EXECUTION_TYPE_STOP_DRILL = 'STOP_DRILL'.freeze,
      PLAN_EXECUTION_TYPE_STOP_DRILL_PRECHECK = 'STOP_DRILL_PRECHECK'.freeze,
      PLAN_EXECUTION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ACCEPTED = 'ACCEPTED'.freeze,
      LIFECYCLE_STATE_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_WAITING = 'WAITING'.freeze,
      LIFECYCLE_STATE_CANCELING = 'CANCELING'.freeze,
      LIFECYCLE_STATE_CANCELED = 'CANCELED'.freeze,
      LIFECYCLE_STATE_SUCCEEDED = 'SUCCEEDED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_PAUSING = 'PAUSING'.freeze,
      LIFECYCLE_STATE_PAUSED = 'PAUSED'.freeze,
      LIFECYCLE_STATE_RESUMING = 'RESUMING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the DR plan execution.
    #
    # Example: `ocid1.drplanexecution.oc1..uniqueID`
    #
    # @return [String]
    attr_accessor :id

    # **[Required]** The OCID of the compartment containing this DR plan execution.
    #
    # Example: `ocid1.compartment.oc1..uniqueID`
    #
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The display name of the DR plan execution.
    #
    # Example: `Execution - EBS Switchover PHX to IAD`
    #
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The OCID of the DR plan.
    #
    # Example: `ocid1.drplan.oc1..uniqueID`
    #
    # @return [String]
    attr_accessor :plan_id

    # **[Required]** The type of the DR plan executed.
    #
    # @return [String]
    attr_reader :plan_execution_type

    # This attribute is required.
    # @return [OCI::DisasterRecovery::Models::DrPlanExecutionOptions]
    attr_accessor :execution_options

    # **[Required]** The OCID of the DR protection group to which this DR plan execution belongs.
    #
    # Example: `ocid1.drprotectiongroup.oc1..uniqueID`
    #
    # @return [String]
    attr_accessor :dr_protection_group_id

    # **[Required]** The OCID of peer DR protection group associated with this plan's
    # DR protection group.
    #
    # Example: `ocid1.drprotectiongroup.oc1..uniqueID`
    #
    # @return [String]
    attr_accessor :peer_dr_protection_group_id

    # **[Required]** The region of the peer DR protection group associated with this plan's
    # DR protection group.
    #
    # Example: `us-ashburn-1`
    #
    # @return [String]
    attr_accessor :peer_region

    # This attribute is required.
    # @return [OCI::DisasterRecovery::Models::ObjectStorageLogLocation]
    attr_accessor :log_location

    # **[Required]** The date and time at which DR plan execution was created. An RFC3339 formatted datetime string.
    #
    # Example: `2019-03-29T09:36:42Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The date and time at which DR plan execution began. An RFC3339 formatted datetime string.
    #
    # Example: `2019-03-29T09:36:42Z`
    #
    # @return [DateTime]
    attr_accessor :time_started

    # **[Required]** The time when DR plan execution was last updated. An RFC3339 formatted datetime string.
    #
    # Example: `2019-03-29T09:36:42Z`
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # The date and time at which DR plan execution succeeded, failed, was paused, or was canceled.
    # An RFC3339 formatted datetime string.
    #
    # Example: `2019-03-29T09:36:42Z`
    #
    # @return [DateTime]
    attr_accessor :time_ended

    # The total duration in seconds taken to complete the DR plan execution.
    #
    # Example: `750`
    #
    # @return [Integer]
    attr_accessor :execution_duration_in_sec

    # **[Required]** A list of groups executed in this DR plan execution.
    #
    # @return [Array<OCI::DisasterRecovery::Models::DrPlanGroupExecution>]
    attr_accessor :group_executions

    # **[Required]** The current state of the DR plan execution.
    #
    # @return [String]
    attr_reader :lifecycle_state

    # A message describing the DR plan execution's current state in more detail.
    #
    # @return [String]
    attr_accessor :life_cycle_details

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Usage of system tag keys. These predefined keys are scoped to namespaces.
    #
    # Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'plan_id': :'planId',
        'plan_execution_type': :'planExecutionType',
        'execution_options': :'executionOptions',
        'dr_protection_group_id': :'drProtectionGroupId',
        'peer_dr_protection_group_id': :'peerDrProtectionGroupId',
        'peer_region': :'peerRegion',
        'log_location': :'logLocation',
        'time_created': :'timeCreated',
        'time_started': :'timeStarted',
        'time_updated': :'timeUpdated',
        'time_ended': :'timeEnded',
        'execution_duration_in_sec': :'executionDurationInSec',
        'group_executions': :'groupExecutions',
        'lifecycle_state': :'lifecycleState',
        'life_cycle_details': :'lifeCycleDetails',
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
        'compartment_id': :'String',
        'display_name': :'String',
        'plan_id': :'String',
        'plan_execution_type': :'String',
        'execution_options': :'OCI::DisasterRecovery::Models::DrPlanExecutionOptions',
        'dr_protection_group_id': :'String',
        'peer_dr_protection_group_id': :'String',
        'peer_region': :'String',
        'log_location': :'OCI::DisasterRecovery::Models::ObjectStorageLogLocation',
        'time_created': :'DateTime',
        'time_started': :'DateTime',
        'time_updated': :'DateTime',
        'time_ended': :'DateTime',
        'execution_duration_in_sec': :'Integer',
        'group_executions': :'Array<OCI::DisasterRecovery::Models::DrPlanGroupExecution>',
        'lifecycle_state': :'String',
        'life_cycle_details': :'String',
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
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :plan_id The value to assign to the {#plan_id} property
    # @option attributes [String] :plan_execution_type The value to assign to the {#plan_execution_type} property
    # @option attributes [OCI::DisasterRecovery::Models::DrPlanExecutionOptions] :execution_options The value to assign to the {#execution_options} property
    # @option attributes [String] :dr_protection_group_id The value to assign to the {#dr_protection_group_id} property
    # @option attributes [String] :peer_dr_protection_group_id The value to assign to the {#peer_dr_protection_group_id} property
    # @option attributes [String] :peer_region The value to assign to the {#peer_region} property
    # @option attributes [OCI::DisasterRecovery::Models::ObjectStorageLogLocation] :log_location The value to assign to the {#log_location} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_started The value to assign to the {#time_started} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [DateTime] :time_ended The value to assign to the {#time_ended} property
    # @option attributes [Integer] :execution_duration_in_sec The value to assign to the {#execution_duration_in_sec} property
    # @option attributes [Array<OCI::DisasterRecovery::Models::DrPlanGroupExecution>] :group_executions The value to assign to the {#group_executions} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :life_cycle_details The value to assign to the {#life_cycle_details} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
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

      self.plan_id = attributes[:'planId'] if attributes[:'planId']

      raise 'You cannot provide both :planId and :plan_id' if attributes.key?(:'planId') && attributes.key?(:'plan_id')

      self.plan_id = attributes[:'plan_id'] if attributes[:'plan_id']

      self.plan_execution_type = attributes[:'planExecutionType'] if attributes[:'planExecutionType']

      raise 'You cannot provide both :planExecutionType and :plan_execution_type' if attributes.key?(:'planExecutionType') && attributes.key?(:'plan_execution_type')

      self.plan_execution_type = attributes[:'plan_execution_type'] if attributes[:'plan_execution_type']

      self.execution_options = attributes[:'executionOptions'] if attributes[:'executionOptions']

      raise 'You cannot provide both :executionOptions and :execution_options' if attributes.key?(:'executionOptions') && attributes.key?(:'execution_options')

      self.execution_options = attributes[:'execution_options'] if attributes[:'execution_options']

      self.dr_protection_group_id = attributes[:'drProtectionGroupId'] if attributes[:'drProtectionGroupId']

      raise 'You cannot provide both :drProtectionGroupId and :dr_protection_group_id' if attributes.key?(:'drProtectionGroupId') && attributes.key?(:'dr_protection_group_id')

      self.dr_protection_group_id = attributes[:'dr_protection_group_id'] if attributes[:'dr_protection_group_id']

      self.peer_dr_protection_group_id = attributes[:'peerDrProtectionGroupId'] if attributes[:'peerDrProtectionGroupId']

      raise 'You cannot provide both :peerDrProtectionGroupId and :peer_dr_protection_group_id' if attributes.key?(:'peerDrProtectionGroupId') && attributes.key?(:'peer_dr_protection_group_id')

      self.peer_dr_protection_group_id = attributes[:'peer_dr_protection_group_id'] if attributes[:'peer_dr_protection_group_id']

      self.peer_region = attributes[:'peerRegion'] if attributes[:'peerRegion']

      raise 'You cannot provide both :peerRegion and :peer_region' if attributes.key?(:'peerRegion') && attributes.key?(:'peer_region')

      self.peer_region = attributes[:'peer_region'] if attributes[:'peer_region']

      self.log_location = attributes[:'logLocation'] if attributes[:'logLocation']

      raise 'You cannot provide both :logLocation and :log_location' if attributes.key?(:'logLocation') && attributes.key?(:'log_location')

      self.log_location = attributes[:'log_location'] if attributes[:'log_location']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_started = attributes[:'timeStarted'] if attributes[:'timeStarted']

      raise 'You cannot provide both :timeStarted and :time_started' if attributes.key?(:'timeStarted') && attributes.key?(:'time_started')

      self.time_started = attributes[:'time_started'] if attributes[:'time_started']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.time_ended = attributes[:'timeEnded'] if attributes[:'timeEnded']

      raise 'You cannot provide both :timeEnded and :time_ended' if attributes.key?(:'timeEnded') && attributes.key?(:'time_ended')

      self.time_ended = attributes[:'time_ended'] if attributes[:'time_ended']

      self.execution_duration_in_sec = attributes[:'executionDurationInSec'] if attributes[:'executionDurationInSec']

      raise 'You cannot provide both :executionDurationInSec and :execution_duration_in_sec' if attributes.key?(:'executionDurationInSec') && attributes.key?(:'execution_duration_in_sec')

      self.execution_duration_in_sec = attributes[:'execution_duration_in_sec'] if attributes[:'execution_duration_in_sec']

      self.group_executions = attributes[:'groupExecutions'] if attributes[:'groupExecutions']

      raise 'You cannot provide both :groupExecutions and :group_executions' if attributes.key?(:'groupExecutions') && attributes.key?(:'group_executions')

      self.group_executions = attributes[:'group_executions'] if attributes[:'group_executions']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.life_cycle_details = attributes[:'lifeCycleDetails'] if attributes[:'lifeCycleDetails']

      raise 'You cannot provide both :lifeCycleDetails and :life_cycle_details' if attributes.key?(:'lifeCycleDetails') && attributes.key?(:'life_cycle_details')

      self.life_cycle_details = attributes[:'life_cycle_details'] if attributes[:'life_cycle_details']

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
    # @param [Object] plan_execution_type Object to be assigned
    def plan_execution_type=(plan_execution_type)
      # rubocop:disable Style/ConditionalAssignment
      if plan_execution_type && !PLAN_EXECUTION_TYPE_ENUM.include?(plan_execution_type)
        OCI.logger.debug("Unknown value for 'plan_execution_type' [" + plan_execution_type + "]. Mapping to 'PLAN_EXECUTION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @plan_execution_type = PLAN_EXECUTION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @plan_execution_type = plan_execution_type
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
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        plan_id == other.plan_id &&
        plan_execution_type == other.plan_execution_type &&
        execution_options == other.execution_options &&
        dr_protection_group_id == other.dr_protection_group_id &&
        peer_dr_protection_group_id == other.peer_dr_protection_group_id &&
        peer_region == other.peer_region &&
        log_location == other.log_location &&
        time_created == other.time_created &&
        time_started == other.time_started &&
        time_updated == other.time_updated &&
        time_ended == other.time_ended &&
        execution_duration_in_sec == other.execution_duration_in_sec &&
        group_executions == other.group_executions &&
        lifecycle_state == other.lifecycle_state &&
        life_cycle_details == other.life_cycle_details &&
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
      [id, compartment_id, display_name, plan_id, plan_execution_type, execution_options, dr_protection_group_id, peer_dr_protection_group_id, peer_region, log_location, time_created, time_started, time_updated, time_ended, execution_duration_in_sec, group_executions, lifecycle_state, life_cycle_details, freeform_tags, defined_tags, system_tags].hash
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
