# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20221208
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Inventory for a Compute Cloud@Customer infrastructure. This information
  # cannot be updated and is from the infrastructure. The information will only be available
  # after the connectionState is transitioned to CONNECTED.
  #
  class ComputeCloudAtCustomer::Models::CccInfrastructureInventory
    # The serial number of the Compute Cloud@Customer infrastructure rack.
    #
    # @return [String]
    attr_accessor :serial_number

    # The number of management nodes that are available and in active use
    # on the Compute Cloud@Customer infrastructure rack.
    #
    # @return [Integer]
    attr_accessor :management_node_count

    # The number of compute nodes that are available and usable
    # on the Compute Cloud@Customer infrastructure rack. There is no distinction
    # of compute node type in this information.
    #
    # @return [Integer]
    attr_accessor :compute_node_count

    # The number of storage trays in the Compute Cloud@Customer infrastructure rack that are designated for capacity storage.
    # @return [Integer]
    attr_accessor :capacity_storage_tray_count

    # The number of storage trays in the Compute Cloud@Customer infrastructure rack that are designated for performance storage.
    # @return [Integer]
    attr_accessor :performance_storage_tray_count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'serial_number': :'serialNumber',
        'management_node_count': :'managementNodeCount',
        'compute_node_count': :'computeNodeCount',
        'capacity_storage_tray_count': :'capacityStorageTrayCount',
        'performance_storage_tray_count': :'performanceStorageTrayCount'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'serial_number': :'String',
        'management_node_count': :'Integer',
        'compute_node_count': :'Integer',
        'capacity_storage_tray_count': :'Integer',
        'performance_storage_tray_count': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :serial_number The value to assign to the {#serial_number} property
    # @option attributes [Integer] :management_node_count The value to assign to the {#management_node_count} property
    # @option attributes [Integer] :compute_node_count The value to assign to the {#compute_node_count} property
    # @option attributes [Integer] :capacity_storage_tray_count The value to assign to the {#capacity_storage_tray_count} property
    # @option attributes [Integer] :performance_storage_tray_count The value to assign to the {#performance_storage_tray_count} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.serial_number = attributes[:'serialNumber'] if attributes[:'serialNumber']

      raise 'You cannot provide both :serialNumber and :serial_number' if attributes.key?(:'serialNumber') && attributes.key?(:'serial_number')

      self.serial_number = attributes[:'serial_number'] if attributes[:'serial_number']

      self.management_node_count = attributes[:'managementNodeCount'] if attributes[:'managementNodeCount']

      raise 'You cannot provide both :managementNodeCount and :management_node_count' if attributes.key?(:'managementNodeCount') && attributes.key?(:'management_node_count')

      self.management_node_count = attributes[:'management_node_count'] if attributes[:'management_node_count']

      self.compute_node_count = attributes[:'computeNodeCount'] if attributes[:'computeNodeCount']

      raise 'You cannot provide both :computeNodeCount and :compute_node_count' if attributes.key?(:'computeNodeCount') && attributes.key?(:'compute_node_count')

      self.compute_node_count = attributes[:'compute_node_count'] if attributes[:'compute_node_count']

      self.capacity_storage_tray_count = attributes[:'capacityStorageTrayCount'] if attributes[:'capacityStorageTrayCount']

      raise 'You cannot provide both :capacityStorageTrayCount and :capacity_storage_tray_count' if attributes.key?(:'capacityStorageTrayCount') && attributes.key?(:'capacity_storage_tray_count')

      self.capacity_storage_tray_count = attributes[:'capacity_storage_tray_count'] if attributes[:'capacity_storage_tray_count']

      self.performance_storage_tray_count = attributes[:'performanceStorageTrayCount'] if attributes[:'performanceStorageTrayCount']

      raise 'You cannot provide both :performanceStorageTrayCount and :performance_storage_tray_count' if attributes.key?(:'performanceStorageTrayCount') && attributes.key?(:'performance_storage_tray_count')

      self.performance_storage_tray_count = attributes[:'performance_storage_tray_count'] if attributes[:'performance_storage_tray_count']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        serial_number == other.serial_number &&
        management_node_count == other.management_node_count &&
        compute_node_count == other.compute_node_count &&
        capacity_storage_tray_count == other.capacity_storage_tray_count &&
        performance_storage_tray_count == other.performance_storage_tray_count
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
      [serial_number, management_node_count, compute_node_count, capacity_storage_tray_count, performance_storage_tray_count].hash
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
