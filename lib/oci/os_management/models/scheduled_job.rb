# Copyright (c) 2016, 2020, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Detailed information about a Scheduled Job
  class OsManagement::Models::ScheduledJob
    SCHEDULE_TYPE_ENUM = [
      SCHEDULE_TYPE_ONETIME = 'ONETIME'.freeze,
      SCHEDULE_TYPE_RECURRING = 'RECURRING'.freeze,
      SCHEDULE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    INTERVAL_TYPE_ENUM = [
      INTERVAL_TYPE_HOUR = 'HOUR'.freeze,
      INTERVAL_TYPE_DAY = 'DAY'.freeze,
      INTERVAL_TYPE_WEEK = 'WEEK'.freeze,
      INTERVAL_TYPE_MONTH = 'MONTH'.freeze,
      INTERVAL_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_INSTALL = 'INSTALL'.freeze,
      OPERATION_TYPE_UPDATE = 'UPDATE'.freeze,
      OPERATION_TYPE_REMOVE = 'REMOVE'.freeze,
      OPERATION_TYPE_UPDATEALL = 'UPDATEALL'.freeze,
      OPERATION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    UPDATE_TYPE_ENUM = [
      UPDATE_TYPE_SECURITY = 'SECURITY'.freeze,
      UPDATE_TYPE_BUGFIX = 'BUGFIX'.freeze,
      UPDATE_TYPE_ENHANCEMENT = 'ENHANCEMENT'.freeze,
      UPDATE_TYPE_ALL = 'ALL'.freeze,
      UPDATE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** OCID for the Scheduled Job
    # @return [String]
    attr_accessor :id

    # OCID for the Compartment
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** Scheduled Job name
    # @return [String]
    attr_accessor :display_name

    # Details describing the Scheduled Job.
    # @return [String]
    attr_accessor :description

    # the type of scheduling this Scheduled Job follows
    # @return [String]
    attr_reader :schedule_type

    # the time of the next execution of this Scheduled Job
    # @return [DateTime]
    attr_accessor :time_next_execution

    # the time of the last execution of this Scheduled Job
    # @return [DateTime]
    attr_accessor :time_last_execution

    # the interval period for a recurring Scheduled Job (only if schedule type is RECURRING)
    # @return [String]
    attr_reader :interval_type

    # the value for the interval period for a recurring Scheduled Job (only if schedule type is RECURRING)
    # @return [String]
    attr_accessor :interval_value

    # the list of managed instances this scheduled job operates on (mutually exclusive with managedInstanceGroups)
    # @return [Array<OCI::OsManagement::Models::Id>]
    attr_accessor :managed_instances

    # the list of managed instance groups this scheduled job operates on (mutually exclusive with managedInstances)
    # @return [Array<OCI::OsManagement::Models::Id>]
    attr_accessor :managed_instance_groups

    # the type of operation this Scheduled Job performs
    # @return [String]
    attr_reader :operation_type

    # Type of the update (only if operation type is UPDATE_ALL_PACKAGES)
    # @return [String]
    attr_reader :update_type

    # the names of the packages (only if operation type is INSTALL/UPDATE/REMOVE_PACKAGE)
    # @return [Array<OCI::OsManagement::Models::PackageName>]
    attr_accessor :package_names

    # list of Work Requests associated with this Scheduled Job
    # @return [Array<OCI::OsManagement::Models::Id>]
    attr_accessor :work_requests

    # The current state of the Scheduled Job.
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
        'id': :'id',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'description': :'description',
        'schedule_type': :'scheduleType',
        'time_next_execution': :'timeNextExecution',
        'time_last_execution': :'timeLastExecution',
        'interval_type': :'intervalType',
        'interval_value': :'intervalValue',
        'managed_instances': :'managedInstances',
        'managed_instance_groups': :'managedInstanceGroups',
        'operation_type': :'operationType',
        'update_type': :'updateType',
        'package_names': :'packageNames',
        'work_requests': :'workRequests',
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
        'id': :'String',
        'compartment_id': :'String',
        'display_name': :'String',
        'description': :'String',
        'schedule_type': :'String',
        'time_next_execution': :'DateTime',
        'time_last_execution': :'DateTime',
        'interval_type': :'String',
        'interval_value': :'String',
        'managed_instances': :'Array<OCI::OsManagement::Models::Id>',
        'managed_instance_groups': :'Array<OCI::OsManagement::Models::Id>',
        'operation_type': :'String',
        'update_type': :'String',
        'package_names': :'Array<OCI::OsManagement::Models::PackageName>',
        'work_requests': :'Array<OCI::OsManagement::Models::Id>',
        'lifecycle_state': :'String',
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
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :schedule_type The value to assign to the {#schedule_type} property
    # @option attributes [DateTime] :time_next_execution The value to assign to the {#time_next_execution} property
    # @option attributes [DateTime] :time_last_execution The value to assign to the {#time_last_execution} property
    # @option attributes [String] :interval_type The value to assign to the {#interval_type} property
    # @option attributes [String] :interval_value The value to assign to the {#interval_value} property
    # @option attributes [Array<OCI::OsManagement::Models::Id>] :managed_instances The value to assign to the {#managed_instances} property
    # @option attributes [Array<OCI::OsManagement::Models::Id>] :managed_instance_groups The value to assign to the {#managed_instance_groups} property
    # @option attributes [String] :operation_type The value to assign to the {#operation_type} property
    # @option attributes [String] :update_type The value to assign to the {#update_type} property
    # @option attributes [Array<OCI::OsManagement::Models::PackageName>] :package_names The value to assign to the {#package_names} property
    # @option attributes [Array<OCI::OsManagement::Models::Id>] :work_requests The value to assign to the {#work_requests} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
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

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.schedule_type = attributes[:'scheduleType'] if attributes[:'scheduleType']

      raise 'You cannot provide both :scheduleType and :schedule_type' if attributes.key?(:'scheduleType') && attributes.key?(:'schedule_type')

      self.schedule_type = attributes[:'schedule_type'] if attributes[:'schedule_type']

      self.time_next_execution = attributes[:'timeNextExecution'] if attributes[:'timeNextExecution']

      raise 'You cannot provide both :timeNextExecution and :time_next_execution' if attributes.key?(:'timeNextExecution') && attributes.key?(:'time_next_execution')

      self.time_next_execution = attributes[:'time_next_execution'] if attributes[:'time_next_execution']

      self.time_last_execution = attributes[:'timeLastExecution'] if attributes[:'timeLastExecution']

      raise 'You cannot provide both :timeLastExecution and :time_last_execution' if attributes.key?(:'timeLastExecution') && attributes.key?(:'time_last_execution')

      self.time_last_execution = attributes[:'time_last_execution'] if attributes[:'time_last_execution']

      self.interval_type = attributes[:'intervalType'] if attributes[:'intervalType']

      raise 'You cannot provide both :intervalType and :interval_type' if attributes.key?(:'intervalType') && attributes.key?(:'interval_type')

      self.interval_type = attributes[:'interval_type'] if attributes[:'interval_type']

      self.interval_value = attributes[:'intervalValue'] if attributes[:'intervalValue']

      raise 'You cannot provide both :intervalValue and :interval_value' if attributes.key?(:'intervalValue') && attributes.key?(:'interval_value')

      self.interval_value = attributes[:'interval_value'] if attributes[:'interval_value']

      self.managed_instances = attributes[:'managedInstances'] if attributes[:'managedInstances']

      raise 'You cannot provide both :managedInstances and :managed_instances' if attributes.key?(:'managedInstances') && attributes.key?(:'managed_instances')

      self.managed_instances = attributes[:'managed_instances'] if attributes[:'managed_instances']

      self.managed_instance_groups = attributes[:'managedInstanceGroups'] if attributes[:'managedInstanceGroups']

      raise 'You cannot provide both :managedInstanceGroups and :managed_instance_groups' if attributes.key?(:'managedInstanceGroups') && attributes.key?(:'managed_instance_groups')

      self.managed_instance_groups = attributes[:'managed_instance_groups'] if attributes[:'managed_instance_groups']

      self.operation_type = attributes[:'operationType'] if attributes[:'operationType']

      raise 'You cannot provide both :operationType and :operation_type' if attributes.key?(:'operationType') && attributes.key?(:'operation_type')

      self.operation_type = attributes[:'operation_type'] if attributes[:'operation_type']

      self.update_type = attributes[:'updateType'] if attributes[:'updateType']

      raise 'You cannot provide both :updateType and :update_type' if attributes.key?(:'updateType') && attributes.key?(:'update_type')

      self.update_type = attributes[:'update_type'] if attributes[:'update_type']

      self.package_names = attributes[:'packageNames'] if attributes[:'packageNames']

      raise 'You cannot provide both :packageNames and :package_names' if attributes.key?(:'packageNames') && attributes.key?(:'package_names')

      self.package_names = attributes[:'package_names'] if attributes[:'package_names']

      self.work_requests = attributes[:'workRequests'] if attributes[:'workRequests']

      raise 'You cannot provide both :workRequests and :work_requests' if attributes.key?(:'workRequests') && attributes.key?(:'work_requests')

      self.work_requests = attributes[:'work_requests'] if attributes[:'work_requests']

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
    # @param [Object] schedule_type Object to be assigned
    def schedule_type=(schedule_type)
      # rubocop:disable Style/ConditionalAssignment
      if schedule_type && !SCHEDULE_TYPE_ENUM.include?(schedule_type)
        OCI.logger.debug("Unknown value for 'schedule_type' [" + schedule_type + "]. Mapping to 'SCHEDULE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @schedule_type = SCHEDULE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @schedule_type = schedule_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] interval_type Object to be assigned
    def interval_type=(interval_type)
      # rubocop:disable Style/ConditionalAssignment
      if interval_type && !INTERVAL_TYPE_ENUM.include?(interval_type)
        OCI.logger.debug("Unknown value for 'interval_type' [" + interval_type + "]. Mapping to 'INTERVAL_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @interval_type = INTERVAL_TYPE_UNKNOWN_ENUM_VALUE
      else
        @interval_type = interval_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] operation_type Object to be assigned
    def operation_type=(operation_type)
      # rubocop:disable Style/ConditionalAssignment
      if operation_type && !OPERATION_TYPE_ENUM.include?(operation_type)
        OCI.logger.debug("Unknown value for 'operation_type' [" + operation_type + "]. Mapping to 'OPERATION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @operation_type = OPERATION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @operation_type = operation_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] update_type Object to be assigned
    def update_type=(update_type)
      # rubocop:disable Style/ConditionalAssignment
      if update_type && !UPDATE_TYPE_ENUM.include?(update_type)
        OCI.logger.debug("Unknown value for 'update_type' [" + update_type + "]. Mapping to 'UPDATE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @update_type = UPDATE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @update_type = update_type
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
        description == other.description &&
        schedule_type == other.schedule_type &&
        time_next_execution == other.time_next_execution &&
        time_last_execution == other.time_last_execution &&
        interval_type == other.interval_type &&
        interval_value == other.interval_value &&
        managed_instances == other.managed_instances &&
        managed_instance_groups == other.managed_instance_groups &&
        operation_type == other.operation_type &&
        update_type == other.update_type &&
        package_names == other.package_names &&
        work_requests == other.work_requests &&
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
      [id, compartment_id, display_name, description, schedule_type, time_next_execution, time_last_execution, interval_type, interval_value, managed_instances, managed_instance_groups, operation_type, update_type, package_names, work_requests, lifecycle_state, freeform_tags, defined_tags].hash
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
