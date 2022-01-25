# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details about a line within the difference.
  class Devops::Models::DiffLineDetails
    CONFLICT_MARKER_ENUM = [
      CONFLICT_MARKER_BASE = 'BASE'.freeze,
      CONFLICT_MARKER_TARGET = 'TARGET'.freeze,
      CONFLICT_MARKER_MARKER = 'MARKER'.freeze,
      CONFLICT_MARKER_NONE = 'NONE'.freeze,
      CONFLICT_MARKER_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The number of a line in the base version.
    # @return [Integer]
    attr_accessor :base_line

    # The number of a line in the target version.
    # @return [Integer]
    attr_accessor :target_line

    # The contents of a line.
    # @return [String]
    attr_accessor :line_content

    # Indicates whether a line in a conflicted section of the difference is from the base version, the target version, or if its just a marker indicating the beginning, middle, or end of a conflicted section.
    # @return [String]
    attr_reader :conflict_marker

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'base_line': :'baseLine',
        'target_line': :'targetLine',
        'line_content': :'lineContent',
        'conflict_marker': :'conflictMarker'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'base_line': :'Integer',
        'target_line': :'Integer',
        'line_content': :'String',
        'conflict_marker': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :base_line The value to assign to the {#base_line} property
    # @option attributes [Integer] :target_line The value to assign to the {#target_line} property
    # @option attributes [String] :line_content The value to assign to the {#line_content} property
    # @option attributes [String] :conflict_marker The value to assign to the {#conflict_marker} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.base_line = attributes[:'baseLine'] if attributes[:'baseLine']

      raise 'You cannot provide both :baseLine and :base_line' if attributes.key?(:'baseLine') && attributes.key?(:'base_line')

      self.base_line = attributes[:'base_line'] if attributes[:'base_line']

      self.target_line = attributes[:'targetLine'] if attributes[:'targetLine']

      raise 'You cannot provide both :targetLine and :target_line' if attributes.key?(:'targetLine') && attributes.key?(:'target_line')

      self.target_line = attributes[:'target_line'] if attributes[:'target_line']

      self.line_content = attributes[:'lineContent'] if attributes[:'lineContent']

      raise 'You cannot provide both :lineContent and :line_content' if attributes.key?(:'lineContent') && attributes.key?(:'line_content')

      self.line_content = attributes[:'line_content'] if attributes[:'line_content']

      self.conflict_marker = attributes[:'conflictMarker'] if attributes[:'conflictMarker']

      raise 'You cannot provide both :conflictMarker and :conflict_marker' if attributes.key?(:'conflictMarker') && attributes.key?(:'conflict_marker')

      self.conflict_marker = attributes[:'conflict_marker'] if attributes[:'conflict_marker']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] conflict_marker Object to be assigned
    def conflict_marker=(conflict_marker)
      # rubocop:disable Style/ConditionalAssignment
      if conflict_marker && !CONFLICT_MARKER_ENUM.include?(conflict_marker)
        OCI.logger.debug("Unknown value for 'conflict_marker' [" + conflict_marker + "]. Mapping to 'CONFLICT_MARKER_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @conflict_marker = CONFLICT_MARKER_UNKNOWN_ENUM_VALUE
      else
        @conflict_marker = conflict_marker
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        base_line == other.base_line &&
        target_line == other.target_line &&
        line_content == other.line_content &&
        conflict_marker == other.conflict_marker
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
      [base_line, target_line, line_content, conflict_marker].hash
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
