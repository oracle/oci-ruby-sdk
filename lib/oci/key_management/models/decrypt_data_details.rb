# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # DecryptDataDetails model.
  class KeyManagement::Models::DecryptDataDetails
    ENCRYPTION_ALGORITHM_ENUM = [
      ENCRYPTION_ALGORITHM_AES_256_GCM = 'AES_256_GCM'.freeze,
      ENCRYPTION_ALGORITHM_RSA_OAEP_SHA_1 = 'RSA_OAEP_SHA_1'.freeze,
      ENCRYPTION_ALGORITHM_RSA_OAEP_SHA_256 = 'RSA_OAEP_SHA_256'.freeze
    ].freeze

    # Information that can be used to provide an encryption context for the encrypted data.
    # The length of the string representation of the associated data must be fewer than 4096 characters.
    #
    # @return [Hash<String, String>]
    attr_accessor :associated_data

    # **[Required]** The encrypted data to decrypt.
    # @return [String]
    attr_accessor :ciphertext

    # **[Required]** The OCID of the key used to encrypt the ciphertext.
    # @return [String]
    attr_accessor :key_id

    # Information that provides context for audit logging. You can provide this additional
    # data as key-value pairs to include in audit logs when audit logging is enabled.
    #
    # @return [Hash<String, String>]
    attr_accessor :logging_context

    # The OCID of the key version used to encrypt the ciphertext.
    # @return [String]
    attr_accessor :key_version_id

    # The encryption algorithm to use to encrypt or decrypt data with a customer-managed key.
    # `AES_256_GCM` indicates that the key is a symmetric key that uses the Advanced Encryption Standard (AES) algorithm and
    # that the mode of encryption is the Galois/Counter Mode (GCM). `RSA_OAEP_SHA_1` indicates that the
    # key is an asymmetric key that uses the RSA encryption algorithm and uses Optimal Asymmetric Encryption Padding (OAEP).
    # `RSA_OAEP_SHA_256` indicates that the key is an asymmetric key that uses the RSA encryption algorithm with a SHA-256 hash
    # and uses OAEP.
    #
    # @return [String]
    attr_reader :encryption_algorithm

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'associated_data': :'associatedData',
        'ciphertext': :'ciphertext',
        'key_id': :'keyId',
        'logging_context': :'loggingContext',
        'key_version_id': :'keyVersionId',
        'encryption_algorithm': :'encryptionAlgorithm'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'associated_data': :'Hash<String, String>',
        'ciphertext': :'String',
        'key_id': :'String',
        'logging_context': :'Hash<String, String>',
        'key_version_id': :'String',
        'encryption_algorithm': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Hash<String, String>] :associated_data The value to assign to the {#associated_data} property
    # @option attributes [String] :ciphertext The value to assign to the {#ciphertext} property
    # @option attributes [String] :key_id The value to assign to the {#key_id} property
    # @option attributes [Hash<String, String>] :logging_context The value to assign to the {#logging_context} property
    # @option attributes [String] :key_version_id The value to assign to the {#key_version_id} property
    # @option attributes [String] :encryption_algorithm The value to assign to the {#encryption_algorithm} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.associated_data = attributes[:'associatedData'] if attributes[:'associatedData']

      raise 'You cannot provide both :associatedData and :associated_data' if attributes.key?(:'associatedData') && attributes.key?(:'associated_data')

      self.associated_data = attributes[:'associated_data'] if attributes[:'associated_data']

      self.ciphertext = attributes[:'ciphertext'] if attributes[:'ciphertext']

      self.key_id = attributes[:'keyId'] if attributes[:'keyId']

      raise 'You cannot provide both :keyId and :key_id' if attributes.key?(:'keyId') && attributes.key?(:'key_id')

      self.key_id = attributes[:'key_id'] if attributes[:'key_id']

      self.logging_context = attributes[:'loggingContext'] if attributes[:'loggingContext']

      raise 'You cannot provide both :loggingContext and :logging_context' if attributes.key?(:'loggingContext') && attributes.key?(:'logging_context')

      self.logging_context = attributes[:'logging_context'] if attributes[:'logging_context']

      self.key_version_id = attributes[:'keyVersionId'] if attributes[:'keyVersionId']

      raise 'You cannot provide both :keyVersionId and :key_version_id' if attributes.key?(:'keyVersionId') && attributes.key?(:'key_version_id')

      self.key_version_id = attributes[:'key_version_id'] if attributes[:'key_version_id']

      self.encryption_algorithm = attributes[:'encryptionAlgorithm'] if attributes[:'encryptionAlgorithm']
      self.encryption_algorithm = "AES_256_GCM" if encryption_algorithm.nil? && !attributes.key?(:'encryptionAlgorithm') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :encryptionAlgorithm and :encryption_algorithm' if attributes.key?(:'encryptionAlgorithm') && attributes.key?(:'encryption_algorithm')

      self.encryption_algorithm = attributes[:'encryption_algorithm'] if attributes[:'encryption_algorithm']
      self.encryption_algorithm = "AES_256_GCM" if encryption_algorithm.nil? && !attributes.key?(:'encryptionAlgorithm') && !attributes.key?(:'encryption_algorithm') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] encryption_algorithm Object to be assigned
    def encryption_algorithm=(encryption_algorithm)
      raise "Invalid value for 'encryption_algorithm': this must be one of the values in ENCRYPTION_ALGORITHM_ENUM." if encryption_algorithm && !ENCRYPTION_ALGORITHM_ENUM.include?(encryption_algorithm)

      @encryption_algorithm = encryption_algorithm
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        associated_data == other.associated_data &&
        ciphertext == other.ciphertext &&
        key_id == other.key_id &&
        logging_context == other.logging_context &&
        key_version_id == other.key_version_id &&
        encryption_algorithm == other.encryption_algorithm
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
      [associated_data, ciphertext, key_id, logging_context, key_version_id, encryption_algorithm].hash
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
