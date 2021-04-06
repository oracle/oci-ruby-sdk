# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'
require_relative 'monitor_configuration'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Request configuration details for the REST monitor type.
  class ApmSynthetics::Models::RestMonitorConfiguration < ApmSynthetics::Models::MonitorConfiguration
    REQUEST_METHOD_ENUM = [
      REQUEST_METHOD_GET = 'GET'.freeze,
      REQUEST_METHOD_POST = 'POST'.freeze,
      REQUEST_METHOD_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    REQ_AUTHENTICATION_SCHEME_ENUM = [
      REQ_AUTHENTICATION_SCHEME_OAUTH = 'OAUTH'.freeze,
      REQ_AUTHENTICATION_SCHEME_NONE = 'NONE'.freeze,
      REQ_AUTHENTICATION_SCHEME_BASIC = 'BASIC'.freeze,
      REQ_AUTHENTICATION_SCHEME_BEARER = 'BEARER'.freeze,
      REQ_AUTHENTICATION_SCHEME_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # If redirection enabled, then redirects will be allowed while accessing target URL.
    # @return [BOOLEAN]
    attr_accessor :is_redirection_enabled

    # If certificate validation enabled, then call will fail for certificate errors.
    # @return [BOOLEAN]
    attr_accessor :is_certificate_validation_enabled

    # Request HTTP method.
    # @return [String]
    attr_reader :request_method

    # Request http authentication scheme.
    # @return [String]
    attr_reader :req_authentication_scheme

    # @return [OCI::ApmSynthetics::Models::RequestAuthenticationDetails]
    attr_accessor :req_authentication_details

    # List of request headers. Example: `[{\"headerName\": \"content-type\", \"headerValue\":\"json\"}]`
    #
    # @return [Array<OCI::ApmSynthetics::Models::Header>]
    attr_accessor :request_headers

    # List of request query params. Example: `[{\"paramName\": \"sortOrder\", \"paramValue\": \"asc\"}]`
    #
    # @return [Array<OCI::ApmSynthetics::Models::RequestQueryParam>]
    attr_accessor :request_query_params

    # Request post body content.
    # @return [String]
    attr_accessor :request_post_body

    # Verify response content against regular expression based string.
    # If response content does not match the verifyResponseContent value, then it will be considered a failure.
    #
    # @return [String]
    attr_accessor :verify_response_content

    # Expected HTTP response codes. For status code range, set values such as 2xx, 3xx.
    #
    # @return [Array<String>]
    attr_accessor :verify_response_codes

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'config_type': :'configType',
        'is_failure_retried': :'isFailureRetried',
        'is_redirection_enabled': :'isRedirectionEnabled',
        'is_certificate_validation_enabled': :'isCertificateValidationEnabled',
        'request_method': :'requestMethod',
        'req_authentication_scheme': :'reqAuthenticationScheme',
        'req_authentication_details': :'reqAuthenticationDetails',
        'request_headers': :'requestHeaders',
        'request_query_params': :'requestQueryParams',
        'request_post_body': :'requestPostBody',
        'verify_response_content': :'verifyResponseContent',
        'verify_response_codes': :'verifyResponseCodes'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'config_type': :'String',
        'is_failure_retried': :'BOOLEAN',
        'is_redirection_enabled': :'BOOLEAN',
        'is_certificate_validation_enabled': :'BOOLEAN',
        'request_method': :'String',
        'req_authentication_scheme': :'String',
        'req_authentication_details': :'OCI::ApmSynthetics::Models::RequestAuthenticationDetails',
        'request_headers': :'Array<OCI::ApmSynthetics::Models::Header>',
        'request_query_params': :'Array<OCI::ApmSynthetics::Models::RequestQueryParam>',
        'request_post_body': :'String',
        'verify_response_content': :'String',
        'verify_response_codes': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_failure_retried The value to assign to the {OCI::ApmSynthetics::Models::MonitorConfiguration#is_failure_retried #is_failure_retried} proprety
    # @option attributes [BOOLEAN] :is_redirection_enabled The value to assign to the {#is_redirection_enabled} property
    # @option attributes [BOOLEAN] :is_certificate_validation_enabled The value to assign to the {#is_certificate_validation_enabled} property
    # @option attributes [String] :request_method The value to assign to the {#request_method} property
    # @option attributes [String] :req_authentication_scheme The value to assign to the {#req_authentication_scheme} property
    # @option attributes [OCI::ApmSynthetics::Models::RequestAuthenticationDetails] :req_authentication_details The value to assign to the {#req_authentication_details} property
    # @option attributes [Array<OCI::ApmSynthetics::Models::Header>] :request_headers The value to assign to the {#request_headers} property
    # @option attributes [Array<OCI::ApmSynthetics::Models::RequestQueryParam>] :request_query_params The value to assign to the {#request_query_params} property
    # @option attributes [String] :request_post_body The value to assign to the {#request_post_body} property
    # @option attributes [String] :verify_response_content The value to assign to the {#verify_response_content} property
    # @option attributes [Array<String>] :verify_response_codes The value to assign to the {#verify_response_codes} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['configType'] = 'REST_CONFIG'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_redirection_enabled = attributes[:'isRedirectionEnabled'] unless attributes[:'isRedirectionEnabled'].nil?
      self.is_redirection_enabled = true if is_redirection_enabled.nil? && !attributes.key?(:'isRedirectionEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isRedirectionEnabled and :is_redirection_enabled' if attributes.key?(:'isRedirectionEnabled') && attributes.key?(:'is_redirection_enabled')

      self.is_redirection_enabled = attributes[:'is_redirection_enabled'] unless attributes[:'is_redirection_enabled'].nil?
      self.is_redirection_enabled = true if is_redirection_enabled.nil? && !attributes.key?(:'isRedirectionEnabled') && !attributes.key?(:'is_redirection_enabled') # rubocop:disable Style/StringLiterals

      self.is_certificate_validation_enabled = attributes[:'isCertificateValidationEnabled'] unless attributes[:'isCertificateValidationEnabled'].nil?
      self.is_certificate_validation_enabled = true if is_certificate_validation_enabled.nil? && !attributes.key?(:'isCertificateValidationEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isCertificateValidationEnabled and :is_certificate_validation_enabled' if attributes.key?(:'isCertificateValidationEnabled') && attributes.key?(:'is_certificate_validation_enabled')

      self.is_certificate_validation_enabled = attributes[:'is_certificate_validation_enabled'] unless attributes[:'is_certificate_validation_enabled'].nil?
      self.is_certificate_validation_enabled = true if is_certificate_validation_enabled.nil? && !attributes.key?(:'isCertificateValidationEnabled') && !attributes.key?(:'is_certificate_validation_enabled') # rubocop:disable Style/StringLiterals

      self.request_method = attributes[:'requestMethod'] if attributes[:'requestMethod']
      self.request_method = "GET" if request_method.nil? && !attributes.key?(:'requestMethod') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :requestMethod and :request_method' if attributes.key?(:'requestMethod') && attributes.key?(:'request_method')

      self.request_method = attributes[:'request_method'] if attributes[:'request_method']
      self.request_method = "GET" if request_method.nil? && !attributes.key?(:'requestMethod') && !attributes.key?(:'request_method') # rubocop:disable Style/StringLiterals

      self.req_authentication_scheme = attributes[:'reqAuthenticationScheme'] if attributes[:'reqAuthenticationScheme']
      self.req_authentication_scheme = "NONE" if req_authentication_scheme.nil? && !attributes.key?(:'reqAuthenticationScheme') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :reqAuthenticationScheme and :req_authentication_scheme' if attributes.key?(:'reqAuthenticationScheme') && attributes.key?(:'req_authentication_scheme')

      self.req_authentication_scheme = attributes[:'req_authentication_scheme'] if attributes[:'req_authentication_scheme']
      self.req_authentication_scheme = "NONE" if req_authentication_scheme.nil? && !attributes.key?(:'reqAuthenticationScheme') && !attributes.key?(:'req_authentication_scheme') # rubocop:disable Style/StringLiterals

      self.req_authentication_details = attributes[:'reqAuthenticationDetails'] if attributes[:'reqAuthenticationDetails']

      raise 'You cannot provide both :reqAuthenticationDetails and :req_authentication_details' if attributes.key?(:'reqAuthenticationDetails') && attributes.key?(:'req_authentication_details')

      self.req_authentication_details = attributes[:'req_authentication_details'] if attributes[:'req_authentication_details']

      self.request_headers = attributes[:'requestHeaders'] if attributes[:'requestHeaders']

      raise 'You cannot provide both :requestHeaders and :request_headers' if attributes.key?(:'requestHeaders') && attributes.key?(:'request_headers')

      self.request_headers = attributes[:'request_headers'] if attributes[:'request_headers']

      self.request_query_params = attributes[:'requestQueryParams'] if attributes[:'requestQueryParams']

      raise 'You cannot provide both :requestQueryParams and :request_query_params' if attributes.key?(:'requestQueryParams') && attributes.key?(:'request_query_params')

      self.request_query_params = attributes[:'request_query_params'] if attributes[:'request_query_params']

      self.request_post_body = attributes[:'requestPostBody'] if attributes[:'requestPostBody']

      raise 'You cannot provide both :requestPostBody and :request_post_body' if attributes.key?(:'requestPostBody') && attributes.key?(:'request_post_body')

      self.request_post_body = attributes[:'request_post_body'] if attributes[:'request_post_body']

      self.verify_response_content = attributes[:'verifyResponseContent'] if attributes[:'verifyResponseContent']

      raise 'You cannot provide both :verifyResponseContent and :verify_response_content' if attributes.key?(:'verifyResponseContent') && attributes.key?(:'verify_response_content')

      self.verify_response_content = attributes[:'verify_response_content'] if attributes[:'verify_response_content']

      self.verify_response_codes = attributes[:'verifyResponseCodes'] if attributes[:'verifyResponseCodes']

      raise 'You cannot provide both :verifyResponseCodes and :verify_response_codes' if attributes.key?(:'verifyResponseCodes') && attributes.key?(:'verify_response_codes')

      self.verify_response_codes = attributes[:'verify_response_codes'] if attributes[:'verify_response_codes']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] request_method Object to be assigned
    def request_method=(request_method)
      # rubocop:disable Style/ConditionalAssignment
      if request_method && !REQUEST_METHOD_ENUM.include?(request_method)
        OCI.logger.debug("Unknown value for 'request_method' [" + request_method + "]. Mapping to 'REQUEST_METHOD_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @request_method = REQUEST_METHOD_UNKNOWN_ENUM_VALUE
      else
        @request_method = request_method
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] req_authentication_scheme Object to be assigned
    def req_authentication_scheme=(req_authentication_scheme)
      # rubocop:disable Style/ConditionalAssignment
      if req_authentication_scheme && !REQ_AUTHENTICATION_SCHEME_ENUM.include?(req_authentication_scheme)
        OCI.logger.debug("Unknown value for 'req_authentication_scheme' [" + req_authentication_scheme + "]. Mapping to 'REQ_AUTHENTICATION_SCHEME_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @req_authentication_scheme = REQ_AUTHENTICATION_SCHEME_UNKNOWN_ENUM_VALUE
      else
        @req_authentication_scheme = req_authentication_scheme
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        config_type == other.config_type &&
        is_failure_retried == other.is_failure_retried &&
        is_redirection_enabled == other.is_redirection_enabled &&
        is_certificate_validation_enabled == other.is_certificate_validation_enabled &&
        request_method == other.request_method &&
        req_authentication_scheme == other.req_authentication_scheme &&
        req_authentication_details == other.req_authentication_details &&
        request_headers == other.request_headers &&
        request_query_params == other.request_query_params &&
        request_post_body == other.request_post_body &&
        verify_response_content == other.verify_response_content &&
        verify_response_codes == other.verify_response_codes
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
      [config_type, is_failure_retried, is_redirection_enabled, is_certificate_validation_enabled, request_method, req_authentication_scheme, req_authentication_details, request_headers, request_query_params, request_post_body, verify_response_content, verify_response_codes].hash
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
