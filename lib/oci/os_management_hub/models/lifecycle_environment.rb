# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220901
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Contains versioned software source content and lifecycle stages for a managed instance.
  class OsManagementHub::Models::LifecycleEnvironment
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    OS_FAMILY_ENUM = [
      OS_FAMILY_ORACLE_LINUX_9 = 'ORACLE_LINUX_9'.freeze,
      OS_FAMILY_ORACLE_LINUX_8 = 'ORACLE_LINUX_8'.freeze,
      OS_FAMILY_ORACLE_LINUX_7 = 'ORACLE_LINUX_7'.freeze,
      OS_FAMILY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ARCH_TYPE_ENUM = [
      ARCH_TYPE_X86_64 = 'X86_64'.freeze,
      ARCH_TYPE_AARCH64 = 'AARCH64'.freeze,
      ARCH_TYPE_I686 = 'I686'.freeze,
      ARCH_TYPE_NOARCH = 'NOARCH'.freeze,
      ARCH_TYPE_SRC = 'SRC'.freeze,
      ARCH_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    VENDOR_NAME_ENUM = [
      VENDOR_NAME_ORACLE = 'ORACLE'.freeze,
      VENDOR_NAME_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the resource that is immutable on creation.
    # @return [String]
    attr_accessor :id

    # **[Required]** The OCID of the tenancy containing the lifecycle environment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information.
    # @return [String]
    attr_accessor :display_name

    # User specified information about the lifecycle environment.
    # @return [String]
    attr_accessor :description

    # **[Required]** User specified list of lifecycle stages to be created for the lifecycle environment.
    # @return [Array<OCI::OsManagementHub::Models::LifecycleStage>]
    attr_accessor :stages

    # The list of managed instance OCIDs specified in the lifecycle stage.
    # @return [Array<OCI::OsManagementHub::Models::ManagedInstanceDetails>]
    attr_accessor :managed_instance_ids

    # **[Required]** The current state of the lifecycle environment.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** The operating system type of the target instances.
    # @return [String]
    attr_reader :os_family

    # **[Required]** The CPU architecture of the target instances.
    # @return [String]
    attr_reader :arch_type

    # **[Required]** The software source vendor name.
    # @return [String]
    attr_reader :vendor_name

    # **[Required]** The time the lifecycle environment was created. An RFC3339 formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_created

    # The time the lifecycle environment was last modified. An RFC3339 formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_modified

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # System tags for this resource. Each key is predefined and scoped to a namespace.
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
        'description': :'description',
        'stages': :'stages',
        'managed_instance_ids': :'managedInstanceIds',
        'lifecycle_state': :'lifecycleState',
        'os_family': :'osFamily',
        'arch_type': :'archType',
        'vendor_name': :'vendorName',
        'time_created': :'timeCreated',
        'time_modified': :'timeModified',
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
        'description': :'String',
        'stages': :'Array<OCI::OsManagementHub::Models::LifecycleStage>',
        'managed_instance_ids': :'Array<OCI::OsManagementHub::Models::ManagedInstanceDetails>',
        'lifecycle_state': :'String',
        'os_family': :'String',
        'arch_type': :'String',
        'vendor_name': :'String',
        'time_created': :'DateTime',
        'time_modified': :'DateTime',
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
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Array<OCI::OsManagementHub::Models::LifecycleStage>] :stages The value to assign to the {#stages} property
    # @option attributes [Array<OCI::OsManagementHub::Models::ManagedInstanceDetails>] :managed_instance_ids The value to assign to the {#managed_instance_ids} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :os_family The value to assign to the {#os_family} property
    # @option attributes [String] :arch_type The value to assign to the {#arch_type} property
    # @option attributes [String] :vendor_name The value to assign to the {#vendor_name} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_modified The value to assign to the {#time_modified} property
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

      self.description = attributes[:'description'] if attributes[:'description']

      self.stages = attributes[:'stages'] if attributes[:'stages']

      self.managed_instance_ids = attributes[:'managedInstanceIds'] if attributes[:'managedInstanceIds']

      raise 'You cannot provide both :managedInstanceIds and :managed_instance_ids' if attributes.key?(:'managedInstanceIds') && attributes.key?(:'managed_instance_ids')

      self.managed_instance_ids = attributes[:'managed_instance_ids'] if attributes[:'managed_instance_ids']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.os_family = attributes[:'osFamily'] if attributes[:'osFamily']

      raise 'You cannot provide both :osFamily and :os_family' if attributes.key?(:'osFamily') && attributes.key?(:'os_family')

      self.os_family = attributes[:'os_family'] if attributes[:'os_family']

      self.arch_type = attributes[:'archType'] if attributes[:'archType']

      raise 'You cannot provide both :archType and :arch_type' if attributes.key?(:'archType') && attributes.key?(:'arch_type')

      self.arch_type = attributes[:'arch_type'] if attributes[:'arch_type']

      self.vendor_name = attributes[:'vendorName'] if attributes[:'vendorName']

      raise 'You cannot provide both :vendorName and :vendor_name' if attributes.key?(:'vendorName') && attributes.key?(:'vendor_name')

      self.vendor_name = attributes[:'vendor_name'] if attributes[:'vendor_name']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_modified = attributes[:'timeModified'] if attributes[:'timeModified']

      raise 'You cannot provide both :timeModified and :time_modified' if attributes.key?(:'timeModified') && attributes.key?(:'time_modified')

      self.time_modified = attributes[:'time_modified'] if attributes[:'time_modified']

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
    # @param [Object] os_family Object to be assigned
    def os_family=(os_family)
      # rubocop:disable Style/ConditionalAssignment
      if os_family && !OS_FAMILY_ENUM.include?(os_family)
        OCI.logger.debug("Unknown value for 'os_family' [" + os_family + "]. Mapping to 'OS_FAMILY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @os_family = OS_FAMILY_UNKNOWN_ENUM_VALUE
      else
        @os_family = os_family
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] arch_type Object to be assigned
    def arch_type=(arch_type)
      # rubocop:disable Style/ConditionalAssignment
      if arch_type && !ARCH_TYPE_ENUM.include?(arch_type)
        OCI.logger.debug("Unknown value for 'arch_type' [" + arch_type + "]. Mapping to 'ARCH_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @arch_type = ARCH_TYPE_UNKNOWN_ENUM_VALUE
      else
        @arch_type = arch_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] vendor_name Object to be assigned
    def vendor_name=(vendor_name)
      # rubocop:disable Style/ConditionalAssignment
      if vendor_name && !VENDOR_NAME_ENUM.include?(vendor_name)
        OCI.logger.debug("Unknown value for 'vendor_name' [" + vendor_name + "]. Mapping to 'VENDOR_NAME_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @vendor_name = VENDOR_NAME_UNKNOWN_ENUM_VALUE
      else
        @vendor_name = vendor_name
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
        stages == other.stages &&
        managed_instance_ids == other.managed_instance_ids &&
        lifecycle_state == other.lifecycle_state &&
        os_family == other.os_family &&
        arch_type == other.arch_type &&
        vendor_name == other.vendor_name &&
        time_created == other.time_created &&
        time_modified == other.time_modified &&
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
      [id, compartment_id, display_name, description, stages, managed_instance_ids, lifecycle_state, os_family, arch_type, vendor_name, time_created, time_modified, freeform_tags, defined_tags, system_tags].hash
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
