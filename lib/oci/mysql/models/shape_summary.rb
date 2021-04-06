# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The shape of the DB System. The shape determines resources to allocate
  # to the DB System - CPU cores and memory for VM shapes; CPU cores, memory
  # and storage for non-VM (or bare metal) shapes.  For a description of
  # shapes, see [DB System Shape Options](https://docs.cloud.oracle.com/mysql-database/doc/shapes.htm).
  #
  class Mysql::Models::ShapeSummary
    IS_SUPPORTED_FOR_ENUM = [
      IS_SUPPORTED_FOR_DBSYSTEM = 'DBSYSTEM'.freeze,
      IS_SUPPORTED_FOR_ANALYTICSCLUSTER = 'ANALYTICSCLUSTER'.freeze,
      IS_SUPPORTED_FOR_HEATWAVECLUSTER = 'HEATWAVECLUSTER'.freeze,
      IS_SUPPORTED_FOR_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The name of the shape used for the DB System.
    # @return [String]
    attr_accessor :name

    # **[Required]** The number of CPU Cores the Instance provides. These are \"OCPU\"s.
    # @return [Integer]
    attr_accessor :cpu_core_count

    # **[Required]** The amount of RAM the Instance provides. This is an IEC base-2 number.
    # @return [Integer]
    attr_accessor :memory_size_in_gbs

    # What service features the shape is supported for.
    #
    # @return [Array<String>]
    attr_reader :is_supported_for

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'cpu_core_count': :'cpuCoreCount',
        'memory_size_in_gbs': :'memorySizeInGBs',
        'is_supported_for': :'isSupportedFor'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'cpu_core_count': :'Integer',
        'memory_size_in_gbs': :'Integer',
        'is_supported_for': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [Integer] :cpu_core_count The value to assign to the {#cpu_core_count} property
    # @option attributes [Integer] :memory_size_in_gbs The value to assign to the {#memory_size_in_gbs} property
    # @option attributes [Array<String>] :is_supported_for The value to assign to the {#is_supported_for} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.cpu_core_count = attributes[:'cpuCoreCount'] if attributes[:'cpuCoreCount']

      raise 'You cannot provide both :cpuCoreCount and :cpu_core_count' if attributes.key?(:'cpuCoreCount') && attributes.key?(:'cpu_core_count')

      self.cpu_core_count = attributes[:'cpu_core_count'] if attributes[:'cpu_core_count']

      self.memory_size_in_gbs = attributes[:'memorySizeInGBs'] if attributes[:'memorySizeInGBs']

      raise 'You cannot provide both :memorySizeInGBs and :memory_size_in_gbs' if attributes.key?(:'memorySizeInGBs') && attributes.key?(:'memory_size_in_gbs')

      self.memory_size_in_gbs = attributes[:'memory_size_in_gbs'] if attributes[:'memory_size_in_gbs']

      self.is_supported_for = attributes[:'isSupportedFor'] if attributes[:'isSupportedFor']

      raise 'You cannot provide both :isSupportedFor and :is_supported_for' if attributes.key?(:'isSupportedFor') && attributes.key?(:'is_supported_for')

      self.is_supported_for = attributes[:'is_supported_for'] if attributes[:'is_supported_for']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] is_supported_for Object to be assigned
    def is_supported_for=(is_supported_for)
      # rubocop:disable Style/ConditionalAssignment
      if is_supported_for.nil?
        @is_supported_for = nil
      else
        @is_supported_for =
          is_supported_for.collect do |item|
            if IS_SUPPORTED_FOR_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'is_supported_for' [#{item}]. Mapping to 'IS_SUPPORTED_FOR_UNKNOWN_ENUM_VALUE'") if OCI.logger
              IS_SUPPORTED_FOR_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        cpu_core_count == other.cpu_core_count &&
        memory_size_in_gbs == other.memory_size_in_gbs &&
        is_supported_for == other.is_supported_for
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
      [name, cpu_core_count, memory_size_in_gbs, is_supported_for].hash
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
