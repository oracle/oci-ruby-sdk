# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Properties used in connection create operations.
  class DataConnectivity::Models::CreateConnectionDetails
    # Generated key that can be used in API calls to identify connection. On scenarios where reference to the connection is needed, a value can be passed in create.
    # @return [String]
    attr_accessor :key

    # The model version of an object.
    # @return [String]
    attr_accessor :model_version

    # The type of the object.
    # @return [String]
    attr_accessor :model_type

    # **[Required]** Free form text without any restriction on permitted characters. Name can have letters, numbers, and special characters. The value is editable and is restricted to 1000 characters.
    # @return [String]
    attr_accessor :name

    # User-defined description for the connection.
    # @return [String]
    attr_accessor :description

    # The version of the object that is used to track changes in the object instance.
    # @return [Integer]
    attr_accessor :object_version

    # The status of an object that can be set to value 1 for shallow references across objects, other values reserved.
    # @return [Integer]
    attr_accessor :object_status

    # **[Required]** Value can only contain upper case letters, underscore, and numbers. It should begin with upper case letter or underscore. The value can be modified.
    # @return [String]
    attr_accessor :identifier

    # @return [OCI::DataConnectivity::Models::Schema]
    attr_accessor :primary_schema

    # The properties for the connection.
    # @return [Array<OCI::DataConnectivity::Models::ConnectionProperty>]
    attr_accessor :connection_properties

    # **[Required]** All the properties for the connection in a key-value map format.
    # @return [Hash<String, Object>]
    attr_accessor :properties

    # **[Required]** Specific Connection Type
    # @return [String]
    attr_accessor :type

    # The default property for the connection.
    # @return [BOOLEAN]
    attr_accessor :is_default

    # @return [OCI::DataConnectivity::Models::ObjectMetadata]
    attr_accessor :metadata

    # @return [OCI::DataConnectivity::Models::RegistryMetadata]
    attr_accessor :registry_metadata

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'key',
        'model_version': :'modelVersion',
        'model_type': :'modelType',
        'name': :'name',
        'description': :'description',
        'object_version': :'objectVersion',
        'object_status': :'objectStatus',
        'identifier': :'identifier',
        'primary_schema': :'primarySchema',
        'connection_properties': :'connectionProperties',
        'properties': :'properties',
        'type': :'type',
        'is_default': :'isDefault',
        'metadata': :'metadata',
        'registry_metadata': :'registryMetadata'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'String',
        'model_version': :'String',
        'model_type': :'String',
        'name': :'String',
        'description': :'String',
        'object_version': :'Integer',
        'object_status': :'Integer',
        'identifier': :'String',
        'primary_schema': :'OCI::DataConnectivity::Models::Schema',
        'connection_properties': :'Array<OCI::DataConnectivity::Models::ConnectionProperty>',
        'properties': :'Hash<String, Object>',
        'type': :'String',
        'is_default': :'BOOLEAN',
        'metadata': :'OCI::DataConnectivity::Models::ObjectMetadata',
        'registry_metadata': :'OCI::DataConnectivity::Models::RegistryMetadata'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :model_version The value to assign to the {#model_version} property
    # @option attributes [String] :model_type The value to assign to the {#model_type} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Integer] :object_version The value to assign to the {#object_version} property
    # @option attributes [Integer] :object_status The value to assign to the {#object_status} property
    # @option attributes [String] :identifier The value to assign to the {#identifier} property
    # @option attributes [OCI::DataConnectivity::Models::Schema] :primary_schema The value to assign to the {#primary_schema} property
    # @option attributes [Array<OCI::DataConnectivity::Models::ConnectionProperty>] :connection_properties The value to assign to the {#connection_properties} property
    # @option attributes [Hash<String, Object>] :properties The value to assign to the {#properties} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [BOOLEAN] :is_default The value to assign to the {#is_default} property
    # @option attributes [OCI::DataConnectivity::Models::ObjectMetadata] :metadata The value to assign to the {#metadata} property
    # @option attributes [OCI::DataConnectivity::Models::RegistryMetadata] :registry_metadata The value to assign to the {#registry_metadata} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key = attributes[:'key'] if attributes[:'key']

      self.model_version = attributes[:'modelVersion'] if attributes[:'modelVersion']

      raise 'You cannot provide both :modelVersion and :model_version' if attributes.key?(:'modelVersion') && attributes.key?(:'model_version')

      self.model_version = attributes[:'model_version'] if attributes[:'model_version']

      self.model_type = attributes[:'modelType'] if attributes[:'modelType']

      raise 'You cannot provide both :modelType and :model_type' if attributes.key?(:'modelType') && attributes.key?(:'model_type')

      self.model_type = attributes[:'model_type'] if attributes[:'model_type']

      self.name = attributes[:'name'] if attributes[:'name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.object_version = attributes[:'objectVersion'] if attributes[:'objectVersion']

      raise 'You cannot provide both :objectVersion and :object_version' if attributes.key?(:'objectVersion') && attributes.key?(:'object_version')

      self.object_version = attributes[:'object_version'] if attributes[:'object_version']

      self.object_status = attributes[:'objectStatus'] if attributes[:'objectStatus']

      raise 'You cannot provide both :objectStatus and :object_status' if attributes.key?(:'objectStatus') && attributes.key?(:'object_status')

      self.object_status = attributes[:'object_status'] if attributes[:'object_status']

      self.identifier = attributes[:'identifier'] if attributes[:'identifier']

      self.primary_schema = attributes[:'primarySchema'] if attributes[:'primarySchema']

      raise 'You cannot provide both :primarySchema and :primary_schema' if attributes.key?(:'primarySchema') && attributes.key?(:'primary_schema')

      self.primary_schema = attributes[:'primary_schema'] if attributes[:'primary_schema']

      self.connection_properties = attributes[:'connectionProperties'] if attributes[:'connectionProperties']

      raise 'You cannot provide both :connectionProperties and :connection_properties' if attributes.key?(:'connectionProperties') && attributes.key?(:'connection_properties')

      self.connection_properties = attributes[:'connection_properties'] if attributes[:'connection_properties']

      self.properties = attributes[:'properties'] if attributes[:'properties']

      self.type = attributes[:'type'] if attributes[:'type']

      self.is_default = attributes[:'isDefault'] unless attributes[:'isDefault'].nil?
      self.is_default = false if is_default.nil? && !attributes.key?(:'isDefault') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isDefault and :is_default' if attributes.key?(:'isDefault') && attributes.key?(:'is_default')

      self.is_default = attributes[:'is_default'] unless attributes[:'is_default'].nil?
      self.is_default = false if is_default.nil? && !attributes.key?(:'isDefault') && !attributes.key?(:'is_default') # rubocop:disable Style/StringLiterals

      self.metadata = attributes[:'metadata'] if attributes[:'metadata']

      self.registry_metadata = attributes[:'registryMetadata'] if attributes[:'registryMetadata']

      raise 'You cannot provide both :registryMetadata and :registry_metadata' if attributes.key?(:'registryMetadata') && attributes.key?(:'registry_metadata')

      self.registry_metadata = attributes[:'registry_metadata'] if attributes[:'registry_metadata']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        key == other.key &&
        model_version == other.model_version &&
        model_type == other.model_type &&
        name == other.name &&
        description == other.description &&
        object_version == other.object_version &&
        object_status == other.object_status &&
        identifier == other.identifier &&
        primary_schema == other.primary_schema &&
        connection_properties == other.connection_properties &&
        properties == other.properties &&
        type == other.type &&
        is_default == other.is_default &&
        metadata == other.metadata &&
        registry_metadata == other.registry_metadata
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
      [key, model_version, model_type, name, description, object_version, object_status, identifier, primary_schema, connection_properties, properties, type, is_default, metadata, registry_metadata].hash
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
