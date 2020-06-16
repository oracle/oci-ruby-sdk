# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The configuration details for the WAAS policy.
  class Waas::Models::PolicyConfig
    TLS_PROTOCOLS_ENUM = [
      TLS_PROTOCOLS_TLS_V1 = 'TLS_V1'.freeze,
      TLS_PROTOCOLS_TLS_V1_1 = 'TLS_V1_1'.freeze,
      TLS_PROTOCOLS_TLS_V1_2 = 'TLS_V1_2'.freeze,
      TLS_PROTOCOLS_TLS_V1_3 = 'TLS_V1_3'.freeze,
      TLS_PROTOCOLS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    CLIENT_ADDRESS_HEADER_ENUM = [
      CLIENT_ADDRESS_HEADER_X_FORWARDED_FOR = 'X_FORWARDED_FOR'.freeze,
      CLIENT_ADDRESS_HEADER_X_CLIENT_IP = 'X_CLIENT_IP'.freeze,
      CLIENT_ADDRESS_HEADER_X_REAL_IP = 'X_REAL_IP'.freeze,
      CLIENT_ADDRESS_HEADER_CLIENT_IP = 'CLIENT_IP'.freeze,
      CLIENT_ADDRESS_HEADER_TRUE_CLIENT_IP = 'TRUE_CLIENT_IP'.freeze,
      CLIENT_ADDRESS_HEADER_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    CIPHER_GROUP_ENUM = [
      CIPHER_GROUP_DEFAULT = 'DEFAULT'.freeze,
      CIPHER_GROUP_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The OCID of the SSL certificate to use if HTTPS is supported.
    # @return [String]
    attr_accessor :certificate_id

    # Enable or disable HTTPS support. If true, a `certificateId` is required. If unspecified, defaults to `false`.
    # @return [BOOLEAN]
    attr_accessor :is_https_enabled

    # Force HTTP to HTTPS redirection. If unspecified, defaults to `false`.
    # @return [BOOLEAN]
    attr_accessor :is_https_forced

    # A list of allowed TLS protocols. Only applicable when HTTPS support is enabled.
    # The TLS protocol is negotiated while the request is connecting and the most recent protocol supported by both the edge node and client browser will be selected. If no such version exists, the connection will be aborted.
    # - **TLS_V1:** corresponds to TLS 1.0 specification.
    #
    # - **TLS_V1_1:** corresponds to TLS 1.1 specification.
    #
    # - **TLS_V1_2:** corresponds to TLS 1.2 specification.
    #
    # - **TLS_V1_3:** corresponds to TLS 1.3 specification.
    #
    # Enabled TLS protocols must go in a row. For example if `TLS_v1_1` and `TLS_V1_3` are enabled, `TLS_V1_2` must be enabled too.
    # @return [Array<String>]
    attr_reader :tls_protocols

    # Enable or disable GZIP compression of origin responses. If enabled, the header `Accept-Encoding: gzip` is sent to origin, otherwise, the empty `Accept-Encoding:` header is used.
    # @return [BOOLEAN]
    attr_accessor :is_origin_compression_enabled

    # Enabling `isBehindCdn` allows for the collection of IP addresses from client requests if the WAF is connected to a CDN.
    # @return [BOOLEAN]
    attr_accessor :is_behind_cdn

    # Specifies an HTTP header name which is treated as the connecting client's IP address. Applicable only if `isBehindCdn` is enabled.
    #
    # The edge node reads this header and its value and sets the client IP address as specified. It does not create the header if the header is not present in the request. If the header is not present, the connecting IP address will be used as the client's true IP address. It uses the last IP address in the header's value as the true IP address.
    #
    # Example: `X-Client-Ip: 11.1.1.1, 13.3.3.3`
    #
    # In the case of multiple headers with the same name, only the first header will be used. It is assumed that CDN sets the correct client IP address to prevent spoofing.
    #
    # - **X_FORWARDED_FOR:** Corresponds to `X-Forwarded-For` header name.
    #
    # - **X_CLIENT_IP:** Corresponds to `X-Client-Ip` header name.
    #
    # - **X_REAL_IP:** Corresponds to `X-Real-Ip` header name.
    #
    # - **CLIENT_IP:** Corresponds to `Client-Ip` header name.
    #
    # - **TRUE_CLIENT_IP:** Corresponds to `True-Client-Ip` header name.
    # @return [String]
    attr_reader :client_address_header

    # Enable or disable automatic content caching based on the response `cache-control` header. This feature enables the origin to act as a proxy cache. Caching is usually defined using `cache-control` header. For example `cache-control: max-age=120` means that the returned resource is valid for 120 seconds. Caching rules will overwrite this setting.
    # @return [BOOLEAN]
    attr_accessor :is_cache_control_respected

    # Enable or disable buffering of responses from the origin. Buffering improves overall stability in case of network issues, but slightly increases Time To First Byte.
    # @return [BOOLEAN]
    attr_accessor :is_response_buffering_enabled

    # The set cipher group for the configured TLS protocol. This sets the configuration for the TLS connections between clients and edge nodes only.
    # - **DEFAULT:** Cipher group supports TLS 1.0, TLS 1.1, TLS 1.2, TLS 1.3 protocols. It has the following ciphers enabled: `ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:!DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA`
    # @return [String]
    attr_reader :cipher_group

    # An object that represents a load balancing method and its properties.
    # @return [OCI::Waas::Models::LoadBalancingMethod]
    attr_accessor :load_balancing_method

    # ModSecurity is not capable to inspect WebSockets. Therefore paths specified here have WAF disabled if Connection request header from the client has the value Upgrade (case insensitive matching) and Upgrade request header has the value websocket (case insensitive matching). Paths matches if the concatenation of request URL path and query starts with the contents of the one of `websocketPathPrefixes` array value. In All other cases challenges, like JSC, HIC and etc., remain active.
    # @return [Array<String>]
    attr_accessor :websocket_path_prefixes

    # SNI stands for Server Name Indication and is an extension of the TLS protocol. It indicates which hostname is being contacted by the browser at the beginning of the 'handshake'-process. This allows a server to connect multiple SSL Certificates to one IP address and port.
    # @return [BOOLEAN]
    attr_accessor :is_sni_enabled

    # @return [OCI::Waas::Models::HealthCheck]
    attr_accessor :health_checks

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'certificate_id': :'certificateId',
        'is_https_enabled': :'isHttpsEnabled',
        'is_https_forced': :'isHttpsForced',
        'tls_protocols': :'tlsProtocols',
        'is_origin_compression_enabled': :'isOriginCompressionEnabled',
        'is_behind_cdn': :'isBehindCdn',
        'client_address_header': :'clientAddressHeader',
        'is_cache_control_respected': :'isCacheControlRespected',
        'is_response_buffering_enabled': :'isResponseBufferingEnabled',
        'cipher_group': :'cipherGroup',
        'load_balancing_method': :'loadBalancingMethod',
        'websocket_path_prefixes': :'websocketPathPrefixes',
        'is_sni_enabled': :'isSniEnabled',
        'health_checks': :'healthChecks'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'certificate_id': :'String',
        'is_https_enabled': :'BOOLEAN',
        'is_https_forced': :'BOOLEAN',
        'tls_protocols': :'Array<String>',
        'is_origin_compression_enabled': :'BOOLEAN',
        'is_behind_cdn': :'BOOLEAN',
        'client_address_header': :'String',
        'is_cache_control_respected': :'BOOLEAN',
        'is_response_buffering_enabled': :'BOOLEAN',
        'cipher_group': :'String',
        'load_balancing_method': :'OCI::Waas::Models::LoadBalancingMethod',
        'websocket_path_prefixes': :'Array<String>',
        'is_sni_enabled': :'BOOLEAN',
        'health_checks': :'OCI::Waas::Models::HealthCheck'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :certificate_id The value to assign to the {#certificate_id} property
    # @option attributes [BOOLEAN] :is_https_enabled The value to assign to the {#is_https_enabled} property
    # @option attributes [BOOLEAN] :is_https_forced The value to assign to the {#is_https_forced} property
    # @option attributes [Array<String>] :tls_protocols The value to assign to the {#tls_protocols} property
    # @option attributes [BOOLEAN] :is_origin_compression_enabled The value to assign to the {#is_origin_compression_enabled} property
    # @option attributes [BOOLEAN] :is_behind_cdn The value to assign to the {#is_behind_cdn} property
    # @option attributes [String] :client_address_header The value to assign to the {#client_address_header} property
    # @option attributes [BOOLEAN] :is_cache_control_respected The value to assign to the {#is_cache_control_respected} property
    # @option attributes [BOOLEAN] :is_response_buffering_enabled The value to assign to the {#is_response_buffering_enabled} property
    # @option attributes [String] :cipher_group The value to assign to the {#cipher_group} property
    # @option attributes [OCI::Waas::Models::LoadBalancingMethod] :load_balancing_method The value to assign to the {#load_balancing_method} property
    # @option attributes [Array<String>] :websocket_path_prefixes The value to assign to the {#websocket_path_prefixes} property
    # @option attributes [BOOLEAN] :is_sni_enabled The value to assign to the {#is_sni_enabled} property
    # @option attributes [OCI::Waas::Models::HealthCheck] :health_checks The value to assign to the {#health_checks} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.certificate_id = attributes[:'certificateId'] if attributes[:'certificateId']

      raise 'You cannot provide both :certificateId and :certificate_id' if attributes.key?(:'certificateId') && attributes.key?(:'certificate_id')

      self.certificate_id = attributes[:'certificate_id'] if attributes[:'certificate_id']

      self.is_https_enabled = attributes[:'isHttpsEnabled'] unless attributes[:'isHttpsEnabled'].nil?

      raise 'You cannot provide both :isHttpsEnabled and :is_https_enabled' if attributes.key?(:'isHttpsEnabled') && attributes.key?(:'is_https_enabled')

      self.is_https_enabled = attributes[:'is_https_enabled'] unless attributes[:'is_https_enabled'].nil?

      self.is_https_forced = attributes[:'isHttpsForced'] unless attributes[:'isHttpsForced'].nil?

      raise 'You cannot provide both :isHttpsForced and :is_https_forced' if attributes.key?(:'isHttpsForced') && attributes.key?(:'is_https_forced')

      self.is_https_forced = attributes[:'is_https_forced'] unless attributes[:'is_https_forced'].nil?

      self.tls_protocols = attributes[:'tlsProtocols'] if attributes[:'tlsProtocols']

      raise 'You cannot provide both :tlsProtocols and :tls_protocols' if attributes.key?(:'tlsProtocols') && attributes.key?(:'tls_protocols')

      self.tls_protocols = attributes[:'tls_protocols'] if attributes[:'tls_protocols']

      self.is_origin_compression_enabled = attributes[:'isOriginCompressionEnabled'] unless attributes[:'isOriginCompressionEnabled'].nil?
      self.is_origin_compression_enabled = true if is_origin_compression_enabled.nil? && !attributes.key?(:'isOriginCompressionEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isOriginCompressionEnabled and :is_origin_compression_enabled' if attributes.key?(:'isOriginCompressionEnabled') && attributes.key?(:'is_origin_compression_enabled')

      self.is_origin_compression_enabled = attributes[:'is_origin_compression_enabled'] unless attributes[:'is_origin_compression_enabled'].nil?
      self.is_origin_compression_enabled = true if is_origin_compression_enabled.nil? && !attributes.key?(:'isOriginCompressionEnabled') && !attributes.key?(:'is_origin_compression_enabled') # rubocop:disable Style/StringLiterals

      self.is_behind_cdn = attributes[:'isBehindCdn'] unless attributes[:'isBehindCdn'].nil?
      self.is_behind_cdn = false if is_behind_cdn.nil? && !attributes.key?(:'isBehindCdn') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isBehindCdn and :is_behind_cdn' if attributes.key?(:'isBehindCdn') && attributes.key?(:'is_behind_cdn')

      self.is_behind_cdn = attributes[:'is_behind_cdn'] unless attributes[:'is_behind_cdn'].nil?
      self.is_behind_cdn = false if is_behind_cdn.nil? && !attributes.key?(:'isBehindCdn') && !attributes.key?(:'is_behind_cdn') # rubocop:disable Style/StringLiterals

      self.client_address_header = attributes[:'clientAddressHeader'] if attributes[:'clientAddressHeader']

      raise 'You cannot provide both :clientAddressHeader and :client_address_header' if attributes.key?(:'clientAddressHeader') && attributes.key?(:'client_address_header')

      self.client_address_header = attributes[:'client_address_header'] if attributes[:'client_address_header']

      self.is_cache_control_respected = attributes[:'isCacheControlRespected'] unless attributes[:'isCacheControlRespected'].nil?
      self.is_cache_control_respected = false if is_cache_control_respected.nil? && !attributes.key?(:'isCacheControlRespected') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isCacheControlRespected and :is_cache_control_respected' if attributes.key?(:'isCacheControlRespected') && attributes.key?(:'is_cache_control_respected')

      self.is_cache_control_respected = attributes[:'is_cache_control_respected'] unless attributes[:'is_cache_control_respected'].nil?
      self.is_cache_control_respected = false if is_cache_control_respected.nil? && !attributes.key?(:'isCacheControlRespected') && !attributes.key?(:'is_cache_control_respected') # rubocop:disable Style/StringLiterals

      self.is_response_buffering_enabled = attributes[:'isResponseBufferingEnabled'] unless attributes[:'isResponseBufferingEnabled'].nil?
      self.is_response_buffering_enabled = false if is_response_buffering_enabled.nil? && !attributes.key?(:'isResponseBufferingEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isResponseBufferingEnabled and :is_response_buffering_enabled' if attributes.key?(:'isResponseBufferingEnabled') && attributes.key?(:'is_response_buffering_enabled')

      self.is_response_buffering_enabled = attributes[:'is_response_buffering_enabled'] unless attributes[:'is_response_buffering_enabled'].nil?
      self.is_response_buffering_enabled = false if is_response_buffering_enabled.nil? && !attributes.key?(:'isResponseBufferingEnabled') && !attributes.key?(:'is_response_buffering_enabled') # rubocop:disable Style/StringLiterals

      self.cipher_group = attributes[:'cipherGroup'] if attributes[:'cipherGroup']
      self.cipher_group = "DEFAULT" if cipher_group.nil? && !attributes.key?(:'cipherGroup') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :cipherGroup and :cipher_group' if attributes.key?(:'cipherGroup') && attributes.key?(:'cipher_group')

      self.cipher_group = attributes[:'cipher_group'] if attributes[:'cipher_group']
      self.cipher_group = "DEFAULT" if cipher_group.nil? && !attributes.key?(:'cipherGroup') && !attributes.key?(:'cipher_group') # rubocop:disable Style/StringLiterals

      self.load_balancing_method = attributes[:'loadBalancingMethod'] if attributes[:'loadBalancingMethod']

      raise 'You cannot provide both :loadBalancingMethod and :load_balancing_method' if attributes.key?(:'loadBalancingMethod') && attributes.key?(:'load_balancing_method')

      self.load_balancing_method = attributes[:'load_balancing_method'] if attributes[:'load_balancing_method']

      self.websocket_path_prefixes = attributes[:'websocketPathPrefixes'] if attributes[:'websocketPathPrefixes']

      raise 'You cannot provide both :websocketPathPrefixes and :websocket_path_prefixes' if attributes.key?(:'websocketPathPrefixes') && attributes.key?(:'websocket_path_prefixes')

      self.websocket_path_prefixes = attributes[:'websocket_path_prefixes'] if attributes[:'websocket_path_prefixes']

      self.is_sni_enabled = attributes[:'isSniEnabled'] unless attributes[:'isSniEnabled'].nil?
      self.is_sni_enabled = false if is_sni_enabled.nil? && !attributes.key?(:'isSniEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isSniEnabled and :is_sni_enabled' if attributes.key?(:'isSniEnabled') && attributes.key?(:'is_sni_enabled')

      self.is_sni_enabled = attributes[:'is_sni_enabled'] unless attributes[:'is_sni_enabled'].nil?
      self.is_sni_enabled = false if is_sni_enabled.nil? && !attributes.key?(:'isSniEnabled') && !attributes.key?(:'is_sni_enabled') # rubocop:disable Style/StringLiterals

      self.health_checks = attributes[:'healthChecks'] if attributes[:'healthChecks']

      raise 'You cannot provide both :healthChecks and :health_checks' if attributes.key?(:'healthChecks') && attributes.key?(:'health_checks')

      self.health_checks = attributes[:'health_checks'] if attributes[:'health_checks']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] tls_protocols Object to be assigned
    def tls_protocols=(tls_protocols)
      # rubocop:disable Style/ConditionalAssignment
      if tls_protocols.nil?
        @tls_protocols = nil
      else
        @tls_protocols =
          tls_protocols.collect do |item|
            if TLS_PROTOCOLS_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'tls_protocols' [#{item}]. Mapping to 'TLS_PROTOCOLS_UNKNOWN_ENUM_VALUE'") if OCI.logger
              TLS_PROTOCOLS_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] client_address_header Object to be assigned
    def client_address_header=(client_address_header)
      # rubocop:disable Style/ConditionalAssignment
      if client_address_header && !CLIENT_ADDRESS_HEADER_ENUM.include?(client_address_header)
        OCI.logger.debug("Unknown value for 'client_address_header' [" + client_address_header + "]. Mapping to 'CLIENT_ADDRESS_HEADER_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @client_address_header = CLIENT_ADDRESS_HEADER_UNKNOWN_ENUM_VALUE
      else
        @client_address_header = client_address_header
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] cipher_group Object to be assigned
    def cipher_group=(cipher_group)
      # rubocop:disable Style/ConditionalAssignment
      if cipher_group && !CIPHER_GROUP_ENUM.include?(cipher_group)
        OCI.logger.debug("Unknown value for 'cipher_group' [" + cipher_group + "]. Mapping to 'CIPHER_GROUP_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @cipher_group = CIPHER_GROUP_UNKNOWN_ENUM_VALUE
      else
        @cipher_group = cipher_group
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        certificate_id == other.certificate_id &&
        is_https_enabled == other.is_https_enabled &&
        is_https_forced == other.is_https_forced &&
        tls_protocols == other.tls_protocols &&
        is_origin_compression_enabled == other.is_origin_compression_enabled &&
        is_behind_cdn == other.is_behind_cdn &&
        client_address_header == other.client_address_header &&
        is_cache_control_respected == other.is_cache_control_respected &&
        is_response_buffering_enabled == other.is_response_buffering_enabled &&
        cipher_group == other.cipher_group &&
        load_balancing_method == other.load_balancing_method &&
        websocket_path_prefixes == other.websocket_path_prefixes &&
        is_sni_enabled == other.is_sni_enabled &&
        health_checks == other.health_checks
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
      [certificate_id, is_https_enabled, is_https_forced, tls_protocols, is_origin_compression_enabled, is_behind_cdn, client_address_header, is_cache_control_respected, is_response_buffering_enabled, cipher_group, load_balancing_method, websocket_path_prefixes, is_sni_enabled, health_checks].hash
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
