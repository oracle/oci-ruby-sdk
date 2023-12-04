# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220125
require 'date'
require_relative 'create_dr_protection_group_member_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Create properties for a load balancer member.
  class DisasterRecovery::Models::CreateDrProtectionGroupMemberLoadBalancerDetails < DisasterRecovery::Models::CreateDrProtectionGroupMemberDetails
    # The OCID of the destination load balancer.
    #
    # Example: `ocid1.loadbalancer.oc1..uniqueID`
    #
    # @return [String]
    attr_accessor :destination_load_balancer_id

    # A list of backend set mappings that are used to transfer or update backends during DR.
    #
    # @return [Array<OCI::DisasterRecovery::Models::LoadBalancerBackendSetMappingDetails>]
    attr_accessor :backend_set_mappings

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'member_id': :'memberId',
        'member_type': :'memberType',
        'destination_load_balancer_id': :'destinationLoadBalancerId',
        'backend_set_mappings': :'backendSetMappings'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'member_id': :'String',
        'member_type': :'String',
        'destination_load_balancer_id': :'String',
        'backend_set_mappings': :'Array<OCI::DisasterRecovery::Models::LoadBalancerBackendSetMappingDetails>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :member_id The value to assign to the {OCI::DisasterRecovery::Models::CreateDrProtectionGroupMemberDetails#member_id #member_id} proprety
    # @option attributes [String] :destination_load_balancer_id The value to assign to the {#destination_load_balancer_id} property
    # @option attributes [Array<OCI::DisasterRecovery::Models::LoadBalancerBackendSetMappingDetails>] :backend_set_mappings The value to assign to the {#backend_set_mappings} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['memberType'] = 'LOAD_BALANCER'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.destination_load_balancer_id = attributes[:'destinationLoadBalancerId'] if attributes[:'destinationLoadBalancerId']

      raise 'You cannot provide both :destinationLoadBalancerId and :destination_load_balancer_id' if attributes.key?(:'destinationLoadBalancerId') && attributes.key?(:'destination_load_balancer_id')

      self.destination_load_balancer_id = attributes[:'destination_load_balancer_id'] if attributes[:'destination_load_balancer_id']

      self.backend_set_mappings = attributes[:'backendSetMappings'] if attributes[:'backendSetMappings']

      raise 'You cannot provide both :backendSetMappings and :backend_set_mappings' if attributes.key?(:'backendSetMappings') && attributes.key?(:'backend_set_mappings')

      self.backend_set_mappings = attributes[:'backend_set_mappings'] if attributes[:'backend_set_mappings']
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
        destination_load_balancer_id == other.destination_load_balancer_id &&
        backend_set_mappings == other.backend_set_mappings
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
      [member_id, member_type, destination_load_balancer_id, backend_set_mappings].hash
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
