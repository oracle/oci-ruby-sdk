# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200630
require 'date'
require_relative 'related_object_type_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # SQL details
  class Opsi::Models::SqlTypeDetails < Opsi::Models::RelatedObjectTypeDetails
    # **[Required]** SQL identifier
    # @return [String]
    attr_accessor :sql_id

    # **[Required]** First 3800 characters of the SQL text
    # @return [String]
    attr_accessor :sql_text

    # **[Required]** SQL identifier
    # @return [BOOLEAN]
    attr_accessor :is_sql_text_truncated

    # **[Required]** SQL command name (such as SELECT, INSERT)
    # @return [String]
    attr_accessor :sql_command

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'sql_id': :'sqlId',
        'sql_text': :'sqlText',
        'is_sql_text_truncated': :'isSqlTextTruncated',
        'sql_command': :'sqlCommand'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'sql_id': :'String',
        'sql_text': :'String',
        'is_sql_text_truncated': :'BOOLEAN',
        'sql_command': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :sql_id The value to assign to the {#sql_id} property
    # @option attributes [String] :sql_text The value to assign to the {#sql_text} property
    # @option attributes [BOOLEAN] :is_sql_text_truncated The value to assign to the {#is_sql_text_truncated} property
    # @option attributes [String] :sql_command The value to assign to the {#sql_command} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'SQL'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.sql_id = attributes[:'sqlId'] if attributes[:'sqlId']

      raise 'You cannot provide both :sqlId and :sql_id' if attributes.key?(:'sqlId') && attributes.key?(:'sql_id')

      self.sql_id = attributes[:'sql_id'] if attributes[:'sql_id']

      self.sql_text = attributes[:'sqlText'] if attributes[:'sqlText']

      raise 'You cannot provide both :sqlText and :sql_text' if attributes.key?(:'sqlText') && attributes.key?(:'sql_text')

      self.sql_text = attributes[:'sql_text'] if attributes[:'sql_text']

      self.is_sql_text_truncated = attributes[:'isSqlTextTruncated'] unless attributes[:'isSqlTextTruncated'].nil?

      raise 'You cannot provide both :isSqlTextTruncated and :is_sql_text_truncated' if attributes.key?(:'isSqlTextTruncated') && attributes.key?(:'is_sql_text_truncated')

      self.is_sql_text_truncated = attributes[:'is_sql_text_truncated'] unless attributes[:'is_sql_text_truncated'].nil?

      self.sql_command = attributes[:'sqlCommand'] if attributes[:'sqlCommand']

      raise 'You cannot provide both :sqlCommand and :sql_command' if attributes.key?(:'sqlCommand') && attributes.key?(:'sql_command')

      self.sql_command = attributes[:'sql_command'] if attributes[:'sql_command']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        sql_id == other.sql_id &&
        sql_text == other.sql_text &&
        is_sql_text_truncated == other.is_sql_text_truncated &&
        sql_command == other.sql_command
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
      [type, sql_id, sql_text, is_sql_text_truncated, sql_command].hash
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