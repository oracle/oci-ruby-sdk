# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The document analysis results.
  class AiVision::Models::AnalyzeDocumentResult
    # This attribute is required.
    # @return [OCI::AiVision::Models::DocumentMetadata]
    attr_accessor :document_metadata

    # **[Required]** The array of a Page.
    # @return [Array<OCI::AiVision::Models::Page>]
    attr_accessor :pages

    # An array of detected document types.
    # @return [Array<OCI::AiVision::Models::DetectedDocumentType>]
    attr_accessor :detected_document_types

    # An array of detected languages.
    # @return [Array<OCI::AiVision::Models::DetectedLanguage>]
    attr_accessor :detected_languages

    # The document classification model version.
    # @return [String]
    attr_accessor :document_classification_model_version

    # The document language classification model version.
    # @return [String]
    attr_accessor :language_classification_model_version

    # The document text detection model version.
    # @return [String]
    attr_accessor :text_detection_model_version

    # The document keyValue detection model version.
    # @return [String]
    attr_accessor :key_value_detection_model_version

    # The document table detection model version.
    # @return [String]
    attr_accessor :table_detection_model_version

    # The errors encountered during document analysis.
    # @return [Array<OCI::AiVision::Models::ProcessingError>]
    attr_accessor :errors

    # The searchable PDF file that was generated.
    # @return [String]
    attr_accessor :searchable_pdf

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'document_metadata': :'documentMetadata',
        'pages': :'pages',
        'detected_document_types': :'detectedDocumentTypes',
        'detected_languages': :'detectedLanguages',
        'document_classification_model_version': :'documentClassificationModelVersion',
        'language_classification_model_version': :'languageClassificationModelVersion',
        'text_detection_model_version': :'textDetectionModelVersion',
        'key_value_detection_model_version': :'keyValueDetectionModelVersion',
        'table_detection_model_version': :'tableDetectionModelVersion',
        'errors': :'errors',
        'searchable_pdf': :'searchablePdf'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'document_metadata': :'OCI::AiVision::Models::DocumentMetadata',
        'pages': :'Array<OCI::AiVision::Models::Page>',
        'detected_document_types': :'Array<OCI::AiVision::Models::DetectedDocumentType>',
        'detected_languages': :'Array<OCI::AiVision::Models::DetectedLanguage>',
        'document_classification_model_version': :'String',
        'language_classification_model_version': :'String',
        'text_detection_model_version': :'String',
        'key_value_detection_model_version': :'String',
        'table_detection_model_version': :'String',
        'errors': :'Array<OCI::AiVision::Models::ProcessingError>',
        'searchable_pdf': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::AiVision::Models::DocumentMetadata] :document_metadata The value to assign to the {#document_metadata} property
    # @option attributes [Array<OCI::AiVision::Models::Page>] :pages The value to assign to the {#pages} property
    # @option attributes [Array<OCI::AiVision::Models::DetectedDocumentType>] :detected_document_types The value to assign to the {#detected_document_types} property
    # @option attributes [Array<OCI::AiVision::Models::DetectedLanguage>] :detected_languages The value to assign to the {#detected_languages} property
    # @option attributes [String] :document_classification_model_version The value to assign to the {#document_classification_model_version} property
    # @option attributes [String] :language_classification_model_version The value to assign to the {#language_classification_model_version} property
    # @option attributes [String] :text_detection_model_version The value to assign to the {#text_detection_model_version} property
    # @option attributes [String] :key_value_detection_model_version The value to assign to the {#key_value_detection_model_version} property
    # @option attributes [String] :table_detection_model_version The value to assign to the {#table_detection_model_version} property
    # @option attributes [Array<OCI::AiVision::Models::ProcessingError>] :errors The value to assign to the {#errors} property
    # @option attributes [String] :searchable_pdf The value to assign to the {#searchable_pdf} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.document_metadata = attributes[:'documentMetadata'] if attributes[:'documentMetadata']

      raise 'You cannot provide both :documentMetadata and :document_metadata' if attributes.key?(:'documentMetadata') && attributes.key?(:'document_metadata')

      self.document_metadata = attributes[:'document_metadata'] if attributes[:'document_metadata']

      self.pages = attributes[:'pages'] if attributes[:'pages']

      self.detected_document_types = attributes[:'detectedDocumentTypes'] if attributes[:'detectedDocumentTypes']

      raise 'You cannot provide both :detectedDocumentTypes and :detected_document_types' if attributes.key?(:'detectedDocumentTypes') && attributes.key?(:'detected_document_types')

      self.detected_document_types = attributes[:'detected_document_types'] if attributes[:'detected_document_types']

      self.detected_languages = attributes[:'detectedLanguages'] if attributes[:'detectedLanguages']

      raise 'You cannot provide both :detectedLanguages and :detected_languages' if attributes.key?(:'detectedLanguages') && attributes.key?(:'detected_languages')

      self.detected_languages = attributes[:'detected_languages'] if attributes[:'detected_languages']

      self.document_classification_model_version = attributes[:'documentClassificationModelVersion'] if attributes[:'documentClassificationModelVersion']

      raise 'You cannot provide both :documentClassificationModelVersion and :document_classification_model_version' if attributes.key?(:'documentClassificationModelVersion') && attributes.key?(:'document_classification_model_version')

      self.document_classification_model_version = attributes[:'document_classification_model_version'] if attributes[:'document_classification_model_version']

      self.language_classification_model_version = attributes[:'languageClassificationModelVersion'] if attributes[:'languageClassificationModelVersion']

      raise 'You cannot provide both :languageClassificationModelVersion and :language_classification_model_version' if attributes.key?(:'languageClassificationModelVersion') && attributes.key?(:'language_classification_model_version')

      self.language_classification_model_version = attributes[:'language_classification_model_version'] if attributes[:'language_classification_model_version']

      self.text_detection_model_version = attributes[:'textDetectionModelVersion'] if attributes[:'textDetectionModelVersion']

      raise 'You cannot provide both :textDetectionModelVersion and :text_detection_model_version' if attributes.key?(:'textDetectionModelVersion') && attributes.key?(:'text_detection_model_version')

      self.text_detection_model_version = attributes[:'text_detection_model_version'] if attributes[:'text_detection_model_version']

      self.key_value_detection_model_version = attributes[:'keyValueDetectionModelVersion'] if attributes[:'keyValueDetectionModelVersion']

      raise 'You cannot provide both :keyValueDetectionModelVersion and :key_value_detection_model_version' if attributes.key?(:'keyValueDetectionModelVersion') && attributes.key?(:'key_value_detection_model_version')

      self.key_value_detection_model_version = attributes[:'key_value_detection_model_version'] if attributes[:'key_value_detection_model_version']

      self.table_detection_model_version = attributes[:'tableDetectionModelVersion'] if attributes[:'tableDetectionModelVersion']

      raise 'You cannot provide both :tableDetectionModelVersion and :table_detection_model_version' if attributes.key?(:'tableDetectionModelVersion') && attributes.key?(:'table_detection_model_version')

      self.table_detection_model_version = attributes[:'table_detection_model_version'] if attributes[:'table_detection_model_version']

      self.errors = attributes[:'errors'] if attributes[:'errors']

      self.searchable_pdf = attributes[:'searchablePdf'] if attributes[:'searchablePdf']

      raise 'You cannot provide both :searchablePdf and :searchable_pdf' if attributes.key?(:'searchablePdf') && attributes.key?(:'searchable_pdf')

      self.searchable_pdf = attributes[:'searchable_pdf'] if attributes[:'searchable_pdf']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        document_metadata == other.document_metadata &&
        pages == other.pages &&
        detected_document_types == other.detected_document_types &&
        detected_languages == other.detected_languages &&
        document_classification_model_version == other.document_classification_model_version &&
        language_classification_model_version == other.language_classification_model_version &&
        text_detection_model_version == other.text_detection_model_version &&
        key_value_detection_model_version == other.key_value_detection_model_version &&
        table_detection_model_version == other.table_detection_model_version &&
        errors == other.errors &&
        searchable_pdf == other.searchable_pdf
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
      [document_metadata, pages, detected_document_types, detected_languages, document_classification_model_version, language_classification_model_version, text_detection_model_version, key_value_detection_model_version, table_detection_model_version, errors, searchable_pdf].hash
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
