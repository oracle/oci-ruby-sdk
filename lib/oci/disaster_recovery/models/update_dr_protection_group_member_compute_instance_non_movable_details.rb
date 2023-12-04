# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220125
require 'date'
require_relative 'update_dr_protection_group_member_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Update properties for a non-movable compute instance member.
  class DisasterRecovery::Models::UpdateDrProtectionGroupMemberComputeInstanceNonMovableDetails < DisasterRecovery::Models::UpdateDrProtectionGroupMemberDetails
    # A flag indicating whether the non-movable compute instance should be started and stopped during DR operations.
    # *Prechecks cannot be executed on stopped instances that are configured to be started.*
    #
    # @return [BOOLEAN]
    attr_accessor :is_start_stop_enabled

    # A list of operations performed on file systems used by the compute instance.
    #
    # @return [Array<OCI::DisasterRecovery::Models::UpdateComputeInstanceNonMovableFileSystemOperationDetails>]
    attr_accessor :file_system_operations

    # A list of operations performed on block volumes used by the compute instance.
    #
    # @return [Array<OCI::DisasterRecovery::Models::UpdateComputeInstanceNonMovableBlockVolumeOperationDetails>]
    attr_accessor :block_volume_operations

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'member_id': :'memberId',
        'member_type': :'memberType',
        'is_start_stop_enabled': :'isStartStopEnabled',
        'file_system_operations': :'fileSystemOperations',
        'block_volume_operations': :'blockVolumeOperations'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'member_id': :'String',
        'member_type': :'String',
        'is_start_stop_enabled': :'BOOLEAN',
        'file_system_operations': :'Array<OCI::DisasterRecovery::Models::UpdateComputeInstanceNonMovableFileSystemOperationDetails>',
        'block_volume_operations': :'Array<OCI::DisasterRecovery::Models::UpdateComputeInstanceNonMovableBlockVolumeOperationDetails>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :member_id The value to assign to the {OCI::DisasterRecovery::Models::UpdateDrProtectionGroupMemberDetails#member_id #member_id} proprety
    # @option attributes [BOOLEAN] :is_start_stop_enabled The value to assign to the {#is_start_stop_enabled} property
    # @option attributes [Array<OCI::DisasterRecovery::Models::UpdateComputeInstanceNonMovableFileSystemOperationDetails>] :file_system_operations The value to assign to the {#file_system_operations} property
    # @option attributes [Array<OCI::DisasterRecovery::Models::UpdateComputeInstanceNonMovableBlockVolumeOperationDetails>] :block_volume_operations The value to assign to the {#block_volume_operations} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['memberType'] = 'COMPUTE_INSTANCE_NON_MOVABLE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_start_stop_enabled = attributes[:'isStartStopEnabled'] unless attributes[:'isStartStopEnabled'].nil?
      self.is_start_stop_enabled = false if is_start_stop_enabled.nil? && !attributes.key?(:'isStartStopEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isStartStopEnabled and :is_start_stop_enabled' if attributes.key?(:'isStartStopEnabled') && attributes.key?(:'is_start_stop_enabled')

      self.is_start_stop_enabled = attributes[:'is_start_stop_enabled'] unless attributes[:'is_start_stop_enabled'].nil?
      self.is_start_stop_enabled = false if is_start_stop_enabled.nil? && !attributes.key?(:'isStartStopEnabled') && !attributes.key?(:'is_start_stop_enabled') # rubocop:disable Style/StringLiterals

      self.file_system_operations = attributes[:'fileSystemOperations'] if attributes[:'fileSystemOperations']

      raise 'You cannot provide both :fileSystemOperations and :file_system_operations' if attributes.key?(:'fileSystemOperations') && attributes.key?(:'file_system_operations')

      self.file_system_operations = attributes[:'file_system_operations'] if attributes[:'file_system_operations']

      self.block_volume_operations = attributes[:'blockVolumeOperations'] if attributes[:'blockVolumeOperations']

      raise 'You cannot provide both :blockVolumeOperations and :block_volume_operations' if attributes.key?(:'blockVolumeOperations') && attributes.key?(:'block_volume_operations')

      self.block_volume_operations = attributes[:'block_volume_operations'] if attributes[:'block_volume_operations']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        member_id == other.member_id &&
        member_type == other.member_type &&
        is_start_stop_enabled == other.is_start_stop_enabled &&
        file_system_operations == other.file_system_operations &&
        block_volume_operations == other.block_volume_operations
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
      [member_id, member_type, is_start_stop_enabled, file_system_operations, block_volume_operations].hash
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
