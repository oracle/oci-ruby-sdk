# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210330
require 'date'
require_relative 'resource_type_metadata_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The resource type metadata is defined in machine friendly format.
  class StackMonitoring::Models::SystemFormatResourceTypeMetadataDetails < StackMonitoring::Models::ResourceTypeMetadataDetails
    # List of required properties for resource type.
    # @return [Array<String>]
    attr_accessor :required_properties

    # List of properties needed by the agent for monitoring the resource.
    # Valid only if resource type is OCI management agent based. When specified,
    # these properties are passed to the management agent during resource create or update.
    #
    # @return [Array<String>]
    attr_accessor :agent_properties

    # List of valid properties for resource type while creating the monitored resource.
    # If resources of this type specifies any other properties during create operation,
    # the operation will fail.
    #
    # @return [Array<String>]
    attr_accessor :valid_properties_for_create

    # List of valid properties for resource type while updating the monitored resource.
    # If resources of this type specifies any other properties during update operation,
    # the operation will fail.
    #
    # @return [Array<String>]
    attr_accessor :valid_properties_for_update

    # List of property sets used to uniquely identify the resources.
    # This check is made during create or update of stack monitoring resource.
    # The resource has to pass unique check for each set in the list.
    # For example, database can have user, password and SID as one unique set.
    # Another unique set would be user, password and service name.
    #
    # @return [Array<OCI::StackMonitoring::Models::UniquePropertySet>]
    attr_accessor :unique_property_sets

    # List of valid values for the properties. This is useful when resource type wants to
    # restrict only certain values for some properties. For instance for 'osType' property,
    # supported values can be restricted to be either Linux or Windows.
    # Example: `{ \"osType\": [\"Linux\",\"Windows\",\"Solaris\"]}`
    #
    # @return [Hash<String, Array<String>>]
    attr_accessor :valid_property_values

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'format': :'format',
        'required_properties': :'requiredProperties',
        'agent_properties': :'agentProperties',
        'valid_properties_for_create': :'validPropertiesForCreate',
        'valid_properties_for_update': :'validPropertiesForUpdate',
        'unique_property_sets': :'uniquePropertySets',
        'valid_property_values': :'validPropertyValues'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'format': :'String',
        'required_properties': :'Array<String>',
        'agent_properties': :'Array<String>',
        'valid_properties_for_create': :'Array<String>',
        'valid_properties_for_update': :'Array<String>',
        'unique_property_sets': :'Array<OCI::StackMonitoring::Models::UniquePropertySet>',
        'valid_property_values': :'Hash<String, Array<String>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<String>] :required_properties The value to assign to the {#required_properties} property
    # @option attributes [Array<String>] :agent_properties The value to assign to the {#agent_properties} property
    # @option attributes [Array<String>] :valid_properties_for_create The value to assign to the {#valid_properties_for_create} property
    # @option attributes [Array<String>] :valid_properties_for_update The value to assign to the {#valid_properties_for_update} property
    # @option attributes [Array<OCI::StackMonitoring::Models::UniquePropertySet>] :unique_property_sets The value to assign to the {#unique_property_sets} property
    # @option attributes [Hash<String, Array<String>>] :valid_property_values The value to assign to the {#valid_property_values} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['format'] = 'SYSTEM_FORMAT'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.required_properties = attributes[:'requiredProperties'] if attributes[:'requiredProperties']

      raise 'You cannot provide both :requiredProperties and :required_properties' if attributes.key?(:'requiredProperties') && attributes.key?(:'required_properties')

      self.required_properties = attributes[:'required_properties'] if attributes[:'required_properties']

      self.agent_properties = attributes[:'agentProperties'] if attributes[:'agentProperties']

      raise 'You cannot provide both :agentProperties and :agent_properties' if attributes.key?(:'agentProperties') && attributes.key?(:'agent_properties')

      self.agent_properties = attributes[:'agent_properties'] if attributes[:'agent_properties']

      self.valid_properties_for_create = attributes[:'validPropertiesForCreate'] if attributes[:'validPropertiesForCreate']

      raise 'You cannot provide both :validPropertiesForCreate and :valid_properties_for_create' if attributes.key?(:'validPropertiesForCreate') && attributes.key?(:'valid_properties_for_create')

      self.valid_properties_for_create = attributes[:'valid_properties_for_create'] if attributes[:'valid_properties_for_create']

      self.valid_properties_for_update = attributes[:'validPropertiesForUpdate'] if attributes[:'validPropertiesForUpdate']

      raise 'You cannot provide both :validPropertiesForUpdate and :valid_properties_for_update' if attributes.key?(:'validPropertiesForUpdate') && attributes.key?(:'valid_properties_for_update')

      self.valid_properties_for_update = attributes[:'valid_properties_for_update'] if attributes[:'valid_properties_for_update']

      self.unique_property_sets = attributes[:'uniquePropertySets'] if attributes[:'uniquePropertySets']

      raise 'You cannot provide both :uniquePropertySets and :unique_property_sets' if attributes.key?(:'uniquePropertySets') && attributes.key?(:'unique_property_sets')

      self.unique_property_sets = attributes[:'unique_property_sets'] if attributes[:'unique_property_sets']

      self.valid_property_values = attributes[:'validPropertyValues'] if attributes[:'validPropertyValues']

      raise 'You cannot provide both :validPropertyValues and :valid_property_values' if attributes.key?(:'validPropertyValues') && attributes.key?(:'valid_property_values')

      self.valid_property_values = attributes[:'valid_property_values'] if attributes[:'valid_property_values']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        format == other.format &&
        required_properties == other.required_properties &&
        agent_properties == other.agent_properties &&
        valid_properties_for_create == other.valid_properties_for_create &&
        valid_properties_for_update == other.valid_properties_for_update &&
        unique_property_sets == other.unique_property_sets &&
        valid_property_values == other.valid_property_values
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
      [format, required_properties, agent_properties, valid_properties_for_create, valid_properties_for_update, unique_property_sets, valid_property_values].hash
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