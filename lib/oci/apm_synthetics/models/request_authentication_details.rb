# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details for request HTTP authentication.
  class ApmSynthetics::Models::RequestAuthenticationDetails
    OAUTH_SCHEME_ENUM = [
      OAUTH_SCHEME_NONE = 'NONE'.freeze,
      OAUTH_SCHEME_BASIC = 'BASIC'.freeze,
      OAUTH_SCHEME_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    AUTH_REQUEST_METHOD_ENUM = [
      AUTH_REQUEST_METHOD_GET = 'GET'.freeze,
      AUTH_REQUEST_METHOD_POST = 'POST'.freeze,
      AUTH_REQUEST_METHOD_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Request http oauth scheme.
    # @return [String]
    attr_reader :oauth_scheme

    # Username for authentication.
    # @return [String]
    attr_accessor :auth_user_name

    # User password for authentication.
    # @return [String]
    attr_accessor :auth_user_password

    # Authentication token.
    # @return [String]
    attr_accessor :auth_token

    # URL to get authetication token.
    # @return [String]
    attr_accessor :auth_url

    # List of authentication headers. Example: `[{\"headerName\": \"content-type\", \"headerValue\":\"json\"}]`
    #
    # @return [Array<OCI::ApmSynthetics::Models::Header>]
    attr_accessor :auth_headers

    # Request method.
    # @return [String]
    attr_reader :auth_request_method

    # Request post body.
    # @return [String]
    attr_accessor :auth_request_post_body

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'oauth_scheme': :'oauthScheme',
        'auth_user_name': :'authUserName',
        'auth_user_password': :'authUserPassword',
        'auth_token': :'authToken',
        'auth_url': :'authUrl',
        'auth_headers': :'authHeaders',
        'auth_request_method': :'authRequestMethod',
        'auth_request_post_body': :'authRequestPostBody'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'oauth_scheme': :'String',
        'auth_user_name': :'String',
        'auth_user_password': :'String',
        'auth_token': :'String',
        'auth_url': :'String',
        'auth_headers': :'Array<OCI::ApmSynthetics::Models::Header>',
        'auth_request_method': :'String',
        'auth_request_post_body': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :oauth_scheme The value to assign to the {#oauth_scheme} property
    # @option attributes [String] :auth_user_name The value to assign to the {#auth_user_name} property
    # @option attributes [String] :auth_user_password The value to assign to the {#auth_user_password} property
    # @option attributes [String] :auth_token The value to assign to the {#auth_token} property
    # @option attributes [String] :auth_url The value to assign to the {#auth_url} property
    # @option attributes [Array<OCI::ApmSynthetics::Models::Header>] :auth_headers The value to assign to the {#auth_headers} property
    # @option attributes [String] :auth_request_method The value to assign to the {#auth_request_method} property
    # @option attributes [String] :auth_request_post_body The value to assign to the {#auth_request_post_body} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.oauth_scheme = attributes[:'oauthScheme'] if attributes[:'oauthScheme']
      self.oauth_scheme = "NONE" if oauth_scheme.nil? && !attributes.key?(:'oauthScheme') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :oauthScheme and :oauth_scheme' if attributes.key?(:'oauthScheme') && attributes.key?(:'oauth_scheme')

      self.oauth_scheme = attributes[:'oauth_scheme'] if attributes[:'oauth_scheme']
      self.oauth_scheme = "NONE" if oauth_scheme.nil? && !attributes.key?(:'oauthScheme') && !attributes.key?(:'oauth_scheme') # rubocop:disable Style/StringLiterals

      self.auth_user_name = attributes[:'authUserName'] if attributes[:'authUserName']

      raise 'You cannot provide both :authUserName and :auth_user_name' if attributes.key?(:'authUserName') && attributes.key?(:'auth_user_name')

      self.auth_user_name = attributes[:'auth_user_name'] if attributes[:'auth_user_name']

      self.auth_user_password = attributes[:'authUserPassword'] if attributes[:'authUserPassword']

      raise 'You cannot provide both :authUserPassword and :auth_user_password' if attributes.key?(:'authUserPassword') && attributes.key?(:'auth_user_password')

      self.auth_user_password = attributes[:'auth_user_password'] if attributes[:'auth_user_password']

      self.auth_token = attributes[:'authToken'] if attributes[:'authToken']

      raise 'You cannot provide both :authToken and :auth_token' if attributes.key?(:'authToken') && attributes.key?(:'auth_token')

      self.auth_token = attributes[:'auth_token'] if attributes[:'auth_token']

      self.auth_url = attributes[:'authUrl'] if attributes[:'authUrl']

      raise 'You cannot provide both :authUrl and :auth_url' if attributes.key?(:'authUrl') && attributes.key?(:'auth_url')

      self.auth_url = attributes[:'auth_url'] if attributes[:'auth_url']

      self.auth_headers = attributes[:'authHeaders'] if attributes[:'authHeaders']

      raise 'You cannot provide both :authHeaders and :auth_headers' if attributes.key?(:'authHeaders') && attributes.key?(:'auth_headers')

      self.auth_headers = attributes[:'auth_headers'] if attributes[:'auth_headers']

      self.auth_request_method = attributes[:'authRequestMethod'] if attributes[:'authRequestMethod']
      self.auth_request_method = "GET" if auth_request_method.nil? && !attributes.key?(:'authRequestMethod') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :authRequestMethod and :auth_request_method' if attributes.key?(:'authRequestMethod') && attributes.key?(:'auth_request_method')

      self.auth_request_method = attributes[:'auth_request_method'] if attributes[:'auth_request_method']
      self.auth_request_method = "GET" if auth_request_method.nil? && !attributes.key?(:'authRequestMethod') && !attributes.key?(:'auth_request_method') # rubocop:disable Style/StringLiterals

      self.auth_request_post_body = attributes[:'authRequestPostBody'] if attributes[:'authRequestPostBody']

      raise 'You cannot provide both :authRequestPostBody and :auth_request_post_body' if attributes.key?(:'authRequestPostBody') && attributes.key?(:'auth_request_post_body')

      self.auth_request_post_body = attributes[:'auth_request_post_body'] if attributes[:'auth_request_post_body']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] oauth_scheme Object to be assigned
    def oauth_scheme=(oauth_scheme)
      # rubocop:disable Style/ConditionalAssignment
      if oauth_scheme && !OAUTH_SCHEME_ENUM.include?(oauth_scheme)
        OCI.logger.debug("Unknown value for 'oauth_scheme' [" + oauth_scheme + "]. Mapping to 'OAUTH_SCHEME_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @oauth_scheme = OAUTH_SCHEME_UNKNOWN_ENUM_VALUE
      else
        @oauth_scheme = oauth_scheme
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] auth_request_method Object to be assigned
    def auth_request_method=(auth_request_method)
      # rubocop:disable Style/ConditionalAssignment
      if auth_request_method && !AUTH_REQUEST_METHOD_ENUM.include?(auth_request_method)
        OCI.logger.debug("Unknown value for 'auth_request_method' [" + auth_request_method + "]. Mapping to 'AUTH_REQUEST_METHOD_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @auth_request_method = AUTH_REQUEST_METHOD_UNKNOWN_ENUM_VALUE
      else
        @auth_request_method = auth_request_method
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        oauth_scheme == other.oauth_scheme &&
        auth_user_name == other.auth_user_name &&
        auth_user_password == other.auth_user_password &&
        auth_token == other.auth_token &&
        auth_url == other.auth_url &&
        auth_headers == other.auth_headers &&
        auth_request_method == other.auth_request_method &&
        auth_request_post_body == other.auth_request_post_body
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
      [oauth_scheme, auth_user_name, auth_user_password, auth_token, auth_url, auth_headers, auth_request_method, auth_request_post_body].hash
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
