# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Properties used in attribute create operations.
  class DataCatalog::Models::CreateAttributeDetails
    # **[Required]** A user-friendly display name. Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # Optional user friendly business name of the attribute. If set, this supplements the harvested display name of the object.
    # @return [String]
    attr_accessor :business_name

    # Detailed description of the attribute.
    # @return [String]
    attr_accessor :description

    # **[Required]** Data type of the attribute as defined in the external system.
    # @return [String]
    attr_accessor :external_data_type

    # Property that identifies if this attribute can be used as a watermark to extract incremental data.
    # @return [BOOLEAN]
    attr_accessor :is_incremental_data

    # Property that identifies if this attribute can be assigned null values.
    # @return [BOOLEAN]
    attr_accessor :is_nullable

    # Max allowed length of the attribute value.
    # @return [Integer]
    attr_accessor :length

    # Position of the attribute in the record definition.
    # @return [Integer]
    attr_accessor :position

    # Precision of the attribute value usually applies to float data type.
    # @return [Integer]
    attr_accessor :precision

    # Scale of the attribute value usually applies to float data type.
    # @return [Integer]
    attr_accessor :scale

    # **[Required]** Last modified timestamp of this object in the external system.
    # @return [DateTime]
    attr_accessor :time_external

    # The minimum count for the number of instances of a given type stored in this collection type attribute,applicable if this attribute is a complex type.
    # @return [Integer]
    attr_accessor :min_collection_count

    # The maximum count for the number of instances of a given type stored in this collection type attribute,applicable if this attribute is a complex type.
    # For type specifications in systems that specify only \"capacity\" without upper or lower bound , this property can also be used to just mean \"capacity\".
    # Some examples are Varray size in Oracle , Occurs Clause in Cobol , capacity in XmlSchemaObjectCollection , maxOccurs in  Xml , maxItems in Json
    #
    # @return [Integer]
    attr_accessor :max_collection_count

    # External entity key that represents the datatype of this attribute , applicable if this attribute is a complex type.
    # @return [String]
    attr_accessor :external_datatype_entity_key

    # External attribute key that represents the parent attribute  of this attribute , applicable if the parent attribute is of complex type.
    # @return [String]
    attr_accessor :external_parent_attribute_key

    # The list of customized properties along with the values for this object
    # @return [Array<OCI::DataCatalog::Models::CustomPropertySetUsage>]
    attr_accessor :custom_property_members

    # Type key of the object. Type keys can be found via the '/types' endpoint.
    # @return [String]
    attr_accessor :type_key

    # A map of maps that contains the properties which are specific to the attribute type. Each attribute type
    # definition defines it's set of required and optional properties. The map keys are category names and the
    # values are maps of property name to property value. Every property is contained inside of a category. Most
    # attributes have required properties within the \"default\" category. To determine the set of required and
    # optional properties for an attribute type, a query can be done on '/types?type=attribute' that returns a
    # collection of all attribute types. The appropriate attribute type, which will include definitions of all
    # of it's properties, can be identified from this collection.
    # Example: `{\"properties\": { \"default\": { \"key1\": \"value1\"}}}`
    #
    # @return [Hash<String, Hash<String, String>>]
    attr_accessor :properties

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'business_name': :'businessName',
        'description': :'description',
        'external_data_type': :'externalDataType',
        'is_incremental_data': :'isIncrementalData',
        'is_nullable': :'isNullable',
        'length': :'length',
        'position': :'position',
        'precision': :'precision',
        'scale': :'scale',
        'time_external': :'timeExternal',
        'min_collection_count': :'minCollectionCount',
        'max_collection_count': :'maxCollectionCount',
        'external_datatype_entity_key': :'externalDatatypeEntityKey',
        'external_parent_attribute_key': :'externalParentAttributeKey',
        'custom_property_members': :'customPropertyMembers',
        'type_key': :'typeKey',
        'properties': :'properties'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'business_name': :'String',
        'description': :'String',
        'external_data_type': :'String',
        'is_incremental_data': :'BOOLEAN',
        'is_nullable': :'BOOLEAN',
        'length': :'Integer',
        'position': :'Integer',
        'precision': :'Integer',
        'scale': :'Integer',
        'time_external': :'DateTime',
        'min_collection_count': :'Integer',
        'max_collection_count': :'Integer',
        'external_datatype_entity_key': :'String',
        'external_parent_attribute_key': :'String',
        'custom_property_members': :'Array<OCI::DataCatalog::Models::CustomPropertySetUsage>',
        'type_key': :'String',
        'properties': :'Hash<String, Hash<String, String>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :business_name The value to assign to the {#business_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :external_data_type The value to assign to the {#external_data_type} property
    # @option attributes [BOOLEAN] :is_incremental_data The value to assign to the {#is_incremental_data} property
    # @option attributes [BOOLEAN] :is_nullable The value to assign to the {#is_nullable} property
    # @option attributes [Integer] :length The value to assign to the {#length} property
    # @option attributes [Integer] :position The value to assign to the {#position} property
    # @option attributes [Integer] :precision The value to assign to the {#precision} property
    # @option attributes [Integer] :scale The value to assign to the {#scale} property
    # @option attributes [DateTime] :time_external The value to assign to the {#time_external} property
    # @option attributes [Integer] :min_collection_count The value to assign to the {#min_collection_count} property
    # @option attributes [Integer] :max_collection_count The value to assign to the {#max_collection_count} property
    # @option attributes [String] :external_datatype_entity_key The value to assign to the {#external_datatype_entity_key} property
    # @option attributes [String] :external_parent_attribute_key The value to assign to the {#external_parent_attribute_key} property
    # @option attributes [Array<OCI::DataCatalog::Models::CustomPropertySetUsage>] :custom_property_members The value to assign to the {#custom_property_members} property
    # @option attributes [String] :type_key The value to assign to the {#type_key} property
    # @option attributes [Hash<String, Hash<String, String>>] :properties The value to assign to the {#properties} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.business_name = attributes[:'businessName'] if attributes[:'businessName']

      raise 'You cannot provide both :businessName and :business_name' if attributes.key?(:'businessName') && attributes.key?(:'business_name')

      self.business_name = attributes[:'business_name'] if attributes[:'business_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.external_data_type = attributes[:'externalDataType'] if attributes[:'externalDataType']

      raise 'You cannot provide both :externalDataType and :external_data_type' if attributes.key?(:'externalDataType') && attributes.key?(:'external_data_type')

      self.external_data_type = attributes[:'external_data_type'] if attributes[:'external_data_type']

      self.is_incremental_data = attributes[:'isIncrementalData'] unless attributes[:'isIncrementalData'].nil?
      self.is_incremental_data = false if is_incremental_data.nil? && !attributes.key?(:'isIncrementalData') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isIncrementalData and :is_incremental_data' if attributes.key?(:'isIncrementalData') && attributes.key?(:'is_incremental_data')

      self.is_incremental_data = attributes[:'is_incremental_data'] unless attributes[:'is_incremental_data'].nil?
      self.is_incremental_data = false if is_incremental_data.nil? && !attributes.key?(:'isIncrementalData') && !attributes.key?(:'is_incremental_data') # rubocop:disable Style/StringLiterals

      self.is_nullable = attributes[:'isNullable'] unless attributes[:'isNullable'].nil?
      self.is_nullable = false if is_nullable.nil? && !attributes.key?(:'isNullable') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isNullable and :is_nullable' if attributes.key?(:'isNullable') && attributes.key?(:'is_nullable')

      self.is_nullable = attributes[:'is_nullable'] unless attributes[:'is_nullable'].nil?
      self.is_nullable = false if is_nullable.nil? && !attributes.key?(:'isNullable') && !attributes.key?(:'is_nullable') # rubocop:disable Style/StringLiterals

      self.length = attributes[:'length'] if attributes[:'length']

      self.position = attributes[:'position'] if attributes[:'position']

      self.precision = attributes[:'precision'] if attributes[:'precision']

      self.scale = attributes[:'scale'] if attributes[:'scale']

      self.time_external = attributes[:'timeExternal'] if attributes[:'timeExternal']

      raise 'You cannot provide both :timeExternal and :time_external' if attributes.key?(:'timeExternal') && attributes.key?(:'time_external')

      self.time_external = attributes[:'time_external'] if attributes[:'time_external']

      self.min_collection_count = attributes[:'minCollectionCount'] if attributes[:'minCollectionCount']

      raise 'You cannot provide both :minCollectionCount and :min_collection_count' if attributes.key?(:'minCollectionCount') && attributes.key?(:'min_collection_count')

      self.min_collection_count = attributes[:'min_collection_count'] if attributes[:'min_collection_count']

      self.max_collection_count = attributes[:'maxCollectionCount'] if attributes[:'maxCollectionCount']

      raise 'You cannot provide both :maxCollectionCount and :max_collection_count' if attributes.key?(:'maxCollectionCount') && attributes.key?(:'max_collection_count')

      self.max_collection_count = attributes[:'max_collection_count'] if attributes[:'max_collection_count']

      self.external_datatype_entity_key = attributes[:'externalDatatypeEntityKey'] if attributes[:'externalDatatypeEntityKey']

      raise 'You cannot provide both :externalDatatypeEntityKey and :external_datatype_entity_key' if attributes.key?(:'externalDatatypeEntityKey') && attributes.key?(:'external_datatype_entity_key')

      self.external_datatype_entity_key = attributes[:'external_datatype_entity_key'] if attributes[:'external_datatype_entity_key']

      self.external_parent_attribute_key = attributes[:'externalParentAttributeKey'] if attributes[:'externalParentAttributeKey']

      raise 'You cannot provide both :externalParentAttributeKey and :external_parent_attribute_key' if attributes.key?(:'externalParentAttributeKey') && attributes.key?(:'external_parent_attribute_key')

      self.external_parent_attribute_key = attributes[:'external_parent_attribute_key'] if attributes[:'external_parent_attribute_key']

      self.custom_property_members = attributes[:'customPropertyMembers'] if attributes[:'customPropertyMembers']

      raise 'You cannot provide both :customPropertyMembers and :custom_property_members' if attributes.key?(:'customPropertyMembers') && attributes.key?(:'custom_property_members')

      self.custom_property_members = attributes[:'custom_property_members'] if attributes[:'custom_property_members']

      self.type_key = attributes[:'typeKey'] if attributes[:'typeKey']

      raise 'You cannot provide both :typeKey and :type_key' if attributes.key?(:'typeKey') && attributes.key?(:'type_key')

      self.type_key = attributes[:'type_key'] if attributes[:'type_key']

      self.properties = attributes[:'properties'] if attributes[:'properties']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        business_name == other.business_name &&
        description == other.description &&
        external_data_type == other.external_data_type &&
        is_incremental_data == other.is_incremental_data &&
        is_nullable == other.is_nullable &&
        length == other.length &&
        position == other.position &&
        precision == other.precision &&
        scale == other.scale &&
        time_external == other.time_external &&
        min_collection_count == other.min_collection_count &&
        max_collection_count == other.max_collection_count &&
        external_datatype_entity_key == other.external_datatype_entity_key &&
        external_parent_attribute_key == other.external_parent_attribute_key &&
        custom_property_members == other.custom_property_members &&
        type_key == other.type_key &&
        properties == other.properties
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
      [display_name, business_name, description, external_data_type, is_incremental_data, is_nullable, length, position, precision, scale, time_external, min_collection_count, max_collection_count, external_datatype_entity_key, external_parent_attribute_key, custom_property_members, type_key, properties].hash
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
