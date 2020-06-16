# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of an entity attribute. An attribute of a data entity describing an item of data,
  # with a name and data type. Synonymous with 'column' in a database.
  #
  class DataCatalog::Models::Attribute
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

    # State of the attribute.
    # @return [String]
    attr_accessor :lifecycle_state

    # The date and time the attribute was created, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    # Example: `2019-03-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The last time that any change was made to the attribute. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # OCID of the user who created this attribute in the data catalog.
    # @return [String]
    attr_accessor :created_by_id

    # OCID of the user who modified this attribute in the data catalog.
    # @return [String]
    attr_accessor :updated_by_id

    # Data type of the attribute as defined in the external system. Type mapping across systems can be achieved
    # through term associations across domains in the ontology. The attribute can also be tagged to the datatype in
    # the domain ontology to resolve any ambiguity arising from type name similarity that can occur with user
    # defined types.
    #
    # @return [String]
    attr_accessor :external_data_type

    # Unique external key of this attribute in the external source system.
    # @return [String]
    attr_accessor :external_key

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

    # Last modified timestamp of this object in the external system.
    # @return [DateTime]
    attr_accessor :time_external

    # URI to the attribute instance in the API.
    # @return [String]
    attr_accessor :uri

    # A map of maps that contains the properties which are specific to the attribute type. Each attribute type
    # definition defines it's set of required and optional properties. The map keys are category names and the
    # values are maps of property name to property value. Every property is contained inside of a category. Most
    # attributes have required properties within the \"default\" category.
    # Example: `{\"properties\": { \"default\": { \"key1\": \"value1\"}}}`
    #
    # @return [Hash<String, Hash<String, String>>]
    attr_accessor :properties

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'key',
        'display_name': :'displayName',
        'description': :'description',
        'entity_key': :'entityKey',
        'lifecycle_state': :'lifecycleState',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'created_by_id': :'createdById',
        'updated_by_id': :'updatedById',
        'external_data_type': :'externalDataType',
        'external_key': :'externalKey',
        'is_incremental_data': :'isIncrementalData',
        'is_nullable': :'isNullable',
        'length': :'length',
        'position': :'position',
        'precision': :'precision',
        'scale': :'scale',
        'time_external': :'timeExternal',
        'uri': :'uri',
        'properties': :'properties'
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
        'lifecycle_state': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'created_by_id': :'String',
        'updated_by_id': :'String',
        'external_data_type': :'String',
        'external_key': :'String',
        'is_incremental_data': :'BOOLEAN',
        'is_nullable': :'BOOLEAN',
        'length': :'Integer',
        'position': :'Integer',
        'precision': :'Integer',
        'scale': :'Integer',
        'time_external': :'DateTime',
        'uri': :'String',
        'properties': :'Hash<String, Hash<String, String>>'
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
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :created_by_id The value to assign to the {#created_by_id} property
    # @option attributes [String] :updated_by_id The value to assign to the {#updated_by_id} property
    # @option attributes [String] :external_data_type The value to assign to the {#external_data_type} property
    # @option attributes [String] :external_key The value to assign to the {#external_key} property
    # @option attributes [BOOLEAN] :is_incremental_data The value to assign to the {#is_incremental_data} property
    # @option attributes [BOOLEAN] :is_nullable The value to assign to the {#is_nullable} property
    # @option attributes [Integer] :length The value to assign to the {#length} property
    # @option attributes [Integer] :position The value to assign to the {#position} property
    # @option attributes [Integer] :precision The value to assign to the {#precision} property
    # @option attributes [Integer] :scale The value to assign to the {#scale} property
    # @option attributes [DateTime] :time_external The value to assign to the {#time_external} property
    # @option attributes [String] :uri The value to assign to the {#uri} property
    # @option attributes [Hash<String, Hash<String, String>>] :properties The value to assign to the {#properties} property
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

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.created_by_id = attributes[:'createdById'] if attributes[:'createdById']

      raise 'You cannot provide both :createdById and :created_by_id' if attributes.key?(:'createdById') && attributes.key?(:'created_by_id')

      self.created_by_id = attributes[:'created_by_id'] if attributes[:'created_by_id']

      self.updated_by_id = attributes[:'updatedById'] if attributes[:'updatedById']

      raise 'You cannot provide both :updatedById and :updated_by_id' if attributes.key?(:'updatedById') && attributes.key?(:'updated_by_id')

      self.updated_by_id = attributes[:'updated_by_id'] if attributes[:'updated_by_id']

      self.external_data_type = attributes[:'externalDataType'] if attributes[:'externalDataType']

      raise 'You cannot provide both :externalDataType and :external_data_type' if attributes.key?(:'externalDataType') && attributes.key?(:'external_data_type')

      self.external_data_type = attributes[:'external_data_type'] if attributes[:'external_data_type']

      self.external_key = attributes[:'externalKey'] if attributes[:'externalKey']

      raise 'You cannot provide both :externalKey and :external_key' if attributes.key?(:'externalKey') && attributes.key?(:'external_key')

      self.external_key = attributes[:'external_key'] if attributes[:'external_key']

      self.is_incremental_data = attributes[:'isIncrementalData'] unless attributes[:'isIncrementalData'].nil?

      raise 'You cannot provide both :isIncrementalData and :is_incremental_data' if attributes.key?(:'isIncrementalData') && attributes.key?(:'is_incremental_data')

      self.is_incremental_data = attributes[:'is_incremental_data'] unless attributes[:'is_incremental_data'].nil?

      self.is_nullable = attributes[:'isNullable'] unless attributes[:'isNullable'].nil?

      raise 'You cannot provide both :isNullable and :is_nullable' if attributes.key?(:'isNullable') && attributes.key?(:'is_nullable')

      self.is_nullable = attributes[:'is_nullable'] unless attributes[:'is_nullable'].nil?

      self.length = attributes[:'length'] if attributes[:'length']

      self.position = attributes[:'position'] if attributes[:'position']

      self.precision = attributes[:'precision'] if attributes[:'precision']

      self.scale = attributes[:'scale'] if attributes[:'scale']

      self.time_external = attributes[:'timeExternal'] if attributes[:'timeExternal']

      raise 'You cannot provide both :timeExternal and :time_external' if attributes.key?(:'timeExternal') && attributes.key?(:'time_external')

      self.time_external = attributes[:'time_external'] if attributes[:'time_external']

      self.uri = attributes[:'uri'] if attributes[:'uri']

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
        key == other.key &&
        display_name == other.display_name &&
        description == other.description &&
        entity_key == other.entity_key &&
        lifecycle_state == other.lifecycle_state &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        created_by_id == other.created_by_id &&
        updated_by_id == other.updated_by_id &&
        external_data_type == other.external_data_type &&
        external_key == other.external_key &&
        is_incremental_data == other.is_incremental_data &&
        is_nullable == other.is_nullable &&
        length == other.length &&
        position == other.position &&
        precision == other.precision &&
        scale == other.scale &&
        time_external == other.time_external &&
        uri == other.uri &&
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
      [key, display_name, description, entity_key, lifecycle_state, time_created, time_updated, created_by_id, updated_by_id, external_data_type, external_key, is_incremental_data, is_nullable, length, position, precision, scale, time_external, uri, properties].hash
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
