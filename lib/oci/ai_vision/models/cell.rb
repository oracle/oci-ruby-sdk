# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A single cell in a table.
  class AiVision::Models::Cell
    # **[Required]** The text recognized in the cell.
    # @return [String]
    attr_accessor :text

    # **[Required]** The index of the cell inside the row.
    # @return [Integer]
    attr_accessor :row_index

    # **[Required]** The index of the cell inside the column.
    # @return [Integer]
    attr_accessor :column_index

    # **[Required]** The confidence score between 0 and 1.
    # @return [Float]
    attr_accessor :confidence

    # This attribute is required.
    # @return [OCI::AiVision::Models::BoundingPolygon]
    attr_accessor :bounding_polygon

    # **[Required]** The words detected in the cell.
    # @return [Array<Integer>]
    attr_accessor :word_indexes

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'text': :'text',
        'row_index': :'rowIndex',
        'column_index': :'columnIndex',
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
        'text': :'String',
        'row_index': :'Integer',
        'column_index': :'Integer',
        'confidence': :'Float',
        'bounding_polygon': :'OCI::AiVision::Models::BoundingPolygon',
        'word_indexes': :'Array<Integer>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :text The value to assign to the {#text} property
    # @option attributes [Integer] :row_index The value to assign to the {#row_index} property
    # @option attributes [Integer] :column_index The value to assign to the {#column_index} property
    # @option attributes [Float] :confidence The value to assign to the {#confidence} property
    # @option attributes [OCI::AiVision::Models::BoundingPolygon] :bounding_polygon The value to assign to the {#bounding_polygon} property
    # @option attributes [Array<Integer>] :word_indexes The value to assign to the {#word_indexes} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.text = attributes[:'text'] if attributes[:'text']

      self.row_index = attributes[:'rowIndex'] if attributes[:'rowIndex']

      raise 'You cannot provide both :rowIndex and :row_index' if attributes.key?(:'rowIndex') && attributes.key?(:'row_index')

      self.row_index = attributes[:'row_index'] if attributes[:'row_index']

      self.column_index = attributes[:'columnIndex'] if attributes[:'columnIndex']

      raise 'You cannot provide both :columnIndex and :column_index' if attributes.key?(:'columnIndex') && attributes.key?(:'column_index')

      self.column_index = attributes[:'column_index'] if attributes[:'column_index']

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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        text == other.text &&
        row_index == other.row_index &&
        column_index == other.column_index &&
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
      [text, row_index, column_index, confidence, bounding_polygon, word_indexes].hash
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
