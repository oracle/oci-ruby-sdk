# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A bastion session resource. A bastion session lets authorized users connect to a target resource using a Secure Shell (SSH) for a predetermined amount of time.
  class Bastion::Models::Session
    KEY_TYPE_ENUM = [
      KEY_TYPE_PUB = 'PUB'.freeze,
      KEY_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The unique identifier (OCID) of the session, which can't be changed after creation.
    # @return [String]
    attr_accessor :id

    # The name of the session.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The unique identifier (OCID) of the bastion that is hosting this session.
    # @return [String]
    attr_accessor :bastion_id

    # **[Required]** The name of the bastion that is hosting this session.
    # @return [String]
    attr_accessor :bastion_name

    # The username that the session uses to connect to the target resource.
    # @return [String]
    attr_accessor :bastion_user_name

    # This attribute is required.
    # @return [OCI::Bastion::Models::TargetResourceDetails]
    attr_accessor :target_resource_details

    # The connection message for the session.
    # @return [Hash<String, String>]
    attr_accessor :ssh_metadata

    # The type of the key used to connect to the session. PUB is a standard public key in OpenSSH format.
    # @return [String]
    attr_reader :key_type

    # This attribute is required.
    # @return [OCI::Bastion::Models::PublicKeyDetails]
    attr_accessor :key_details

    # The public key of the bastion host. You can use this to verify that you're connecting to the correct bastion.
    # @return [String]
    attr_accessor :bastion_public_host_key_info

    # **[Required]** The time the session was created. Format is defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    # Example: `2020-01-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The time the session was updated. Format is defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    # Example: `2020-01-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** The current state of the session.
    # @return [String]
    attr_reader :lifecycle_state

    # A message describing the current session state in more detail.
    # @return [String]
    attr_accessor :lifecycle_details

    # **[Required]** The amount of time the session can remain active.
    # @return [Integer]
    attr_accessor :session_ttl_in_seconds

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'bastion_id': :'bastionId',
        'bastion_name': :'bastionName',
        'bastion_user_name': :'bastionUserName',
        'target_resource_details': :'targetResourceDetails',
        'ssh_metadata': :'sshMetadata',
        'key_type': :'keyType',
        'key_details': :'keyDetails',
        'bastion_public_host_key_info': :'bastionPublicHostKeyInfo',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'session_ttl_in_seconds': :'sessionTtlInSeconds'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'display_name': :'String',
        'bastion_id': :'String',
        'bastion_name': :'String',
        'bastion_user_name': :'String',
        'target_resource_details': :'OCI::Bastion::Models::TargetResourceDetails',
        'ssh_metadata': :'Hash<String, String>',
        'key_type': :'String',
        'key_details': :'OCI::Bastion::Models::PublicKeyDetails',
        'bastion_public_host_key_info': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'session_ttl_in_seconds': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :bastion_id The value to assign to the {#bastion_id} property
    # @option attributes [String] :bastion_name The value to assign to the {#bastion_name} property
    # @option attributes [String] :bastion_user_name The value to assign to the {#bastion_user_name} property
    # @option attributes [OCI::Bastion::Models::TargetResourceDetails] :target_resource_details The value to assign to the {#target_resource_details} property
    # @option attributes [Hash<String, String>] :ssh_metadata The value to assign to the {#ssh_metadata} property
    # @option attributes [String] :key_type The value to assign to the {#key_type} property
    # @option attributes [OCI::Bastion::Models::PublicKeyDetails] :key_details The value to assign to the {#key_details} property
    # @option attributes [String] :bastion_public_host_key_info The value to assign to the {#bastion_public_host_key_info} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [Integer] :session_ttl_in_seconds The value to assign to the {#session_ttl_in_seconds} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.bastion_id = attributes[:'bastionId'] if attributes[:'bastionId']

      raise 'You cannot provide both :bastionId and :bastion_id' if attributes.key?(:'bastionId') && attributes.key?(:'bastion_id')

      self.bastion_id = attributes[:'bastion_id'] if attributes[:'bastion_id']

      self.bastion_name = attributes[:'bastionName'] if attributes[:'bastionName']

      raise 'You cannot provide both :bastionName and :bastion_name' if attributes.key?(:'bastionName') && attributes.key?(:'bastion_name')

      self.bastion_name = attributes[:'bastion_name'] if attributes[:'bastion_name']

      self.bastion_user_name = attributes[:'bastionUserName'] if attributes[:'bastionUserName']

      raise 'You cannot provide both :bastionUserName and :bastion_user_name' if attributes.key?(:'bastionUserName') && attributes.key?(:'bastion_user_name')

      self.bastion_user_name = attributes[:'bastion_user_name'] if attributes[:'bastion_user_name']

      self.target_resource_details = attributes[:'targetResourceDetails'] if attributes[:'targetResourceDetails']

      raise 'You cannot provide both :targetResourceDetails and :target_resource_details' if attributes.key?(:'targetResourceDetails') && attributes.key?(:'target_resource_details')

      self.target_resource_details = attributes[:'target_resource_details'] if attributes[:'target_resource_details']

      self.ssh_metadata = attributes[:'sshMetadata'] if attributes[:'sshMetadata']

      raise 'You cannot provide both :sshMetadata and :ssh_metadata' if attributes.key?(:'sshMetadata') && attributes.key?(:'ssh_metadata')

      self.ssh_metadata = attributes[:'ssh_metadata'] if attributes[:'ssh_metadata']

      self.key_type = attributes[:'keyType'] if attributes[:'keyType']
      self.key_type = "PUB" if key_type.nil? && !attributes.key?(:'keyType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :keyType and :key_type' if attributes.key?(:'keyType') && attributes.key?(:'key_type')

      self.key_type = attributes[:'key_type'] if attributes[:'key_type']
      self.key_type = "PUB" if key_type.nil? && !attributes.key?(:'keyType') && !attributes.key?(:'key_type') # rubocop:disable Style/StringLiterals

      self.key_details = attributes[:'keyDetails'] if attributes[:'keyDetails']

      raise 'You cannot provide both :keyDetails and :key_details' if attributes.key?(:'keyDetails') && attributes.key?(:'key_details')

      self.key_details = attributes[:'key_details'] if attributes[:'key_details']

      self.bastion_public_host_key_info = attributes[:'bastionPublicHostKeyInfo'] if attributes[:'bastionPublicHostKeyInfo']

      raise 'You cannot provide both :bastionPublicHostKeyInfo and :bastion_public_host_key_info' if attributes.key?(:'bastionPublicHostKeyInfo') && attributes.key?(:'bastion_public_host_key_info')

      self.bastion_public_host_key_info = attributes[:'bastion_public_host_key_info'] if attributes[:'bastion_public_host_key_info']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.session_ttl_in_seconds = attributes[:'sessionTtlInSeconds'] if attributes[:'sessionTtlInSeconds']

      raise 'You cannot provide both :sessionTtlInSeconds and :session_ttl_in_seconds' if attributes.key?(:'sessionTtlInSeconds') && attributes.key?(:'session_ttl_in_seconds')

      self.session_ttl_in_seconds = attributes[:'session_ttl_in_seconds'] if attributes[:'session_ttl_in_seconds']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] key_type Object to be assigned
    def key_type=(key_type)
      # rubocop:disable Style/ConditionalAssignment
      if key_type && !KEY_TYPE_ENUM.include?(key_type)
        OCI.logger.debug("Unknown value for 'key_type' [" + key_type + "]. Mapping to 'KEY_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @key_type = KEY_TYPE_UNKNOWN_ENUM_VALUE
      else
        @key_type = key_type
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
        display_name == other.display_name &&
        bastion_id == other.bastion_id &&
        bastion_name == other.bastion_name &&
        bastion_user_name == other.bastion_user_name &&
        target_resource_details == other.target_resource_details &&
        ssh_metadata == other.ssh_metadata &&
        key_type == other.key_type &&
        key_details == other.key_details &&
        bastion_public_host_key_info == other.bastion_public_host_key_info &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        session_ttl_in_seconds == other.session_ttl_in_seconds
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
      [id, display_name, bastion_id, bastion_name, bastion_user_name, target_resource_details, ssh_metadata, key_type, key_details, bastion_public_host_key_info, time_created, time_updated, lifecycle_state, lifecycle_details, session_ttl_in_seconds].hash
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
