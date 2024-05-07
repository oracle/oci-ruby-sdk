# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: v1
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # CostTrackingTag model.
  class IdentityDataPlane::Models::CostTrackingTag
    # **[Required]** The tag namespace id.
    # @return [String]
    attr_accessor :tag_namespace_id

    # **[Required]** The tag namespace name.
    # @return [String]
    attr_accessor :tag_namespace_name

    # **[Required]** The tag definition id.
    # @return [String]
    attr_accessor :tag_definition_id

    # **[Required]** The tag definition name.
    # @return [String]
    attr_accessor :tag_definition_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'tag_namespace_id': :'Tag_Namespace_Id',
        'tag_namespace_name': :'Tag_Namespace_Name',
        'tag_definition_id': :'Tag_Definition_Id',
        'tag_definition_name': :'Tag_Definition_Name'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'tag_namespace_id': :'String',
        'tag_namespace_name': :'String',
        'tag_definition_id': :'String',
        'tag_definition_name': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :tag_namespace_id The value to assign to the {#tag_namespace_id} property
    # @option attributes [String] :tag_namespace_name The value to assign to the {#tag_namespace_name} property
    # @option attributes [String] :tag_definition_id The value to assign to the {#tag_definition_id} property
    # @option attributes [String] :tag_definition_name The value to assign to the {#tag_definition_name} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.tag_namespace_id = attributes[:'Tag_Namespace_Id'] if attributes[:'Tag_Namespace_Id']

      raise 'You cannot provide both :Tag_Namespace_Id and :tag_namespace_id' if attributes.key?(:'Tag_Namespace_Id') && attributes.key?(:'tag_namespace_id')

      self.tag_namespace_id = attributes[:'tag_namespace_id'] if attributes[:'tag_namespace_id']

      self.tag_namespace_name = attributes[:'Tag_Namespace_Name'] if attributes[:'Tag_Namespace_Name']

      raise 'You cannot provide both :Tag_Namespace_Name and :tag_namespace_name' if attributes.key?(:'Tag_Namespace_Name') && attributes.key?(:'tag_namespace_name')

      self.tag_namespace_name = attributes[:'tag_namespace_name'] if attributes[:'tag_namespace_name']

      self.tag_definition_id = attributes[:'Tag_Definition_Id'] if attributes[:'Tag_Definition_Id']

      raise 'You cannot provide both :Tag_Definition_Id and :tag_definition_id' if attributes.key?(:'Tag_Definition_Id') && attributes.key?(:'tag_definition_id')

      self.tag_definition_id = attributes[:'tag_definition_id'] if attributes[:'tag_definition_id']

      self.tag_definition_name = attributes[:'Tag_Definition_Name'] if attributes[:'Tag_Definition_Name']

      raise 'You cannot provide both :Tag_Definition_Name and :tag_definition_name' if attributes.key?(:'Tag_Definition_Name') && attributes.key?(:'tag_definition_name')

      self.tag_definition_name = attributes[:'tag_definition_name'] if attributes[:'tag_definition_name']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        tag_namespace_id == other.tag_namespace_id &&
        tag_namespace_name == other.tag_namespace_name &&
        tag_definition_id == other.tag_definition_id &&
        tag_definition_name == other.tag_definition_name
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
      [tag_namespace_id, tag_namespace_name, tag_definition_id, tag_definition_name].hash
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
