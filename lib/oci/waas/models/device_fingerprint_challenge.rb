# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The device fingerprint challenge settings. The device fingerprint challenge generates hashed signatures of both virtual and real browsers to identify and block malicious bots.
  class Waas::Models::DeviceFingerprintChallenge
    ACTION_ENUM = [
      ACTION_DETECT = 'DETECT'.freeze,
      ACTION_BLOCK = 'BLOCK'.freeze,
      ACTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Enables or disables the device fingerprint challenge Web Application Firewall feature.
    # @return [BOOLEAN]
    attr_accessor :is_enabled

    # The action to take on requests from detected bots. If unspecified, defaults to `DETECT`.
    # @return [String]
    attr_reader :action

    # The number of failed requests allowed before taking action. If unspecified, defaults to `10`.
    # @return [Integer]
    attr_accessor :failure_threshold

    # The number of seconds between challenges for the same IP address. If unspecified, defaults to `60`.
    # @return [Integer]
    attr_accessor :action_expiration_in_seconds

    # The number of seconds before the failure threshold resets. If unspecified, defaults to `60`.
    # @return [Integer]
    attr_accessor :failure_threshold_expiration_in_seconds

    # The maximum number of IP addresses permitted with the same device fingerprint. If unspecified, defaults to `20`.
    # @return [Integer]
    attr_accessor :max_address_count

    # The number of seconds before the maximum addresses count resets. If unspecified, defaults to `60`.
    # @return [Integer]
    attr_accessor :max_address_count_expiration_in_seconds

    # @return [OCI::Waas::Models::BlockChallengeSettings]
    attr_accessor :challenge_settings

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'is_enabled': :'isEnabled',
        'action': :'action',
        'failure_threshold': :'failureThreshold',
        'action_expiration_in_seconds': :'actionExpirationInSeconds',
        'failure_threshold_expiration_in_seconds': :'failureThresholdExpirationInSeconds',
        'max_address_count': :'maxAddressCount',
        'max_address_count_expiration_in_seconds': :'maxAddressCountExpirationInSeconds',
        'challenge_settings': :'challengeSettings'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'is_enabled': :'BOOLEAN',
        'action': :'String',
        'failure_threshold': :'Integer',
        'action_expiration_in_seconds': :'Integer',
        'failure_threshold_expiration_in_seconds': :'Integer',
        'max_address_count': :'Integer',
        'max_address_count_expiration_in_seconds': :'Integer',
        'challenge_settings': :'OCI::Waas::Models::BlockChallengeSettings'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_enabled The value to assign to the {#is_enabled} property
    # @option attributes [String] :action The value to assign to the {#action} property
    # @option attributes [Integer] :failure_threshold The value to assign to the {#failure_threshold} property
    # @option attributes [Integer] :action_expiration_in_seconds The value to assign to the {#action_expiration_in_seconds} property
    # @option attributes [Integer] :failure_threshold_expiration_in_seconds The value to assign to the {#failure_threshold_expiration_in_seconds} property
    # @option attributes [Integer] :max_address_count The value to assign to the {#max_address_count} property
    # @option attributes [Integer] :max_address_count_expiration_in_seconds The value to assign to the {#max_address_count_expiration_in_seconds} property
    # @option attributes [OCI::Waas::Models::BlockChallengeSettings] :challenge_settings The value to assign to the {#challenge_settings} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_enabled = attributes[:'isEnabled'] unless attributes[:'isEnabled'].nil?

      raise 'You cannot provide both :isEnabled and :is_enabled' if attributes.key?(:'isEnabled') && attributes.key?(:'is_enabled')

      self.is_enabled = attributes[:'is_enabled'] unless attributes[:'is_enabled'].nil?

      self.action = attributes[:'action'] if attributes[:'action']

      self.failure_threshold = attributes[:'failureThreshold'] if attributes[:'failureThreshold']

      raise 'You cannot provide both :failureThreshold and :failure_threshold' if attributes.key?(:'failureThreshold') && attributes.key?(:'failure_threshold')

      self.failure_threshold = attributes[:'failure_threshold'] if attributes[:'failure_threshold']

      self.action_expiration_in_seconds = attributes[:'actionExpirationInSeconds'] if attributes[:'actionExpirationInSeconds']

      raise 'You cannot provide both :actionExpirationInSeconds and :action_expiration_in_seconds' if attributes.key?(:'actionExpirationInSeconds') && attributes.key?(:'action_expiration_in_seconds')

      self.action_expiration_in_seconds = attributes[:'action_expiration_in_seconds'] if attributes[:'action_expiration_in_seconds']

      self.failure_threshold_expiration_in_seconds = attributes[:'failureThresholdExpirationInSeconds'] if attributes[:'failureThresholdExpirationInSeconds']

      raise 'You cannot provide both :failureThresholdExpirationInSeconds and :failure_threshold_expiration_in_seconds' if attributes.key?(:'failureThresholdExpirationInSeconds') && attributes.key?(:'failure_threshold_expiration_in_seconds')

      self.failure_threshold_expiration_in_seconds = attributes[:'failure_threshold_expiration_in_seconds'] if attributes[:'failure_threshold_expiration_in_seconds']

      self.max_address_count = attributes[:'maxAddressCount'] if attributes[:'maxAddressCount']

      raise 'You cannot provide both :maxAddressCount and :max_address_count' if attributes.key?(:'maxAddressCount') && attributes.key?(:'max_address_count')

      self.max_address_count = attributes[:'max_address_count'] if attributes[:'max_address_count']

      self.max_address_count_expiration_in_seconds = attributes[:'maxAddressCountExpirationInSeconds'] if attributes[:'maxAddressCountExpirationInSeconds']

      raise 'You cannot provide both :maxAddressCountExpirationInSeconds and :max_address_count_expiration_in_seconds' if attributes.key?(:'maxAddressCountExpirationInSeconds') && attributes.key?(:'max_address_count_expiration_in_seconds')

      self.max_address_count_expiration_in_seconds = attributes[:'max_address_count_expiration_in_seconds'] if attributes[:'max_address_count_expiration_in_seconds']

      self.challenge_settings = attributes[:'challengeSettings'] if attributes[:'challengeSettings']

      raise 'You cannot provide both :challengeSettings and :challenge_settings' if attributes.key?(:'challengeSettings') && attributes.key?(:'challenge_settings')

      self.challenge_settings = attributes[:'challenge_settings'] if attributes[:'challenge_settings']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] action Object to be assigned
    def action=(action)
      # rubocop:disable Style/ConditionalAssignment
      if action && !ACTION_ENUM.include?(action)
        OCI.logger.debug("Unknown value for 'action' [" + action + "]. Mapping to 'ACTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @action = ACTION_UNKNOWN_ENUM_VALUE
      else
        @action = action
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        is_enabled == other.is_enabled &&
        action == other.action &&
        failure_threshold == other.failure_threshold &&
        action_expiration_in_seconds == other.action_expiration_in_seconds &&
        failure_threshold_expiration_in_seconds == other.failure_threshold_expiration_in_seconds &&
        max_address_count == other.max_address_count &&
        max_address_count_expiration_in_seconds == other.max_address_count_expiration_in_seconds &&
        challenge_settings == other.challenge_settings
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
      [is_enabled, action, failure_threshold, action_expiration_in_seconds, failure_threshold_expiration_in_seconds, max_address_count, max_address_count_expiration_in_seconds, challenge_settings].hash
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
