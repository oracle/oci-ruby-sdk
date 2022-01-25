# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # LogAnalyticsMetaSourceType
  class LogAnalytics::Models::LogAnalyticsMetaSourceType
    # The built in parser name.
    # @return [String]
    attr_accessor :built_in_parser_name

    # The source type description.
    # @return [String]
    attr_accessor :description

    # The source type display name.
    # @return [String]
    attr_accessor :display_name

    # The entity display name.
    # @return [String]
    attr_accessor :entity_display_name

    # The entity internal name.
    # @return [String]
    attr_accessor :entity_name

    # The source type name.
    # @return [String]
    attr_accessor :name

    # The maximum exclude pattern.
    # @return [Integer]
    attr_accessor :maximum_exclude_pattern

    # The maximum include pattern.
    # @return [Integer]
    attr_accessor :maximum_include_pattern

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'built_in_parser_name': :'builtInParserName',
        'description': :'description',
        'display_name': :'displayName',
        'entity_display_name': :'entityDisplayName',
        'entity_name': :'entityName',
        'name': :'name',
        'maximum_exclude_pattern': :'maximumExcludePattern',
        'maximum_include_pattern': :'maximumIncludePattern'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'built_in_parser_name': :'String',
        'description': :'String',
        'display_name': :'String',
        'entity_display_name': :'String',
        'entity_name': :'String',
        'name': :'String',
        'maximum_exclude_pattern': :'Integer',
        'maximum_include_pattern': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :built_in_parser_name The value to assign to the {#built_in_parser_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :entity_display_name The value to assign to the {#entity_display_name} property
    # @option attributes [String] :entity_name The value to assign to the {#entity_name} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [Integer] :maximum_exclude_pattern The value to assign to the {#maximum_exclude_pattern} property
    # @option attributes [Integer] :maximum_include_pattern The value to assign to the {#maximum_include_pattern} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.built_in_parser_name = attributes[:'builtInParserName'] if attributes[:'builtInParserName']

      raise 'You cannot provide both :builtInParserName and :built_in_parser_name' if attributes.key?(:'builtInParserName') && attributes.key?(:'built_in_parser_name')

      self.built_in_parser_name = attributes[:'built_in_parser_name'] if attributes[:'built_in_parser_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.entity_display_name = attributes[:'entityDisplayName'] if attributes[:'entityDisplayName']

      raise 'You cannot provide both :entityDisplayName and :entity_display_name' if attributes.key?(:'entityDisplayName') && attributes.key?(:'entity_display_name')

      self.entity_display_name = attributes[:'entity_display_name'] if attributes[:'entity_display_name']

      self.entity_name = attributes[:'entityName'] if attributes[:'entityName']

      raise 'You cannot provide both :entityName and :entity_name' if attributes.key?(:'entityName') && attributes.key?(:'entity_name')

      self.entity_name = attributes[:'entity_name'] if attributes[:'entity_name']

      self.name = attributes[:'name'] if attributes[:'name']

      self.maximum_exclude_pattern = attributes[:'maximumExcludePattern'] if attributes[:'maximumExcludePattern']

      raise 'You cannot provide both :maximumExcludePattern and :maximum_exclude_pattern' if attributes.key?(:'maximumExcludePattern') && attributes.key?(:'maximum_exclude_pattern')

      self.maximum_exclude_pattern = attributes[:'maximum_exclude_pattern'] if attributes[:'maximum_exclude_pattern']

      self.maximum_include_pattern = attributes[:'maximumIncludePattern'] if attributes[:'maximumIncludePattern']

      raise 'You cannot provide both :maximumIncludePattern and :maximum_include_pattern' if attributes.key?(:'maximumIncludePattern') && attributes.key?(:'maximum_include_pattern')

      self.maximum_include_pattern = attributes[:'maximum_include_pattern'] if attributes[:'maximum_include_pattern']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        built_in_parser_name == other.built_in_parser_name &&
        description == other.description &&
        display_name == other.display_name &&
        entity_display_name == other.entity_display_name &&
        entity_name == other.entity_name &&
        name == other.name &&
        maximum_exclude_pattern == other.maximum_exclude_pattern &&
        maximum_include_pattern == other.maximum_include_pattern
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
      [built_in_parser_name, description, display_name, entity_display_name, entity_name, name, maximum_exclude_pattern, maximum_include_pattern].hash
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
