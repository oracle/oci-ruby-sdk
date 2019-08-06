# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The configuration details for implementing session persistence based on a user-specified cookie name (application
  # cookie stickiness).
  #
  # Session persistence enables the Load Balancing service to direct any number of requests that originate from a single
  # logical client to a single backend web server. For more information, see
  # [Session Persistence](https://docs.cloud.oracle.com/Content/Balance/Reference/sessionpersistence.htm).
  #
  # With application cookie stickiness, the load balancer enables session persistence only when the response from a backend
  # application server includes a `Set-cookie` header with the user-specified cookie name.
  #
  # To disable application cookie stickiness on a running load balancer, use the
  # {#update_backend_set update_backend_set} operation and specify `null` for the
  # `SessionPersistenceConfigurationDetails` object.
  #
  # Example: `SessionPersistenceConfigurationDetails: null`
  #
  # **Note:** `SessionPersistenceConfigurationDetails` (application cookie stickiness) and `LBCookieSessionPersistenceConfigurationDetails`
  # (LB cookie stickiness) are mutually exclusive. An error results if you try to enable both types of session persistence.
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class LoadBalancer::Models::SessionPersistenceConfigurationDetails
    # **[Required]** The name of the cookie used to detect a session initiated by the backend server. Use '*' to specify
    # that any cookie set by the backend causes the session to persist.
    #
    # Example: `example_cookie`
    #
    # @return [String]
    attr_accessor :cookie_name

    # Whether the load balancer is prevented from directing traffic from a persistent session client to
    # a different backend server if the original server is unavailable. Defaults to false.
    #
    # Example: `false`
    #
    # @return [BOOLEAN]
    attr_accessor :disable_fallback

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'cookie_name': :'cookieName',
        'disable_fallback': :'disableFallback'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'cookie_name': :'String',
        'disable_fallback': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :cookie_name The value to assign to the {#cookie_name} property
    # @option attributes [BOOLEAN] :disable_fallback The value to assign to the {#disable_fallback} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.cookie_name = attributes[:'cookieName'] if attributes[:'cookieName']

      raise 'You cannot provide both :cookieName and :cookie_name' if attributes.key?(:'cookieName') && attributes.key?(:'cookie_name')

      self.cookie_name = attributes[:'cookie_name'] if attributes[:'cookie_name']

      self.disable_fallback = attributes[:'disableFallback'] unless attributes[:'disableFallback'].nil?
      self.disable_fallback = false if disable_fallback.nil? && !attributes.key?(:'disableFallback') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :disableFallback and :disable_fallback' if attributes.key?(:'disableFallback') && attributes.key?(:'disable_fallback')

      self.disable_fallback = attributes[:'disable_fallback'] unless attributes[:'disable_fallback'].nil?
      self.disable_fallback = false if disable_fallback.nil? && !attributes.key?(:'disableFallback') && !attributes.key?(:'disable_fallback') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        cookie_name == other.cookie_name &&
        disable_fallback == other.disable_fallback
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
      [cookie_name, disable_fallback].hash
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
