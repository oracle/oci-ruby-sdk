# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # EncryptDataDetails model.
  class KeyManagement::Models::EncryptDataDetails
    # Information that can be used to provide an encryption context for the
    # encrypted data. The length of the string representation of the associatedData
    # must be fewer than 4096 characters.
    #
    # @return [Hash<String, String>]
    attr_accessor :associated_data

    # **[Required]** The OCID of the key to encrypt with.
    # @return [String]
    attr_accessor :key_id

    # Information that can be used to provide context for audit logging. It is a map that contains any addtional
    # data the users may have and will be added to the audit logs (if audit logging is enabled)
    #
    # @return [Hash<String, String>]
    attr_accessor :logging_context

    # **[Required]** The plaintext data to encrypt.
    # @return [String]
    attr_accessor :plaintext

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'associated_data': :'associatedData',
        'key_id': :'keyId',
        'logging_context': :'loggingContext',
        'plaintext': :'plaintext'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'associated_data': :'Hash<String, String>',
        'key_id': :'String',
        'logging_context': :'Hash<String, String>',
        'plaintext': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Hash<String, String>] :associated_data The value to assign to the {#associated_data} property
    # @option attributes [String] :key_id The value to assign to the {#key_id} property
    # @option attributes [Hash<String, String>] :logging_context The value to assign to the {#logging_context} property
    # @option attributes [String] :plaintext The value to assign to the {#plaintext} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.associated_data = attributes[:'associatedData'] if attributes[:'associatedData']

      raise 'You cannot provide both :associatedData and :associated_data' if attributes.key?(:'associatedData') && attributes.key?(:'associated_data')

      self.associated_data = attributes[:'associated_data'] if attributes[:'associated_data']

      self.key_id = attributes[:'keyId'] if attributes[:'keyId']

      raise 'You cannot provide both :keyId and :key_id' if attributes.key?(:'keyId') && attributes.key?(:'key_id')

      self.key_id = attributes[:'key_id'] if attributes[:'key_id']

      self.logging_context = attributes[:'loggingContext'] if attributes[:'loggingContext']

      raise 'You cannot provide both :loggingContext and :logging_context' if attributes.key?(:'loggingContext') && attributes.key?(:'logging_context')

      self.logging_context = attributes[:'logging_context'] if attributes[:'logging_context']

      self.plaintext = attributes[:'plaintext'] if attributes[:'plaintext']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        associated_data == other.associated_data &&
        key_id == other.key_id &&
        logging_context == other.logging_context &&
        plaintext == other.plaintext
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
      [associated_data, key_id, logging_context, plaintext].hash
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
