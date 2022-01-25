# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Key model.
  class KeyManagement::Models::Key
    PROTECTION_MODE_ENUM = [
      PROTECTION_MODE_HSM = 'HSM'.freeze,
      PROTECTION_MODE_SOFTWARE = 'SOFTWARE'.freeze,
      PROTECTION_MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ENABLING = 'ENABLING'.freeze,
      LIFECYCLE_STATE_ENABLED = 'ENABLED'.freeze,
      LIFECYCLE_STATE_DISABLING = 'DISABLING'.freeze,
      LIFECYCLE_STATE_DISABLED = 'DISABLED'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_PENDING_DELETION = 'PENDING_DELETION'.freeze,
      LIFECYCLE_STATE_SCHEDULING_DELETION = 'SCHEDULING_DELETION'.freeze,
      LIFECYCLE_STATE_CANCELLING_DELETION = 'CANCELLING_DELETION'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_BACKUP_IN_PROGRESS = 'BACKUP_IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_RESTORING = 'RESTORING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the compartment that contains this master encryption key.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The OCID of the key version used in cryptographic operations. During key rotation, the service might be
    # in a transitional state where this or a newer key version are used intermittently. The `currentKeyVersion`
    # property is updated when the service is guaranteed to use the new key version for all subsequent encryption operations.
    #
    # @return [String]
    attr_accessor :current_key_version

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # **[Required]** A user-friendly name for the key. It does not have to be unique, and it is changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # **[Required]** The OCID of the key.
    # @return [String]
    attr_accessor :id

    # This attribute is required.
    # @return [OCI::KeyManagement::Models::KeyShape]
    attr_accessor :key_shape

    # The key's protection mode indicates how the key persists and where cryptographic operations that use the key are performed.
    # A protection mode of `HSM` means that the key persists on a hardware security module (HSM) and all cryptographic operations are performed inside
    # the HSM. A protection mode of `SOFTWARE` means that the key persists on the server, protected by the vault's RSA wrapping key which persists
    # on the HSM. All cryptographic operations that use a key with a protection mode of `SOFTWARE` are performed on the server. By default,
    # a key's protection mode is set to `HSM`. You can't change a key's protection mode after the key is created or imported.
    #
    # @return [String]
    attr_reader :protection_mode

    # **[Required]** The key's current lifecycle state.
    #
    # Example: `ENABLED`
    #
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** The date and time the key was created, expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339) timestamp format.
    #
    # Example: `2018-04-03T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # An optional property indicating when to delete the key, expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339) timestamp format.
    # Example: `2019-04-03T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_of_deletion

    # **[Required]** The OCID of the vault that contains this key.
    # @return [String]
    attr_accessor :vault_id

    # The OCID of the key from which this key was restored.
    # @return [String]
    attr_accessor :restored_from_key_id

    # @return [OCI::KeyManagement::Models::KeyReplicaDetails]
    attr_accessor :replica_details

    # @return [BOOLEAN]
    attr_accessor :is_primary

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'current_key_version': :'currentKeyVersion',
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'freeform_tags': :'freeformTags',
        'id': :'id',
        'key_shape': :'keyShape',
        'protection_mode': :'protectionMode',
        'lifecycle_state': :'lifecycleState',
        'time_created': :'timeCreated',
        'time_of_deletion': :'timeOfDeletion',
        'vault_id': :'vaultId',
        'restored_from_key_id': :'restoredFromKeyId',
        'replica_details': :'replicaDetails',
        'is_primary': :'isPrimary'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'current_key_version': :'String',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'freeform_tags': :'Hash<String, String>',
        'id': :'String',
        'key_shape': :'OCI::KeyManagement::Models::KeyShape',
        'protection_mode': :'String',
        'lifecycle_state': :'String',
        'time_created': :'DateTime',
        'time_of_deletion': :'DateTime',
        'vault_id': :'String',
        'restored_from_key_id': :'String',
        'replica_details': :'OCI::KeyManagement::Models::KeyReplicaDetails',
        'is_primary': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :current_key_version The value to assign to the {#current_key_version} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [OCI::KeyManagement::Models::KeyShape] :key_shape The value to assign to the {#key_shape} property
    # @option attributes [String] :protection_mode The value to assign to the {#protection_mode} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_of_deletion The value to assign to the {#time_of_deletion} property
    # @option attributes [String] :vault_id The value to assign to the {#vault_id} property
    # @option attributes [String] :restored_from_key_id The value to assign to the {#restored_from_key_id} property
    # @option attributes [OCI::KeyManagement::Models::KeyReplicaDetails] :replica_details The value to assign to the {#replica_details} property
    # @option attributes [BOOLEAN] :is_primary The value to assign to the {#is_primary} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.current_key_version = attributes[:'currentKeyVersion'] if attributes[:'currentKeyVersion']

      raise 'You cannot provide both :currentKeyVersion and :current_key_version' if attributes.key?(:'currentKeyVersion') && attributes.key?(:'current_key_version')

      self.current_key_version = attributes[:'current_key_version'] if attributes[:'current_key_version']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.id = attributes[:'id'] if attributes[:'id']

      self.key_shape = attributes[:'keyShape'] if attributes[:'keyShape']

      raise 'You cannot provide both :keyShape and :key_shape' if attributes.key?(:'keyShape') && attributes.key?(:'key_shape')

      self.key_shape = attributes[:'key_shape'] if attributes[:'key_shape']

      self.protection_mode = attributes[:'protectionMode'] if attributes[:'protectionMode']

      raise 'You cannot provide both :protectionMode and :protection_mode' if attributes.key?(:'protectionMode') && attributes.key?(:'protection_mode')

      self.protection_mode = attributes[:'protection_mode'] if attributes[:'protection_mode']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_of_deletion = attributes[:'timeOfDeletion'] if attributes[:'timeOfDeletion']

      raise 'You cannot provide both :timeOfDeletion and :time_of_deletion' if attributes.key?(:'timeOfDeletion') && attributes.key?(:'time_of_deletion')

      self.time_of_deletion = attributes[:'time_of_deletion'] if attributes[:'time_of_deletion']

      self.vault_id = attributes[:'vaultId'] if attributes[:'vaultId']

      raise 'You cannot provide both :vaultId and :vault_id' if attributes.key?(:'vaultId') && attributes.key?(:'vault_id')

      self.vault_id = attributes[:'vault_id'] if attributes[:'vault_id']

      self.restored_from_key_id = attributes[:'restoredFromKeyId'] if attributes[:'restoredFromKeyId']

      raise 'You cannot provide both :restoredFromKeyId and :restored_from_key_id' if attributes.key?(:'restoredFromKeyId') && attributes.key?(:'restored_from_key_id')

      self.restored_from_key_id = attributes[:'restored_from_key_id'] if attributes[:'restored_from_key_id']

      self.replica_details = attributes[:'replicaDetails'] if attributes[:'replicaDetails']

      raise 'You cannot provide both :replicaDetails and :replica_details' if attributes.key?(:'replicaDetails') && attributes.key?(:'replica_details')

      self.replica_details = attributes[:'replica_details'] if attributes[:'replica_details']

      self.is_primary = attributes[:'isPrimary'] unless attributes[:'isPrimary'].nil?

      raise 'You cannot provide both :isPrimary and :is_primary' if attributes.key?(:'isPrimary') && attributes.key?(:'is_primary')

      self.is_primary = attributes[:'is_primary'] unless attributes[:'is_primary'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] protection_mode Object to be assigned
    def protection_mode=(protection_mode)
      # rubocop:disable Style/ConditionalAssignment
      if protection_mode && !PROTECTION_MODE_ENUM.include?(protection_mode)
        OCI.logger.debug("Unknown value for 'protection_mode' [" + protection_mode + "]. Mapping to 'PROTECTION_MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @protection_mode = PROTECTION_MODE_UNKNOWN_ENUM_VALUE
      else
        @protection_mode = protection_mode
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
        compartment_id == other.compartment_id &&
        current_key_version == other.current_key_version &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        freeform_tags == other.freeform_tags &&
        id == other.id &&
        key_shape == other.key_shape &&
        protection_mode == other.protection_mode &&
        lifecycle_state == other.lifecycle_state &&
        time_created == other.time_created &&
        time_of_deletion == other.time_of_deletion &&
        vault_id == other.vault_id &&
        restored_from_key_id == other.restored_from_key_id &&
        replica_details == other.replica_details &&
        is_primary == other.is_primary
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
      [compartment_id, current_key_version, defined_tags, display_name, freeform_tags, id, key_shape, protection_mode, lifecycle_state, time_created, time_of_deletion, vault_id, restored_from_key_id, replica_details, is_primary].hash
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
