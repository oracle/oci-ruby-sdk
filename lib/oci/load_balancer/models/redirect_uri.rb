# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An object that defines the redirect URI applied to the original request. The object property values compose the
  # redirect URI.
  #
  # **NOTE:** The Load Balancing service cannot automatically detect or avoid infinite redirects. Be sure to provide
  # meaningful, complete, and correct field values. If any component field of this object has no value, the system
  # retains the value from the incoming HTTP request URI.
  #
  # For example, if you specify only the protocol field `https`, and the incoming request URI is
  # `http://example.com:8080`, the resulting runtime redirect URI is `https://example.com:8080`. The system retains
  # the host and port from the incoming URI and does not automatically change the port setting from `8080` to `443`.
  #
  # Be sure to configure valid percent-encoding (URL encoding) when needed.
  #
  # In addition to static string values, you can use the following tokens to construct the redirect URI. These tokens
  # extract values from the incoming HTTP request URI.
  #
  # *  {protocol} : The protocol from the incoming HTTP request URI.
  # *  {host}     : The domain name from the incoming HTTP request URI.
  # *  {port}     : The port from the incoming HTTP request URI.
  # *  {path}     : The path from the incoming HTTP request URI.
  # *  {query}    : The query string from the incoming HTTP request URI.
  #
  # The tokens are case sensitive. For example, `{host}` is a valid token, but `{HOST}` is not.
  #
  # You can retain the literal characters of a token when you specify values for the path and query properties of the
  # redirect URI. Use a backslash (\\\\) as the escape character for the \\\\, {, and } characters. For example, if the
  # incoming HTTP request URI is `/video`, the path property value:
  #
  # `/example{path}123\\{path\\}`
  #
  # appears in the constructed redirect URI as:
  #
  # `/example/video123{path}`
  #
  class LoadBalancer::Models::RedirectUri
    # The HTTP protocol to use in the redirect URI.
    #
    # When this value is null, not set, or set to `{protocol}`, the service preserves the original protocol from the
    # incoming HTTP request URI. Allowed values are:
    #
    # *  HTTP
    # *  HTTPS
    # *  {protocol}
    #
    # `{protocol}` is the only valid token for this property. It can appear only once in the value string.
    #
    # Example: `HTTPS`
    #
    # @return [String]
    attr_accessor :protocol

    # The valid domain name (hostname) or IP address to use in the redirect URI.
    #
    # When this value is null, not set, or set to `{host}`, the service preserves the original domain name from the
    # incoming HTTP request URI.
    #
    # All RedirectUri tokens are valid for this property. You can use any token more than once.
    #
    # Curly braces are valid in this property only to surround tokens, such as `{host}`
    #
    # Examples:
    #
    # *  **example.com** appears as `example.com` in the redirect URI.
    #
    # *  **in{host}** appears as `inexample.com` in the redirect URI if `example.com` is the hostname in the
    #    incoming HTTP request URI.
    #
    # *  **{port}{host}** appears as `8081example.com` in the redirect URI if `example.com` is the hostname and
    #    the port is `8081` in the incoming HTTP request URI.
    #
    # @return [String]
    attr_accessor :host

    # The communication port to use in the redirect URI.
    #
    # Valid values include integers from 1 to 65535.
    #
    # When this value is null, the service preserves the original port from the incoming HTTP request URI.
    #
    # Example: `8081`
    #
    # @return [Integer]
    attr_accessor :port

    # The HTTP URI path to use in the redirect URI.
    #
    # When this value is null, not set, or set to `{path}`, the service preserves the original path from the
    # incoming HTTP request URI. To omit the path from the redirect URI, set this value to an empty string, \"\".
    #
    # All RedirectUri tokens are valid for this property. You can use any token more than once.
    #
    # The path string must begin with `/` if it does not begin with the `{path}` token.
    #
    # Examples:
    #
    # *  __/example/video/123__ appears as `/example/video/123` in the redirect URI.
    #
    # *  __/example{path}__ appears as `/example/video/123` in the redirect URI if `/video/123` is the path in the
    #    incoming HTTP request URI.
    #
    # *  __{path}/123__ appears as `/example/video/123` in the redirect URI if `/example/video` is the path in the
    #    incoming HTTP request URI.
    #
    # *  __{path}123__ appears as `/example/video123` in the redirect URI if `/example/video` is the path in the
    #    incoming HTTP request URI.
    #
    # *  __/{host}/123__ appears as `/example.com/123` in the redirect URI if `example.com` is the hostname
    #    in the incoming HTTP request URI.
    #
    # *  __/{host}/{port}__ appears as `/example.com/123` in the redirect URI if `example.com` is the hostname and
    #    `123` is the port in the incoming HTTP request URI.
    #
    # *  __/{query}__ appears as `/lang=en` in the redirect URI if the query is `lang=en` in the incoming HTTP
    #    request URI.
    #
    # @return [String]
    attr_accessor :path

    # The query string to use in the redirect URI.
    #
    # When this value is null, not set, or set to `{query}`, the service preserves the original query parameters
    # from the incoming HTTP request URI.
    #
    # All `RedirectUri` tokens are valid for this property. You can use any token more than once.
    #
    # If the query string does not begin with the `{query}` token, it must begin with the question mark (?) character.
    #
    # You can specify multiple query parameters as a single string. Separate each query parameter with an ampersand
    # (&) character. To omit all incoming query parameters from the redirect URI, set this value to an empty
    # string, \"\".
    #
    # If the specified query string results in a redirect URI ending with `?` or `&`, the last character is truncated.
    # For example, if the incoming URI is `http://host.com:8080/documents` and the query property value is
    # `?lang=en&{query}`, the redirect URI is `http://host.com:8080/documents?lang=en`. The system
    # truncates the final ampersand (&) because the incoming URI included no value to replace the {query} token.
    #
    # Examples:
    # * **lang=en&time_zone=PST** appears as `lang=en&time_zone=PST` in the redirect URI.
    #
    # * **{query}** appears as `lang=en&time_zone=PST` in the redirect URI if `lang=en&time_zone=PST` is the query
    #   string in the incoming HTTP request. If the incoming HTTP request has no query parameters, the `{query}`
    #   token renders as an empty string.
    #
    # * **lang=en&{query}&time_zone=PST** appears as `lang=en&country=us&time_zone=PST` in the redirect URI if
    #   `country=us` is the query string in the incoming HTTP request. If the incoming HTTP request has no query
    #   parameters, this value renders as `lang=en&time_zone=PST`.
    #
    # *  **protocol={protocol}&hostname={host}** appears as `protocol=http&hostname=example.com` in the redirect
    #    URI if the protocol is `HTTP` and the hostname is `example.com` in the incoming HTTP request.
    #
    # *  **port={port}&hostname={host}** appears as `port=8080&hostname=example.com` in the redirect URI if the
    #    port is `8080` and the hostname is `example.com` in the incoming HTTP request URI.
    #
    # @return [String]
    attr_accessor :query

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'protocol': :'protocol',
        'host': :'host',
        'port': :'port',
        'path': :'path',
        'query': :'query'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'protocol': :'String',
        'host': :'String',
        'port': :'Integer',
        'path': :'String',
        'query': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :protocol The value to assign to the {#protocol} property
    # @option attributes [String] :host The value to assign to the {#host} property
    # @option attributes [Integer] :port The value to assign to the {#port} property
    # @option attributes [String] :path The value to assign to the {#path} property
    # @option attributes [String] :query The value to assign to the {#query} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.protocol = attributes[:'protocol'] if attributes[:'protocol']

      self.host = attributes[:'host'] if attributes[:'host']

      self.port = attributes[:'port'] if attributes[:'port']

      self.path = attributes[:'path'] if attributes[:'path']

      self.query = attributes[:'query'] if attributes[:'query']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        protocol == other.protocol &&
        host == other.host &&
        port == other.port &&
        path == other.path &&
        query == other.query
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
      [protocol, host, port, path, query].hash
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
