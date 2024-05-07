# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20160918
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # For a flexible shape, the amount of networking bandwidth available for instances that use this shape.
  #
  # If this field is null, then this shape has a fixed amount of bandwidth equivalent to `networkingBandwidthInGbps`.
  #
  class Core::Models::ShapeNetworkingBandwidthOptions
    # The minimum amount of networking bandwidth, in gigabits per second.
    #
    # @return [Float]
    attr_accessor :min_in_gbps

    # The maximum amount of networking bandwidth, in gigabits per second.
    #
    # @return [Float]
    attr_accessor :max_in_gbps

    # The default amount of networking bandwidth per OCPU, in gigabits per second.
    #
    # @return [Float]
    attr_accessor :default_per_ocpu_in_gbps

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'min_in_gbps': :'minInGbps',
        'max_in_gbps': :'maxInGbps',
        'default_per_ocpu_in_gbps': :'defaultPerOcpuInGbps'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'min_in_gbps': :'Float',
        'max_in_gbps': :'Float',
        'default_per_ocpu_in_gbps': :'Float'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Float] :min_in_gbps The value to assign to the {#min_in_gbps} property
    # @option attributes [Float] :max_in_gbps The value to assign to the {#max_in_gbps} property
    # @option attributes [Float] :default_per_ocpu_in_gbps The value to assign to the {#default_per_ocpu_in_gbps} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.min_in_gbps = attributes[:'minInGbps'] if attributes[:'minInGbps']

      raise 'You cannot provide both :minInGbps and :min_in_gbps' if attributes.key?(:'minInGbps') && attributes.key?(:'min_in_gbps')

      self.min_in_gbps = attributes[:'min_in_gbps'] if attributes[:'min_in_gbps']

      self.max_in_gbps = attributes[:'maxInGbps'] if attributes[:'maxInGbps']

      raise 'You cannot provide both :maxInGbps and :max_in_gbps' if attributes.key?(:'maxInGbps') && attributes.key?(:'max_in_gbps')

      self.max_in_gbps = attributes[:'max_in_gbps'] if attributes[:'max_in_gbps']

      self.default_per_ocpu_in_gbps = attributes[:'defaultPerOcpuInGbps'] if attributes[:'defaultPerOcpuInGbps']

      raise 'You cannot provide both :defaultPerOcpuInGbps and :default_per_ocpu_in_gbps' if attributes.key?(:'defaultPerOcpuInGbps') && attributes.key?(:'default_per_ocpu_in_gbps')

      self.default_per_ocpu_in_gbps = attributes[:'default_per_ocpu_in_gbps'] if attributes[:'default_per_ocpu_in_gbps']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        min_in_gbps == other.min_in_gbps &&
        max_in_gbps == other.max_in_gbps &&
        default_per_ocpu_in_gbps == other.default_per_ocpu_in_gbps
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
      [min_in_gbps, max_in_gbps, default_per_ocpu_in_gbps].hash
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
