# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The data entity shape object.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class DataConnectivity::Models::CreateEntityShapeDetails
    MODEL_TYPE_ENUM = [
      MODEL_TYPE_VIEW_ENTITY = 'VIEW_ENTITY'.freeze,
      MODEL_TYPE_TABLE_ENTITY = 'TABLE_ENTITY'.freeze,
      MODEL_TYPE_FILE_ENTITY = 'FILE_ENTITY'.freeze,
      MODEL_TYPE_DATA_STORE_ENTITY = 'DATA_STORE_ENTITY'.freeze,
      MODEL_TYPE_SQL_ENTITY = 'SQL_ENTITY'.freeze
    ].freeze

    ENTITY_TYPE_ENUM = [
      ENTITY_TYPE_TABLE = 'TABLE'.freeze,
      ENTITY_TYPE_VIEW = 'VIEW'.freeze,
      ENTITY_TYPE_FILE = 'FILE'.freeze,
      ENTITY_TYPE_SQL = 'SQL'.freeze
    ].freeze

    # **[Required]** The data entity type.
    # @return [String]
    attr_reader :model_type

    # The object key.
    # @return [String]
    attr_accessor :key

    # The object's model version.
    # @return [String]
    attr_accessor :model_version

    # @return [OCI::DataConnectivity::Models::ParentReference]
    attr_accessor :parent_ref

    # **[Required]** Free form text without any restriction on permitted characters. Name can have letters, numbers, and special characters. The value is editable and is restricted to 1000 characters.
    # @return [String]
    attr_accessor :name

    # The version of the object that is used to track changes in the object instance.
    # @return [Integer]
    attr_accessor :object_version

    # The external key for the object.
    # @return [String]
    attr_accessor :external_key

    # @return [OCI::DataConnectivity::Models::Shape]
    attr_accessor :shape

    # The shape ID.
    # @return [String]
    attr_accessor :shape_id

    # The entity type.
    # @return [String]
    attr_reader :entity_type

    # Specifies other type label.
    # @return [String]
    attr_accessor :other_type_label

    # An array of unique keys.
    # @return [Array<OCI::DataConnectivity::Models::UniqueKey>]
    attr_accessor :unique_keys

    # An array of foreign keys.
    # @return [Array<OCI::DataConnectivity::Models::ForeignKey>]
    attr_accessor :foreign_keys

    # The resource name.
    # @return [String]
    attr_accessor :resource_name

    # The status of an object that can be set to value 1 for shallow references across objects, other values reserved.
    # @return [Integer]
    attr_accessor :object_status

    # Value can only contain upper case letters, underscore, and numbers. It should begin with upper case letter or underscore. The value can be modified.
    # @return [String]
    attr_accessor :identifier

    # @return [OCI::DataConnectivity::Models::TypeLibrary]
    attr_accessor :types

    # Map<String, String> for entity properties
    # @return [Hash<String, String>]
    attr_accessor :entity_properties

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'modelType',
        'key': :'key',
        'model_version': :'modelVersion',
        'parent_ref': :'parentRef',
        'name': :'name',
        'object_version': :'objectVersion',
        'external_key': :'externalKey',
        'shape': :'shape',
        'shape_id': :'shapeId',
        'entity_type': :'entityType',
        'other_type_label': :'otherTypeLabel',
        'unique_keys': :'uniqueKeys',
        'foreign_keys': :'foreignKeys',
        'resource_name': :'resourceName',
        'object_status': :'objectStatus',
        'identifier': :'identifier',
        'types': :'types',
        'entity_properties': :'entityProperties'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'String',
        'key': :'String',
        'model_version': :'String',
        'parent_ref': :'OCI::DataConnectivity::Models::ParentReference',
        'name': :'String',
        'object_version': :'Integer',
        'external_key': :'String',
        'shape': :'OCI::DataConnectivity::Models::Shape',
        'shape_id': :'String',
        'entity_type': :'String',
        'other_type_label': :'String',
        'unique_keys': :'Array<OCI::DataConnectivity::Models::UniqueKey>',
        'foreign_keys': :'Array<OCI::DataConnectivity::Models::ForeignKey>',
        'resource_name': :'String',
        'object_status': :'Integer',
        'identifier': :'String',
        'types': :'OCI::DataConnectivity::Models::TypeLibrary',
        'entity_properties': :'Hash<String, String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'modelType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::DataConnectivity::Models::CreateEntityShapeFromDataStore' if type == 'DATA_STORE_ENTITY'
      return 'OCI::DataConnectivity::Models::CreateEntityShapeFromTable' if type == 'TABLE_ENTITY'
      return 'OCI::DataConnectivity::Models::CreateEntityShapeFromSQL' if type == 'SQL_ENTITY'
      return 'OCI::DataConnectivity::Models::CreateEntityShapeFromFile' if type == 'FILE_ENTITY'
      return 'OCI::DataConnectivity::Models::CreateEntityShapeFromView' if type == 'VIEW_ENTITY'

      # TODO: Log a warning when the subtype is not found.
      'OCI::DataConnectivity::Models::CreateEntityShapeDetails'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :model_type The value to assign to the {#model_type} property
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :model_version The value to assign to the {#model_version} property
    # @option attributes [OCI::DataConnectivity::Models::ParentReference] :parent_ref The value to assign to the {#parent_ref} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [Integer] :object_version The value to assign to the {#object_version} property
    # @option attributes [String] :external_key The value to assign to the {#external_key} property
    # @option attributes [OCI::DataConnectivity::Models::Shape] :shape The value to assign to the {#shape} property
    # @option attributes [String] :shape_id The value to assign to the {#shape_id} property
    # @option attributes [String] :entity_type The value to assign to the {#entity_type} property
    # @option attributes [String] :other_type_label The value to assign to the {#other_type_label} property
    # @option attributes [Array<OCI::DataConnectivity::Models::UniqueKey>] :unique_keys The value to assign to the {#unique_keys} property
    # @option attributes [Array<OCI::DataConnectivity::Models::ForeignKey>] :foreign_keys The value to assign to the {#foreign_keys} property
    # @option attributes [String] :resource_name The value to assign to the {#resource_name} property
    # @option attributes [Integer] :object_status The value to assign to the {#object_status} property
    # @option attributes [String] :identifier The value to assign to the {#identifier} property
    # @option attributes [OCI::DataConnectivity::Models::TypeLibrary] :types The value to assign to the {#types} property
    # @option attributes [Hash<String, String>] :entity_properties The value to assign to the {#entity_properties} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.model_type = attributes[:'modelType'] if attributes[:'modelType']

      raise 'You cannot provide both :modelType and :model_type' if attributes.key?(:'modelType') && attributes.key?(:'model_type')

      self.model_type = attributes[:'model_type'] if attributes[:'model_type']

      self.key = attributes[:'key'] if attributes[:'key']

      self.model_version = attributes[:'modelVersion'] if attributes[:'modelVersion']

      raise 'You cannot provide both :modelVersion and :model_version' if attributes.key?(:'modelVersion') && attributes.key?(:'model_version')

      self.model_version = attributes[:'model_version'] if attributes[:'model_version']

      self.parent_ref = attributes[:'parentRef'] if attributes[:'parentRef']

      raise 'You cannot provide both :parentRef and :parent_ref' if attributes.key?(:'parentRef') && attributes.key?(:'parent_ref')

      self.parent_ref = attributes[:'parent_ref'] if attributes[:'parent_ref']

      self.name = attributes[:'name'] if attributes[:'name']

      self.object_version = attributes[:'objectVersion'] if attributes[:'objectVersion']

      raise 'You cannot provide both :objectVersion and :object_version' if attributes.key?(:'objectVersion') && attributes.key?(:'object_version')

      self.object_version = attributes[:'object_version'] if attributes[:'object_version']

      self.external_key = attributes[:'externalKey'] if attributes[:'externalKey']

      raise 'You cannot provide both :externalKey and :external_key' if attributes.key?(:'externalKey') && attributes.key?(:'external_key')

      self.external_key = attributes[:'external_key'] if attributes[:'external_key']

      self.shape = attributes[:'shape'] if attributes[:'shape']

      self.shape_id = attributes[:'shapeId'] if attributes[:'shapeId']

      raise 'You cannot provide both :shapeId and :shape_id' if attributes.key?(:'shapeId') && attributes.key?(:'shape_id')

      self.shape_id = attributes[:'shape_id'] if attributes[:'shape_id']

      self.entity_type = attributes[:'entityType'] if attributes[:'entityType']

      raise 'You cannot provide both :entityType and :entity_type' if attributes.key?(:'entityType') && attributes.key?(:'entity_type')

      self.entity_type = attributes[:'entity_type'] if attributes[:'entity_type']

      self.other_type_label = attributes[:'otherTypeLabel'] if attributes[:'otherTypeLabel']

      raise 'You cannot provide both :otherTypeLabel and :other_type_label' if attributes.key?(:'otherTypeLabel') && attributes.key?(:'other_type_label')

      self.other_type_label = attributes[:'other_type_label'] if attributes[:'other_type_label']

      self.unique_keys = attributes[:'uniqueKeys'] if attributes[:'uniqueKeys']

      raise 'You cannot provide both :uniqueKeys and :unique_keys' if attributes.key?(:'uniqueKeys') && attributes.key?(:'unique_keys')

      self.unique_keys = attributes[:'unique_keys'] if attributes[:'unique_keys']

      self.foreign_keys = attributes[:'foreignKeys'] if attributes[:'foreignKeys']

      raise 'You cannot provide both :foreignKeys and :foreign_keys' if attributes.key?(:'foreignKeys') && attributes.key?(:'foreign_keys')

      self.foreign_keys = attributes[:'foreign_keys'] if attributes[:'foreign_keys']

      self.resource_name = attributes[:'resourceName'] if attributes[:'resourceName']

      raise 'You cannot provide both :resourceName and :resource_name' if attributes.key?(:'resourceName') && attributes.key?(:'resource_name')

      self.resource_name = attributes[:'resource_name'] if attributes[:'resource_name']

      self.object_status = attributes[:'objectStatus'] if attributes[:'objectStatus']

      raise 'You cannot provide both :objectStatus and :object_status' if attributes.key?(:'objectStatus') && attributes.key?(:'object_status')

      self.object_status = attributes[:'object_status'] if attributes[:'object_status']

      self.identifier = attributes[:'identifier'] if attributes[:'identifier']

      self.types = attributes[:'types'] if attributes[:'types']

      self.entity_properties = attributes[:'entityProperties'] if attributes[:'entityProperties']

      raise 'You cannot provide both :entityProperties and :entity_properties' if attributes.key?(:'entityProperties') && attributes.key?(:'entity_properties')

      self.entity_properties = attributes[:'entity_properties'] if attributes[:'entity_properties']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] model_type Object to be assigned
    def model_type=(model_type)
      raise "Invalid value for 'model_type': this must be one of the values in MODEL_TYPE_ENUM." if model_type && !MODEL_TYPE_ENUM.include?(model_type)

      @model_type = model_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] entity_type Object to be assigned
    def entity_type=(entity_type)
      raise "Invalid value for 'entity_type': this must be one of the values in ENTITY_TYPE_ENUM." if entity_type && !ENTITY_TYPE_ENUM.include?(entity_type)

      @entity_type = entity_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        model_type == other.model_type &&
        key == other.key &&
        model_version == other.model_version &&
        parent_ref == other.parent_ref &&
        name == other.name &&
        object_version == other.object_version &&
        external_key == other.external_key &&
        shape == other.shape &&
        shape_id == other.shape_id &&
        entity_type == other.entity_type &&
        other_type_label == other.other_type_label &&
        unique_keys == other.unique_keys &&
        foreign_keys == other.foreign_keys &&
        resource_name == other.resource_name &&
        object_status == other.object_status &&
        identifier == other.identifier &&
        types == other.types &&
        entity_properties == other.entity_properties
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
      [model_type, key, model_version, parent_ref, name, object_version, external_key, shape, shape_id, entity_type, other_type_label, unique_keys, foreign_keys, resource_name, object_status, identifier, types, entity_properties].hash
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
