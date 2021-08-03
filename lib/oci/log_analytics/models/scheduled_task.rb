# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Log analytics scheduled task resource.
  #
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class LogAnalytics::Models::ScheduledTask
    KIND_ENUM = [
      KIND_ACCELERATION = 'ACCELERATION'.freeze,
      KIND_STANDARD = 'STANDARD'.freeze,
      KIND_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

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

    PAUSE_REASON_ENUM = [
      PAUSE_REASON_METRIC_EXTRACTION_NOT_VALID = 'METRIC_EXTRACTION_NOT_VALID'.freeze,
      PAUSE_REASON_SAVED_SEARCH_NOT_VALID = 'SAVED_SEARCH_NOT_VALID'.freeze,
      PAUSE_REASON_SAVED_SEARCH_NOT_FOUND = 'SAVED_SEARCH_NOT_FOUND'.freeze,
      PAUSE_REASON_QUERY_STRING_NOT_VALID = 'QUERY_STRING_NOT_VALID'.freeze,
      PAUSE_REASON_USER_ACTION = 'USER_ACTION'.freeze,
      PAUSE_REASON_TENANCY_LIFECYCLE = 'TENANCY_LIFECYCLE'.freeze,
      PAUSE_REASON_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Discriminator.
    # @return [String]
    attr_reader :kind

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the data plane resource.
    #
    # @return [String]
    attr_accessor :id

    # **[Required]** A user-friendly name that is changeable and that does not have to be unique.
    # Format: a leading alphanumeric, followed by zero or more
    # alphanumerics, underscores, spaces, backslashes, or hyphens in any order).
    # No trailing spaces allowed.
    #
    # @return [String]
    attr_accessor :display_name

    # **[Required]** Task type.
    # @return [String]
    attr_reader :task_type

    # **[Required]** Schedules.
    # @return [Array<OCI::LogAnalytics::Models::Schedule>]
    attr_accessor :schedules

    # This attribute is required.
    # @return [OCI::LogAnalytics::Models::Action]
    attr_accessor :action

    # Status of the scheduled task.
    # @return [String]
    attr_reader :task_status

    # reason for taskStatus PAUSED.
    # @return [String]
    attr_reader :pause_reason

    # most recent Work Request Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the asynchronous request.
    # @return [String]
    attr_accessor :work_request_id

    # Number of execution occurrences.
    # @return [Integer]
    attr_accessor :num_occurrences

    # **[Required]** Compartment Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The date and time the scheduled task was created, in the format defined by RFC3339.
    #
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The date and time the scheduled task was last updated, in the format defined by RFC3339.
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # The date and time the scheduled task will execute next,
    # in the format defined by RFC3339.
    #
    # @return [DateTime]
    attr_accessor :time_of_next_execution

    # **[Required]** The current state of the scheduled task.
    # @return [String]
    attr_reader :lifecycle_state

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

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'kind': :'kind',
        'id': :'id',
        'display_name': :'displayName',
        'task_type': :'taskType',
        'schedules': :'schedules',
        'action': :'action',
        'task_status': :'taskStatus',
        'pause_reason': :'pauseReason',
        'work_request_id': :'workRequestId',
        'num_occurrences': :'numOccurrences',
        'compartment_id': :'compartmentId',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'time_of_next_execution': :'timeOfNextExecution',
        'lifecycle_state': :'lifecycleState',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'kind': :'String',
        'id': :'String',
        'display_name': :'String',
        'task_type': :'String',
        'schedules': :'Array<OCI::LogAnalytics::Models::Schedule>',
        'action': :'OCI::LogAnalytics::Models::Action',
        'task_status': :'String',
        'pause_reason': :'String',
        'work_request_id': :'String',
        'num_occurrences': :'Integer',
        'compartment_id': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'time_of_next_execution': :'DateTime',
        'lifecycle_state': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'kind'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::LogAnalytics::Models::StandardTask' if type == 'STANDARD'

      # TODO: Log a warning when the subtype is not found.
      'OCI::LogAnalytics::Models::ScheduledTask'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :kind The value to assign to the {#kind} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :task_type The value to assign to the {#task_type} property
    # @option attributes [Array<OCI::LogAnalytics::Models::Schedule>] :schedules The value to assign to the {#schedules} property
    # @option attributes [OCI::LogAnalytics::Models::Action] :action The value to assign to the {#action} property
    # @option attributes [String] :task_status The value to assign to the {#task_status} property
    # @option attributes [String] :pause_reason The value to assign to the {#pause_reason} property
    # @option attributes [String] :work_request_id The value to assign to the {#work_request_id} property
    # @option attributes [Integer] :num_occurrences The value to assign to the {#num_occurrences} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [DateTime] :time_of_next_execution The value to assign to the {#time_of_next_execution} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.kind = attributes[:'kind'] if attributes[:'kind']

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.task_type = attributes[:'taskType'] if attributes[:'taskType']

      raise 'You cannot provide both :taskType and :task_type' if attributes.key?(:'taskType') && attributes.key?(:'task_type')

      self.task_type = attributes[:'task_type'] if attributes[:'task_type']

      self.schedules = attributes[:'schedules'] if attributes[:'schedules']

      self.action = attributes[:'action'] if attributes[:'action']

      self.task_status = attributes[:'taskStatus'] if attributes[:'taskStatus']

      raise 'You cannot provide both :taskStatus and :task_status' if attributes.key?(:'taskStatus') && attributes.key?(:'task_status')

      self.task_status = attributes[:'task_status'] if attributes[:'task_status']

      self.pause_reason = attributes[:'pauseReason'] if attributes[:'pauseReason']

      raise 'You cannot provide both :pauseReason and :pause_reason' if attributes.key?(:'pauseReason') && attributes.key?(:'pause_reason')

      self.pause_reason = attributes[:'pause_reason'] if attributes[:'pause_reason']

      self.work_request_id = attributes[:'workRequestId'] if attributes[:'workRequestId']

      raise 'You cannot provide both :workRequestId and :work_request_id' if attributes.key?(:'workRequestId') && attributes.key?(:'work_request_id')

      self.work_request_id = attributes[:'work_request_id'] if attributes[:'work_request_id']

      self.num_occurrences = attributes[:'numOccurrences'] if attributes[:'numOccurrences']

      raise 'You cannot provide both :numOccurrences and :num_occurrences' if attributes.key?(:'numOccurrences') && attributes.key?(:'num_occurrences')

      self.num_occurrences = attributes[:'num_occurrences'] if attributes[:'num_occurrences']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.time_of_next_execution = attributes[:'timeOfNextExecution'] if attributes[:'timeOfNextExecution']

      raise 'You cannot provide both :timeOfNextExecution and :time_of_next_execution' if attributes.key?(:'timeOfNextExecution') && attributes.key?(:'time_of_next_execution')

      self.time_of_next_execution = attributes[:'time_of_next_execution'] if attributes[:'time_of_next_execution']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

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
    # @param [Object] kind Object to be assigned
    def kind=(kind)
      # rubocop:disable Style/ConditionalAssignment
      if kind && !KIND_ENUM.include?(kind)
        OCI.logger.debug("Unknown value for 'kind' [" + kind + "]. Mapping to 'KIND_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @kind = KIND_UNKNOWN_ENUM_VALUE
      else
        @kind = kind
      end
      # rubocop:enable Style/ConditionalAssignment
    end

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
    # @param [Object] pause_reason Object to be assigned
    def pause_reason=(pause_reason)
      # rubocop:disable Style/ConditionalAssignment
      if pause_reason && !PAUSE_REASON_ENUM.include?(pause_reason)
        OCI.logger.debug("Unknown value for 'pause_reason' [" + pause_reason + "]. Mapping to 'PAUSE_REASON_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @pause_reason = PAUSE_REASON_UNKNOWN_ENUM_VALUE
      else
        @pause_reason = pause_reason
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
        kind == other.kind &&
        id == other.id &&
        display_name == other.display_name &&
        task_type == other.task_type &&
        schedules == other.schedules &&
        action == other.action &&
        task_status == other.task_status &&
        pause_reason == other.pause_reason &&
        work_request_id == other.work_request_id &&
        num_occurrences == other.num_occurrences &&
        compartment_id == other.compartment_id &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        time_of_next_execution == other.time_of_next_execution &&
        lifecycle_state == other.lifecycle_state &&
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
      [kind, id, display_name, task_type, schedules, action, task_status, pause_reason, work_request_id, num_occurrences, compartment_id, time_created, time_updated, time_of_next_execution, lifecycle_state, freeform_tags, defined_tags].hash
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
