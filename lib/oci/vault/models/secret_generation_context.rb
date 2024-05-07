# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20180608
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Captures a configurable set of secret generation rules such as length, base characters, additional characters, and so on.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Vault::Models::SecretGenerationContext
    GENERATION_TYPE_ENUM = [
      GENERATION_TYPE_PASSPHRASE = 'PASSPHRASE'.freeze,
      GENERATION_TYPE_SSH_KEY = 'SSH_KEY'.freeze,
      GENERATION_TYPE_BYTES = 'BYTES'.freeze,
      GENERATION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Name of the predefined secret generation type.
    # @return [String]
    attr_reader :generation_type

    # SecretTemplate captures structure in which customer wants to store secrets. This is optional and a default structure is available for each secret type.
    # The template can have any structure with static values that are not generated. Within the template, you can insert predefined placeholders to store secrets.
    # These placeholders are later replaced with the generated content and saved as a Base64 encoded content.
    #
    # @return [String]
    attr_accessor :secret_template

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'generation_type': :'generationType',
        'secret_template': :'secretTemplate'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'generation_type': :'String',
        'secret_template': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'generationType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Vault::Models::PassphraseGenerationContext' if type == 'PASSPHRASE'
      return 'OCI::Vault::Models::SshKeyGenerationContext' if type == 'SSH_KEY'
      return 'OCI::Vault::Models::BytesGenerationContext' if type == 'BYTES'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Vault::Models::SecretGenerationContext'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :generation_type The value to assign to the {#generation_type} property
    # @option attributes [String] :secret_template The value to assign to the {#secret_template} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.generation_type = attributes[:'generationType'] if attributes[:'generationType']

      raise 'You cannot provide both :generationType and :generation_type' if attributes.key?(:'generationType') && attributes.key?(:'generation_type')

      self.generation_type = attributes[:'generation_type'] if attributes[:'generation_type']

      self.secret_template = attributes[:'secretTemplate'] if attributes[:'secretTemplate']

      raise 'You cannot provide both :secretTemplate and :secret_template' if attributes.key?(:'secretTemplate') && attributes.key?(:'secret_template')

      self.secret_template = attributes[:'secret_template'] if attributes[:'secret_template']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] generation_type Object to be assigned
    def generation_type=(generation_type)
      # rubocop:disable Style/ConditionalAssignment
      if generation_type && !GENERATION_TYPE_ENUM.include?(generation_type)
        OCI.logger.debug("Unknown value for 'generation_type' [" + generation_type + "]. Mapping to 'GENERATION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @generation_type = GENERATION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @generation_type = generation_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        generation_type == other.generation_type &&
        secret_template == other.secret_template
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
      [generation_type, secret_template].hash
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
