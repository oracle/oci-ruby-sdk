# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

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

    # A list of allowed TLS protocols. Only applicable when HTTPS support is enabled. It affects client's connection to the edge nodes. The most secure TLS version will be chosen.
    # - **TLS_V1:** corresponds to TLS 1.0 specification.
    #
    # - **TLS_V1_1:** corresponds to TLS 1.1 specification.
    #
    # - **TLS_V1_2:** corresponds to TLS 1.2 specification.
    #
    # - **TLS_V1_3:** corresponds to TLS 1.3 specification.
    #
    # Enabled TLS protocols must go in a row. For example if TLS_v1_1 and TLS_V1_3 are enabled, TLS_V1_2 must be enabled too.
    # @return [Array<String>]
    attr_reader :tls_protocols

    # Enable or disable GZIP compression of origin responses. If enabled, the header `Accept-Encoding: gzip` is sent to origin, otherwise - empty `Accept-Encoding:` header is used.
    # @return [BOOLEAN]
    attr_accessor :is_origin_compression_enabled

    # Enable or disable the use of CDN. It allows to specify true client IP address if clients do not connect directly to us.
    # @return [BOOLEAN]
    attr_accessor :is_behind_cdn

    # The HTTP header used to pass the client IP address from the CDN if `isBehindCdn` is enabled. This feature consumes the header and its value as the true client IP address. It does not create the header. Using trusted chains (for example `X-Client-Ip: 11.1.1.1, 13.3.3.3`), the last IP address in the list will be used as true client IP address. In case of multiple headers with the same name, the first one will be used. If the header is not present it will use the connecting IP address as the true client IP address. It's assumed that CDN sets the correct client IP address and prevents spoofing.
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

    # Enable or disable automatic content caching based on the response `cache-control` header. This feature enables the origin to act as a proxy cache. Caching policies are usually defined using `cache-control` header. For example `cache-control: max-age=120` means that the returned resource is valid for 120 seconds. Caching rules will overwrite this setting.
    # @return [BOOLEAN]
    attr_accessor :is_cache_control_respected

    # Enable or disable buffering of responses from the origin. Buffering improves overall stability in case of network issues, but slightly increases Time To First Byte.
    # @return [BOOLEAN]
    attr_accessor :is_response_buffering_enabled

    # The cipher group
    # - **DEFAULT:** Cipher group supports TLS 1.0, TLS 1.1, TLS 1.2, TLS 1.3 protocols. It has the following ciphers enabled: `ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:!DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA`
    # @return [String]
    attr_reader :cipher_group

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
        'cipher_group': :'cipherGroup'
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
        'cipher_group': :'String'
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
        cipher_group == other.cipher_group
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
      [certificate_id, is_https_enabled, is_https_forced, tls_protocols, is_origin_compression_enabled, is_behind_cdn, client_address_header, is_cache_control_respected, is_response_buffering_enabled, cipher_group].hash
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
