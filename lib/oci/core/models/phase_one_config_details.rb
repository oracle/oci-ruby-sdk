# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Configuration details for IKE phase one (ISAKMP) configuration parameters.
  class Core::Models::PhaseOneConfigDetails
    AUTHENTICATION_ALGORITHM_ENUM = [
      AUTHENTICATION_ALGORITHM_SHA2_384 = 'SHA2_384'.freeze,
      AUTHENTICATION_ALGORITHM_SHA2_256 = 'SHA2_256'.freeze,
      AUTHENTICATION_ALGORITHM_SHA1_96 = 'SHA1_96'.freeze
    ].freeze

    ENCRYPTION_ALGORITHM_ENUM = [
      ENCRYPTION_ALGORITHM_AES_256_CBC = 'AES_256_CBC'.freeze,
      ENCRYPTION_ALGORITHM_AES_192_CBC = 'AES_192_CBC'.freeze,
      ENCRYPTION_ALGORITHM_AES_128_CBC = 'AES_128_CBC'.freeze
    ].freeze

    DIFFIE_HELMAN_GROUP_ENUM = [
      DIFFIE_HELMAN_GROUP_GROUP2 = 'GROUP2'.freeze,
      DIFFIE_HELMAN_GROUP_GROUP5 = 'GROUP5'.freeze,
      DIFFIE_HELMAN_GROUP_GROUP14 = 'GROUP14'.freeze,
      DIFFIE_HELMAN_GROUP_GROUP19 = 'GROUP19'.freeze,
      DIFFIE_HELMAN_GROUP_GROUP20 = 'GROUP20'.freeze,
      DIFFIE_HELMAN_GROUP_GROUP24 = 'GROUP24'.freeze
    ].freeze

    # Indicates whether custom configuration is enabled for phase one options.
    # @return [BOOLEAN]
    attr_accessor :is_custom_phase_one_config

    # The custom authentication algorithm proposed during phase one tunnel negotiation.
    #
    # @return [String]
    attr_reader :authentication_algorithm

    # The custom encryption algorithm proposed during phase one tunnel negotiation.
    #
    # @return [String]
    attr_reader :encryption_algorithm

    # The custom Diffie-Hellman group proposed during phase one tunnel negotiation.
    #
    # @return [String]
    attr_reader :diffie_helman_group

    # Internet key association (IKE) session key lifetime in seconds for IPSec phase one. The default is 28800 which is equivalent to 8 hours.
    #
    # @return [Integer]
    attr_accessor :lifetime_in_seconds

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'is_custom_phase_one_config': :'isCustomPhaseOneConfig',
        'authentication_algorithm': :'authenticationAlgorithm',
        'encryption_algorithm': :'encryptionAlgorithm',
        'diffie_helman_group': :'diffieHelmanGroup',
        'lifetime_in_seconds': :'lifetimeInSeconds'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'is_custom_phase_one_config': :'BOOLEAN',
        'authentication_algorithm': :'String',
        'encryption_algorithm': :'String',
        'diffie_helman_group': :'String',
        'lifetime_in_seconds': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_custom_phase_one_config The value to assign to the {#is_custom_phase_one_config} property
    # @option attributes [String] :authentication_algorithm The value to assign to the {#authentication_algorithm} property
    # @option attributes [String] :encryption_algorithm The value to assign to the {#encryption_algorithm} property
    # @option attributes [String] :diffie_helman_group The value to assign to the {#diffie_helman_group} property
    # @option attributes [Integer] :lifetime_in_seconds The value to assign to the {#lifetime_in_seconds} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_custom_phase_one_config = attributes[:'isCustomPhaseOneConfig'] unless attributes[:'isCustomPhaseOneConfig'].nil?

      raise 'You cannot provide both :isCustomPhaseOneConfig and :is_custom_phase_one_config' if attributes.key?(:'isCustomPhaseOneConfig') && attributes.key?(:'is_custom_phase_one_config')

      self.is_custom_phase_one_config = attributes[:'is_custom_phase_one_config'] unless attributes[:'is_custom_phase_one_config'].nil?

      self.authentication_algorithm = attributes[:'authenticationAlgorithm'] if attributes[:'authenticationAlgorithm']

      raise 'You cannot provide both :authenticationAlgorithm and :authentication_algorithm' if attributes.key?(:'authenticationAlgorithm') && attributes.key?(:'authentication_algorithm')

      self.authentication_algorithm = attributes[:'authentication_algorithm'] if attributes[:'authentication_algorithm']

      self.encryption_algorithm = attributes[:'encryptionAlgorithm'] if attributes[:'encryptionAlgorithm']

      raise 'You cannot provide both :encryptionAlgorithm and :encryption_algorithm' if attributes.key?(:'encryptionAlgorithm') && attributes.key?(:'encryption_algorithm')

      self.encryption_algorithm = attributes[:'encryption_algorithm'] if attributes[:'encryption_algorithm']

      self.diffie_helman_group = attributes[:'diffieHelmanGroup'] if attributes[:'diffieHelmanGroup']

      raise 'You cannot provide both :diffieHelmanGroup and :diffie_helman_group' if attributes.key?(:'diffieHelmanGroup') && attributes.key?(:'diffie_helman_group')

      self.diffie_helman_group = attributes[:'diffie_helman_group'] if attributes[:'diffie_helman_group']

      self.lifetime_in_seconds = attributes[:'lifetimeInSeconds'] if attributes[:'lifetimeInSeconds']

      raise 'You cannot provide both :lifetimeInSeconds and :lifetime_in_seconds' if attributes.key?(:'lifetimeInSeconds') && attributes.key?(:'lifetime_in_seconds')

      self.lifetime_in_seconds = attributes[:'lifetime_in_seconds'] if attributes[:'lifetime_in_seconds']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] authentication_algorithm Object to be assigned
    def authentication_algorithm=(authentication_algorithm)
      raise "Invalid value for 'authentication_algorithm': this must be one of the values in AUTHENTICATION_ALGORITHM_ENUM." if authentication_algorithm && !AUTHENTICATION_ALGORITHM_ENUM.include?(authentication_algorithm)

      @authentication_algorithm = authentication_algorithm
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] encryption_algorithm Object to be assigned
    def encryption_algorithm=(encryption_algorithm)
      raise "Invalid value for 'encryption_algorithm': this must be one of the values in ENCRYPTION_ALGORITHM_ENUM." if encryption_algorithm && !ENCRYPTION_ALGORITHM_ENUM.include?(encryption_algorithm)

      @encryption_algorithm = encryption_algorithm
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] diffie_helman_group Object to be assigned
    def diffie_helman_group=(diffie_helman_group)
      raise "Invalid value for 'diffie_helman_group': this must be one of the values in DIFFIE_HELMAN_GROUP_ENUM." if diffie_helman_group && !DIFFIE_HELMAN_GROUP_ENUM.include?(diffie_helman_group)

      @diffie_helman_group = diffie_helman_group
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        is_custom_phase_one_config == other.is_custom_phase_one_config &&
        authentication_algorithm == other.authentication_algorithm &&
        encryption_algorithm == other.encryption_algorithm &&
        diffie_helman_group == other.diffie_helman_group &&
        lifetime_in_seconds == other.lifetime_in_seconds
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
      [is_custom_phase_one_config, authentication_algorithm, encryption_algorithm, diffie_helman_group, lifetime_in_seconds].hash
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