# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220125
require 'date'
require_relative 'create_dr_protection_group_member_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Create properties for a movable compute instance member.
  class DisasterRecovery::Models::CreateDrProtectionGroupMemberComputeInstanceMovableDetails < DisasterRecovery::Models::CreateDrProtectionGroupMemberDetails
    # A flag indicating if the compute instance should be moved to the same fault domain in the destination region.
    # The compute instance launch will fail if this flag is set to true and capacity is not available in the
    # specified fault domain in the destination region.
    #
    # Example: `false`
    #
    # @return [BOOLEAN]
    attr_accessor :is_retain_fault_domain

    # The OCID of a capacity reservation in the destination region which will be used to launch
    # the compute instance.
    #
    # Example: `ocid1.capacityreservation.oc1..uniqueID`
    #
    # @return [String]
    attr_accessor :destination_capacity_reservation_id

    # A list of compute instance VNIC mappings.
    #
    # @return [Array<OCI::DisasterRecovery::Models::ComputeInstanceMovableVnicMappingDetails>]
    attr_accessor :vnic_mappings

    # The OCID of a compartment in the destination region in which the compute instance
    # should be launched.
    #
    # Example: `ocid1.compartment.oc1..uniqueID`
    #
    # @return [String]
    attr_accessor :destination_compartment_id

    # The OCID of a dedicated VM host in the destination region where the compute instance
    # should be launched.
    #
    # Example: `ocid1.dedicatedvmhost.oc1..uniqueID`
    #
    # @return [String]
    attr_accessor :destination_dedicated_vm_host_id

    # A list of operations performed on file systems used by the compute instance.
    #
    # @return [Array<OCI::DisasterRecovery::Models::CreateComputeInstanceMovableFileSystemOperationDetails>]
    attr_accessor :file_system_operations

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'member_id': :'memberId',
        'member_type': :'memberType',
        'is_retain_fault_domain': :'isRetainFaultDomain',
        'destination_capacity_reservation_id': :'destinationCapacityReservationId',
        'vnic_mappings': :'vnicMappings',
        'destination_compartment_id': :'destinationCompartmentId',
        'destination_dedicated_vm_host_id': :'destinationDedicatedVmHostId',
        'file_system_operations': :'fileSystemOperations'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'member_id': :'String',
        'member_type': :'String',
        'is_retain_fault_domain': :'BOOLEAN',
        'destination_capacity_reservation_id': :'String',
        'vnic_mappings': :'Array<OCI::DisasterRecovery::Models::ComputeInstanceMovableVnicMappingDetails>',
        'destination_compartment_id': :'String',
        'destination_dedicated_vm_host_id': :'String',
        'file_system_operations': :'Array<OCI::DisasterRecovery::Models::CreateComputeInstanceMovableFileSystemOperationDetails>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :member_id The value to assign to the {OCI::DisasterRecovery::Models::CreateDrProtectionGroupMemberDetails#member_id #member_id} proprety
    # @option attributes [BOOLEAN] :is_retain_fault_domain The value to assign to the {#is_retain_fault_domain} property
    # @option attributes [String] :destination_capacity_reservation_id The value to assign to the {#destination_capacity_reservation_id} property
    # @option attributes [Array<OCI::DisasterRecovery::Models::ComputeInstanceMovableVnicMappingDetails>] :vnic_mappings The value to assign to the {#vnic_mappings} property
    # @option attributes [String] :destination_compartment_id The value to assign to the {#destination_compartment_id} property
    # @option attributes [String] :destination_dedicated_vm_host_id The value to assign to the {#destination_dedicated_vm_host_id} property
    # @option attributes [Array<OCI::DisasterRecovery::Models::CreateComputeInstanceMovableFileSystemOperationDetails>] :file_system_operations The value to assign to the {#file_system_operations} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['memberType'] = 'COMPUTE_INSTANCE_MOVABLE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_retain_fault_domain = attributes[:'isRetainFaultDomain'] unless attributes[:'isRetainFaultDomain'].nil?
      self.is_retain_fault_domain = false if is_retain_fault_domain.nil? && !attributes.key?(:'isRetainFaultDomain') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isRetainFaultDomain and :is_retain_fault_domain' if attributes.key?(:'isRetainFaultDomain') && attributes.key?(:'is_retain_fault_domain')

      self.is_retain_fault_domain = attributes[:'is_retain_fault_domain'] unless attributes[:'is_retain_fault_domain'].nil?
      self.is_retain_fault_domain = false if is_retain_fault_domain.nil? && !attributes.key?(:'isRetainFaultDomain') && !attributes.key?(:'is_retain_fault_domain') # rubocop:disable Style/StringLiterals

      self.destination_capacity_reservation_id = attributes[:'destinationCapacityReservationId'] if attributes[:'destinationCapacityReservationId']

      raise 'You cannot provide both :destinationCapacityReservationId and :destination_capacity_reservation_id' if attributes.key?(:'destinationCapacityReservationId') && attributes.key?(:'destination_capacity_reservation_id')

      self.destination_capacity_reservation_id = attributes[:'destination_capacity_reservation_id'] if attributes[:'destination_capacity_reservation_id']

      self.vnic_mappings = attributes[:'vnicMappings'] if attributes[:'vnicMappings']

      raise 'You cannot provide both :vnicMappings and :vnic_mappings' if attributes.key?(:'vnicMappings') && attributes.key?(:'vnic_mappings')

      self.vnic_mappings = attributes[:'vnic_mappings'] if attributes[:'vnic_mappings']

      self.destination_compartment_id = attributes[:'destinationCompartmentId'] if attributes[:'destinationCompartmentId']

      raise 'You cannot provide both :destinationCompartmentId and :destination_compartment_id' if attributes.key?(:'destinationCompartmentId') && attributes.key?(:'destination_compartment_id')

      self.destination_compartment_id = attributes[:'destination_compartment_id'] if attributes[:'destination_compartment_id']

      self.destination_dedicated_vm_host_id = attributes[:'destinationDedicatedVmHostId'] if attributes[:'destinationDedicatedVmHostId']

      raise 'You cannot provide both :destinationDedicatedVmHostId and :destination_dedicated_vm_host_id' if attributes.key?(:'destinationDedicatedVmHostId') && attributes.key?(:'destination_dedicated_vm_host_id')

      self.destination_dedicated_vm_host_id = attributes[:'destination_dedicated_vm_host_id'] if attributes[:'destination_dedicated_vm_host_id']

      self.file_system_operations = attributes[:'fileSystemOperations'] if attributes[:'fileSystemOperations']

      raise 'You cannot provide both :fileSystemOperations and :file_system_operations' if attributes.key?(:'fileSystemOperations') && attributes.key?(:'file_system_operations')

      self.file_system_operations = attributes[:'file_system_operations'] if attributes[:'file_system_operations']
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
        is_retain_fault_domain == other.is_retain_fault_domain &&
        destination_capacity_reservation_id == other.destination_capacity_reservation_id &&
        vnic_mappings == other.vnic_mappings &&
        destination_compartment_id == other.destination_compartment_id &&
        destination_dedicated_vm_host_id == other.destination_dedicated_vm_host_id &&
        file_system_operations == other.file_system_operations
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
      [member_id, member_type, is_retain_fault_domain, destination_capacity_reservation_id, vnic_mappings, destination_compartment_id, destination_dedicated_vm_host_id, file_system_operations].hash
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
