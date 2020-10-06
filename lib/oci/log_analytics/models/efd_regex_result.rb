# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # EfdRegexResult
  class LogAnalytics::Models::EfdRegexResult
    # baseFieldName
    # @return [String]
    attr_accessor :base_field_name

    # id
    # @return [Integer]
    attr_accessor :id

    # @return [OCI::LogAnalytics::Models::RegexMatchResult]
    attr_accessor :match_result

    # parsedFieldCount
    # @return [Integer]
    attr_accessor :parsed_field_count

    # parsedFields
    # @return [Hash<String, String>]
    attr_accessor :parsed_fields

    # regex
    # @return [String]
    attr_accessor :regex

    # status
    # @return [String]
    attr_accessor :status

    # statusDescription
    # @return [String]
    attr_accessor :status_description

    # isValidRegexSyntax
    # @return [BOOLEAN]
    attr_accessor :is_valid_regex_syntax

    # violations
    # @return [Array<OCI::LogAnalytics::Models::Violation>]
    attr_accessor :violations

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'base_field_name': :'baseFieldName',
        'id': :'id',
        'match_result': :'matchResult',
        'parsed_field_count': :'parsedFieldCount',
        'parsed_fields': :'parsedFields',
        'regex': :'regex',
        'status': :'status',
        'status_description': :'statusDescription',
        'is_valid_regex_syntax': :'isValidRegexSyntax',
        'violations': :'violations'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'base_field_name': :'String',
        'id': :'Integer',
        'match_result': :'OCI::LogAnalytics::Models::RegexMatchResult',
        'parsed_field_count': :'Integer',
        'parsed_fields': :'Hash<String, String>',
        'regex': :'String',
        'status': :'String',
        'status_description': :'String',
        'is_valid_regex_syntax': :'BOOLEAN',
        'violations': :'Array<OCI::LogAnalytics::Models::Violation>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :base_field_name The value to assign to the {#base_field_name} property
    # @option attributes [Integer] :id The value to assign to the {#id} property
    # @option attributes [OCI::LogAnalytics::Models::RegexMatchResult] :match_result The value to assign to the {#match_result} property
    # @option attributes [Integer] :parsed_field_count The value to assign to the {#parsed_field_count} property
    # @option attributes [Hash<String, String>] :parsed_fields The value to assign to the {#parsed_fields} property
    # @option attributes [String] :regex The value to assign to the {#regex} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :status_description The value to assign to the {#status_description} property
    # @option attributes [BOOLEAN] :is_valid_regex_syntax The value to assign to the {#is_valid_regex_syntax} property
    # @option attributes [Array<OCI::LogAnalytics::Models::Violation>] :violations The value to assign to the {#violations} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.base_field_name = attributes[:'baseFieldName'] if attributes[:'baseFieldName']

      raise 'You cannot provide both :baseFieldName and :base_field_name' if attributes.key?(:'baseFieldName') && attributes.key?(:'base_field_name')

      self.base_field_name = attributes[:'base_field_name'] if attributes[:'base_field_name']

      self.id = attributes[:'id'] if attributes[:'id']

      self.match_result = attributes[:'matchResult'] if attributes[:'matchResult']

      raise 'You cannot provide both :matchResult and :match_result' if attributes.key?(:'matchResult') && attributes.key?(:'match_result')

      self.match_result = attributes[:'match_result'] if attributes[:'match_result']

      self.parsed_field_count = attributes[:'parsedFieldCount'] if attributes[:'parsedFieldCount']

      raise 'You cannot provide both :parsedFieldCount and :parsed_field_count' if attributes.key?(:'parsedFieldCount') && attributes.key?(:'parsed_field_count')

      self.parsed_field_count = attributes[:'parsed_field_count'] if attributes[:'parsed_field_count']

      self.parsed_fields = attributes[:'parsedFields'] if attributes[:'parsedFields']

      raise 'You cannot provide both :parsedFields and :parsed_fields' if attributes.key?(:'parsedFields') && attributes.key?(:'parsed_fields')

      self.parsed_fields = attributes[:'parsed_fields'] if attributes[:'parsed_fields']

      self.regex = attributes[:'regex'] if attributes[:'regex']

      self.status = attributes[:'status'] if attributes[:'status']

      self.status_description = attributes[:'statusDescription'] if attributes[:'statusDescription']

      raise 'You cannot provide both :statusDescription and :status_description' if attributes.key?(:'statusDescription') && attributes.key?(:'status_description')

      self.status_description = attributes[:'status_description'] if attributes[:'status_description']

      self.is_valid_regex_syntax = attributes[:'isValidRegexSyntax'] unless attributes[:'isValidRegexSyntax'].nil?

      raise 'You cannot provide both :isValidRegexSyntax and :is_valid_regex_syntax' if attributes.key?(:'isValidRegexSyntax') && attributes.key?(:'is_valid_regex_syntax')

      self.is_valid_regex_syntax = attributes[:'is_valid_regex_syntax'] unless attributes[:'is_valid_regex_syntax'].nil?

      self.violations = attributes[:'violations'] if attributes[:'violations']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        base_field_name == other.base_field_name &&
        id == other.id &&
        match_result == other.match_result &&
        parsed_field_count == other.parsed_field_count &&
        parsed_fields == other.parsed_fields &&
        regex == other.regex &&
        status == other.status &&
        status_description == other.status_description &&
        is_valid_regex_syntax == other.is_valid_regex_syntax &&
        violations == other.violations
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
      [base_field_name, id, match_result, parsed_field_count, parsed_fields, regex, status, status_description, is_valid_regex_syntax, violations].hash
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
