# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The value of a form field.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class AiVision::Models::FieldValue
    VALUE_TYPE_ENUM = [
      VALUE_TYPE_STRING = 'STRING'.freeze,
      VALUE_TYPE_DATE = 'DATE'.freeze,
      VALUE_TYPE_TIME = 'TIME'.freeze,
      VALUE_TYPE_PHONE_NUMBER = 'PHONE_NUMBER'.freeze,
      VALUE_TYPE_NUMBER = 'NUMBER'.freeze,
      VALUE_TYPE_INTEGER = 'INTEGER'.freeze,
      VALUE_TYPE_ARRAY = 'ARRAY'.freeze,
      VALUE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The type of data detected.
    #
    # @return [String]
    attr_reader :value_type

    # The detected text of a field.
    # @return [String]
    attr_accessor :text

    # **[Required]** The confidence score between 0 and 1.
    # @return [Float]
    attr_accessor :confidence

    # This attribute is required.
    # @return [OCI::AiVision::Models::BoundingPolygon]
    attr_accessor :bounding_polygon

    # **[Required]** The indexes of the words in the field value.
    # @return [Array<Integer>]
    attr_accessor :word_indexes

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'value_type': :'valueType',
        'text': :'text',
        'confidence': :'confidence',
        'bounding_polygon': :'boundingPolygon',
        'word_indexes': :'wordIndexes'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'value_type': :'String',
        'text': :'String',
        'confidence': :'Float',
        'bounding_polygon': :'OCI::AiVision::Models::BoundingPolygon',
        'word_indexes': :'Array<Integer>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'valueType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::AiVision::Models::ValueTime' if type == 'TIME'
      return 'OCI::AiVision::Models::ValueInteger' if type == 'INTEGER'
      return 'OCI::AiVision::Models::ValueDate' if type == 'DATE'
      return 'OCI::AiVision::Models::ValueNumber' if type == 'NUMBER'
      return 'OCI::AiVision::Models::ValueString' if type == 'STRING'
      return 'OCI::AiVision::Models::ValuePhoneNumber' if type == 'PHONE_NUMBER'
      return 'OCI::AiVision::Models::ValueArray' if type == 'ARRAY'

      # TODO: Log a warning when the subtype is not found.
      'OCI::AiVision::Models::FieldValue'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :value_type The value to assign to the {#value_type} property
    # @option attributes [String] :text The value to assign to the {#text} property
    # @option attributes [Float] :confidence The value to assign to the {#confidence} property
    # @option attributes [OCI::AiVision::Models::BoundingPolygon] :bounding_polygon The value to assign to the {#bounding_polygon} property
    # @option attributes [Array<Integer>] :word_indexes The value to assign to the {#word_indexes} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.value_type = attributes[:'valueType'] if attributes[:'valueType']

      raise 'You cannot provide both :valueType and :value_type' if attributes.key?(:'valueType') && attributes.key?(:'value_type')

      self.value_type = attributes[:'value_type'] if attributes[:'value_type']

      self.text = attributes[:'text'] if attributes[:'text']

      self.confidence = attributes[:'confidence'] if attributes[:'confidence']

      self.bounding_polygon = attributes[:'boundingPolygon'] if attributes[:'boundingPolygon']

      raise 'You cannot provide both :boundingPolygon and :bounding_polygon' if attributes.key?(:'boundingPolygon') && attributes.key?(:'bounding_polygon')

      self.bounding_polygon = attributes[:'bounding_polygon'] if attributes[:'bounding_polygon']

      self.word_indexes = attributes[:'wordIndexes'] if attributes[:'wordIndexes']

      raise 'You cannot provide both :wordIndexes and :word_indexes' if attributes.key?(:'wordIndexes') && attributes.key?(:'word_indexes')

      self.word_indexes = attributes[:'word_indexes'] if attributes[:'word_indexes']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] value_type Object to be assigned
    def value_type=(value_type)
      # rubocop:disable Style/ConditionalAssignment
      if value_type && !VALUE_TYPE_ENUM.include?(value_type)
        OCI.logger.debug("Unknown value for 'value_type' [" + value_type + "]. Mapping to 'VALUE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @value_type = VALUE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @value_type = value_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        value_type == other.value_type &&
        text == other.text &&
        confidence == other.confidence &&
        bounding_polygon == other.bounding_polygon &&
        word_indexes == other.word_indexes
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
      [value_type, text, confidence, bounding_polygon, word_indexes].hash
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
