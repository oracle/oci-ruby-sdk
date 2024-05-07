# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220125
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Update properties for a member in a DR protection group.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class DisasterRecovery::Models::UpdateDrProtectionGroupMemberDetails
    MEMBER_TYPE_ENUM = [
      MEMBER_TYPE_COMPUTE_INSTANCE = 'COMPUTE_INSTANCE'.freeze,
      MEMBER_TYPE_COMPUTE_INSTANCE_MOVABLE = 'COMPUTE_INSTANCE_MOVABLE'.freeze,
      MEMBER_TYPE_COMPUTE_INSTANCE_NON_MOVABLE = 'COMPUTE_INSTANCE_NON_MOVABLE'.freeze,
      MEMBER_TYPE_VOLUME_GROUP = 'VOLUME_GROUP'.freeze,
      MEMBER_TYPE_DATABASE = 'DATABASE'.freeze,
      MEMBER_TYPE_AUTONOMOUS_DATABASE = 'AUTONOMOUS_DATABASE'.freeze,
      MEMBER_TYPE_LOAD_BALANCER = 'LOAD_BALANCER'.freeze,
      MEMBER_TYPE_NETWORK_LOAD_BALANCER = 'NETWORK_LOAD_BALANCER'.freeze,
      MEMBER_TYPE_FILE_SYSTEM = 'FILE_SYSTEM'.freeze
    ].freeze

    # **[Required]** The OCID of the member.
    #
    # Example: `ocid1.database.oc1..uniqueID`
    #
    # @return [String]
    attr_accessor :member_id

    # **[Required]** The type of the member.
    #
    # @return [String]
    attr_reader :member_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'member_id': :'memberId',
        'member_type': :'memberType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'member_id': :'String',
        'member_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'memberType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::DisasterRecovery::Models::UpdateDrProtectionGroupMemberComputeInstanceDetails' if type == 'COMPUTE_INSTANCE'
      return 'OCI::DisasterRecovery::Models::UpdateDrProtectionGroupMemberNetworkLoadBalancerDetails' if type == 'NETWORK_LOAD_BALANCER'
      return 'OCI::DisasterRecovery::Models::UpdateDrProtectionGroupMemberAutonomousDatabaseDetails' if type == 'AUTONOMOUS_DATABASE'
      return 'OCI::DisasterRecovery::Models::UpdateDrProtectionGroupMemberFileSystemDetails' if type == 'FILE_SYSTEM'
      return 'OCI::DisasterRecovery::Models::UpdateDrProtectionGroupMemberVolumeGroupDetails' if type == 'VOLUME_GROUP'
      return 'OCI::DisasterRecovery::Models::UpdateDrProtectionGroupMemberComputeInstanceNonMovableDetails' if type == 'COMPUTE_INSTANCE_NON_MOVABLE'
      return 'OCI::DisasterRecovery::Models::UpdateDrProtectionGroupMemberLoadBalancerDetails' if type == 'LOAD_BALANCER'
      return 'OCI::DisasterRecovery::Models::UpdateDrProtectionGroupMemberComputeInstanceMovableDetails' if type == 'COMPUTE_INSTANCE_MOVABLE'
      return 'OCI::DisasterRecovery::Models::UpdateDrProtectionGroupMemberDatabaseDetails' if type == 'DATABASE'

      # TODO: Log a warning when the subtype is not found.
      'OCI::DisasterRecovery::Models::UpdateDrProtectionGroupMemberDetails'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :member_id The value to assign to the {#member_id} property
    # @option attributes [String] :member_type The value to assign to the {#member_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.member_id = attributes[:'memberId'] if attributes[:'memberId']

      raise 'You cannot provide both :memberId and :member_id' if attributes.key?(:'memberId') && attributes.key?(:'member_id')

      self.member_id = attributes[:'member_id'] if attributes[:'member_id']

      self.member_type = attributes[:'memberType'] if attributes[:'memberType']

      raise 'You cannot provide both :memberType and :member_type' if attributes.key?(:'memberType') && attributes.key?(:'member_type')

      self.member_type = attributes[:'member_type'] if attributes[:'member_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] member_type Object to be assigned
    def member_type=(member_type)
      raise "Invalid value for 'member_type': this must be one of the values in MEMBER_TYPE_ENUM." if member_type && !MEMBER_TYPE_ENUM.include?(member_type)

      @member_type = member_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        member_id == other.member_id &&
        member_type == other.member_type
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
      [member_id, member_type].hash
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
