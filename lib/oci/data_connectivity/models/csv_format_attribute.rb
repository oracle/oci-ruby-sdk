# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'abstract_format_attribute'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The CSV format attribute.
  class DataConnectivity::Models::CsvFormatAttribute < DataConnectivity::Models::AbstractFormatAttribute
    # The encoding for the file.
    # @return [String]
    attr_accessor :encoding

    # The escape character for the CSV format.
    # @return [String]
    attr_accessor :escape_character

    # The delimiter for the CSV format.
    # @return [String]
    attr_accessor :delimiter

    # The quote character for the CSV format.
    # @return [String]
    attr_accessor :quote_character

    # Defines whether the file has a header row.
    # @return [BOOLEAN]
    attr_accessor :has_header

    # Defines whether a file pattern is supported.
    # @return [BOOLEAN]
    attr_accessor :is_file_pattern

    # Format for timestamp information.
    # @return [String]
    attr_accessor :timestamp_format

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'modelType',
        'encoding': :'encoding',
        'escape_character': :'escapeCharacter',
        'delimiter': :'delimiter',
        'quote_character': :'quoteCharacter',
        'has_header': :'hasHeader',
        'is_file_pattern': :'isFilePattern',
        'timestamp_format': :'timestampFormat'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'String',
        'encoding': :'String',
        'escape_character': :'String',
        'delimiter': :'String',
        'quote_character': :'String',
        'has_header': :'BOOLEAN',
        'is_file_pattern': :'BOOLEAN',
        'timestamp_format': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :encoding The value to assign to the {#encoding} property
    # @option attributes [String] :escape_character The value to assign to the {#escape_character} property
    # @option attributes [String] :delimiter The value to assign to the {#delimiter} property
    # @option attributes [String] :quote_character The value to assign to the {#quote_character} property
    # @option attributes [BOOLEAN] :has_header The value to assign to the {#has_header} property
    # @option attributes [BOOLEAN] :is_file_pattern The value to assign to the {#is_file_pattern} property
    # @option attributes [String] :timestamp_format The value to assign to the {#timestamp_format} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['modelType'] = 'CSV_FORMAT'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.encoding = attributes[:'encoding'] if attributes[:'encoding']

      self.escape_character = attributes[:'escapeCharacter'] if attributes[:'escapeCharacter']

      raise 'You cannot provide both :escapeCharacter and :escape_character' if attributes.key?(:'escapeCharacter') && attributes.key?(:'escape_character')

      self.escape_character = attributes[:'escape_character'] if attributes[:'escape_character']

      self.delimiter = attributes[:'delimiter'] if attributes[:'delimiter']

      self.quote_character = attributes[:'quoteCharacter'] if attributes[:'quoteCharacter']

      raise 'You cannot provide both :quoteCharacter and :quote_character' if attributes.key?(:'quoteCharacter') && attributes.key?(:'quote_character')

      self.quote_character = attributes[:'quote_character'] if attributes[:'quote_character']

      self.has_header = attributes[:'hasHeader'] unless attributes[:'hasHeader'].nil?

      raise 'You cannot provide both :hasHeader and :has_header' if attributes.key?(:'hasHeader') && attributes.key?(:'has_header')

      self.has_header = attributes[:'has_header'] unless attributes[:'has_header'].nil?

      self.is_file_pattern = attributes[:'isFilePattern'] unless attributes[:'isFilePattern'].nil?

      raise 'You cannot provide both :isFilePattern and :is_file_pattern' if attributes.key?(:'isFilePattern') && attributes.key?(:'is_file_pattern')

      self.is_file_pattern = attributes[:'is_file_pattern'] unless attributes[:'is_file_pattern'].nil?

      self.timestamp_format = attributes[:'timestampFormat'] if attributes[:'timestampFormat']

      raise 'You cannot provide both :timestampFormat and :timestamp_format' if attributes.key?(:'timestampFormat') && attributes.key?(:'timestamp_format')

      self.timestamp_format = attributes[:'timestamp_format'] if attributes[:'timestamp_format']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        model_type == other.model_type &&
        encoding == other.encoding &&
        escape_character == other.escape_character &&
        delimiter == other.delimiter &&
        quote_character == other.quote_character &&
        has_header == other.has_header &&
        is_file_pattern == other.is_file_pattern &&
        timestamp_format == other.timestamp_format
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
      [model_type, encoding, escape_character, delimiter, quote_character, has_header, is_file_pattern, timestamp_format].hash
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
