# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A tag key definition used in the current profile override, including the tag namespace, tag key, tag value type, and tag values.
  # Only defined tags are supported.
  # For more information about tagging, see [Tagging Overview](https://docs.cloud.oracle.com/iaas/Content/Tagging/Concepts/taggingoverview.htm)
  #
  class Optimizer::Models::TargetTag
    TAG_VALUE_TYPE_ENUM = [
      TAG_VALUE_TYPE_VALUE = 'VALUE'.freeze,
      TAG_VALUE_TYPE_ANY = 'ANY'.freeze,
      TAG_VALUE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The name of the tag namespace.
    # @return [String]
    attr_accessor :tag_namespace_name

    # **[Required]** The name you use to refer to the tag, also known as the tag key.
    # @return [String]
    attr_accessor :tag_definition_name

    # **[Required]** Specifies which tag value types in the `tagValues` field result in overrides of the recommendation criteria.
    #
    # When the value for this field is `ANY`, the `tagValues` field should be empty, which enforces overrides to the recommendation
    # for resources with any tag values attached to them.
    #
    # When the value for this field value is `VALUE`, the `tagValues` field must include a specific value or list of values.
    # Overrides to the recommendation criteria only occur for resources that match the values in the `tagValues` fields.
    #
    # @return [String]
    attr_reader :tag_value_type

    # The list of tag values. The tag value is the value that the user applying the tag adds to the tag key.
    # @return [Array<String>]
    attr_accessor :tag_values

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'tag_namespace_name': :'tagNamespaceName',
        'tag_definition_name': :'tagDefinitionName',
        'tag_value_type': :'tagValueType',
        'tag_values': :'tagValues'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'tag_namespace_name': :'String',
        'tag_definition_name': :'String',
        'tag_value_type': :'String',
        'tag_values': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :tag_namespace_name The value to assign to the {#tag_namespace_name} property
    # @option attributes [String] :tag_definition_name The value to assign to the {#tag_definition_name} property
    # @option attributes [String] :tag_value_type The value to assign to the {#tag_value_type} property
    # @option attributes [Array<String>] :tag_values The value to assign to the {#tag_values} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.tag_namespace_name = attributes[:'tagNamespaceName'] if attributes[:'tagNamespaceName']

      raise 'You cannot provide both :tagNamespaceName and :tag_namespace_name' if attributes.key?(:'tagNamespaceName') && attributes.key?(:'tag_namespace_name')

      self.tag_namespace_name = attributes[:'tag_namespace_name'] if attributes[:'tag_namespace_name']

      self.tag_definition_name = attributes[:'tagDefinitionName'] if attributes[:'tagDefinitionName']

      raise 'You cannot provide both :tagDefinitionName and :tag_definition_name' if attributes.key?(:'tagDefinitionName') && attributes.key?(:'tag_definition_name')

      self.tag_definition_name = attributes[:'tag_definition_name'] if attributes[:'tag_definition_name']

      self.tag_value_type = attributes[:'tagValueType'] if attributes[:'tagValueType']

      raise 'You cannot provide both :tagValueType and :tag_value_type' if attributes.key?(:'tagValueType') && attributes.key?(:'tag_value_type')

      self.tag_value_type = attributes[:'tag_value_type'] if attributes[:'tag_value_type']

      self.tag_values = attributes[:'tagValues'] if attributes[:'tagValues']

      raise 'You cannot provide both :tagValues and :tag_values' if attributes.key?(:'tagValues') && attributes.key?(:'tag_values')

      self.tag_values = attributes[:'tag_values'] if attributes[:'tag_values']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] tag_value_type Object to be assigned
    def tag_value_type=(tag_value_type)
      # rubocop:disable Style/ConditionalAssignment
      if tag_value_type && !TAG_VALUE_TYPE_ENUM.include?(tag_value_type)
        OCI.logger.debug("Unknown value for 'tag_value_type' [" + tag_value_type + "]. Mapping to 'TAG_VALUE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @tag_value_type = TAG_VALUE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @tag_value_type = tag_value_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        tag_namespace_name == other.tag_namespace_name &&
        tag_definition_name == other.tag_definition_name &&
        tag_value_type == other.tag_value_type &&
        tag_values == other.tag_values
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
      [tag_namespace_name, tag_definition_name, tag_value_type, tag_values].hash
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
