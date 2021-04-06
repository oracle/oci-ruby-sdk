# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Parsed representation of the log file.
  class LogAnalytics::Models::ParsedContent
    # List of field names.
    # @return [Array<String>]
    attr_accessor :field_names

    # List of field display names.
    # @return [Array<String>]
    attr_accessor :field_display_names

    # Parsed field values.
    # @return [Array<OCI::LogAnalytics::Models::ParsedField>]
    attr_accessor :parsed_field_values

    # Sample log entries picked up from the given file for validation.
    # @return [String]
    attr_accessor :log_content

    # Sample Size taken for validation.
    # @return [Integer]
    attr_accessor :sample_size

    # Match Status.
    # @return [String]
    attr_accessor :match_status

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'field_names': :'fieldNames',
        'field_display_names': :'fieldDisplayNames',
        'parsed_field_values': :'parsedFieldValues',
        'log_content': :'logContent',
        'sample_size': :'sampleSize',
        'match_status': :'matchStatus'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'field_names': :'Array<String>',
        'field_display_names': :'Array<String>',
        'parsed_field_values': :'Array<OCI::LogAnalytics::Models::ParsedField>',
        'log_content': :'String',
        'sample_size': :'Integer',
        'match_status': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<String>] :field_names The value to assign to the {#field_names} property
    # @option attributes [Array<String>] :field_display_names The value to assign to the {#field_display_names} property
    # @option attributes [Array<OCI::LogAnalytics::Models::ParsedField>] :parsed_field_values The value to assign to the {#parsed_field_values} property
    # @option attributes [String] :log_content The value to assign to the {#log_content} property
    # @option attributes [Integer] :sample_size The value to assign to the {#sample_size} property
    # @option attributes [String] :match_status The value to assign to the {#match_status} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.field_names = attributes[:'fieldNames'] if attributes[:'fieldNames']

      raise 'You cannot provide both :fieldNames and :field_names' if attributes.key?(:'fieldNames') && attributes.key?(:'field_names')

      self.field_names = attributes[:'field_names'] if attributes[:'field_names']

      self.field_display_names = attributes[:'fieldDisplayNames'] if attributes[:'fieldDisplayNames']

      raise 'You cannot provide both :fieldDisplayNames and :field_display_names' if attributes.key?(:'fieldDisplayNames') && attributes.key?(:'field_display_names')

      self.field_display_names = attributes[:'field_display_names'] if attributes[:'field_display_names']

      self.parsed_field_values = attributes[:'parsedFieldValues'] if attributes[:'parsedFieldValues']

      raise 'You cannot provide both :parsedFieldValues and :parsed_field_values' if attributes.key?(:'parsedFieldValues') && attributes.key?(:'parsed_field_values')

      self.parsed_field_values = attributes[:'parsed_field_values'] if attributes[:'parsed_field_values']

      self.log_content = attributes[:'logContent'] if attributes[:'logContent']

      raise 'You cannot provide both :logContent and :log_content' if attributes.key?(:'logContent') && attributes.key?(:'log_content')

      self.log_content = attributes[:'log_content'] if attributes[:'log_content']

      self.sample_size = attributes[:'sampleSize'] if attributes[:'sampleSize']

      raise 'You cannot provide both :sampleSize and :sample_size' if attributes.key?(:'sampleSize') && attributes.key?(:'sample_size')

      self.sample_size = attributes[:'sample_size'] if attributes[:'sample_size']

      self.match_status = attributes[:'matchStatus'] if attributes[:'matchStatus']

      raise 'You cannot provide both :matchStatus and :match_status' if attributes.key?(:'matchStatus') && attributes.key?(:'match_status')

      self.match_status = attributes[:'match_status'] if attributes[:'match_status']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        field_names == other.field_names &&
        field_display_names == other.field_display_names &&
        parsed_field_values == other.parsed_field_values &&
        log_content == other.log_content &&
        sample_size == other.sample_size &&
        match_status == other.match_status
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
      [field_names, field_display_names, parsed_field_values, log_content, sample_size, match_status].hash
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
