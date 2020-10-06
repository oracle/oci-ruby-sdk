# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of an entity attribute.
  class DataCatalog::Models::AttributeSummary
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_MOVING = 'MOVING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Unique attribute key that is immutable.
    # @return [String]
    attr_accessor :key

    # A user-friendly display name. Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # Detailed description of the attribute.
    # @return [String]
    attr_accessor :description

    # The unique key of the parent entity.
    # @return [String]
    attr_accessor :entity_key

    # Unique external key of this attribute in the external source system.
    # @return [String]
    attr_accessor :external_key

    # Max allowed length of the attribute value.
    # @return [Integer]
    attr_accessor :length

    # Property that identifies if this attribute can be assigned null values.
    # @return [BOOLEAN]
    attr_accessor :is_nullable

    # URI to the attribute instance in the API.
    # @return [String]
    attr_accessor :uri

    # State of the attribute.
    # @return [String]
    attr_reader :lifecycle_state

    # The date and time the attribute was created, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    # Example: `2019-03-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # Data type of the attribute as defined in the external source system.
    # @return [String]
    attr_accessor :external_data_type

    # The minimum count for the number of instances of a given type stored in this collection type attribute,applicable if this attribute is a complex type.
    # @return [Integer]
    attr_accessor :min_collection_count

    # The maximum count for the number of instances of a given type stored in this collection type attribute,applicable if this attribute is a complex type.
    # For type specifications in systems that specify only \"capacity\" without upper or lower bound , this property can also be used to just mean \"capacity\".
    # Some examples are Varray size in Oracle , Occurs Clause in Cobol , capacity in XmlSchemaObjectCollection , maxOccurs in  Xml , maxItems in Json
    #
    # @return [Integer]
    attr_accessor :max_collection_count

    # Entity key that represents the datatype of this attribute , applicable if this attribute is a complex type.
    # @return [String]
    attr_accessor :datatype_entity_key

    # External entity key that represents the datatype of this attribute , applicable if this attribute is a complex type.
    # @return [String]
    attr_accessor :external_datatype_entity_key

    # Attribute key that represents the parent attribute of this attribute , applicable if the parent attribute is of complex datatype.
    # @return [String]
    attr_accessor :parent_attribute_key

    # External attribute key that represents the parent attribute  of this attribute , applicable if the parent attribute is of complex type.
    # @return [String]
    attr_accessor :external_parent_attribute_key

    # Full path of the attribute.
    # @return [String]
    attr_accessor :path

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'key',
        'display_name': :'displayName',
        'description': :'description',
        'entity_key': :'entityKey',
        'external_key': :'externalKey',
        'length': :'length',
        'is_nullable': :'isNullable',
        'uri': :'uri',
        'lifecycle_state': :'lifecycleState',
        'time_created': :'timeCreated',
        'external_data_type': :'externalDataType',
        'min_collection_count': :'minCollectionCount',
        'max_collection_count': :'maxCollectionCount',
        'datatype_entity_key': :'datatypeEntityKey',
        'external_datatype_entity_key': :'externalDatatypeEntityKey',
        'parent_attribute_key': :'parentAttributeKey',
        'external_parent_attribute_key': :'externalParentAttributeKey',
        'path': :'path'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'String',
        'display_name': :'String',
        'description': :'String',
        'entity_key': :'String',
        'external_key': :'String',
        'length': :'Integer',
        'is_nullable': :'BOOLEAN',
        'uri': :'String',
        'lifecycle_state': :'String',
        'time_created': :'DateTime',
        'external_data_type': :'String',
        'min_collection_count': :'Integer',
        'max_collection_count': :'Integer',
        'datatype_entity_key': :'String',
        'external_datatype_entity_key': :'String',
        'parent_attribute_key': :'String',
        'external_parent_attribute_key': :'String',
        'path': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :entity_key The value to assign to the {#entity_key} property
    # @option attributes [String] :external_key The value to assign to the {#external_key} property
    # @option attributes [Integer] :length The value to assign to the {#length} property
    # @option attributes [BOOLEAN] :is_nullable The value to assign to the {#is_nullable} property
    # @option attributes [String] :uri The value to assign to the {#uri} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :external_data_type The value to assign to the {#external_data_type} property
    # @option attributes [Integer] :min_collection_count The value to assign to the {#min_collection_count} property
    # @option attributes [Integer] :max_collection_count The value to assign to the {#max_collection_count} property
    # @option attributes [String] :datatype_entity_key The value to assign to the {#datatype_entity_key} property
    # @option attributes [String] :external_datatype_entity_key The value to assign to the {#external_datatype_entity_key} property
    # @option attributes [String] :parent_attribute_key The value to assign to the {#parent_attribute_key} property
    # @option attributes [String] :external_parent_attribute_key The value to assign to the {#external_parent_attribute_key} property
    # @option attributes [String] :path The value to assign to the {#path} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key = attributes[:'key'] if attributes[:'key']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.entity_key = attributes[:'entityKey'] if attributes[:'entityKey']

      raise 'You cannot provide both :entityKey and :entity_key' if attributes.key?(:'entityKey') && attributes.key?(:'entity_key')

      self.entity_key = attributes[:'entity_key'] if attributes[:'entity_key']

      self.external_key = attributes[:'externalKey'] if attributes[:'externalKey']

      raise 'You cannot provide both :externalKey and :external_key' if attributes.key?(:'externalKey') && attributes.key?(:'external_key')

      self.external_key = attributes[:'external_key'] if attributes[:'external_key']

      self.length = attributes[:'length'] if attributes[:'length']

      self.is_nullable = attributes[:'isNullable'] unless attributes[:'isNullable'].nil?

      raise 'You cannot provide both :isNullable and :is_nullable' if attributes.key?(:'isNullable') && attributes.key?(:'is_nullable')

      self.is_nullable = attributes[:'is_nullable'] unless attributes[:'is_nullable'].nil?

      self.uri = attributes[:'uri'] if attributes[:'uri']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.external_data_type = attributes[:'externalDataType'] if attributes[:'externalDataType']

      raise 'You cannot provide both :externalDataType and :external_data_type' if attributes.key?(:'externalDataType') && attributes.key?(:'external_data_type')

      self.external_data_type = attributes[:'external_data_type'] if attributes[:'external_data_type']

      self.min_collection_count = attributes[:'minCollectionCount'] if attributes[:'minCollectionCount']

      raise 'You cannot provide both :minCollectionCount and :min_collection_count' if attributes.key?(:'minCollectionCount') && attributes.key?(:'min_collection_count')

      self.min_collection_count = attributes[:'min_collection_count'] if attributes[:'min_collection_count']

      self.max_collection_count = attributes[:'maxCollectionCount'] if attributes[:'maxCollectionCount']

      raise 'You cannot provide both :maxCollectionCount and :max_collection_count' if attributes.key?(:'maxCollectionCount') && attributes.key?(:'max_collection_count')

      self.max_collection_count = attributes[:'max_collection_count'] if attributes[:'max_collection_count']

      self.datatype_entity_key = attributes[:'datatypeEntityKey'] if attributes[:'datatypeEntityKey']

      raise 'You cannot provide both :datatypeEntityKey and :datatype_entity_key' if attributes.key?(:'datatypeEntityKey') && attributes.key?(:'datatype_entity_key')

      self.datatype_entity_key = attributes[:'datatype_entity_key'] if attributes[:'datatype_entity_key']

      self.external_datatype_entity_key = attributes[:'externalDatatypeEntityKey'] if attributes[:'externalDatatypeEntityKey']

      raise 'You cannot provide both :externalDatatypeEntityKey and :external_datatype_entity_key' if attributes.key?(:'externalDatatypeEntityKey') && attributes.key?(:'external_datatype_entity_key')

      self.external_datatype_entity_key = attributes[:'external_datatype_entity_key'] if attributes[:'external_datatype_entity_key']

      self.parent_attribute_key = attributes[:'parentAttributeKey'] if attributes[:'parentAttributeKey']

      raise 'You cannot provide both :parentAttributeKey and :parent_attribute_key' if attributes.key?(:'parentAttributeKey') && attributes.key?(:'parent_attribute_key')

      self.parent_attribute_key = attributes[:'parent_attribute_key'] if attributes[:'parent_attribute_key']

      self.external_parent_attribute_key = attributes[:'externalParentAttributeKey'] if attributes[:'externalParentAttributeKey']

      raise 'You cannot provide both :externalParentAttributeKey and :external_parent_attribute_key' if attributes.key?(:'externalParentAttributeKey') && attributes.key?(:'external_parent_attribute_key')

      self.external_parent_attribute_key = attributes[:'external_parent_attribute_key'] if attributes[:'external_parent_attribute_key']

      self.path = attributes[:'path'] if attributes[:'path']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        key == other.key &&
        display_name == other.display_name &&
        description == other.description &&
        entity_key == other.entity_key &&
        external_key == other.external_key &&
        length == other.length &&
        is_nullable == other.is_nullable &&
        uri == other.uri &&
        lifecycle_state == other.lifecycle_state &&
        time_created == other.time_created &&
        external_data_type == other.external_data_type &&
        min_collection_count == other.min_collection_count &&
        max_collection_count == other.max_collection_count &&
        datatype_entity_key == other.datatype_entity_key &&
        external_datatype_entity_key == other.external_datatype_entity_key &&
        parent_attribute_key == other.parent_attribute_key &&
        external_parent_attribute_key == other.external_parent_attribute_key &&
        path == other.path
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
      [key, display_name, description, entity_key, external_key, length, is_nullable, uri, lifecycle_state, time_created, external_data_type, min_collection_count, max_collection_count, datatype_entity_key, external_datatype_entity_key, parent_attribute_key, external_parent_attribute_key, path].hash
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
