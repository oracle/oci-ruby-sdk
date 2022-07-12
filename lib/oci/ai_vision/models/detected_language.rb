# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The language detected in a document.
  class AiVision::Models::DetectedLanguage
    LANGUAGE_CODE_ENUM = [
      LANGUAGE_CODE_ENG = 'ENG'.freeze,
      LANGUAGE_CODE_CES = 'CES'.freeze,
      LANGUAGE_CODE_DAN = 'DAN'.freeze,
      LANGUAGE_CODE_NLD = 'NLD'.freeze,
      LANGUAGE_CODE_FIN = 'FIN'.freeze,
      LANGUAGE_CODE_FRA = 'FRA'.freeze,
      LANGUAGE_CODE_DEU = 'DEU'.freeze,
      LANGUAGE_CODE_ELL = 'ELL'.freeze,
      LANGUAGE_CODE_HUN = 'HUN'.freeze,
      LANGUAGE_CODE_ITA = 'ITA'.freeze,
      LANGUAGE_CODE_NOR = 'NOR'.freeze,
      LANGUAGE_CODE_POL = 'POL'.freeze,
      LANGUAGE_CODE_POR = 'POR'.freeze,
      LANGUAGE_CODE_RON = 'RON'.freeze,
      LANGUAGE_CODE_RUS = 'RUS'.freeze,
      LANGUAGE_CODE_SLK = 'SLK'.freeze,
      LANGUAGE_CODE_SPA = 'SPA'.freeze,
      LANGUAGE_CODE_SWE = 'SWE'.freeze,
      LANGUAGE_CODE_TUR = 'TUR'.freeze,
      LANGUAGE_CODE_ARA = 'ARA'.freeze,
      LANGUAGE_CODE_CHI_SIM = 'CHI_SIM'.freeze,
      LANGUAGE_CODE_HIN = 'HIN'.freeze,
      LANGUAGE_CODE_JPN = 'JPN'.freeze,
      LANGUAGE_CODE_KOR = 'KOR'.freeze,
      LANGUAGE_CODE_OTHERS = 'OTHERS'.freeze,
      LANGUAGE_CODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The language of the document, abbreviated according to ISO 639-2.
    # @return [String]
    attr_reader :language_code

    # **[Required]** The confidence score between 0 and 1.
    # @return [Float]
    attr_accessor :confidence

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'language_code': :'languageCode',
        'confidence': :'confidence'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'language_code': :'String',
        'confidence': :'Float'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :language_code The value to assign to the {#language_code} property
    # @option attributes [Float] :confidence The value to assign to the {#confidence} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.language_code = attributes[:'languageCode'] if attributes[:'languageCode']

      raise 'You cannot provide both :languageCode and :language_code' if attributes.key?(:'languageCode') && attributes.key?(:'language_code')

      self.language_code = attributes[:'language_code'] if attributes[:'language_code']

      self.confidence = attributes[:'confidence'] if attributes[:'confidence']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] language_code Object to be assigned
    def language_code=(language_code)
      # rubocop:disable Style/ConditionalAssignment
      if language_code && !LANGUAGE_CODE_ENUM.include?(language_code)
        OCI.logger.debug("Unknown value for 'language_code' [" + language_code + "]. Mapping to 'LANGUAGE_CODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @language_code = LANGUAGE_CODE_UNKNOWN_ENUM_VALUE
      else
        @language_code = language_code
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        language_code == other.language_code &&
        confidence == other.confidence
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
      [language_code, confidence].hash
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
