# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Information for creating a Scheduled Job
  class OsManagement::Models::CreateScheduledJobDetails
    SCHEDULE_TYPE_ENUM = [
      SCHEDULE_TYPE_ONETIME = 'ONETIME'.freeze,
      SCHEDULE_TYPE_RECURRING = 'RECURRING'.freeze
    ].freeze

    INTERVAL_TYPE_ENUM = [
      INTERVAL_TYPE_HOUR = 'HOUR'.freeze,
      INTERVAL_TYPE_DAY = 'DAY'.freeze,
      INTERVAL_TYPE_WEEK = 'WEEK'.freeze,
      INTERVAL_TYPE_MONTH = 'MONTH'.freeze
    ].freeze

    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_INSTALL = 'INSTALL'.freeze,
      OPERATION_TYPE_UPDATE = 'UPDATE'.freeze,
      OPERATION_TYPE_REMOVE = 'REMOVE'.freeze,
      OPERATION_TYPE_UPDATEALL = 'UPDATEALL'.freeze
    ].freeze

    UPDATE_TYPE_ENUM = [
      UPDATE_TYPE_SECURITY = 'SECURITY'.freeze,
      UPDATE_TYPE_BUGFIX = 'BUGFIX'.freeze,
      UPDATE_TYPE_ENHANCEMENT = 'ENHANCEMENT'.freeze,
      UPDATE_TYPE_ALL = 'ALL'.freeze
    ].freeze

    OS_FAMILY_ENUM = [
      OS_FAMILY_LINUX = 'LINUX'.freeze,
      OS_FAMILY_WINDOWS = 'WINDOWS'.freeze,
      OS_FAMILY_ALL = 'ALL'.freeze
    ].freeze

    # **[Required]** OCID for the Compartment
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** Scheduled Job name
    # @return [String]
    attr_accessor :display_name

    # Details describing the Scheduled Job.
    # @return [String]
    attr_accessor :description

    # **[Required]** the type of scheduling this Scheduled Job follows
    # @return [String]
    attr_reader :schedule_type

    # **[Required]** the desired time for the next execution of this Scheduled Job
    # @return [DateTime]
    attr_accessor :time_next_execution

    # the interval period for a recurring Scheduled Job (only if schedule type is RECURRING)
    # @return [String]
    attr_reader :interval_type

    # the value for the interval period for a recurring Scheduled Job (only if schedule type is RECURRING)
    # @return [String]
    attr_accessor :interval_value

    # The list of managed instances this scheduled job operates on
    # (mutually exclusive with managedInstanceGroups). Either this or the
    # managedInstanceGroups must be supplied.
    #
    # @return [Array<OCI::OsManagement::Models::Id>]
    attr_accessor :managed_instances

    # The list of managed instance groups this scheduled job operates on
    # (mutually exclusive with managedInstances). Either this or
    # managedInstances must be supplied.
    #
    # @return [Array<OCI::OsManagement::Models::Id>]
    attr_accessor :managed_instance_groups

    # **[Required]** the type of operation this Scheduled Job performs
    # @return [String]
    attr_reader :operation_type

    # Type of the update (only if operation type is UPDATEALL)
    # @return [String]
    attr_reader :update_type

    # the id of the package (only if operation type is INSTALL/UPDATE/REMOVE)
    # @return [Array<OCI::OsManagement::Models::PackageName>]
    attr_accessor :package_names

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

    # The unique names of the Windows Updates (only if operation type is INSTALL).
    # This is only applicable when the osFamily is for Windows managed instances.
    #
    # @return [Array<String>]
    attr_accessor :update_names

    # The Operating System type of the managed instance(s) on which this scheduled job will operate.
    # If not specified, this defaults to Linux.
    #
    # @return [String]
    attr_reader :os_family

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'description': :'description',
        'schedule_type': :'scheduleType',
        'time_next_execution': :'timeNextExecution',
        'interval_type': :'intervalType',
        'interval_value': :'intervalValue',
        'managed_instances': :'managedInstances',
        'managed_instance_groups': :'managedInstanceGroups',
        'operation_type': :'operationType',
        'update_type': :'updateType',
        'package_names': :'packageNames',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'update_names': :'updateNames',
        'os_family': :'osFamily'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'display_name': :'String',
        'description': :'String',
        'schedule_type': :'String',
        'time_next_execution': :'DateTime',
        'interval_type': :'String',
        'interval_value': :'String',
        'managed_instances': :'Array<OCI::OsManagement::Models::Id>',
        'managed_instance_groups': :'Array<OCI::OsManagement::Models::Id>',
        'operation_type': :'String',
        'update_type': :'String',
        'package_names': :'Array<OCI::OsManagement::Models::PackageName>',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'update_names': :'Array<String>',
        'os_family': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :schedule_type The value to assign to the {#schedule_type} property
    # @option attributes [DateTime] :time_next_execution The value to assign to the {#time_next_execution} property
    # @option attributes [String] :interval_type The value to assign to the {#interval_type} property
    # @option attributes [String] :interval_value The value to assign to the {#interval_value} property
    # @option attributes [Array<OCI::OsManagement::Models::Id>] :managed_instances The value to assign to the {#managed_instances} property
    # @option attributes [Array<OCI::OsManagement::Models::Id>] :managed_instance_groups The value to assign to the {#managed_instance_groups} property
    # @option attributes [String] :operation_type The value to assign to the {#operation_type} property
    # @option attributes [String] :update_type The value to assign to the {#update_type} property
    # @option attributes [Array<OCI::OsManagement::Models::PackageName>] :package_names The value to assign to the {#package_names} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Array<String>] :update_names The value to assign to the {#update_names} property
    # @option attributes [String] :os_family The value to assign to the {#os_family} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

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

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.update_names = attributes[:'updateNames'] if attributes[:'updateNames']

      raise 'You cannot provide both :updateNames and :update_names' if attributes.key?(:'updateNames') && attributes.key?(:'update_names')

      self.update_names = attributes[:'update_names'] if attributes[:'update_names']

      self.os_family = attributes[:'osFamily'] if attributes[:'osFamily']

      raise 'You cannot provide both :osFamily and :os_family' if attributes.key?(:'osFamily') && attributes.key?(:'os_family')

      self.os_family = attributes[:'os_family'] if attributes[:'os_family']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] schedule_type Object to be assigned
    def schedule_type=(schedule_type)
      raise "Invalid value for 'schedule_type': this must be one of the values in SCHEDULE_TYPE_ENUM." if schedule_type && !SCHEDULE_TYPE_ENUM.include?(schedule_type)

      @schedule_type = schedule_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] interval_type Object to be assigned
    def interval_type=(interval_type)
      raise "Invalid value for 'interval_type': this must be one of the values in INTERVAL_TYPE_ENUM." if interval_type && !INTERVAL_TYPE_ENUM.include?(interval_type)

      @interval_type = interval_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] operation_type Object to be assigned
    def operation_type=(operation_type)
      raise "Invalid value for 'operation_type': this must be one of the values in OPERATION_TYPE_ENUM." if operation_type && !OPERATION_TYPE_ENUM.include?(operation_type)

      @operation_type = operation_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] update_type Object to be assigned
    def update_type=(update_type)
      raise "Invalid value for 'update_type': this must be one of the values in UPDATE_TYPE_ENUM." if update_type && !UPDATE_TYPE_ENUM.include?(update_type)

      @update_type = update_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] os_family Object to be assigned
    def os_family=(os_family)
      raise "Invalid value for 'os_family': this must be one of the values in OS_FAMILY_ENUM." if os_family && !OS_FAMILY_ENUM.include?(os_family)

      @os_family = os_family
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        description == other.description &&
        schedule_type == other.schedule_type &&
        time_next_execution == other.time_next_execution &&
        interval_type == other.interval_type &&
        interval_value == other.interval_value &&
        managed_instances == other.managed_instances &&
        managed_instance_groups == other.managed_instance_groups &&
        operation_type == other.operation_type &&
        update_type == other.update_type &&
        package_names == other.package_names &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        update_names == other.update_names &&
        os_family == other.os_family
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
      [compartment_id, display_name, description, schedule_type, time_next_execution, interval_type, interval_value, managed_instances, managed_instance_groups, operation_type, update_type, package_names, freeform_tags, defined_tags, update_names, os_family].hash
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
