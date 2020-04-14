# Copyright (c) 2016, 2020, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Full data catalog type definition. Fully defines a type of the data catalog. All types are statically defined
  # in the system and are immutable. It isn't possible to create new types or update existing types via the API.
  #
  class DataCatalog::Models::Type
    # **[Required]** Unique type key that is immutable.
    # @return [String]
    attr_accessor :key

    # The immutable name of the type.
    # @return [String]
    attr_accessor :name

    # Detailed description of the type.
    # @return [String]
    attr_accessor :description

    # The data catalog's OCID.
    # @return [String]
    attr_accessor :catalog_id

    # A map of arrays which defines the type specific properties, both required and optional. The map keys are
    # category names and the values are arrays contiaing all property details. Every property is contained inside
    # of a category. Most types have required properties within the \"default\" category.
    # Example:
    # `{
    #    \"properties\": {
    #      \"default\": {
    #        \"attributes:\": [
    #          {
    #            \"name\": \"host\",
    #            \"type\": \"string\",
    #            \"isRequired\": true,
    #            \"isUpdatable\": false
    #          },
    #          ...
    #        ]
    #      }
    #    }
    #  }`
    #
    # @return [Hash<String, Array<OCI::DataCatalog::Models::PropertyDefinition>>]
    attr_accessor :properties

    # The current state of the type.
    # @return [String]
    attr_accessor :lifecycle_state

    # Indicates whether the type is internal, making it unavailable for use by metadata elements.
    # @return [BOOLEAN]
    attr_accessor :is_internal

    # Indicates whether the type can be used for tagging metadata elements.
    # @return [BOOLEAN]
    attr_accessor :is_tag

    # Indicates whether the type is approved for use as a classifying object.
    # @return [BOOLEAN]
    attr_accessor :is_approved

    # Indicates the category this type belongs to. For instance, data assets, connections.
    # @return [String]
    attr_accessor :type_category

    # Mapping type equivalence in the external system.
    # @return [String]
    attr_accessor :external_type_name

    # URI to the type instance in the API.
    # @return [String]
    attr_accessor :uri

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'key',
        'name': :'name',
        'description': :'description',
        'catalog_id': :'catalogId',
        'properties': :'properties',
        'lifecycle_state': :'lifecycleState',
        'is_internal': :'isInternal',
        'is_tag': :'isTag',
        'is_approved': :'isApproved',
        'type_category': :'typeCategory',
        'external_type_name': :'externalTypeName',
        'uri': :'uri'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'String',
        'name': :'String',
        'description': :'String',
        'catalog_id': :'String',
        'properties': :'Hash<String, Array<OCI::DataCatalog::Models::PropertyDefinition>>',
        'lifecycle_state': :'String',
        'is_internal': :'BOOLEAN',
        'is_tag': :'BOOLEAN',
        'is_approved': :'BOOLEAN',
        'type_category': :'String',
        'external_type_name': :'String',
        'uri': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :catalog_id The value to assign to the {#catalog_id} property
    # @option attributes [Hash<String, Array<OCI::DataCatalog::Models::PropertyDefinition>>] :properties The value to assign to the {#properties} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [BOOLEAN] :is_internal The value to assign to the {#is_internal} property
    # @option attributes [BOOLEAN] :is_tag The value to assign to the {#is_tag} property
    # @option attributes [BOOLEAN] :is_approved The value to assign to the {#is_approved} property
    # @option attributes [String] :type_category The value to assign to the {#type_category} property
    # @option attributes [String] :external_type_name The value to assign to the {#external_type_name} property
    # @option attributes [String] :uri The value to assign to the {#uri} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key = attributes[:'key'] if attributes[:'key']

      self.name = attributes[:'name'] if attributes[:'name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.catalog_id = attributes[:'catalogId'] if attributes[:'catalogId']

      raise 'You cannot provide both :catalogId and :catalog_id' if attributes.key?(:'catalogId') && attributes.key?(:'catalog_id')

      self.catalog_id = attributes[:'catalog_id'] if attributes[:'catalog_id']

      self.properties = attributes[:'properties'] if attributes[:'properties']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.is_internal = attributes[:'isInternal'] unless attributes[:'isInternal'].nil?

      raise 'You cannot provide both :isInternal and :is_internal' if attributes.key?(:'isInternal') && attributes.key?(:'is_internal')

      self.is_internal = attributes[:'is_internal'] unless attributes[:'is_internal'].nil?

      self.is_tag = attributes[:'isTag'] unless attributes[:'isTag'].nil?

      raise 'You cannot provide both :isTag and :is_tag' if attributes.key?(:'isTag') && attributes.key?(:'is_tag')

      self.is_tag = attributes[:'is_tag'] unless attributes[:'is_tag'].nil?

      self.is_approved = attributes[:'isApproved'] unless attributes[:'isApproved'].nil?

      raise 'You cannot provide both :isApproved and :is_approved' if attributes.key?(:'isApproved') && attributes.key?(:'is_approved')

      self.is_approved = attributes[:'is_approved'] unless attributes[:'is_approved'].nil?

      self.type_category = attributes[:'typeCategory'] if attributes[:'typeCategory']

      raise 'You cannot provide both :typeCategory and :type_category' if attributes.key?(:'typeCategory') && attributes.key?(:'type_category')

      self.type_category = attributes[:'type_category'] if attributes[:'type_category']

      self.external_type_name = attributes[:'externalTypeName'] if attributes[:'externalTypeName']

      raise 'You cannot provide both :externalTypeName and :external_type_name' if attributes.key?(:'externalTypeName') && attributes.key?(:'external_type_name')

      self.external_type_name = attributes[:'external_type_name'] if attributes[:'external_type_name']

      self.uri = attributes[:'uri'] if attributes[:'uri']
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
        name == other.name &&
        description == other.description &&
        catalog_id == other.catalog_id &&
        properties == other.properties &&
        lifecycle_state == other.lifecycle_state &&
        is_internal == other.is_internal &&
        is_tag == other.is_tag &&
        is_approved == other.is_approved &&
        type_category == other.type_category &&
        external_type_name == other.external_type_name &&
        uri == other.uri
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
      [key, name, description, catalog_id, properties, lifecycle_state, is_internal, is_tag, is_approved, type_category, external_type_name, uri].hash
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
