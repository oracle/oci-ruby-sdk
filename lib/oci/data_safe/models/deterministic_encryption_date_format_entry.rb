# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20181201
require 'date'
require_relative 'format_entry'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The Deterministic Encryption (Date) masking format encrypts column data using a cryptographic
  # key and Advanced Encryption Standard (AES 128). It can be used to encrypt date columns only.
  # It requires a range of dates as input defined by the startDate and endDate attributes. The
  # start date must be less than or equal to the end date.
  #
  # The original column values in all the rows must be within the specified date range. The
  # encrypted values are also within the specified range. Therefore, to ensure uniqueness, the
  # total number of dates in the range must be greater than or equal to the number of distinct
  # original values in the column. If an original value is not in the specified date range, it
  # might not produce a one-to-one mapping. All non-confirming values are mapped to a single
  # encrypted value, thereby producing a many-to-one mapping.
  #
  # Deterministic Encryption (Date) is a format-preserving, deterministic and reversible masking
  # format, which requires a seed value while submitting a masking work request. Passing the
  # same seed value when masking multiple times or masking different databases ensures that
  # the data is masked deterministically. To learn more, check Deterministic Encryption in the
  # Data Safe documentation.
  #
  class DataSafe::Models::DeterministicEncryptionDateFormatEntry < DataSafe::Models::FormatEntry
    # **[Required]** The lower bound of the range within which all the original column values fall.
    # The start date must be less than or equal to the end date.
    #
    # @return [DateTime]
    attr_accessor :start_date

    # **[Required]** The upper bound of the range within which all the original column values fall.
    # The end date must be greater than or equal to the start date.
    #
    # @return [DateTime]
    attr_accessor :end_date

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'description': :'description',
        'start_date': :'startDate',
        'end_date': :'endDate'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'description': :'String',
        'start_date': :'DateTime',
        'end_date': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :description The value to assign to the {OCI::DataSafe::Models::FormatEntry#description #description} proprety
    # @option attributes [DateTime] :start_date The value to assign to the {#start_date} property
    # @option attributes [DateTime] :end_date The value to assign to the {#end_date} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'DETERMINISTIC_ENCRYPTION_DATE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.start_date = attributes[:'startDate'] if attributes[:'startDate']

      raise 'You cannot provide both :startDate and :start_date' if attributes.key?(:'startDate') && attributes.key?(:'start_date')

      self.start_date = attributes[:'start_date'] if attributes[:'start_date']

      self.end_date = attributes[:'endDate'] if attributes[:'endDate']

      raise 'You cannot provide both :endDate and :end_date' if attributes.key?(:'endDate') && attributes.key?(:'end_date')

      self.end_date = attributes[:'end_date'] if attributes[:'end_date']
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
        description == other.description &&
        start_date == other.start_date &&
        end_date == other.end_date
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
      [type, description, start_date, end_date].hash
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
