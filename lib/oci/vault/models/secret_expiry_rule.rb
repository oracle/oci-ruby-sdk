# Copyright (c) 2016, 2020, Oracle and/or its affiliates. All rights reserved.

require 'date'
require_relative 'secret_rule'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A rule that helps enforce the expiration of a secret's contents.
  class Vault::Models::SecretExpiryRule < Vault::Models::SecretRule
    # A property indicating how long the secret contents will be considered valid, expressed in
    # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#Time_intervals) format. The secret needs to be
    # updated when the secret content expires. No enforcement mechanism exists at this time, but audit logs
    # record the expiration on the appropriate date, according to the time interval specified in the rule.
    # The timer resets after you update the secret contents.
    # The minimum value is 1 day and the maximum value is 90 days for this property. Currently, only intervals expressed in days are supported.
    # For example, pass `P3D` to have the secret version expire every 3 days.
    #
    # @return [String]
    attr_accessor :secret_version_expiry_interval

    # An optional property indicating the absolute time when this secret will expire, expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339) timestamp format.
    # The minimum number of days from current time is 1 day and the maximum number of days from current time is 365 days.
    # Example: `2019-04-03T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_of_absolute_expiry

    # A property indicating whether to block retrieval of the secret content, on expiry. The default is false.
    # If the secret has already expired and you would like to retrieve the secret contents,
    # you need to edit the secret rule to disable this property, to allow reading the secret content.
    #
    # @return [BOOLEAN]
    attr_accessor :is_secret_content_retrieval_blocked_on_expiry

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'rule_type': :'ruleType',
        'secret_version_expiry_interval': :'secretVersionExpiryInterval',
        'time_of_absolute_expiry': :'timeOfAbsoluteExpiry',
        'is_secret_content_retrieval_blocked_on_expiry': :'isSecretContentRetrievalBlockedOnExpiry'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'rule_type': :'String',
        'secret_version_expiry_interval': :'String',
        'time_of_absolute_expiry': :'DateTime',
        'is_secret_content_retrieval_blocked_on_expiry': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :secret_version_expiry_interval The value to assign to the {#secret_version_expiry_interval} property
    # @option attributes [DateTime] :time_of_absolute_expiry The value to assign to the {#time_of_absolute_expiry} property
    # @option attributes [BOOLEAN] :is_secret_content_retrieval_blocked_on_expiry The value to assign to the {#is_secret_content_retrieval_blocked_on_expiry} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['ruleType'] = 'SECRET_EXPIRY_RULE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.secret_version_expiry_interval = attributes[:'secretVersionExpiryInterval'] if attributes[:'secretVersionExpiryInterval']

      raise 'You cannot provide both :secretVersionExpiryInterval and :secret_version_expiry_interval' if attributes.key?(:'secretVersionExpiryInterval') && attributes.key?(:'secret_version_expiry_interval')

      self.secret_version_expiry_interval = attributes[:'secret_version_expiry_interval'] if attributes[:'secret_version_expiry_interval']

      self.time_of_absolute_expiry = attributes[:'timeOfAbsoluteExpiry'] if attributes[:'timeOfAbsoluteExpiry']

      raise 'You cannot provide both :timeOfAbsoluteExpiry and :time_of_absolute_expiry' if attributes.key?(:'timeOfAbsoluteExpiry') && attributes.key?(:'time_of_absolute_expiry')

      self.time_of_absolute_expiry = attributes[:'time_of_absolute_expiry'] if attributes[:'time_of_absolute_expiry']

      self.is_secret_content_retrieval_blocked_on_expiry = attributes[:'isSecretContentRetrievalBlockedOnExpiry'] unless attributes[:'isSecretContentRetrievalBlockedOnExpiry'].nil?

      raise 'You cannot provide both :isSecretContentRetrievalBlockedOnExpiry and :is_secret_content_retrieval_blocked_on_expiry' if attributes.key?(:'isSecretContentRetrievalBlockedOnExpiry') && attributes.key?(:'is_secret_content_retrieval_blocked_on_expiry')

      self.is_secret_content_retrieval_blocked_on_expiry = attributes[:'is_secret_content_retrieval_blocked_on_expiry'] unless attributes[:'is_secret_content_retrieval_blocked_on_expiry'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        rule_type == other.rule_type &&
        secret_version_expiry_interval == other.secret_version_expiry_interval &&
        time_of_absolute_expiry == other.time_of_absolute_expiry &&
        is_secret_content_retrieval_blocked_on_expiry == other.is_secret_content_retrieval_blocked_on_expiry
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
      [rule_type, secret_version_expiry_interval, time_of_absolute_expiry, is_secret_content_retrieval_blocked_on_expiry].hash
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
