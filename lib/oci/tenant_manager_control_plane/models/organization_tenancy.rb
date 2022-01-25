# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information about the OrganizationTenancy.
  class TenantManagerControlPlane::Models::OrganizationTenancy
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ROLE_ENUM = [
      ROLE_PARENT = 'PARENT'.freeze,
      ROLE_CHILD = 'CHILD'.freeze,
      ROLE_NONE = 'NONE'.freeze,
      ROLE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** OCID of the tenancy.
    # @return [String]
    attr_accessor :tenancy_id

    # Name of the tenancy.
    # @return [String]
    attr_accessor :name

    # Lifecycle state of the OrganizationTenancy.
    # @return [String]
    attr_reader :lifecycle_state

    # Role of the OrganizationTenancy.
    # @return [String]
    attr_reader :role

    # Date-time when this tenancy joined the organization.
    # @return [DateTime]
    attr_accessor :time_joined

    # Date-time when this tenancy left the organization.
    # @return [DateTime]
    attr_accessor :time_left

    # Flag to indicate the tenancy is approved for transfer to another organization.
    # @return [BOOLEAN]
    attr_accessor :is_approved_for_transfer

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'tenancy_id': :'tenancyId',
        'name': :'name',
        'lifecycle_state': :'lifecycleState',
        'role': :'role',
        'time_joined': :'timeJoined',
        'time_left': :'timeLeft',
        'is_approved_for_transfer': :'isApprovedForTransfer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'tenancy_id': :'String',
        'name': :'String',
        'lifecycle_state': :'String',
        'role': :'String',
        'time_joined': :'DateTime',
        'time_left': :'DateTime',
        'is_approved_for_transfer': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :tenancy_id The value to assign to the {#tenancy_id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :role The value to assign to the {#role} property
    # @option attributes [DateTime] :time_joined The value to assign to the {#time_joined} property
    # @option attributes [DateTime] :time_left The value to assign to the {#time_left} property
    # @option attributes [BOOLEAN] :is_approved_for_transfer The value to assign to the {#is_approved_for_transfer} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.tenancy_id = attributes[:'tenancyId'] if attributes[:'tenancyId']

      raise 'You cannot provide both :tenancyId and :tenancy_id' if attributes.key?(:'tenancyId') && attributes.key?(:'tenancy_id')

      self.tenancy_id = attributes[:'tenancy_id'] if attributes[:'tenancy_id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.role = attributes[:'role'] if attributes[:'role']

      self.time_joined = attributes[:'timeJoined'] if attributes[:'timeJoined']

      raise 'You cannot provide both :timeJoined and :time_joined' if attributes.key?(:'timeJoined') && attributes.key?(:'time_joined')

      self.time_joined = attributes[:'time_joined'] if attributes[:'time_joined']

      self.time_left = attributes[:'timeLeft'] if attributes[:'timeLeft']

      raise 'You cannot provide both :timeLeft and :time_left' if attributes.key?(:'timeLeft') && attributes.key?(:'time_left')

      self.time_left = attributes[:'time_left'] if attributes[:'time_left']

      self.is_approved_for_transfer = attributes[:'isApprovedForTransfer'] unless attributes[:'isApprovedForTransfer'].nil?

      raise 'You cannot provide both :isApprovedForTransfer and :is_approved_for_transfer' if attributes.key?(:'isApprovedForTransfer') && attributes.key?(:'is_approved_for_transfer')

      self.is_approved_for_transfer = attributes[:'is_approved_for_transfer'] unless attributes[:'is_approved_for_transfer'].nil?
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
    # @param [Object] role Object to be assigned
    def role=(role)
      # rubocop:disable Style/ConditionalAssignment
      if role && !ROLE_ENUM.include?(role)
        OCI.logger.debug("Unknown value for 'role' [" + role + "]. Mapping to 'ROLE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @role = ROLE_UNKNOWN_ENUM_VALUE
      else
        @role = role
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        tenancy_id == other.tenancy_id &&
        name == other.name &&
        lifecycle_state == other.lifecycle_state &&
        role == other.role &&
        time_joined == other.time_joined &&
        time_left == other.time_left &&
        is_approved_for_transfer == other.is_approved_for_transfer
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
      [tenancy_id, name, lifecycle_state, role, time_joined, time_left, is_approved_for_transfer].hash
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
