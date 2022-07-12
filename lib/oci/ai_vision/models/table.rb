# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The table extracted from a document.
  class AiVision::Models::Table
    # **[Required]** The number of rows.
    # @return [Integer]
    attr_accessor :row_count

    # **[Required]** The number of columns.
    # @return [Integer]
    attr_accessor :column_count

    # **[Required]** The header rows.
    # @return [Array<OCI::AiVision::Models::TableRow>]
    attr_accessor :header_rows

    # **[Required]** The body rows.
    # @return [Array<OCI::AiVision::Models::TableRow>]
    attr_accessor :body_rows

    # **[Required]** the footer rows.
    # @return [Array<OCI::AiVision::Models::TableRow>]
    attr_accessor :footer_rows

    # **[Required]** The confidence score between 0 and 1.
    # @return [Float]
    attr_accessor :confidence

    # This attribute is required.
    # @return [OCI::AiVision::Models::BoundingPolygon]
    attr_accessor :bounding_polygon

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'row_count': :'rowCount',
        'column_count': :'columnCount',
        'header_rows': :'headerRows',
        'body_rows': :'bodyRows',
        'footer_rows': :'footerRows',
        'confidence': :'confidence',
        'bounding_polygon': :'boundingPolygon'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'row_count': :'Integer',
        'column_count': :'Integer',
        'header_rows': :'Array<OCI::AiVision::Models::TableRow>',
        'body_rows': :'Array<OCI::AiVision::Models::TableRow>',
        'footer_rows': :'Array<OCI::AiVision::Models::TableRow>',
        'confidence': :'Float',
        'bounding_polygon': :'OCI::AiVision::Models::BoundingPolygon'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :row_count The value to assign to the {#row_count} property
    # @option attributes [Integer] :column_count The value to assign to the {#column_count} property
    # @option attributes [Array<OCI::AiVision::Models::TableRow>] :header_rows The value to assign to the {#header_rows} property
    # @option attributes [Array<OCI::AiVision::Models::TableRow>] :body_rows The value to assign to the {#body_rows} property
    # @option attributes [Array<OCI::AiVision::Models::TableRow>] :footer_rows The value to assign to the {#footer_rows} property
    # @option attributes [Float] :confidence The value to assign to the {#confidence} property
    # @option attributes [OCI::AiVision::Models::BoundingPolygon] :bounding_polygon The value to assign to the {#bounding_polygon} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.row_count = attributes[:'rowCount'] if attributes[:'rowCount']

      raise 'You cannot provide both :rowCount and :row_count' if attributes.key?(:'rowCount') && attributes.key?(:'row_count')

      self.row_count = attributes[:'row_count'] if attributes[:'row_count']

      self.column_count = attributes[:'columnCount'] if attributes[:'columnCount']

      raise 'You cannot provide both :columnCount and :column_count' if attributes.key?(:'columnCount') && attributes.key?(:'column_count')

      self.column_count = attributes[:'column_count'] if attributes[:'column_count']

      self.header_rows = attributes[:'headerRows'] if attributes[:'headerRows']

      raise 'You cannot provide both :headerRows and :header_rows' if attributes.key?(:'headerRows') && attributes.key?(:'header_rows')

      self.header_rows = attributes[:'header_rows'] if attributes[:'header_rows']

      self.body_rows = attributes[:'bodyRows'] if attributes[:'bodyRows']

      raise 'You cannot provide both :bodyRows and :body_rows' if attributes.key?(:'bodyRows') && attributes.key?(:'body_rows')

      self.body_rows = attributes[:'body_rows'] if attributes[:'body_rows']

      self.footer_rows = attributes[:'footerRows'] if attributes[:'footerRows']

      raise 'You cannot provide both :footerRows and :footer_rows' if attributes.key?(:'footerRows') && attributes.key?(:'footer_rows')

      self.footer_rows = attributes[:'footer_rows'] if attributes[:'footer_rows']

      self.confidence = attributes[:'confidence'] if attributes[:'confidence']

      self.bounding_polygon = attributes[:'boundingPolygon'] if attributes[:'boundingPolygon']

      raise 'You cannot provide both :boundingPolygon and :bounding_polygon' if attributes.key?(:'boundingPolygon') && attributes.key?(:'bounding_polygon')

      self.bounding_polygon = attributes[:'bounding_polygon'] if attributes[:'bounding_polygon']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        row_count == other.row_count &&
        column_count == other.column_count &&
        header_rows == other.header_rows &&
        body_rows == other.body_rows &&
        footer_rows == other.footer_rows &&
        confidence == other.confidence &&
        bounding_polygon == other.bounding_polygon
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
      [row_count, column_count, header_rows, body_rows, footer_rows, confidence, bounding_polygon].hash
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
