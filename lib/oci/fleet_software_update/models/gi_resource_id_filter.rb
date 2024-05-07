# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220528
require 'date'
require 'logger'
require_relative 'gi_fleet_discovery_filter'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Related resource Ids to include in the discovery.
  #
  class FleetSoftwareUpdate::Models::GiResourceIdFilter < FleetSoftwareUpdate::Models::GiFleetDiscoveryFilter
    ENTITY_TYPE_ENUM = [
      ENTITY_TYPE_EXADATAINFRASTRUCTURE = 'EXADATAINFRASTRUCTURE'.freeze,
      ENTITY_TYPE_CLOUDEXADATAINFRASTRUCTURE = 'CLOUDEXADATAINFRASTRUCTURE'.freeze,
      ENTITY_TYPE_VMCLUSTER = 'VMCLUSTER'.freeze,
      ENTITY_TYPE_CLOUDVMCLUSTER = 'CLOUDVMCLUSTER'.freeze,
      ENTITY_TYPE_FSUCOLLECTION = 'FSUCOLLECTION'.freeze,
      ENTITY_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    OPERATOR_ENUM = [
      OPERATOR_AND = 'AND'.freeze,
      OPERATOR_OR = 'OR'.freeze,
      OPERATOR_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Type of resource to match in the discovery.
    #
    # @return [String]
    attr_reader :entity_type

    # **[Required]** Related resource Ids to include in the discovery.
    # All must match the specified entityType.
    #
    # @return [Array<String>]
    attr_accessor :identifiers

    # Type of join for each element in this filter.
    #
    # @return [String]
    attr_reader :operator

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'mode': :'mode',
        'entity_type': :'entityType',
        'identifiers': :'identifiers',
        'operator': :'operator'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'mode': :'String',
        'entity_type': :'String',
        'identifiers': :'Array<String>',
        'operator': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :mode The value to assign to the {OCI::FleetSoftwareUpdate::Models::GiFleetDiscoveryFilter#mode #mode} proprety
    # @option attributes [String] :entity_type The value to assign to the {#entity_type} property
    # @option attributes [Array<String>] :identifiers The value to assign to the {#identifiers} property
    # @option attributes [String] :operator The value to assign to the {#operator} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'RESOURCE_ID'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.entity_type = attributes[:'entityType'] if attributes[:'entityType']

      raise 'You cannot provide both :entityType and :entity_type' if attributes.key?(:'entityType') && attributes.key?(:'entity_type')

      self.entity_type = attributes[:'entity_type'] if attributes[:'entity_type']

      self.identifiers = attributes[:'identifiers'] if attributes[:'identifiers']

      self.operator = attributes[:'operator'] if attributes[:'operator']
      self.operator = "OR" if operator.nil? && !attributes.key?(:'operator') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] entity_type Object to be assigned
    def entity_type=(entity_type)
      # rubocop:disable Style/ConditionalAssignment
      if entity_type && !ENTITY_TYPE_ENUM.include?(entity_type)
        OCI.logger.debug("Unknown value for 'entity_type' [" + entity_type + "]. Mapping to 'ENTITY_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @entity_type = ENTITY_TYPE_UNKNOWN_ENUM_VALUE
      else
        @entity_type = entity_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] operator Object to be assigned
    def operator=(operator)
      # rubocop:disable Style/ConditionalAssignment
      if operator && !OPERATOR_ENUM.include?(operator)
        OCI.logger.debug("Unknown value for 'operator' [" + operator + "]. Mapping to 'OPERATOR_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @operator = OPERATOR_UNKNOWN_ENUM_VALUE
      else
        @operator = operator
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        mode == other.mode &&
        entity_type == other.entity_type &&
        identifiers == other.identifiers &&
        operator == other.operator
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
      [type, mode, entity_type, identifiers, operator].hash
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
