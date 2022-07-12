# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # IPSec tunnel details specific to ISAKMP phase one.
  class Core::Models::TunnelPhaseOneDetails
    # Indicates whether custom phase one configuration is enabled.
    # If this option is not enabled, default settings are proposed.
    #
    # @return [BOOLEAN]
    attr_accessor :is_custom_phase_one_config

    # The total configured lifetime of the IKE security association.
    # @return [Integer]
    attr_accessor :lifetime

    # The remaining lifetime before the key is refreshed.
    # @return [Integer]
    attr_accessor :remaining_lifetime

    # The proposed custom authentication algorithm.
    # @return [String]
    attr_accessor :custom_authentication_algorithm

    # The negotiated authentication algorithm.
    # @return [String]
    attr_accessor :negotiated_authentication_algorithm

    # The proposed custom encryption algorithm.
    # @return [String]
    attr_accessor :custom_encryption_algorithm

    # The negotiated encryption algorithm.
    # @return [String]
    attr_accessor :negotiated_encryption_algorithm

    # The proposed custom Diffie-Hellman group.
    # @return [String]
    attr_accessor :custom_dh_group

    # The negotiated Diffie-Hellman group.
    # @return [String]
    attr_accessor :negotiated_dh_group

    # Indicates whether IKE phase one is established.
    # @return [BOOLEAN]
    attr_accessor :is_ike_established

    # The date and time we retrieved the remaining lifetime, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :remaining_lifetime_last_retrieved

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'is_custom_phase_one_config': :'isCustomPhaseOneConfig',
        'lifetime': :'lifetime',
        'remaining_lifetime': :'remainingLifetime',
        'custom_authentication_algorithm': :'customAuthenticationAlgorithm',
        'negotiated_authentication_algorithm': :'negotiatedAuthenticationAlgorithm',
        'custom_encryption_algorithm': :'customEncryptionAlgorithm',
        'negotiated_encryption_algorithm': :'negotiatedEncryptionAlgorithm',
        'custom_dh_group': :'customDhGroup',
        'negotiated_dh_group': :'negotiatedDhGroup',
        'is_ike_established': :'isIkeEstablished',
        'remaining_lifetime_last_retrieved': :'remainingLifetimeLastRetrieved'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'is_custom_phase_one_config': :'BOOLEAN',
        'lifetime': :'Integer',
        'remaining_lifetime': :'Integer',
        'custom_authentication_algorithm': :'String',
        'negotiated_authentication_algorithm': :'String',
        'custom_encryption_algorithm': :'String',
        'negotiated_encryption_algorithm': :'String',
        'custom_dh_group': :'String',
        'negotiated_dh_group': :'String',
        'is_ike_established': :'BOOLEAN',
        'remaining_lifetime_last_retrieved': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_custom_phase_one_config The value to assign to the {#is_custom_phase_one_config} property
    # @option attributes [Integer] :lifetime The value to assign to the {#lifetime} property
    # @option attributes [Integer] :remaining_lifetime The value to assign to the {#remaining_lifetime} property
    # @option attributes [String] :custom_authentication_algorithm The value to assign to the {#custom_authentication_algorithm} property
    # @option attributes [String] :negotiated_authentication_algorithm The value to assign to the {#negotiated_authentication_algorithm} property
    # @option attributes [String] :custom_encryption_algorithm The value to assign to the {#custom_encryption_algorithm} property
    # @option attributes [String] :negotiated_encryption_algorithm The value to assign to the {#negotiated_encryption_algorithm} property
    # @option attributes [String] :custom_dh_group The value to assign to the {#custom_dh_group} property
    # @option attributes [String] :negotiated_dh_group The value to assign to the {#negotiated_dh_group} property
    # @option attributes [BOOLEAN] :is_ike_established The value to assign to the {#is_ike_established} property
    # @option attributes [DateTime] :remaining_lifetime_last_retrieved The value to assign to the {#remaining_lifetime_last_retrieved} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_custom_phase_one_config = attributes[:'isCustomPhaseOneConfig'] unless attributes[:'isCustomPhaseOneConfig'].nil?

      raise 'You cannot provide both :isCustomPhaseOneConfig and :is_custom_phase_one_config' if attributes.key?(:'isCustomPhaseOneConfig') && attributes.key?(:'is_custom_phase_one_config')

      self.is_custom_phase_one_config = attributes[:'is_custom_phase_one_config'] unless attributes[:'is_custom_phase_one_config'].nil?

      self.lifetime = attributes[:'lifetime'] if attributes[:'lifetime']

      self.remaining_lifetime = attributes[:'remainingLifetime'] if attributes[:'remainingLifetime']

      raise 'You cannot provide both :remainingLifetime and :remaining_lifetime' if attributes.key?(:'remainingLifetime') && attributes.key?(:'remaining_lifetime')

      self.remaining_lifetime = attributes[:'remaining_lifetime'] if attributes[:'remaining_lifetime']

      self.custom_authentication_algorithm = attributes[:'customAuthenticationAlgorithm'] if attributes[:'customAuthenticationAlgorithm']

      raise 'You cannot provide both :customAuthenticationAlgorithm and :custom_authentication_algorithm' if attributes.key?(:'customAuthenticationAlgorithm') && attributes.key?(:'custom_authentication_algorithm')

      self.custom_authentication_algorithm = attributes[:'custom_authentication_algorithm'] if attributes[:'custom_authentication_algorithm']

      self.negotiated_authentication_algorithm = attributes[:'negotiatedAuthenticationAlgorithm'] if attributes[:'negotiatedAuthenticationAlgorithm']

      raise 'You cannot provide both :negotiatedAuthenticationAlgorithm and :negotiated_authentication_algorithm' if attributes.key?(:'negotiatedAuthenticationAlgorithm') && attributes.key?(:'negotiated_authentication_algorithm')

      self.negotiated_authentication_algorithm = attributes[:'negotiated_authentication_algorithm'] if attributes[:'negotiated_authentication_algorithm']

      self.custom_encryption_algorithm = attributes[:'customEncryptionAlgorithm'] if attributes[:'customEncryptionAlgorithm']

      raise 'You cannot provide both :customEncryptionAlgorithm and :custom_encryption_algorithm' if attributes.key?(:'customEncryptionAlgorithm') && attributes.key?(:'custom_encryption_algorithm')

      self.custom_encryption_algorithm = attributes[:'custom_encryption_algorithm'] if attributes[:'custom_encryption_algorithm']

      self.negotiated_encryption_algorithm = attributes[:'negotiatedEncryptionAlgorithm'] if attributes[:'negotiatedEncryptionAlgorithm']

      raise 'You cannot provide both :negotiatedEncryptionAlgorithm and :negotiated_encryption_algorithm' if attributes.key?(:'negotiatedEncryptionAlgorithm') && attributes.key?(:'negotiated_encryption_algorithm')

      self.negotiated_encryption_algorithm = attributes[:'negotiated_encryption_algorithm'] if attributes[:'negotiated_encryption_algorithm']

      self.custom_dh_group = attributes[:'customDhGroup'] if attributes[:'customDhGroup']

      raise 'You cannot provide both :customDhGroup and :custom_dh_group' if attributes.key?(:'customDhGroup') && attributes.key?(:'custom_dh_group')

      self.custom_dh_group = attributes[:'custom_dh_group'] if attributes[:'custom_dh_group']

      self.negotiated_dh_group = attributes[:'negotiatedDhGroup'] if attributes[:'negotiatedDhGroup']

      raise 'You cannot provide both :negotiatedDhGroup and :negotiated_dh_group' if attributes.key?(:'negotiatedDhGroup') && attributes.key?(:'negotiated_dh_group')

      self.negotiated_dh_group = attributes[:'negotiated_dh_group'] if attributes[:'negotiated_dh_group']

      self.is_ike_established = attributes[:'isIkeEstablished'] unless attributes[:'isIkeEstablished'].nil?

      raise 'You cannot provide both :isIkeEstablished and :is_ike_established' if attributes.key?(:'isIkeEstablished') && attributes.key?(:'is_ike_established')

      self.is_ike_established = attributes[:'is_ike_established'] unless attributes[:'is_ike_established'].nil?

      self.remaining_lifetime_last_retrieved = attributes[:'remainingLifetimeLastRetrieved'] if attributes[:'remainingLifetimeLastRetrieved']

      raise 'You cannot provide both :remainingLifetimeLastRetrieved and :remaining_lifetime_last_retrieved' if attributes.key?(:'remainingLifetimeLastRetrieved') && attributes.key?(:'remaining_lifetime_last_retrieved')

      self.remaining_lifetime_last_retrieved = attributes[:'remaining_lifetime_last_retrieved'] if attributes[:'remaining_lifetime_last_retrieved']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        is_custom_phase_one_config == other.is_custom_phase_one_config &&
        lifetime == other.lifetime &&
        remaining_lifetime == other.remaining_lifetime &&
        custom_authentication_algorithm == other.custom_authentication_algorithm &&
        negotiated_authentication_algorithm == other.negotiated_authentication_algorithm &&
        custom_encryption_algorithm == other.custom_encryption_algorithm &&
        negotiated_encryption_algorithm == other.negotiated_encryption_algorithm &&
        custom_dh_group == other.custom_dh_group &&
        negotiated_dh_group == other.negotiated_dh_group &&
        is_ike_established == other.is_ike_established &&
        remaining_lifetime_last_retrieved == other.remaining_lifetime_last_retrieved
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
      [is_custom_phase_one_config, lifetime, remaining_lifetime, custom_authentication_algorithm, negotiated_authentication_algorithm, custom_encryption_algorithm, negotiated_encryption_algorithm, custom_dh_group, negotiated_dh_group, is_ike_established, remaining_lifetime_last_retrieved].hash
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
