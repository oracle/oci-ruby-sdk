# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20201101
require 'date'
require_relative 'discovered_external_db_system_component'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of an ASM discovered in an external DB system discovery run.
  class DatabaseManagement::Models::DiscoveredExternalAsm < DatabaseManagement::Models::DiscoveredExternalDbSystemComponent
    # The directory in which ASM is installed. This is the same directory in which Oracle Grid Infrastructure is installed.
    # @return [String]
    attr_accessor :grid_home

    # Indicates whether Oracle Flex ASM is enabled or not.
    # @return [BOOLEAN]
    attr_accessor :is_flex_enabled

    # The ASM version.
    # @return [String]
    attr_accessor :version

    # @return [Array<OCI::DatabaseManagement::Models::DiscoveredExternalAsmInstance>]
    attr_accessor :asm_instances

    # @return [OCI::DatabaseManagement::Models::ExternalDbSystemDiscoveryConnector]
    attr_accessor :connector

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'component_id': :'componentId',
        'display_name': :'displayName',
        'component_name': :'componentName',
        'component_type': :'componentType',
        'resource_id': :'resourceId',
        'is_selected_for_monitoring': :'isSelectedForMonitoring',
        'status': :'status',
        'associated_components': :'associatedComponents',
        'grid_home': :'gridHome',
        'is_flex_enabled': :'isFlexEnabled',
        'version': :'version',
        'asm_instances': :'asmInstances',
        'connector': :'connector'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'component_id': :'String',
        'display_name': :'String',
        'component_name': :'String',
        'component_type': :'String',
        'resource_id': :'String',
        'is_selected_for_monitoring': :'BOOLEAN',
        'status': :'String',
        'associated_components': :'Array<OCI::DatabaseManagement::Models::AssociatedComponent>',
        'grid_home': :'String',
        'is_flex_enabled': :'BOOLEAN',
        'version': :'String',
        'asm_instances': :'Array<OCI::DatabaseManagement::Models::DiscoveredExternalAsmInstance>',
        'connector': :'OCI::DatabaseManagement::Models::ExternalDbSystemDiscoveryConnector'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :component_id The value to assign to the {OCI::DatabaseManagement::Models::DiscoveredExternalDbSystemComponent#component_id #component_id} proprety
    # @option attributes [String] :display_name The value to assign to the {OCI::DatabaseManagement::Models::DiscoveredExternalDbSystemComponent#display_name #display_name} proprety
    # @option attributes [String] :component_name The value to assign to the {OCI::DatabaseManagement::Models::DiscoveredExternalDbSystemComponent#component_name #component_name} proprety
    # @option attributes [String] :resource_id The value to assign to the {OCI::DatabaseManagement::Models::DiscoveredExternalDbSystemComponent#resource_id #resource_id} proprety
    # @option attributes [BOOLEAN] :is_selected_for_monitoring The value to assign to the {OCI::DatabaseManagement::Models::DiscoveredExternalDbSystemComponent#is_selected_for_monitoring #is_selected_for_monitoring} proprety
    # @option attributes [String] :status The value to assign to the {OCI::DatabaseManagement::Models::DiscoveredExternalDbSystemComponent#status #status} proprety
    # @option attributes [Array<OCI::DatabaseManagement::Models::AssociatedComponent>] :associated_components The value to assign to the {OCI::DatabaseManagement::Models::DiscoveredExternalDbSystemComponent#associated_components #associated_components} proprety
    # @option attributes [String] :grid_home The value to assign to the {#grid_home} property
    # @option attributes [BOOLEAN] :is_flex_enabled The value to assign to the {#is_flex_enabled} property
    # @option attributes [String] :version The value to assign to the {#version} property
    # @option attributes [Array<OCI::DatabaseManagement::Models::DiscoveredExternalAsmInstance>] :asm_instances The value to assign to the {#asm_instances} property
    # @option attributes [OCI::DatabaseManagement::Models::ExternalDbSystemDiscoveryConnector] :connector The value to assign to the {#connector} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['componentType'] = 'ASM'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.grid_home = attributes[:'gridHome'] if attributes[:'gridHome']

      raise 'You cannot provide both :gridHome and :grid_home' if attributes.key?(:'gridHome') && attributes.key?(:'grid_home')

      self.grid_home = attributes[:'grid_home'] if attributes[:'grid_home']

      self.is_flex_enabled = attributes[:'isFlexEnabled'] unless attributes[:'isFlexEnabled'].nil?

      raise 'You cannot provide both :isFlexEnabled and :is_flex_enabled' if attributes.key?(:'isFlexEnabled') && attributes.key?(:'is_flex_enabled')

      self.is_flex_enabled = attributes[:'is_flex_enabled'] unless attributes[:'is_flex_enabled'].nil?

      self.version = attributes[:'version'] if attributes[:'version']

      self.asm_instances = attributes[:'asmInstances'] if attributes[:'asmInstances']

      raise 'You cannot provide both :asmInstances and :asm_instances' if attributes.key?(:'asmInstances') && attributes.key?(:'asm_instances')

      self.asm_instances = attributes[:'asm_instances'] if attributes[:'asm_instances']

      self.connector = attributes[:'connector'] if attributes[:'connector']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        component_id == other.component_id &&
        display_name == other.display_name &&
        component_name == other.component_name &&
        component_type == other.component_type &&
        resource_id == other.resource_id &&
        is_selected_for_monitoring == other.is_selected_for_monitoring &&
        status == other.status &&
        associated_components == other.associated_components &&
        grid_home == other.grid_home &&
        is_flex_enabled == other.is_flex_enabled &&
        version == other.version &&
        asm_instances == other.asm_instances &&
        connector == other.connector
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
      [component_id, display_name, component_name, component_type, resource_id, is_selected_for_monitoring, status, associated_components, grid_home, is_flex_enabled, version, asm_instances, connector].hash
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
