# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220125
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The detected face.
  class AiVision::Models::Face
    # **[Required]** The confidence score, between 0 and 1.
    # @return [Float]
    attr_accessor :confidence

    # This attribute is required.
    # @return [OCI::AiVision::Models::BoundingPolygon]
    attr_accessor :bounding_polygon

    # **[Required]** The quality score of the face detected, between 0 and 1.
    # @return [Float]
    attr_accessor :quality_score

    # A point of interest within a face.
    # @return [Array<OCI::AiVision::Models::Landmark>]
    attr_accessor :landmarks

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'confidence': :'confidence',
        'bounding_polygon': :'boundingPolygon',
        'quality_score': :'qualityScore',
        'landmarks': :'landmarks'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'confidence': :'Float',
        'bounding_polygon': :'OCI::AiVision::Models::BoundingPolygon',
        'quality_score': :'Float',
        'landmarks': :'Array<OCI::AiVision::Models::Landmark>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Float] :confidence The value to assign to the {#confidence} property
    # @option attributes [OCI::AiVision::Models::BoundingPolygon] :bounding_polygon The value to assign to the {#bounding_polygon} property
    # @option attributes [Float] :quality_score The value to assign to the {#quality_score} property
    # @option attributes [Array<OCI::AiVision::Models::Landmark>] :landmarks The value to assign to the {#landmarks} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.confidence = attributes[:'confidence'] if attributes[:'confidence']

      self.bounding_polygon = attributes[:'boundingPolygon'] if attributes[:'boundingPolygon']

      raise 'You cannot provide both :boundingPolygon and :bounding_polygon' if attributes.key?(:'boundingPolygon') && attributes.key?(:'bounding_polygon')

      self.bounding_polygon = attributes[:'bounding_polygon'] if attributes[:'bounding_polygon']

      self.quality_score = attributes[:'qualityScore'] if attributes[:'qualityScore']

      raise 'You cannot provide both :qualityScore and :quality_score' if attributes.key?(:'qualityScore') && attributes.key?(:'quality_score')

      self.quality_score = attributes[:'quality_score'] if attributes[:'quality_score']

      self.landmarks = attributes[:'landmarks'] if attributes[:'landmarks']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        confidence == other.confidence &&
        bounding_polygon == other.bounding_polygon &&
        quality_score == other.quality_score &&
        landmarks == other.landmarks
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
      [confidence, bounding_polygon, quality_score, landmarks].hash
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
