# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The caching rule settings.
  class Waas::Models::CachingRuleSummary
    ACTION_ENUM = [
      ACTION_CACHE = 'CACHE'.freeze,
      ACTION_BYPASS_CACHE = 'BYPASS_CACHE'.freeze,
      ACTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The unique key for the caching rule.
    # @return [String]
    attr_accessor :key

    # **[Required]** The name of the caching rule.
    # @return [String]
    attr_accessor :name

    # **[Required]** The action to take on matched caching rules.
    # - **CACHE:** Allow to set caching rule, which would be cached.
    #
    # - **BYPASS_CACHE:** Allow to set caching rule, which would never be cached. e.g. all requests would be passed directly to origin for those file types.
    # @return [String]
    attr_reader :action

    # The caching duration (applies only to `CACHE` action) specified in ISO 8601 extended format. Supported units: seconds, minutes, hours, days, weeks, months. Max value - 99. Mixing of multiple units is not supported.
    # @return [String]
    attr_accessor :caching_duration

    # Enables or disables the client caching.
    # Browsers use the Cache-Control header value for caching content locally, in the browser.
    # This setting will control the addition of a Cache-Control header to responses. It overrides existing Cache-Control headers.
    # @return [BOOLEAN]
    attr_accessor :is_client_caching_enabled

    # The client caching duration (applies only to `CACHE` action) specified in ISO 8601 extended format, in case client caching enabled. It sets Cache-Control header max-age time, i.e. the local browser cache expire time. Supported units: seconds, minutes, hours, days, weeks, months. Max value - 99. Mixing of multiple units is not supported.
    # @return [String]
    attr_accessor :client_caching_duration

    # **[Required]** The array of the rule criteria with condition and value.
    # @return [Array<OCI::Waas::Models::CachingRuleCriteria>]
    attr_accessor :criteria

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'key',
        'name': :'name',
        'action': :'action',
        'caching_duration': :'cachingDuration',
        'is_client_caching_enabled': :'isClientCachingEnabled',
        'client_caching_duration': :'clientCachingDuration',
        'criteria': :'criteria'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'String',
        'name': :'String',
        'action': :'String',
        'caching_duration': :'String',
        'is_client_caching_enabled': :'BOOLEAN',
        'client_caching_duration': :'String',
        'criteria': :'Array<OCI::Waas::Models::CachingRuleCriteria>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :action The value to assign to the {#action} property
    # @option attributes [String] :caching_duration The value to assign to the {#caching_duration} property
    # @option attributes [BOOLEAN] :is_client_caching_enabled The value to assign to the {#is_client_caching_enabled} property
    # @option attributes [String] :client_caching_duration The value to assign to the {#client_caching_duration} property
    # @option attributes [Array<OCI::Waas::Models::CachingRuleCriteria>] :criteria The value to assign to the {#criteria} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key = attributes[:'key'] if attributes[:'key']

      self.name = attributes[:'name'] if attributes[:'name']

      self.action = attributes[:'action'] if attributes[:'action']

      self.caching_duration = attributes[:'cachingDuration'] if attributes[:'cachingDuration']

      raise 'You cannot provide both :cachingDuration and :caching_duration' if attributes.key?(:'cachingDuration') && attributes.key?(:'caching_duration')

      self.caching_duration = attributes[:'caching_duration'] if attributes[:'caching_duration']

      self.is_client_caching_enabled = attributes[:'isClientCachingEnabled'] unless attributes[:'isClientCachingEnabled'].nil?

      raise 'You cannot provide both :isClientCachingEnabled and :is_client_caching_enabled' if attributes.key?(:'isClientCachingEnabled') && attributes.key?(:'is_client_caching_enabled')

      self.is_client_caching_enabled = attributes[:'is_client_caching_enabled'] unless attributes[:'is_client_caching_enabled'].nil?

      self.client_caching_duration = attributes[:'clientCachingDuration'] if attributes[:'clientCachingDuration']

      raise 'You cannot provide both :clientCachingDuration and :client_caching_duration' if attributes.key?(:'clientCachingDuration') && attributes.key?(:'client_caching_duration')

      self.client_caching_duration = attributes[:'client_caching_duration'] if attributes[:'client_caching_duration']

      self.criteria = attributes[:'criteria'] if attributes[:'criteria']
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
        key == other.key &&
        name == other.name &&
        action == other.action &&
        caching_duration == other.caching_duration &&
        is_client_caching_enabled == other.is_client_caching_enabled &&
        client_caching_duration == other.client_caching_duration &&
        criteria == other.criteria
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
      [key, name, action, caching_duration, is_client_caching_enabled, client_caching_duration, criteria].hash
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
