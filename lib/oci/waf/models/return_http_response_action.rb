# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'action'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An object that represents an action which returns a defined HTTP response.
  class Waf::Models::ReturnHttpResponseAction < Waf::Models::Action
    # **[Required]** Response code.
    #
    # The following response codes are valid values for this property:
    #
    # * 2xx
    #
    #   200 OK
    #   201 Created
    #   202 Accepted
    #   206 Partial Content
    #
    # * 3xx
    #
    #   300 Multiple Choices
    #   301 Moved Permanently
    #   302 Found
    #   303 See Other
    #   307 Temporary Redirect
    #
    # * 4xx
    #
    #   400 Bad Request
    #   401 Unauthorized
    #   403 Forbidden
    #   404 Not Found
    #   405 Method Not Allowed
    #   408 Request Timeout
    #   409 Conflict
    #   411 Length Required
    #   412 Precondition Failed
    #   413 Payload Too Large
    #   414 URI Too Long
    #   415 Unsupported Media Type
    #   416 Range Not Satisfiable
    #   422 Unprocessable Entity
    #   494 Request Header Too Large
    #   495 Cert Error
    #   496 No Cert
    #   497 HTTP to HTTPS
    #
    # * 5xx
    #
    #   500 Internal Server Error
    #   501 Not Implemented
    #   502 Bad Gateway
    #   503 Service Unavailable
    #   504 Gateway Timeout
    #   507 Insufficient Storage
    #
    # Example: `200`
    #
    # @return [Integer]
    attr_accessor :code

    # Adds headers defined in this array for HTTP response.
    #
    # Hop-by-hop headers are not allowed to be set:
    #
    # * Connection
    # * Keep-Alive
    # * Proxy-Authenticate
    # * Proxy-Authorization
    # * TE
    # * Trailer
    # * Transfer-Encoding
    # * Upgrade
    #
    # @return [Array<OCI::Waf::Models::ResponseHeader>]
    attr_accessor :headers

    # @return [OCI::Waf::Models::HttpResponseBody]
    attr_accessor :body

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'name': :'name',
        'code': :'code',
        'headers': :'headers',
        'body': :'body'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'name': :'String',
        'code': :'Integer',
        'headers': :'Array<OCI::Waf::Models::ResponseHeader>',
        'body': :'OCI::Waf::Models::HttpResponseBody'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {OCI::Waf::Models::Action#name #name} proprety
    # @option attributes [Integer] :code The value to assign to the {#code} property
    # @option attributes [Array<OCI::Waf::Models::ResponseHeader>] :headers The value to assign to the {#headers} property
    # @option attributes [OCI::Waf::Models::HttpResponseBody] :body The value to assign to the {#body} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'RETURN_HTTP_RESPONSE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.code = attributes[:'code'] if attributes[:'code']

      self.headers = attributes[:'headers'] if attributes[:'headers']

      self.body = attributes[:'body'] if attributes[:'body']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        name == other.name &&
        code == other.code &&
        headers == other.headers &&
        body == other.body
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
      [type, name, code, headers, body].hash
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
