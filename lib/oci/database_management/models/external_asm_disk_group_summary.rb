# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20201101
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The summary of an external ASM disk group.
  class DatabaseManagement::Models::ExternalAsmDiskGroupSummary
    REDUNDANCY_TYPE_ENUM = [
      REDUNDANCY_TYPE_EXTEND = 'EXTEND'.freeze,
      REDUNDANCY_TYPE_EXTERN = 'EXTERN'.freeze,
      REDUNDANCY_TYPE_FLEX = 'FLEX'.freeze,
      REDUNDANCY_TYPE_HIGH = 'HIGH'.freeze,
      REDUNDANCY_TYPE_NORMAL = 'NORMAL'.freeze,
      REDUNDANCY_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The name of the ASM disk group.
    # @return [String]
    attr_accessor :name

    # The number of ASM instances that have the disk group in mounted state.
    # @return [Integer]
    attr_accessor :mounting_instance_count

    # The number of ASM instances that have the disk group in dismounted state.
    # @return [Integer]
    attr_accessor :dismounting_instance_count

    # The redundancy type of the disk group.
    # @return [String]
    attr_reader :redundancy_type

    # Indicates whether the disk group is a sparse disk group or not.
    # @return [BOOLEAN]
    attr_accessor :is_sparse

    # The unique names of the databases using the disk group.
    # @return [Array<String>]
    attr_accessor :databases

    # The total capacity of the disk group (in megabytes).
    # @return [Integer]
    attr_accessor :total_size_in_mbs

    # The used capacity of the disk group (in megabytes).
    # @return [Integer]
    attr_accessor :used_size_in_mbs

    # The percentage of used space in the disk group.
    # @return [Float]
    attr_accessor :used_percent

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'mounting_instance_count': :'mountingInstanceCount',
        'dismounting_instance_count': :'dismountingInstanceCount',
        'redundancy_type': :'redundancyType',
        'is_sparse': :'isSparse',
        'databases': :'databases',
        'total_size_in_mbs': :'totalSizeInMBs',
        'used_size_in_mbs': :'usedSizeInMBs',
        'used_percent': :'usedPercent'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'mounting_instance_count': :'Integer',
        'dismounting_instance_count': :'Integer',
        'redundancy_type': :'String',
        'is_sparse': :'BOOLEAN',
        'databases': :'Array<String>',
        'total_size_in_mbs': :'Integer',
        'used_size_in_mbs': :'Integer',
        'used_percent': :'Float'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [Integer] :mounting_instance_count The value to assign to the {#mounting_instance_count} property
    # @option attributes [Integer] :dismounting_instance_count The value to assign to the {#dismounting_instance_count} property
    # @option attributes [String] :redundancy_type The value to assign to the {#redundancy_type} property
    # @option attributes [BOOLEAN] :is_sparse The value to assign to the {#is_sparse} property
    # @option attributes [Array<String>] :databases The value to assign to the {#databases} property
    # @option attributes [Integer] :total_size_in_mbs The value to assign to the {#total_size_in_mbs} property
    # @option attributes [Integer] :used_size_in_mbs The value to assign to the {#used_size_in_mbs} property
    # @option attributes [Float] :used_percent The value to assign to the {#used_percent} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.mounting_instance_count = attributes[:'mountingInstanceCount'] if attributes[:'mountingInstanceCount']

      raise 'You cannot provide both :mountingInstanceCount and :mounting_instance_count' if attributes.key?(:'mountingInstanceCount') && attributes.key?(:'mounting_instance_count')

      self.mounting_instance_count = attributes[:'mounting_instance_count'] if attributes[:'mounting_instance_count']

      self.dismounting_instance_count = attributes[:'dismountingInstanceCount'] if attributes[:'dismountingInstanceCount']

      raise 'You cannot provide both :dismountingInstanceCount and :dismounting_instance_count' if attributes.key?(:'dismountingInstanceCount') && attributes.key?(:'dismounting_instance_count')

      self.dismounting_instance_count = attributes[:'dismounting_instance_count'] if attributes[:'dismounting_instance_count']

      self.redundancy_type = attributes[:'redundancyType'] if attributes[:'redundancyType']

      raise 'You cannot provide both :redundancyType and :redundancy_type' if attributes.key?(:'redundancyType') && attributes.key?(:'redundancy_type')

      self.redundancy_type = attributes[:'redundancy_type'] if attributes[:'redundancy_type']

      self.is_sparse = attributes[:'isSparse'] unless attributes[:'isSparse'].nil?

      raise 'You cannot provide both :isSparse and :is_sparse' if attributes.key?(:'isSparse') && attributes.key?(:'is_sparse')

      self.is_sparse = attributes[:'is_sparse'] unless attributes[:'is_sparse'].nil?

      self.databases = attributes[:'databases'] if attributes[:'databases']

      self.total_size_in_mbs = attributes[:'totalSizeInMBs'] if attributes[:'totalSizeInMBs']

      raise 'You cannot provide both :totalSizeInMBs and :total_size_in_mbs' if attributes.key?(:'totalSizeInMBs') && attributes.key?(:'total_size_in_mbs')

      self.total_size_in_mbs = attributes[:'total_size_in_mbs'] if attributes[:'total_size_in_mbs']

      self.used_size_in_mbs = attributes[:'usedSizeInMBs'] if attributes[:'usedSizeInMBs']

      raise 'You cannot provide both :usedSizeInMBs and :used_size_in_mbs' if attributes.key?(:'usedSizeInMBs') && attributes.key?(:'used_size_in_mbs')

      self.used_size_in_mbs = attributes[:'used_size_in_mbs'] if attributes[:'used_size_in_mbs']

      self.used_percent = attributes[:'usedPercent'] if attributes[:'usedPercent']

      raise 'You cannot provide both :usedPercent and :used_percent' if attributes.key?(:'usedPercent') && attributes.key?(:'used_percent')

      self.used_percent = attributes[:'used_percent'] if attributes[:'used_percent']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] redundancy_type Object to be assigned
    def redundancy_type=(redundancy_type)
      # rubocop:disable Style/ConditionalAssignment
      if redundancy_type && !REDUNDANCY_TYPE_ENUM.include?(redundancy_type)
        OCI.logger.debug("Unknown value for 'redundancy_type' [" + redundancy_type + "]. Mapping to 'REDUNDANCY_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @redundancy_type = REDUNDANCY_TYPE_UNKNOWN_ENUM_VALUE
      else
        @redundancy_type = redundancy_type
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
        mounting_instance_count == other.mounting_instance_count &&
        dismounting_instance_count == other.dismounting_instance_count &&
        redundancy_type == other.redundancy_type &&
        is_sparse == other.is_sparse &&
        databases == other.databases &&
        total_size_in_mbs == other.total_size_in_mbs &&
        used_size_in_mbs == other.used_size_in_mbs &&
        used_percent == other.used_percent
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
      [name, mounting_instance_count, dismounting_instance_count, redundancy_type, is_sparse, databases, total_size_in_mbs, used_size_in_mbs, used_percent].hash
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