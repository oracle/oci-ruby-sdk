# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The result of a comparison of two lines in the two content input strings.
  class LogAnalytics::Models::CompareLineResult
    # A line from the content on the left. This may be empty if there is no matching line on
    # the left for a line in the right content.
    #
    # @return [String]
    attr_accessor :left_content

    # A line from the content on the right. This may be empty if there is no matching line on
    # the right for a line in the left content.
    #
    # @return [String]
    attr_accessor :right_content

    # The result of the line comparison. An empty string means the lines being compared are the
    # same. A pipe, |, means the lines are different, and a caret, > or <, means the
    # line is only found either on the right or the left.
    #
    # @return [String]
    attr_accessor :diff_type

    # A comma delimited set of indices that identify which characters are different from those
    # in the right string.
    #
    # @return [String]
    attr_accessor :left_indices

    # A comma delimited set of indices that identify which characters are different from those
    # in the left string.
    #
    # @return [String]
    attr_accessor :right_indices

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'left_content': :'leftContent',
        'right_content': :'rightContent',
        'diff_type': :'diffType',
        'left_indices': :'leftIndices',
        'right_indices': :'rightIndices'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'left_content': :'String',
        'right_content': :'String',
        'diff_type': :'String',
        'left_indices': :'String',
        'right_indices': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :left_content The value to assign to the {#left_content} property
    # @option attributes [String] :right_content The value to assign to the {#right_content} property
    # @option attributes [String] :diff_type The value to assign to the {#diff_type} property
    # @option attributes [String] :left_indices The value to assign to the {#left_indices} property
    # @option attributes [String] :right_indices The value to assign to the {#right_indices} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.left_content = attributes[:'leftContent'] if attributes[:'leftContent']

      raise 'You cannot provide both :leftContent and :left_content' if attributes.key?(:'leftContent') && attributes.key?(:'left_content')

      self.left_content = attributes[:'left_content'] if attributes[:'left_content']

      self.right_content = attributes[:'rightContent'] if attributes[:'rightContent']

      raise 'You cannot provide both :rightContent and :right_content' if attributes.key?(:'rightContent') && attributes.key?(:'right_content')

      self.right_content = attributes[:'right_content'] if attributes[:'right_content']

      self.diff_type = attributes[:'diffType'] if attributes[:'diffType']

      raise 'You cannot provide both :diffType and :diff_type' if attributes.key?(:'diffType') && attributes.key?(:'diff_type')

      self.diff_type = attributes[:'diff_type'] if attributes[:'diff_type']

      self.left_indices = attributes[:'leftIndices'] if attributes[:'leftIndices']

      raise 'You cannot provide both :leftIndices and :left_indices' if attributes.key?(:'leftIndices') && attributes.key?(:'left_indices')

      self.left_indices = attributes[:'left_indices'] if attributes[:'left_indices']

      self.right_indices = attributes[:'rightIndices'] if attributes[:'rightIndices']

      raise 'You cannot provide both :rightIndices and :right_indices' if attributes.key?(:'rightIndices') && attributes.key?(:'right_indices')

      self.right_indices = attributes[:'right_indices'] if attributes[:'right_indices']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        left_content == other.left_content &&
        right_content == other.right_content &&
        diff_type == other.diff_type &&
        left_indices == other.left_indices &&
        right_indices == other.right_indices
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
      [left_content, right_content, diff_type, left_indices, right_indices].hash
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
