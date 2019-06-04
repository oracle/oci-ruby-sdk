# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The human interaction challenge settings. The human interaction challenge checks various event listeners in the user's browser to determine if there is a human user making a request.
  class Waas::Models::HumanInteractionChallenge
    ACTION_ENUM = [
      ACTION_DETECT = 'DETECT'.freeze,
      ACTION_BLOCK = 'BLOCK'.freeze,
      ACTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Enables or disables the human interaction challenge Web Application Firewall feature.
    # @return [BOOLEAN]
    attr_accessor :is_enabled

    # The action to take against requests from detected bots. If unspecified, defaults to `DETECT`.
    # @return [String]
    attr_reader :action

    # The number of failed requests before taking action. If unspecified, defaults to `10`.
    # @return [Integer]
    attr_accessor :failure_threshold

    # The number of seconds between challenges for the same IP address. If unspecified, defaults to `60`.
    # @return [Integer]
    attr_accessor :action_expiration_in_seconds

    # The number of seconds before the failure threshold resets. If unspecified, defaults to  `60`.
    # @return [Integer]
    attr_accessor :failure_threshold_expiration_in_seconds

    # The number of interactions required to pass the challenge. If unspecified, defaults to `3`.
    # @return [Integer]
    attr_accessor :interaction_threshold

    # The number of seconds to record the interactions from the user. If unspecified, defaults to `15`.
    # @return [Integer]
    attr_accessor :recording_period_in_seconds

    # Adds an additional HTTP header to requests that fail the challenge before being passed to the origin. Only applicable when the `action` is set to `DETECT`.
    # @return [OCI::Waas::Models::Header]
    attr_accessor :set_http_header

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
        'interaction_threshold': :'interactionThreshold',
        'recording_period_in_seconds': :'recordingPeriodInSeconds',
        'set_http_header': :'setHttpHeader',
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
        'interaction_threshold': :'Integer',
        'recording_period_in_seconds': :'Integer',
        'set_http_header': :'OCI::Waas::Models::Header',
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
    # @option attributes [Integer] :interaction_threshold The value to assign to the {#interaction_threshold} property
    # @option attributes [Integer] :recording_period_in_seconds The value to assign to the {#recording_period_in_seconds} property
    # @option attributes [OCI::Waas::Models::Header] :set_http_header The value to assign to the {#set_http_header} property
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

      self.interaction_threshold = attributes[:'interactionThreshold'] if attributes[:'interactionThreshold']

      raise 'You cannot provide both :interactionThreshold and :interaction_threshold' if attributes.key?(:'interactionThreshold') && attributes.key?(:'interaction_threshold')

      self.interaction_threshold = attributes[:'interaction_threshold'] if attributes[:'interaction_threshold']

      self.recording_period_in_seconds = attributes[:'recordingPeriodInSeconds'] if attributes[:'recordingPeriodInSeconds']

      raise 'You cannot provide both :recordingPeriodInSeconds and :recording_period_in_seconds' if attributes.key?(:'recordingPeriodInSeconds') && attributes.key?(:'recording_period_in_seconds')

      self.recording_period_in_seconds = attributes[:'recording_period_in_seconds'] if attributes[:'recording_period_in_seconds']

      self.set_http_header = attributes[:'setHttpHeader'] if attributes[:'setHttpHeader']

      raise 'You cannot provide both :setHttpHeader and :set_http_header' if attributes.key?(:'setHttpHeader') && attributes.key?(:'set_http_header')

      self.set_http_header = attributes[:'set_http_header'] if attributes[:'set_http_header']

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
        interaction_threshold == other.interaction_threshold &&
        recording_period_in_seconds == other.recording_period_in_seconds &&
        set_http_header == other.set_http_header &&
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
      [is_enabled, action, failure_threshold, action_expiration_in_seconds, failure_threshold_expiration_in_seconds, interaction_threshold, recording_period_in_seconds, set_http_header, challenge_settings].hash
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
