# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20221109
require 'date'
require 'logger'
require_relative 'processor_config'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The configuration of a general processor.
  class AiDocument::Models::GeneralProcessorConfig < AiDocument::Models::ProcessorConfig
    DOCUMENT_TYPE_ENUM = [
      DOCUMENT_TYPE_INVOICE = 'INVOICE'.freeze,
      DOCUMENT_TYPE_RECEIPT = 'RECEIPT'.freeze,
      DOCUMENT_TYPE_RESUME = 'RESUME'.freeze,
      DOCUMENT_TYPE_TAX_FORM = 'TAX_FORM'.freeze,
      DOCUMENT_TYPE_DRIVER_LICENSE = 'DRIVER_LICENSE'.freeze,
      DOCUMENT_TYPE_PASSPORT = 'PASSPORT'.freeze,
      DOCUMENT_TYPE_BANK_STATEMENT = 'BANK_STATEMENT'.freeze,
      DOCUMENT_TYPE_CHECK = 'CHECK'.freeze,
      DOCUMENT_TYPE_PAYSLIP = 'PAYSLIP'.freeze,
      DOCUMENT_TYPE_OTHERS = 'OTHERS'.freeze,
      DOCUMENT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The document type.
    # @return [String]
    attr_reader :document_type

    # **[Required]** The types of document analysis requested.
    # @return [Array<OCI::AiDocument::Models::DocumentFeature>]
    attr_accessor :features

    # Whether or not to generate a ZIP file containing the results.
    # @return [BOOLEAN]
    attr_accessor :is_zip_output_enabled

    # The document language, abbreviated according to the BCP 47 Language-Tag syntax.
    # @return [String]
    attr_accessor :language

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'processor_type': :'processorType',
        'document_type': :'documentType',
        'features': :'features',
        'is_zip_output_enabled': :'isZipOutputEnabled',
        'language': :'language'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'processor_type': :'String',
        'document_type': :'String',
        'features': :'Array<OCI::AiDocument::Models::DocumentFeature>',
        'is_zip_output_enabled': :'BOOLEAN',
        'language': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :document_type The value to assign to the {#document_type} property
    # @option attributes [Array<OCI::AiDocument::Models::DocumentFeature>] :features The value to assign to the {#features} property
    # @option attributes [BOOLEAN] :is_zip_output_enabled The value to assign to the {#is_zip_output_enabled} property
    # @option attributes [String] :language The value to assign to the {#language} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['processorType'] = 'GENERAL'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.document_type = attributes[:'documentType'] if attributes[:'documentType']

      raise 'You cannot provide both :documentType and :document_type' if attributes.key?(:'documentType') && attributes.key?(:'document_type')

      self.document_type = attributes[:'document_type'] if attributes[:'document_type']

      self.features = attributes[:'features'] if attributes[:'features']

      self.is_zip_output_enabled = attributes[:'isZipOutputEnabled'] unless attributes[:'isZipOutputEnabled'].nil?
      self.is_zip_output_enabled = false if is_zip_output_enabled.nil? && !attributes.key?(:'isZipOutputEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isZipOutputEnabled and :is_zip_output_enabled' if attributes.key?(:'isZipOutputEnabled') && attributes.key?(:'is_zip_output_enabled')

      self.is_zip_output_enabled = attributes[:'is_zip_output_enabled'] unless attributes[:'is_zip_output_enabled'].nil?
      self.is_zip_output_enabled = false if is_zip_output_enabled.nil? && !attributes.key?(:'isZipOutputEnabled') && !attributes.key?(:'is_zip_output_enabled') # rubocop:disable Style/StringLiterals

      self.language = attributes[:'language'] if attributes[:'language']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] document_type Object to be assigned
    def document_type=(document_type)
      # rubocop:disable Style/ConditionalAssignment
      if document_type && !DOCUMENT_TYPE_ENUM.include?(document_type)
        OCI.logger.debug("Unknown value for 'document_type' [" + document_type + "]. Mapping to 'DOCUMENT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @document_type = DOCUMENT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @document_type = document_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        processor_type == other.processor_type &&
        document_type == other.document_type &&
        features == other.features &&
        is_zip_output_enabled == other.is_zip_output_enabled &&
        language == other.language
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
      [processor_type, document_type, features, is_zip_output_enabled, language].hash
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
