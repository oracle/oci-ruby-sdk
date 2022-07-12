# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # One page document analysis result.
  class AiVision::Models::Page
    # **[Required]** The document page number.
    # @return [Integer]
    attr_accessor :page_number

    # @return [OCI::AiVision::Models::Dimensions]
    attr_accessor :dimensions

    # An array of detected document types.
    # @return [Array<OCI::AiVision::Models::DetectedDocumentType>]
    attr_accessor :detected_document_types

    # An array of detected languages.
    # @return [Array<OCI::AiVision::Models::DetectedLanguage>]
    attr_accessor :detected_languages

    # The words detected on the page.
    # @return [Array<OCI::AiVision::Models::Word>]
    attr_accessor :words

    # The lines of text detected on the page.
    # @return [Array<OCI::AiVision::Models::Line>]
    attr_accessor :lines

    # The tables detected on the page.
    # @return [Array<OCI::AiVision::Models::Table>]
    attr_accessor :tables

    # The form fields detected on the page.
    # @return [Array<OCI::AiVision::Models::DocumentField>]
    attr_accessor :document_fields

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'page_number': :'pageNumber',
        'dimensions': :'dimensions',
        'detected_document_types': :'detectedDocumentTypes',
        'detected_languages': :'detectedLanguages',
        'words': :'words',
        'lines': :'lines',
        'tables': :'tables',
        'document_fields': :'documentFields'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'page_number': :'Integer',
        'dimensions': :'OCI::AiVision::Models::Dimensions',
        'detected_document_types': :'Array<OCI::AiVision::Models::DetectedDocumentType>',
        'detected_languages': :'Array<OCI::AiVision::Models::DetectedLanguage>',
        'words': :'Array<OCI::AiVision::Models::Word>',
        'lines': :'Array<OCI::AiVision::Models::Line>',
        'tables': :'Array<OCI::AiVision::Models::Table>',
        'document_fields': :'Array<OCI::AiVision::Models::DocumentField>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :page_number The value to assign to the {#page_number} property
    # @option attributes [OCI::AiVision::Models::Dimensions] :dimensions The value to assign to the {#dimensions} property
    # @option attributes [Array<OCI::AiVision::Models::DetectedDocumentType>] :detected_document_types The value to assign to the {#detected_document_types} property
    # @option attributes [Array<OCI::AiVision::Models::DetectedLanguage>] :detected_languages The value to assign to the {#detected_languages} property
    # @option attributes [Array<OCI::AiVision::Models::Word>] :words The value to assign to the {#words} property
    # @option attributes [Array<OCI::AiVision::Models::Line>] :lines The value to assign to the {#lines} property
    # @option attributes [Array<OCI::AiVision::Models::Table>] :tables The value to assign to the {#tables} property
    # @option attributes [Array<OCI::AiVision::Models::DocumentField>] :document_fields The value to assign to the {#document_fields} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.page_number = attributes[:'pageNumber'] if attributes[:'pageNumber']

      raise 'You cannot provide both :pageNumber and :page_number' if attributes.key?(:'pageNumber') && attributes.key?(:'page_number')

      self.page_number = attributes[:'page_number'] if attributes[:'page_number']

      self.dimensions = attributes[:'dimensions'] if attributes[:'dimensions']

      self.detected_document_types = attributes[:'detectedDocumentTypes'] if attributes[:'detectedDocumentTypes']

      raise 'You cannot provide both :detectedDocumentTypes and :detected_document_types' if attributes.key?(:'detectedDocumentTypes') && attributes.key?(:'detected_document_types')

      self.detected_document_types = attributes[:'detected_document_types'] if attributes[:'detected_document_types']

      self.detected_languages = attributes[:'detectedLanguages'] if attributes[:'detectedLanguages']

      raise 'You cannot provide both :detectedLanguages and :detected_languages' if attributes.key?(:'detectedLanguages') && attributes.key?(:'detected_languages')

      self.detected_languages = attributes[:'detected_languages'] if attributes[:'detected_languages']

      self.words = attributes[:'words'] if attributes[:'words']

      self.lines = attributes[:'lines'] if attributes[:'lines']

      self.tables = attributes[:'tables'] if attributes[:'tables']

      self.document_fields = attributes[:'documentFields'] if attributes[:'documentFields']

      raise 'You cannot provide both :documentFields and :document_fields' if attributes.key?(:'documentFields') && attributes.key?(:'document_fields')

      self.document_fields = attributes[:'document_fields'] if attributes[:'document_fields']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        page_number == other.page_number &&
        dimensions == other.dimensions &&
        detected_document_types == other.detected_document_types &&
        detected_languages == other.detected_languages &&
        words == other.words &&
        lines == other.lines &&
        tables == other.tables &&
        document_fields == other.document_fields
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
      [page_number, dimensions, detected_document_types, detected_languages, words, lines, tables, document_fields].hash
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