# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information about connectivity validation results
  class DataConnectivity::Models::ConnectivityValidation
    # **[Required]** Total number of validation messages
    # @return [Integer]
    attr_accessor :total_message_count

    # Total number of validation error messages
    # @return [Integer]
    attr_accessor :error_message_count

    # Total number of validation warning messages
    # @return [Integer]
    attr_accessor :warn_message_count

    # Total number of validation information messages
    # @return [Integer]
    attr_accessor :info_message_count

    # Detailed information of the connectivity validation.
    # @return [Hash<String, Array<OCI::DataConnectivity::Models::ValidationMessage>>]
    attr_accessor :validation_messages

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'total_message_count': :'totalMessageCount',
        'error_message_count': :'errorMessageCount',
        'warn_message_count': :'warnMessageCount',
        'info_message_count': :'infoMessageCount',
        'validation_messages': :'validationMessages'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'total_message_count': :'Integer',
        'error_message_count': :'Integer',
        'warn_message_count': :'Integer',
        'info_message_count': :'Integer',
        'validation_messages': :'Hash<String, Array<OCI::DataConnectivity::Models::ValidationMessage>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :total_message_count The value to assign to the {#total_message_count} property
    # @option attributes [Integer] :error_message_count The value to assign to the {#error_message_count} property
    # @option attributes [Integer] :warn_message_count The value to assign to the {#warn_message_count} property
    # @option attributes [Integer] :info_message_count The value to assign to the {#info_message_count} property
    # @option attributes [Hash<String, Array<OCI::DataConnectivity::Models::ValidationMessage>>] :validation_messages The value to assign to the {#validation_messages} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.total_message_count = attributes[:'totalMessageCount'] if attributes[:'totalMessageCount']

      raise 'You cannot provide both :totalMessageCount and :total_message_count' if attributes.key?(:'totalMessageCount') && attributes.key?(:'total_message_count')

      self.total_message_count = attributes[:'total_message_count'] if attributes[:'total_message_count']

      self.error_message_count = attributes[:'errorMessageCount'] if attributes[:'errorMessageCount']

      raise 'You cannot provide both :errorMessageCount and :error_message_count' if attributes.key?(:'errorMessageCount') && attributes.key?(:'error_message_count')

      self.error_message_count = attributes[:'error_message_count'] if attributes[:'error_message_count']

      self.warn_message_count = attributes[:'warnMessageCount'] if attributes[:'warnMessageCount']

      raise 'You cannot provide both :warnMessageCount and :warn_message_count' if attributes.key?(:'warnMessageCount') && attributes.key?(:'warn_message_count')

      self.warn_message_count = attributes[:'warn_message_count'] if attributes[:'warn_message_count']

      self.info_message_count = attributes[:'infoMessageCount'] if attributes[:'infoMessageCount']

      raise 'You cannot provide both :infoMessageCount and :info_message_count' if attributes.key?(:'infoMessageCount') && attributes.key?(:'info_message_count')

      self.info_message_count = attributes[:'info_message_count'] if attributes[:'info_message_count']

      self.validation_messages = attributes[:'validationMessages'] if attributes[:'validationMessages']

      raise 'You cannot provide both :validationMessages and :validation_messages' if attributes.key?(:'validationMessages') && attributes.key?(:'validation_messages')

      self.validation_messages = attributes[:'validation_messages'] if attributes[:'validation_messages']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        total_message_count == other.total_message_count &&
        error_message_count == other.error_message_count &&
        warn_message_count == other.warn_message_count &&
        info_message_count == other.info_message_count &&
        validation_messages == other.validation_messages
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
      [total_message_count, error_message_count, warn_message_count, info_message_count, validation_messages].hash
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