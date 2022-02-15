# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Image analysis results.
  class AiVision::Models::AnalyzeImageResult
    # Detected objects.
    # @return [Array<OCI::AiVision::Models::ImageObject>]
    attr_accessor :image_objects

    # Image classification labels.
    # @return [Array<OCI::AiVision::Models::Label>]
    attr_accessor :labels

    # ontologyClasses of image labels.
    # @return [Array<OCI::AiVision::Models::OntologyClass>]
    attr_accessor :ontology_classes

    # @return [OCI::AiVision::Models::ImageText]
    attr_accessor :image_text

    # Image classification model version.
    # @return [String]
    attr_accessor :image_classification_model_version

    # Object detection model version.
    # @return [String]
    attr_accessor :object_detection_model_version

    # Text detection model version.
    # @return [String]
    attr_accessor :text_detection_model_version

    # Errors encountered during image analysis.
    # @return [Array<OCI::AiVision::Models::ProcessingError>]
    attr_accessor :errors

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'image_objects': :'imageObjects',
        'labels': :'labels',
        'ontology_classes': :'ontologyClasses',
        'image_text': :'imageText',
        'image_classification_model_version': :'imageClassificationModelVersion',
        'object_detection_model_version': :'objectDetectionModelVersion',
        'text_detection_model_version': :'textDetectionModelVersion',
        'errors': :'errors'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'image_objects': :'Array<OCI::AiVision::Models::ImageObject>',
        'labels': :'Array<OCI::AiVision::Models::Label>',
        'ontology_classes': :'Array<OCI::AiVision::Models::OntologyClass>',
        'image_text': :'OCI::AiVision::Models::ImageText',
        'image_classification_model_version': :'String',
        'object_detection_model_version': :'String',
        'text_detection_model_version': :'String',
        'errors': :'Array<OCI::AiVision::Models::ProcessingError>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<OCI::AiVision::Models::ImageObject>] :image_objects The value to assign to the {#image_objects} property
    # @option attributes [Array<OCI::AiVision::Models::Label>] :labels The value to assign to the {#labels} property
    # @option attributes [Array<OCI::AiVision::Models::OntologyClass>] :ontology_classes The value to assign to the {#ontology_classes} property
    # @option attributes [OCI::AiVision::Models::ImageText] :image_text The value to assign to the {#image_text} property
    # @option attributes [String] :image_classification_model_version The value to assign to the {#image_classification_model_version} property
    # @option attributes [String] :object_detection_model_version The value to assign to the {#object_detection_model_version} property
    # @option attributes [String] :text_detection_model_version The value to assign to the {#text_detection_model_version} property
    # @option attributes [Array<OCI::AiVision::Models::ProcessingError>] :errors The value to assign to the {#errors} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.image_objects = attributes[:'imageObjects'] if attributes[:'imageObjects']

      raise 'You cannot provide both :imageObjects and :image_objects' if attributes.key?(:'imageObjects') && attributes.key?(:'image_objects')

      self.image_objects = attributes[:'image_objects'] if attributes[:'image_objects']

      self.labels = attributes[:'labels'] if attributes[:'labels']

      self.ontology_classes = attributes[:'ontologyClasses'] if attributes[:'ontologyClasses']

      raise 'You cannot provide both :ontologyClasses and :ontology_classes' if attributes.key?(:'ontologyClasses') && attributes.key?(:'ontology_classes')

      self.ontology_classes = attributes[:'ontology_classes'] if attributes[:'ontology_classes']

      self.image_text = attributes[:'imageText'] if attributes[:'imageText']

      raise 'You cannot provide both :imageText and :image_text' if attributes.key?(:'imageText') && attributes.key?(:'image_text')

      self.image_text = attributes[:'image_text'] if attributes[:'image_text']

      self.image_classification_model_version = attributes[:'imageClassificationModelVersion'] if attributes[:'imageClassificationModelVersion']

      raise 'You cannot provide both :imageClassificationModelVersion and :image_classification_model_version' if attributes.key?(:'imageClassificationModelVersion') && attributes.key?(:'image_classification_model_version')

      self.image_classification_model_version = attributes[:'image_classification_model_version'] if attributes[:'image_classification_model_version']

      self.object_detection_model_version = attributes[:'objectDetectionModelVersion'] if attributes[:'objectDetectionModelVersion']

      raise 'You cannot provide both :objectDetectionModelVersion and :object_detection_model_version' if attributes.key?(:'objectDetectionModelVersion') && attributes.key?(:'object_detection_model_version')

      self.object_detection_model_version = attributes[:'object_detection_model_version'] if attributes[:'object_detection_model_version']

      self.text_detection_model_version = attributes[:'textDetectionModelVersion'] if attributes[:'textDetectionModelVersion']

      raise 'You cannot provide both :textDetectionModelVersion and :text_detection_model_version' if attributes.key?(:'textDetectionModelVersion') && attributes.key?(:'text_detection_model_version')

      self.text_detection_model_version = attributes[:'text_detection_model_version'] if attributes[:'text_detection_model_version']

      self.errors = attributes[:'errors'] if attributes[:'errors']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        image_objects == other.image_objects &&
        labels == other.labels &&
        ontology_classes == other.ontology_classes &&
        image_text == other.image_text &&
        image_classification_model_version == other.image_classification_model_version &&
        object_detection_model_version == other.object_detection_model_version &&
        text_detection_model_version == other.text_detection_model_version &&
        errors == other.errors
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
      [image_objects, labels, ontology_classes, image_text, image_classification_model_version, object_detection_model_version, text_detection_model_version, errors].hash
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
