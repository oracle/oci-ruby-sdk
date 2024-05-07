# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220125
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Deprecated. Source VNIC to destination subnet mapping for a compute instance.
  #
  class DisasterRecovery::Models::ComputeInstanceVnicMapping
    # **[Required]** The OCID of the VNIC.
    #
    # Example: `ocid1.vnic.oc1..uniqueID`
    #
    # @return [String]
    attr_accessor :source_vnic_id

    # **[Required]** The OCID of the destination subnet to which the source VNIC should connect.
    #
    # Example: `ocid1.subnet.oc1..uniqueID`
    #
    # @return [String]
    attr_accessor :destination_subnet_id

    # A list of OCIDs of network security groups (NSG) in the destination region which should be assigned to
    # the source VNIC.
    #
    # Example: `[ ocid1.networksecuritygroup.oc1..uniqueID1, ocid1.networksecuritygroup.oc1..uniqueID2 ]`
    #
    # @return [Array<String>]
    attr_accessor :destination_nsg_id_list

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'source_vnic_id': :'sourceVnicId',
        'destination_subnet_id': :'destinationSubnetId',
        'destination_nsg_id_list': :'destinationNsgIdList'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'source_vnic_id': :'String',
        'destination_subnet_id': :'String',
        'destination_nsg_id_list': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :source_vnic_id The value to assign to the {#source_vnic_id} property
    # @option attributes [String] :destination_subnet_id The value to assign to the {#destination_subnet_id} property
    # @option attributes [Array<String>] :destination_nsg_id_list The value to assign to the {#destination_nsg_id_list} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.source_vnic_id = attributes[:'sourceVnicId'] if attributes[:'sourceVnicId']

      raise 'You cannot provide both :sourceVnicId and :source_vnic_id' if attributes.key?(:'sourceVnicId') && attributes.key?(:'source_vnic_id')

      self.source_vnic_id = attributes[:'source_vnic_id'] if attributes[:'source_vnic_id']

      self.destination_subnet_id = attributes[:'destinationSubnetId'] if attributes[:'destinationSubnetId']

      raise 'You cannot provide both :destinationSubnetId and :destination_subnet_id' if attributes.key?(:'destinationSubnetId') && attributes.key?(:'destination_subnet_id')

      self.destination_subnet_id = attributes[:'destination_subnet_id'] if attributes[:'destination_subnet_id']

      self.destination_nsg_id_list = attributes[:'destinationNsgIdList'] if attributes[:'destinationNsgIdList']

      raise 'You cannot provide both :destinationNsgIdList and :destination_nsg_id_list' if attributes.key?(:'destinationNsgIdList') && attributes.key?(:'destination_nsg_id_list')

      self.destination_nsg_id_list = attributes[:'destination_nsg_id_list'] if attributes[:'destination_nsg_id_list']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        source_vnic_id == other.source_vnic_id &&
        destination_subnet_id == other.destination_subnet_id &&
        destination_nsg_id_list == other.destination_nsg_id_list
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
      [source_vnic_id, destination_subnet_id, destination_nsg_id_list].hash
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
