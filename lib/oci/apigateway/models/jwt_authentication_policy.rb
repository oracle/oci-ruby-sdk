# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'authentication_policy'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Validate a JWT token present in the header or query parameter. A valid
  # policy must specify either tokenHeader or tokenQueryParam.
  #
  class Apigateway::Models::JwtAuthenticationPolicy < Apigateway::Models::AuthenticationPolicy
    # The name of the header containing the authentication token.
    # @return [String]
    attr_accessor :token_header

    # The name of the query parameter containing the authentication token.
    # @return [String]
    attr_accessor :token_query_param

    # The authentication scheme that is to be used when authenticating
    # the token. This must to be provided if \"tokenHeader\" is specified.
    #
    # @return [String]
    attr_accessor :token_auth_scheme

    # **[Required]** A list of parties that could have issued the token.
    # @return [Array<String>]
    attr_accessor :issuers

    # **[Required]** The list of intended recipients for the token.
    # @return [Array<String>]
    attr_accessor :audiences

    # A list of claims which should be validated to consider the token valid.
    # @return [Array<OCI::Apigateway::Models::JsonWebTokenClaim>]
    attr_accessor :verify_claims

    # The maximum expected time difference between the system clocks
    # of the token issuer and the API Gateway.
    #
    # @return [Float]
    attr_accessor :max_clock_skew_in_seconds

    # This attribute is required.
    # @return [OCI::Apigateway::Models::PublicKeySet]
    attr_accessor :public_keys

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'is_anonymous_access_allowed': :'isAnonymousAccessAllowed',
        'type': :'type',
        'token_header': :'tokenHeader',
        'token_query_param': :'tokenQueryParam',
        'token_auth_scheme': :'tokenAuthScheme',
        'issuers': :'issuers',
        'audiences': :'audiences',
        'verify_claims': :'verifyClaims',
        'max_clock_skew_in_seconds': :'maxClockSkewInSeconds',
        'public_keys': :'publicKeys'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'is_anonymous_access_allowed': :'BOOLEAN',
        'type': :'String',
        'token_header': :'String',
        'token_query_param': :'String',
        'token_auth_scheme': :'String',
        'issuers': :'Array<String>',
        'audiences': :'Array<String>',
        'verify_claims': :'Array<OCI::Apigateway::Models::JsonWebTokenClaim>',
        'max_clock_skew_in_seconds': :'Float',
        'public_keys': :'OCI::Apigateway::Models::PublicKeySet'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_anonymous_access_allowed The value to assign to the {OCI::Apigateway::Models::AuthenticationPolicy#is_anonymous_access_allowed #is_anonymous_access_allowed} proprety
    # @option attributes [String] :token_header The value to assign to the {#token_header} property
    # @option attributes [String] :token_query_param The value to assign to the {#token_query_param} property
    # @option attributes [String] :token_auth_scheme The value to assign to the {#token_auth_scheme} property
    # @option attributes [Array<String>] :issuers The value to assign to the {#issuers} property
    # @option attributes [Array<String>] :audiences The value to assign to the {#audiences} property
    # @option attributes [Array<OCI::Apigateway::Models::JsonWebTokenClaim>] :verify_claims The value to assign to the {#verify_claims} property
    # @option attributes [Float] :max_clock_skew_in_seconds The value to assign to the {#max_clock_skew_in_seconds} property
    # @option attributes [OCI::Apigateway::Models::PublicKeySet] :public_keys The value to assign to the {#public_keys} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'JWT_AUTHENTICATION'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.token_header = attributes[:'tokenHeader'] if attributes[:'tokenHeader']

      raise 'You cannot provide both :tokenHeader and :token_header' if attributes.key?(:'tokenHeader') && attributes.key?(:'token_header')

      self.token_header = attributes[:'token_header'] if attributes[:'token_header']

      self.token_query_param = attributes[:'tokenQueryParam'] if attributes[:'tokenQueryParam']

      raise 'You cannot provide both :tokenQueryParam and :token_query_param' if attributes.key?(:'tokenQueryParam') && attributes.key?(:'token_query_param')

      self.token_query_param = attributes[:'token_query_param'] if attributes[:'token_query_param']

      self.token_auth_scheme = attributes[:'tokenAuthScheme'] if attributes[:'tokenAuthScheme']

      raise 'You cannot provide both :tokenAuthScheme and :token_auth_scheme' if attributes.key?(:'tokenAuthScheme') && attributes.key?(:'token_auth_scheme')

      self.token_auth_scheme = attributes[:'token_auth_scheme'] if attributes[:'token_auth_scheme']

      self.issuers = attributes[:'issuers'] if attributes[:'issuers']

      self.audiences = attributes[:'audiences'] if attributes[:'audiences']

      self.verify_claims = attributes[:'verifyClaims'] if attributes[:'verifyClaims']

      raise 'You cannot provide both :verifyClaims and :verify_claims' if attributes.key?(:'verifyClaims') && attributes.key?(:'verify_claims')

      self.verify_claims = attributes[:'verify_claims'] if attributes[:'verify_claims']

      self.max_clock_skew_in_seconds = attributes[:'maxClockSkewInSeconds'] if attributes[:'maxClockSkewInSeconds']
      self.max_clock_skew_in_seconds = 0.0 if max_clock_skew_in_seconds.nil? && !attributes.key?(:'maxClockSkewInSeconds') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :maxClockSkewInSeconds and :max_clock_skew_in_seconds' if attributes.key?(:'maxClockSkewInSeconds') && attributes.key?(:'max_clock_skew_in_seconds')

      self.max_clock_skew_in_seconds = attributes[:'max_clock_skew_in_seconds'] if attributes[:'max_clock_skew_in_seconds']
      self.max_clock_skew_in_seconds = 0.0 if max_clock_skew_in_seconds.nil? && !attributes.key?(:'maxClockSkewInSeconds') && !attributes.key?(:'max_clock_skew_in_seconds') # rubocop:disable Style/StringLiterals

      self.public_keys = attributes[:'publicKeys'] if attributes[:'publicKeys']

      raise 'You cannot provide both :publicKeys and :public_keys' if attributes.key?(:'publicKeys') && attributes.key?(:'public_keys')

      self.public_keys = attributes[:'public_keys'] if attributes[:'public_keys']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        is_anonymous_access_allowed == other.is_anonymous_access_allowed &&
        type == other.type &&
        token_header == other.token_header &&
        token_query_param == other.token_query_param &&
        token_auth_scheme == other.token_auth_scheme &&
        issuers == other.issuers &&
        audiences == other.audiences &&
        verify_claims == other.verify_claims &&
        max_clock_skew_in_seconds == other.max_clock_skew_in_seconds &&
        public_keys == other.public_keys
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
      [is_anonymous_access_allowed, type, token_header, token_query_param, token_auth_scheme, issuers, audiences, verify_claims, max_clock_skew_in_seconds, public_keys].hash
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
