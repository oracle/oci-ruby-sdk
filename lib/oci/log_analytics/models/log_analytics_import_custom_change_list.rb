# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # LogAnalyticsImportCustomChangeList
  class LogAnalytics::Models::LogAnalyticsImportCustomChangeList
    # createdParserNames
    # @return [Array<String>]
    attr_accessor :created_parser_names

    # updatedParserNames
    # @return [Array<String>]
    attr_accessor :updated_parser_names

    # createdSourceNames
    # @return [Array<String>]
    attr_accessor :created_source_names

    # updatedSourceNames
    # @return [Array<String>]
    attr_accessor :updated_source_names

    # createdFieldDisplayNames
    # @return [Array<String>]
    attr_accessor :created_field_display_names

    # updatedFieldDisplayNames
    # @return [Array<String>]
    attr_accessor :updated_field_display_names

    # conflictParserNames
    # @return [Array<String>]
    attr_accessor :conflict_parser_names

    # conflictSourceNames
    # @return [Array<String>]
    attr_accessor :conflict_source_names

    # conflictFieldDisplayNames
    # @return [Array<String>]
    attr_accessor :conflict_field_display_names

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'created_parser_names': :'createdParserNames',
        'updated_parser_names': :'updatedParserNames',
        'created_source_names': :'createdSourceNames',
        'updated_source_names': :'updatedSourceNames',
        'created_field_display_names': :'createdFieldDisplayNames',
        'updated_field_display_names': :'updatedFieldDisplayNames',
        'conflict_parser_names': :'conflictParserNames',
        'conflict_source_names': :'conflictSourceNames',
        'conflict_field_display_names': :'conflictFieldDisplayNames'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'created_parser_names': :'Array<String>',
        'updated_parser_names': :'Array<String>',
        'created_source_names': :'Array<String>',
        'updated_source_names': :'Array<String>',
        'created_field_display_names': :'Array<String>',
        'updated_field_display_names': :'Array<String>',
        'conflict_parser_names': :'Array<String>',
        'conflict_source_names': :'Array<String>',
        'conflict_field_display_names': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<String>] :created_parser_names The value to assign to the {#created_parser_names} property
    # @option attributes [Array<String>] :updated_parser_names The value to assign to the {#updated_parser_names} property
    # @option attributes [Array<String>] :created_source_names The value to assign to the {#created_source_names} property
    # @option attributes [Array<String>] :updated_source_names The value to assign to the {#updated_source_names} property
    # @option attributes [Array<String>] :created_field_display_names The value to assign to the {#created_field_display_names} property
    # @option attributes [Array<String>] :updated_field_display_names The value to assign to the {#updated_field_display_names} property
    # @option attributes [Array<String>] :conflict_parser_names The value to assign to the {#conflict_parser_names} property
    # @option attributes [Array<String>] :conflict_source_names The value to assign to the {#conflict_source_names} property
    # @option attributes [Array<String>] :conflict_field_display_names The value to assign to the {#conflict_field_display_names} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.created_parser_names = attributes[:'createdParserNames'] if attributes[:'createdParserNames']

      raise 'You cannot provide both :createdParserNames and :created_parser_names' if attributes.key?(:'createdParserNames') && attributes.key?(:'created_parser_names')

      self.created_parser_names = attributes[:'created_parser_names'] if attributes[:'created_parser_names']

      self.updated_parser_names = attributes[:'updatedParserNames'] if attributes[:'updatedParserNames']

      raise 'You cannot provide both :updatedParserNames and :updated_parser_names' if attributes.key?(:'updatedParserNames') && attributes.key?(:'updated_parser_names')

      self.updated_parser_names = attributes[:'updated_parser_names'] if attributes[:'updated_parser_names']

      self.created_source_names = attributes[:'createdSourceNames'] if attributes[:'createdSourceNames']

      raise 'You cannot provide both :createdSourceNames and :created_source_names' if attributes.key?(:'createdSourceNames') && attributes.key?(:'created_source_names')

      self.created_source_names = attributes[:'created_source_names'] if attributes[:'created_source_names']

      self.updated_source_names = attributes[:'updatedSourceNames'] if attributes[:'updatedSourceNames']

      raise 'You cannot provide both :updatedSourceNames and :updated_source_names' if attributes.key?(:'updatedSourceNames') && attributes.key?(:'updated_source_names')

      self.updated_source_names = attributes[:'updated_source_names'] if attributes[:'updated_source_names']

      self.created_field_display_names = attributes[:'createdFieldDisplayNames'] if attributes[:'createdFieldDisplayNames']

      raise 'You cannot provide both :createdFieldDisplayNames and :created_field_display_names' if attributes.key?(:'createdFieldDisplayNames') && attributes.key?(:'created_field_display_names')

      self.created_field_display_names = attributes[:'created_field_display_names'] if attributes[:'created_field_display_names']

      self.updated_field_display_names = attributes[:'updatedFieldDisplayNames'] if attributes[:'updatedFieldDisplayNames']

      raise 'You cannot provide both :updatedFieldDisplayNames and :updated_field_display_names' if attributes.key?(:'updatedFieldDisplayNames') && attributes.key?(:'updated_field_display_names')

      self.updated_field_display_names = attributes[:'updated_field_display_names'] if attributes[:'updated_field_display_names']

      self.conflict_parser_names = attributes[:'conflictParserNames'] if attributes[:'conflictParserNames']

      raise 'You cannot provide both :conflictParserNames and :conflict_parser_names' if attributes.key?(:'conflictParserNames') && attributes.key?(:'conflict_parser_names')

      self.conflict_parser_names = attributes[:'conflict_parser_names'] if attributes[:'conflict_parser_names']

      self.conflict_source_names = attributes[:'conflictSourceNames'] if attributes[:'conflictSourceNames']

      raise 'You cannot provide both :conflictSourceNames and :conflict_source_names' if attributes.key?(:'conflictSourceNames') && attributes.key?(:'conflict_source_names')

      self.conflict_source_names = attributes[:'conflict_source_names'] if attributes[:'conflict_source_names']

      self.conflict_field_display_names = attributes[:'conflictFieldDisplayNames'] if attributes[:'conflictFieldDisplayNames']

      raise 'You cannot provide both :conflictFieldDisplayNames and :conflict_field_display_names' if attributes.key?(:'conflictFieldDisplayNames') && attributes.key?(:'conflict_field_display_names')

      self.conflict_field_display_names = attributes[:'conflict_field_display_names'] if attributes[:'conflict_field_display_names']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        created_parser_names == other.created_parser_names &&
        updated_parser_names == other.updated_parser_names &&
        created_source_names == other.created_source_names &&
        updated_source_names == other.updated_source_names &&
        created_field_display_names == other.created_field_display_names &&
        updated_field_display_names == other.updated_field_display_names &&
        conflict_parser_names == other.conflict_parser_names &&
        conflict_source_names == other.conflict_source_names &&
        conflict_field_display_names == other.conflict_field_display_names
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
      [created_parser_names, updated_parser_names, created_source_names, updated_source_names, created_field_display_names, updated_field_display_names, conflict_parser_names, conflict_source_names, conflict_field_display_names].hash
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
