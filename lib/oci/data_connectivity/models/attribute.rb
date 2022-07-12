# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Registry Attribute Object, to get connector details
  class DataConnectivity::Models::Attribute
    # **[Required]** The name of of the Attribute.
    # @return [String]
    attr_accessor :name

    # True if Attribute is sensitive.
    # @return [BOOLEAN]
    attr_accessor :is_sensitive

    # True if Attribute is mandatory.
    # @return [BOOLEAN]
    attr_accessor :is_mandatory

    # True if Attribute is generated.
    # @return [BOOLEAN]
    attr_accessor :is_generated

    # True if Attribute is encoded.
    # @return [BOOLEAN]
    attr_accessor :is_base64_encoded

    # List of valid key list
    # @return [Array<String>]
    attr_accessor :valid_key_list

    # Attribute type details
    # @return [String]
    attr_accessor :attribute_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'is_sensitive': :'isSensitive',
        'is_mandatory': :'isMandatory',
        'is_generated': :'isGenerated',
        'is_base64_encoded': :'isBase64Encoded',
        'valid_key_list': :'validKeyList',
        'attribute_type': :'attributeType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'is_sensitive': :'BOOLEAN',
        'is_mandatory': :'BOOLEAN',
        'is_generated': :'BOOLEAN',
        'is_base64_encoded': :'BOOLEAN',
        'valid_key_list': :'Array<String>',
        'attribute_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [BOOLEAN] :is_sensitive The value to assign to the {#is_sensitive} property
    # @option attributes [BOOLEAN] :is_mandatory The value to assign to the {#is_mandatory} property
    # @option attributes [BOOLEAN] :is_generated The value to assign to the {#is_generated} property
    # @option attributes [BOOLEAN] :is_base64_encoded The value to assign to the {#is_base64_encoded} property
    # @option attributes [Array<String>] :valid_key_list The value to assign to the {#valid_key_list} property
    # @option attributes [String] :attribute_type The value to assign to the {#attribute_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.is_sensitive = attributes[:'isSensitive'] unless attributes[:'isSensitive'].nil?

      raise 'You cannot provide both :isSensitive and :is_sensitive' if attributes.key?(:'isSensitive') && attributes.key?(:'is_sensitive')

      self.is_sensitive = attributes[:'is_sensitive'] unless attributes[:'is_sensitive'].nil?

      self.is_mandatory = attributes[:'isMandatory'] unless attributes[:'isMandatory'].nil?

      raise 'You cannot provide both :isMandatory and :is_mandatory' if attributes.key?(:'isMandatory') && attributes.key?(:'is_mandatory')

      self.is_mandatory = attributes[:'is_mandatory'] unless attributes[:'is_mandatory'].nil?

      self.is_generated = attributes[:'isGenerated'] unless attributes[:'isGenerated'].nil?

      raise 'You cannot provide both :isGenerated and :is_generated' if attributes.key?(:'isGenerated') && attributes.key?(:'is_generated')

      self.is_generated = attributes[:'is_generated'] unless attributes[:'is_generated'].nil?

      self.is_base64_encoded = attributes[:'isBase64Encoded'] unless attributes[:'isBase64Encoded'].nil?

      raise 'You cannot provide both :isBase64Encoded and :is_base64_encoded' if attributes.key?(:'isBase64Encoded') && attributes.key?(:'is_base64_encoded')

      self.is_base64_encoded = attributes[:'is_base64_encoded'] unless attributes[:'is_base64_encoded'].nil?

      self.valid_key_list = attributes[:'validKeyList'] if attributes[:'validKeyList']

      raise 'You cannot provide both :validKeyList and :valid_key_list' if attributes.key?(:'validKeyList') && attributes.key?(:'valid_key_list')

      self.valid_key_list = attributes[:'valid_key_list'] if attributes[:'valid_key_list']

      self.attribute_type = attributes[:'attributeType'] if attributes[:'attributeType']

      raise 'You cannot provide both :attributeType and :attribute_type' if attributes.key?(:'attributeType') && attributes.key?(:'attribute_type')

      self.attribute_type = attributes[:'attribute_type'] if attributes[:'attribute_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        is_sensitive == other.is_sensitive &&
        is_mandatory == other.is_mandatory &&
        is_generated == other.is_generated &&
        is_base64_encoded == other.is_base64_encoded &&
        valid_key_list == other.valid_key_list &&
        attribute_type == other.attribute_type
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
      [name, is_sensitive, is_mandatory, is_generated, is_base64_encoded, valid_key_list, attribute_type].hash
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
