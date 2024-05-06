# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220901
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Software vendor name, list of osFamily and archType.
  class OsManagementHub::Models::SoftwareSourceVendorSummary
    NAME_ENUM = [
      NAME_ORACLE = 'ORACLE'.freeze,
      NAME_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    OS_FAMILIES_ENUM = [
      OS_FAMILIES_ORACLE_LINUX_9 = 'ORACLE_LINUX_9'.freeze,
      OS_FAMILIES_ORACLE_LINUX_8 = 'ORACLE_LINUX_8'.freeze,
      OS_FAMILIES_ORACLE_LINUX_7 = 'ORACLE_LINUX_7'.freeze,
      OS_FAMILIES_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ARCH_TYPES_ENUM = [
      ARCH_TYPES_X86_64 = 'X86_64'.freeze,
      ARCH_TYPES_AARCH64 = 'AARCH64'.freeze,
      ARCH_TYPES_I686 = 'I686'.freeze,
      ARCH_TYPES_NOARCH = 'NOARCH'.freeze,
      ARCH_TYPES_SRC = 'SRC'.freeze,
      ARCH_TYPES_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Name of the vendor providing the software source.
    # @return [String]
    attr_reader :name

    # **[Required]** List of corresponding osFamilies.
    # @return [Array<String>]
    attr_reader :os_families

    # **[Required]** List of corresponding archTypes.
    # @return [Array<String>]
    attr_reader :arch_types

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'os_families': :'osFamilies',
        'arch_types': :'archTypes'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'os_families': :'Array<String>',
        'arch_types': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [Array<String>] :os_families The value to assign to the {#os_families} property
    # @option attributes [Array<String>] :arch_types The value to assign to the {#arch_types} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.os_families = attributes[:'osFamilies'] if attributes[:'osFamilies']

      raise 'You cannot provide both :osFamilies and :os_families' if attributes.key?(:'osFamilies') && attributes.key?(:'os_families')

      self.os_families = attributes[:'os_families'] if attributes[:'os_families']

      self.arch_types = attributes[:'archTypes'] if attributes[:'archTypes']

      raise 'You cannot provide both :archTypes and :arch_types' if attributes.key?(:'archTypes') && attributes.key?(:'arch_types')

      self.arch_types = attributes[:'arch_types'] if attributes[:'arch_types']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] name Object to be assigned
    def name=(name)
      # rubocop:disable Style/ConditionalAssignment
      if name && !NAME_ENUM.include?(name)
        OCI.logger.debug("Unknown value for 'name' [" + name + "]. Mapping to 'NAME_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @name = NAME_UNKNOWN_ENUM_VALUE
      else
        @name = name
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] os_families Object to be assigned
    def os_families=(os_families)
      # rubocop:disable Style/ConditionalAssignment
      if os_families.nil?
        @os_families = nil
      else
        @os_families =
          os_families.collect do |item|
            if OS_FAMILIES_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'os_families' [#{item}]. Mapping to 'OS_FAMILIES_UNKNOWN_ENUM_VALUE'") if OCI.logger
              OS_FAMILIES_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] arch_types Object to be assigned
    def arch_types=(arch_types)
      # rubocop:disable Style/ConditionalAssignment
      if arch_types.nil?
        @arch_types = nil
      else
        @arch_types =
          arch_types.collect do |item|
            if ARCH_TYPES_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'arch_types' [#{item}]. Mapping to 'ARCH_TYPES_UNKNOWN_ENUM_VALUE'") if OCI.logger
              ARCH_TYPES_UNKNOWN_ENUM_VALUE
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
        os_families == other.os_families &&
        arch_types == other.arch_types
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
      [name, os_families, arch_types].hash
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