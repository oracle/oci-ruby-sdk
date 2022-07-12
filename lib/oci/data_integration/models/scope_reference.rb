# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The `ScopeReference` class is a base class for any model object that wraps a scope reference to a TypedObject.
  class DataIntegration::Models::ScopeReference
    REFERENCE_TYPE_ENUM = [
      REFERENCE_TYPE_DIRECT_REF = 'DIRECT_REF'.freeze,
      REFERENCE_TYPE_BOUND_ENTITY_SHAPE = 'BOUND_ENTITY_SHAPE'.freeze,
      REFERENCE_TYPE_BOUND_ENTITY_SHAPE_FIELD = 'BOUND_ENTITY_SHAPE_FIELD'.freeze,
      REFERENCE_TYPE_OCI_FUNCTION_INPUT_SHAPE = 'OCI_FUNCTION_INPUT_SHAPE'.freeze,
      REFERENCE_TYPE_OCI_FUNCTION_OUTPUT_SHAPE = 'OCI_FUNCTION_OUTPUT_SHAPE'.freeze,
      REFERENCE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** A key or shallow reference to an object.  For direct reference, it points to the actual scope object.  For BOUND_ENTITY_SHAPE or BOUND_ENTITY_SHAPE_FIELD, it points to the source or target operator.   For OCI_FUNCTION_INPUT_SHAPE or OCI_FUNCTION_OUTPUT_SHAPE, it points to the OCI Function object.
    # @return [String]
    attr_accessor :reference_object

    # The reference type for this reference.  Set to null for a direct reference, for indirect references set to a type of association such as \"BOUND_ENTITY_SHAPE\".   Current known reference type values are \"BOUND_ENTITY_SHAPE\", \"BOUND_ENTITY_SHAPE_FIELD\", \"OCI_FUNCTION_INPUT_SHAPE\", \"OCI_FUNCTION_OUTPUT_SHAPE\"
    # @return [String]
    attr_reader :reference_type

    # The referenced object name for this reference.  Set to the field name if the referenceType is BOUND_ENTITY_SHAPE_FIELD, else set to null.
    # @return [String]
    attr_accessor :ref_object_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'reference_object': :'referenceObject',
        'reference_type': :'referenceType',
        'ref_object_name': :'refObjectName'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'reference_object': :'String',
        'reference_type': :'String',
        'ref_object_name': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :reference_object The value to assign to the {#reference_object} property
    # @option attributes [String] :reference_type The value to assign to the {#reference_type} property
    # @option attributes [String] :ref_object_name The value to assign to the {#ref_object_name} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.reference_object = attributes[:'referenceObject'] if attributes[:'referenceObject']

      raise 'You cannot provide both :referenceObject and :reference_object' if attributes.key?(:'referenceObject') && attributes.key?(:'reference_object')

      self.reference_object = attributes[:'reference_object'] if attributes[:'reference_object']

      self.reference_type = attributes[:'referenceType'] if attributes[:'referenceType']
      self.reference_type = "DIRECT_REF" if reference_type.nil? && !attributes.key?(:'referenceType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :referenceType and :reference_type' if attributes.key?(:'referenceType') && attributes.key?(:'reference_type')

      self.reference_type = attributes[:'reference_type'] if attributes[:'reference_type']
      self.reference_type = "DIRECT_REF" if reference_type.nil? && !attributes.key?(:'referenceType') && !attributes.key?(:'reference_type') # rubocop:disable Style/StringLiterals

      self.ref_object_name = attributes[:'refObjectName'] if attributes[:'refObjectName']

      raise 'You cannot provide both :refObjectName and :ref_object_name' if attributes.key?(:'refObjectName') && attributes.key?(:'ref_object_name')

      self.ref_object_name = attributes[:'ref_object_name'] if attributes[:'ref_object_name']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] reference_type Object to be assigned
    def reference_type=(reference_type)
      # rubocop:disable Style/ConditionalAssignment
      if reference_type && !REFERENCE_TYPE_ENUM.include?(reference_type)
        OCI.logger.debug("Unknown value for 'reference_type' [" + reference_type + "]. Mapping to 'REFERENCE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @reference_type = REFERENCE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @reference_type = reference_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        reference_object == other.reference_object &&
        reference_type == other.reference_type &&
        ref_object_name == other.ref_object_name
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
      [reference_object, reference_type, ref_object_name].hash
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
