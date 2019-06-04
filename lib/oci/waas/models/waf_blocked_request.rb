# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # WafBlockedRequest model.
  class Waas::Models::WafBlockedRequest
    WAF_FEATURE_ENUM = [
      WAF_FEATURE_PROTECTION_RULES = 'PROTECTION_RULES'.freeze,
      WAF_FEATURE_JS_CHALLENGE = 'JS_CHALLENGE'.freeze,
      WAF_FEATURE_ACCESS_RULES = 'ACCESS_RULES'.freeze,
      WAF_FEATURE_THREAT_FEEDS = 'THREAT_FEEDS'.freeze,
      WAF_FEATURE_HUMAN_INTERACTION_CHALLENGE = 'HUMAN_INTERACTION_CHALLENGE'.freeze,
      WAF_FEATURE_DEVICE_FINGERPRINT_CHALLENGE = 'DEVICE_FINGERPRINT_CHALLENGE'.freeze,
      WAF_FEATURE_CAPTCHA = 'CAPTCHA'.freeze,
      WAF_FEATURE_ADDRESS_RATE_LIMITING = 'ADDRESS_RATE_LIMITING'.freeze,
      WAF_FEATURE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The date and time the blocked requests were observed, expressed in RFC 3339 timestamp format.
    # @return [DateTime]
    attr_accessor :time_observed

    # The number of seconds the data covers.
    # @return [Integer]
    attr_accessor :time_range_in_seconds

    # The specific Web Application Firewall feature that blocked the requests, such as JavaScript Challenge or Access Control.
    # @return [String]
    attr_reader :waf_feature

    # The count of blocked requests.
    # @return [Integer]
    attr_accessor :count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'time_observed': :'timeObserved',
        'time_range_in_seconds': :'timeRangeInSeconds',
        'waf_feature': :'wafFeature',
        'count': :'count'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'time_observed': :'DateTime',
        'time_range_in_seconds': :'Integer',
        'waf_feature': :'String',
        'count': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :time_observed The value to assign to the {#time_observed} property
    # @option attributes [Integer] :time_range_in_seconds The value to assign to the {#time_range_in_seconds} property
    # @option attributes [String] :waf_feature The value to assign to the {#waf_feature} property
    # @option attributes [Integer] :count The value to assign to the {#count} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.time_observed = attributes[:'timeObserved'] if attributes[:'timeObserved']

      raise 'You cannot provide both :timeObserved and :time_observed' if attributes.key?(:'timeObserved') && attributes.key?(:'time_observed')

      self.time_observed = attributes[:'time_observed'] if attributes[:'time_observed']

      self.time_range_in_seconds = attributes[:'timeRangeInSeconds'] if attributes[:'timeRangeInSeconds']

      raise 'You cannot provide both :timeRangeInSeconds and :time_range_in_seconds' if attributes.key?(:'timeRangeInSeconds') && attributes.key?(:'time_range_in_seconds')

      self.time_range_in_seconds = attributes[:'time_range_in_seconds'] if attributes[:'time_range_in_seconds']

      self.waf_feature = attributes[:'wafFeature'] if attributes[:'wafFeature']

      raise 'You cannot provide both :wafFeature and :waf_feature' if attributes.key?(:'wafFeature') && attributes.key?(:'waf_feature')

      self.waf_feature = attributes[:'waf_feature'] if attributes[:'waf_feature']

      self.count = attributes[:'count'] if attributes[:'count']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] waf_feature Object to be assigned
    def waf_feature=(waf_feature)
      # rubocop:disable Style/ConditionalAssignment
      if waf_feature && !WAF_FEATURE_ENUM.include?(waf_feature)
        OCI.logger.debug("Unknown value for 'waf_feature' [" + waf_feature + "]. Mapping to 'WAF_FEATURE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @waf_feature = WAF_FEATURE_UNKNOWN_ENUM_VALUE
      else
        @waf_feature = waf_feature
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        time_observed == other.time_observed &&
        time_range_in_seconds == other.time_range_in_seconds &&
        waf_feature == other.waf_feature &&
        count == other.count
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
      [time_observed, time_range_in_seconds, waf_feature, count].hash
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
