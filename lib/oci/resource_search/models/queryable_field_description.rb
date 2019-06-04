# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An individual field that can be used as part of a query filter.
  class ResourceSearch::Models::QueryableFieldDescription
    FIELD_TYPE_ENUM = [
      FIELD_TYPE_IDENTIFIER = 'IDENTIFIER'.freeze,
      FIELD_TYPE_STRING = 'STRING'.freeze,
      FIELD_TYPE_INTEGER = 'INTEGER'.freeze,
      FIELD_TYPE_RATIONAL = 'RATIONAL'.freeze,
      FIELD_TYPE_BOOLEAN = 'BOOLEAN'.freeze,
      FIELD_TYPE_DATETIME = 'DATETIME'.freeze,
      FIELD_TYPE_IP = 'IP'.freeze,
      FIELD_TYPE_OBJECT = 'OBJECT'.freeze,
      FIELD_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The type of the field, which dictates what semantics and query constraints you can use when searching or querying.
    #
    # @return [String]
    attr_reader :field_type

    # **[Required]** The name of the field to use when constructing the query. Field names are present for all types except `OBJECT`.
    #
    # @return [String]
    attr_accessor :field_name

    # Indicates this field is actually an array of the specified field type.
    #
    # @return [BOOLEAN]
    attr_accessor :is_array

    # If the field type is `OBJECT`, then this property will provide all the individual properties on the object that can
    # be queried.
    #
    # @return [Array<OCI::ResourceSearch::Models::QueryableFieldDescription>]
    attr_accessor :object_properties

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'field_type': :'fieldType',
        'field_name': :'fieldName',
        'is_array': :'isArray',
        'object_properties': :'objectProperties'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'field_type': :'String',
        'field_name': :'String',
        'is_array': :'BOOLEAN',
        'object_properties': :'Array<OCI::ResourceSearch::Models::QueryableFieldDescription>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :field_type The value to assign to the {#field_type} property
    # @option attributes [String] :field_name The value to assign to the {#field_name} property
    # @option attributes [BOOLEAN] :is_array The value to assign to the {#is_array} property
    # @option attributes [Array<OCI::ResourceSearch::Models::QueryableFieldDescription>] :object_properties The value to assign to the {#object_properties} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.field_type = attributes[:'fieldType'] if attributes[:'fieldType']

      raise 'You cannot provide both :fieldType and :field_type' if attributes.key?(:'fieldType') && attributes.key?(:'field_type')

      self.field_type = attributes[:'field_type'] if attributes[:'field_type']

      self.field_name = attributes[:'fieldName'] if attributes[:'fieldName']

      raise 'You cannot provide both :fieldName and :field_name' if attributes.key?(:'fieldName') && attributes.key?(:'field_name')

      self.field_name = attributes[:'field_name'] if attributes[:'field_name']

      self.is_array = attributes[:'isArray'] unless attributes[:'isArray'].nil?

      raise 'You cannot provide both :isArray and :is_array' if attributes.key?(:'isArray') && attributes.key?(:'is_array')

      self.is_array = attributes[:'is_array'] unless attributes[:'is_array'].nil?

      self.object_properties = attributes[:'objectProperties'] if attributes[:'objectProperties']

      raise 'You cannot provide both :objectProperties and :object_properties' if attributes.key?(:'objectProperties') && attributes.key?(:'object_properties')

      self.object_properties = attributes[:'object_properties'] if attributes[:'object_properties']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] field_type Object to be assigned
    def field_type=(field_type)
      # rubocop:disable Style/ConditionalAssignment
      if field_type && !FIELD_TYPE_ENUM.include?(field_type)
        OCI.logger.debug("Unknown value for 'field_type' [" + field_type + "]. Mapping to 'FIELD_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @field_type = FIELD_TYPE_UNKNOWN_ENUM_VALUE
      else
        @field_type = field_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        field_type == other.field_type &&
        field_name == other.field_name &&
        is_array == other.is_array &&
        object_properties == other.object_properties
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
      [field_type, field_name, is_array, object_properties].hash
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
