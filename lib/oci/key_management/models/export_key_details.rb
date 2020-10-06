# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of the key that you want to wrap and export.
  class KeyManagement::Models::ExportKeyDetails
    ALGORITHM_ENUM = [
      ALGORITHM_RSA_OAEP_AES_SHA256 = 'RSA_OAEP_AES_SHA256'.freeze,
      ALGORITHM_RSA_OAEP_SHA256 = 'RSA_OAEP_SHA256'.freeze
    ].freeze

    # **[Required]** The OCID of the master encryption key associated with the key version you want to export.
    # @return [String]
    attr_accessor :key_id

    # The OCID of the specific key version to export. If not specified, the service exports the current key version.
    #
    # @return [String]
    attr_accessor :key_version_id

    # **[Required]** The encryption algorithm to use to encrypt exportable key material from a software-backed key. Specifying `RSA_OAEP_AES_SHA256`
    # invokes the RSA AES key wrap mechanism, which generates a temporary AES key. The temporary AES key is wrapped by the RSA public
    # wrapping key provided along with the request, creating a wrapped temporary AES key. The temporary AES key is also used to wrap
    # the exportable key material. The wrapped temporary AES key and the wrapped exportable key material are concatenated, producing
    # concatenated blob output that jointly represents them. Specifying `RSA_OAEP_SHA256` means that the software key is wrapped by
    # the RSA public wrapping key provided along with the request.
    #
    # @return [String]
    attr_reader :algorithm

    # **[Required]** The PEM format of the 2048-bit, 3072-bit, or 4096-bit RSA wrapping key in your possession that you want to use to encrypt the key.
    #
    # @return [String]
    attr_accessor :public_key

    # Information that provides context for audit logging. You can provide this additional
    # data as key-value pairs to include in the audit logs when audit logging is enabled.
    #
    # @return [Hash<String, String>]
    attr_accessor :logging_context

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key_id': :'keyId',
        'key_version_id': :'keyVersionId',
        'algorithm': :'algorithm',
        'public_key': :'publicKey',
        'logging_context': :'loggingContext'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key_id': :'String',
        'key_version_id': :'String',
        'algorithm': :'String',
        'public_key': :'String',
        'logging_context': :'Hash<String, String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key_id The value to assign to the {#key_id} property
    # @option attributes [String] :key_version_id The value to assign to the {#key_version_id} property
    # @option attributes [String] :algorithm The value to assign to the {#algorithm} property
    # @option attributes [String] :public_key The value to assign to the {#public_key} property
    # @option attributes [Hash<String, String>] :logging_context The value to assign to the {#logging_context} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key_id = attributes[:'keyId'] if attributes[:'keyId']

      raise 'You cannot provide both :keyId and :key_id' if attributes.key?(:'keyId') && attributes.key?(:'key_id')

      self.key_id = attributes[:'key_id'] if attributes[:'key_id']

      self.key_version_id = attributes[:'keyVersionId'] if attributes[:'keyVersionId']

      raise 'You cannot provide both :keyVersionId and :key_version_id' if attributes.key?(:'keyVersionId') && attributes.key?(:'key_version_id')

      self.key_version_id = attributes[:'key_version_id'] if attributes[:'key_version_id']

      self.algorithm = attributes[:'algorithm'] if attributes[:'algorithm']

      self.public_key = attributes[:'publicKey'] if attributes[:'publicKey']

      raise 'You cannot provide both :publicKey and :public_key' if attributes.key?(:'publicKey') && attributes.key?(:'public_key')

      self.public_key = attributes[:'public_key'] if attributes[:'public_key']

      self.logging_context = attributes[:'loggingContext'] if attributes[:'loggingContext']

      raise 'You cannot provide both :loggingContext and :logging_context' if attributes.key?(:'loggingContext') && attributes.key?(:'logging_context')

      self.logging_context = attributes[:'logging_context'] if attributes[:'logging_context']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] algorithm Object to be assigned
    def algorithm=(algorithm)
      raise "Invalid value for 'algorithm': this must be one of the values in ALGORITHM_ENUM." if algorithm && !ALGORITHM_ENUM.include?(algorithm)

      @algorithm = algorithm
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        key_id == other.key_id &&
        key_version_id == other.key_version_id &&
        algorithm == other.algorithm &&
        public_key == other.public_key &&
        logging_context == other.logging_context
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
      [key_id, key_version_id, algorithm, public_key, logging_context].hash
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
