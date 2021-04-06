# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary information about a scheduled task.
  class LogAnalytics::Models::ScheduledTaskSummary
    TASK_TYPE_ENUM = [
      TASK_TYPE_SAVED_SEARCH = 'SAVED_SEARCH'.freeze,
      TASK_TYPE_ACCELERATION = 'ACCELERATION'.freeze,
      TASK_TYPE_PURGE = 'PURGE'.freeze,
      TASK_TYPE_ACCELERATION_MAINTENANCE = 'ACCELERATION_MAINTENANCE'.freeze,
      TASK_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    TASK_STATUS_ENUM = [
      TASK_STATUS_READY = 'READY'.freeze,
      TASK_STATUS_PAUSED = 'PAUSED'.freeze,
      TASK_STATUS_COMPLETED = 'COMPLETED'.freeze,
      TASK_STATUS_BLOCKED = 'BLOCKED'.freeze,
      TASK_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LAST_EXECUTION_STATUS_ENUM = [
      LAST_EXECUTION_STATUS_FAILED = 'FAILED'.freeze,
      LAST_EXECUTION_STATUS_SUCCEEDED = 'SUCCEEDED'.freeze,
      LAST_EXECUTION_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the data plane resource.
    #
    # @return [String]
    attr_accessor :id

    # **[Required]** Task type.
    # @return [String]
    attr_reader :task_type

    # **[Required]** Compartment Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The date and time the schedule task was created, in the format defined by RFC3339.
    #
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The date and time the scheduled task was last updated, in the format defined by RFC3339.
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** The current state of the scheduled task.
    # @return [String]
    attr_accessor :lifecycle_state

    # Status of the scheduled task.
    # @return [String]
    attr_reader :task_status

    # most recent Work Request Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the asynchronous request.
    # @return [String]
    attr_accessor :work_request_id

    # **[Required]** A user-friendly name that is changeable and that does not have to be unique.
    # Format: a leading alphanumeric, followed by zero or more
    # alphanumerics, underscores, spaces, backslashes, or hyphens in any order).
    # No trailing spaces allowed.
    #
    # @return [String]
    attr_accessor :display_name

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

    # The most recent task execution status.
    # @return [String]
    attr_reader :last_execution_status

    # The date and time the scheduled task last executed, in the format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_last_executed

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'task_type': :'taskType',
        'compartment_id': :'compartmentId',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'task_status': :'taskStatus',
        'work_request_id': :'workRequestId',
        'display_name': :'displayName',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'last_execution_status': :'lastExecutionStatus',
        'time_last_executed': :'timeLastExecuted'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'task_type': :'String',
        'compartment_id': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'task_status': :'String',
        'work_request_id': :'String',
        'display_name': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'last_execution_status': :'String',
        'time_last_executed': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :task_type The value to assign to the {#task_type} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :task_status The value to assign to the {#task_status} property
    # @option attributes [String] :work_request_id The value to assign to the {#work_request_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :last_execution_status The value to assign to the {#last_execution_status} property
    # @option attributes [DateTime] :time_last_executed The value to assign to the {#time_last_executed} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.task_type = attributes[:'taskType'] if attributes[:'taskType']

      raise 'You cannot provide both :taskType and :task_type' if attributes.key?(:'taskType') && attributes.key?(:'task_type')

      self.task_type = attributes[:'task_type'] if attributes[:'task_type']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.task_status = attributes[:'taskStatus'] if attributes[:'taskStatus']

      raise 'You cannot provide both :taskStatus and :task_status' if attributes.key?(:'taskStatus') && attributes.key?(:'task_status')

      self.task_status = attributes[:'task_status'] if attributes[:'task_status']

      self.work_request_id = attributes[:'workRequestId'] if attributes[:'workRequestId']

      raise 'You cannot provide both :workRequestId and :work_request_id' if attributes.key?(:'workRequestId') && attributes.key?(:'work_request_id')

      self.work_request_id = attributes[:'work_request_id'] if attributes[:'work_request_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.last_execution_status = attributes[:'lastExecutionStatus'] if attributes[:'lastExecutionStatus']

      raise 'You cannot provide both :lastExecutionStatus and :last_execution_status' if attributes.key?(:'lastExecutionStatus') && attributes.key?(:'last_execution_status')

      self.last_execution_status = attributes[:'last_execution_status'] if attributes[:'last_execution_status']

      self.time_last_executed = attributes[:'timeLastExecuted'] if attributes[:'timeLastExecuted']

      raise 'You cannot provide both :timeLastExecuted and :time_last_executed' if attributes.key?(:'timeLastExecuted') && attributes.key?(:'time_last_executed')

      self.time_last_executed = attributes[:'time_last_executed'] if attributes[:'time_last_executed']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] task_type Object to be assigned
    def task_type=(task_type)
      # rubocop:disable Style/ConditionalAssignment
      if task_type && !TASK_TYPE_ENUM.include?(task_type)
        OCI.logger.debug("Unknown value for 'task_type' [" + task_type + "]. Mapping to 'TASK_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @task_type = TASK_TYPE_UNKNOWN_ENUM_VALUE
      else
        @task_type = task_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] task_status Object to be assigned
    def task_status=(task_status)
      # rubocop:disable Style/ConditionalAssignment
      if task_status && !TASK_STATUS_ENUM.include?(task_status)
        OCI.logger.debug("Unknown value for 'task_status' [" + task_status + "]. Mapping to 'TASK_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @task_status = TASK_STATUS_UNKNOWN_ENUM_VALUE
      else
        @task_status = task_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] last_execution_status Object to be assigned
    def last_execution_status=(last_execution_status)
      # rubocop:disable Style/ConditionalAssignment
      if last_execution_status && !LAST_EXECUTION_STATUS_ENUM.include?(last_execution_status)
        OCI.logger.debug("Unknown value for 'last_execution_status' [" + last_execution_status + "]. Mapping to 'LAST_EXECUTION_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @last_execution_status = LAST_EXECUTION_STATUS_UNKNOWN_ENUM_VALUE
      else
        @last_execution_status = last_execution_status
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
        task_type == other.task_type &&
        compartment_id == other.compartment_id &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        task_status == other.task_status &&
        work_request_id == other.work_request_id &&
        display_name == other.display_name &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        last_execution_status == other.last_execution_status &&
        time_last_executed == other.time_last_executed
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
      [id, task_type, compartment_id, time_created, time_updated, lifecycle_state, task_status, work_request_id, display_name, freeform_tags, defined_tags, last_execution_status, time_last_executed].hash
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
