# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information about new node
  class Bds::Models::CreateNodeDetails
    # **[Required]** BDS instance node type
    # @return [String]
    attr_accessor :node_type

    # **[Required]** Shape of the node
    # @return [String]
    attr_accessor :shape

    # **[Required]** The size of block volume in GB that needs to be attached to a given node.
    # All the necessary details needed for attachment are managed by service itself.
    #
    # @return [Integer]
    attr_accessor :block_volume_size_in_gbs

    # **[Required]** The OCID of the subnet in which the node should be created
    # @return [String]
    attr_accessor :subnet_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'node_type': :'nodeType',
        'shape': :'shape',
        'block_volume_size_in_gbs': :'blockVolumeSizeInGBs',
        'subnet_id': :'subnetId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'node_type': :'String',
        'shape': :'String',
        'block_volume_size_in_gbs': :'Integer',
        'subnet_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :node_type The value to assign to the {#node_type} property
    # @option attributes [String] :shape The value to assign to the {#shape} property
    # @option attributes [Integer] :block_volume_size_in_gbs The value to assign to the {#block_volume_size_in_gbs} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.node_type = attributes[:'nodeType'] if attributes[:'nodeType']

      raise 'You cannot provide both :nodeType and :node_type' if attributes.key?(:'nodeType') && attributes.key?(:'node_type')

      self.node_type = attributes[:'node_type'] if attributes[:'node_type']

      self.shape = attributes[:'shape'] if attributes[:'shape']

      self.block_volume_size_in_gbs = attributes[:'blockVolumeSizeInGBs'] if attributes[:'blockVolumeSizeInGBs']

      raise 'You cannot provide both :blockVolumeSizeInGBs and :block_volume_size_in_gbs' if attributes.key?(:'blockVolumeSizeInGBs') && attributes.key?(:'block_volume_size_in_gbs')

      self.block_volume_size_in_gbs = attributes[:'block_volume_size_in_gbs'] if attributes[:'block_volume_size_in_gbs']

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        node_type == other.node_type &&
        shape == other.shape &&
        block_volume_size_in_gbs == other.block_volume_size_in_gbs &&
        subnet_id == other.subnet_id
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
      [node_type, shape, block_volume_size_in_gbs, subnet_id].hash
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