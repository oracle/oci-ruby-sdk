# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'response_cache_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Connection details for an external RESP based cache store for Response Caching.
  #
  class Apigateway::Models::ExternalRespCache < Apigateway::Models::ResponseCacheDetails
    # **[Required]** The set of cache store members to connect to. At present only a single server is supported.
    #
    # @return [Array<OCI::Apigateway::Models::ResponseCacheRespServer>]
    attr_accessor :servers

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Oracle Vault Service secret resource.
    #
    # @return [String]
    attr_accessor :authentication_secret_id

    # **[Required]** The version number of the authentication secret to use.
    #
    # @return [Integer]
    attr_accessor :authentication_secret_version_number

    # Defines if the connection should be over SSL.
    #
    # @return [BOOLEAN]
    attr_accessor :is_ssl_enabled

    # Defines whether or not to uphold SSL verification.
    #
    # @return [BOOLEAN]
    attr_accessor :is_ssl_verify_disabled

    # Defines the timeout for establishing a connection with the Response Cache.
    #
    # @return [Integer]
    attr_accessor :connect_timeout_in_ms

    # Defines the timeout for reading data from the Response Cache.
    #
    # @return [Integer]
    attr_accessor :read_timeout_in_ms

    # Defines the timeout for transmitting data to the Response Cache.
    #
    # @return [Integer]
    attr_accessor :send_timeout_in_ms

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'servers': :'servers',
        'authentication_secret_id': :'authenticationSecretId',
        'authentication_secret_version_number': :'authenticationSecretVersionNumber',
        'is_ssl_enabled': :'isSslEnabled',
        'is_ssl_verify_disabled': :'isSslVerifyDisabled',
        'connect_timeout_in_ms': :'connectTimeoutInMs',
        'read_timeout_in_ms': :'readTimeoutInMs',
        'send_timeout_in_ms': :'sendTimeoutInMs'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'servers': :'Array<OCI::Apigateway::Models::ResponseCacheRespServer>',
        'authentication_secret_id': :'String',
        'authentication_secret_version_number': :'Integer',
        'is_ssl_enabled': :'BOOLEAN',
        'is_ssl_verify_disabled': :'BOOLEAN',
        'connect_timeout_in_ms': :'Integer',
        'read_timeout_in_ms': :'Integer',
        'send_timeout_in_ms': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<OCI::Apigateway::Models::ResponseCacheRespServer>] :servers The value to assign to the {#servers} property
    # @option attributes [String] :authentication_secret_id The value to assign to the {#authentication_secret_id} property
    # @option attributes [Integer] :authentication_secret_version_number The value to assign to the {#authentication_secret_version_number} property
    # @option attributes [BOOLEAN] :is_ssl_enabled The value to assign to the {#is_ssl_enabled} property
    # @option attributes [BOOLEAN] :is_ssl_verify_disabled The value to assign to the {#is_ssl_verify_disabled} property
    # @option attributes [Integer] :connect_timeout_in_ms The value to assign to the {#connect_timeout_in_ms} property
    # @option attributes [Integer] :read_timeout_in_ms The value to assign to the {#read_timeout_in_ms} property
    # @option attributes [Integer] :send_timeout_in_ms The value to assign to the {#send_timeout_in_ms} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'EXTERNAL_RESP_CACHE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.servers = attributes[:'servers'] if attributes[:'servers']

      self.authentication_secret_id = attributes[:'authenticationSecretId'] if attributes[:'authenticationSecretId']

      raise 'You cannot provide both :authenticationSecretId and :authentication_secret_id' if attributes.key?(:'authenticationSecretId') && attributes.key?(:'authentication_secret_id')

      self.authentication_secret_id = attributes[:'authentication_secret_id'] if attributes[:'authentication_secret_id']

      self.authentication_secret_version_number = attributes[:'authenticationSecretVersionNumber'] if attributes[:'authenticationSecretVersionNumber']

      raise 'You cannot provide both :authenticationSecretVersionNumber and :authentication_secret_version_number' if attributes.key?(:'authenticationSecretVersionNumber') && attributes.key?(:'authentication_secret_version_number')

      self.authentication_secret_version_number = attributes[:'authentication_secret_version_number'] if attributes[:'authentication_secret_version_number']

      self.is_ssl_enabled = attributes[:'isSslEnabled'] unless attributes[:'isSslEnabled'].nil?
      self.is_ssl_enabled = false if is_ssl_enabled.nil? && !attributes.key?(:'isSslEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isSslEnabled and :is_ssl_enabled' if attributes.key?(:'isSslEnabled') && attributes.key?(:'is_ssl_enabled')

      self.is_ssl_enabled = attributes[:'is_ssl_enabled'] unless attributes[:'is_ssl_enabled'].nil?
      self.is_ssl_enabled = false if is_ssl_enabled.nil? && !attributes.key?(:'isSslEnabled') && !attributes.key?(:'is_ssl_enabled') # rubocop:disable Style/StringLiterals

      self.is_ssl_verify_disabled = attributes[:'isSslVerifyDisabled'] unless attributes[:'isSslVerifyDisabled'].nil?
      self.is_ssl_verify_disabled = false if is_ssl_verify_disabled.nil? && !attributes.key?(:'isSslVerifyDisabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isSslVerifyDisabled and :is_ssl_verify_disabled' if attributes.key?(:'isSslVerifyDisabled') && attributes.key?(:'is_ssl_verify_disabled')

      self.is_ssl_verify_disabled = attributes[:'is_ssl_verify_disabled'] unless attributes[:'is_ssl_verify_disabled'].nil?
      self.is_ssl_verify_disabled = false if is_ssl_verify_disabled.nil? && !attributes.key?(:'isSslVerifyDisabled') && !attributes.key?(:'is_ssl_verify_disabled') # rubocop:disable Style/StringLiterals

      self.connect_timeout_in_ms = attributes[:'connectTimeoutInMs'] if attributes[:'connectTimeoutInMs']

      raise 'You cannot provide both :connectTimeoutInMs and :connect_timeout_in_ms' if attributes.key?(:'connectTimeoutInMs') && attributes.key?(:'connect_timeout_in_ms')

      self.connect_timeout_in_ms = attributes[:'connect_timeout_in_ms'] if attributes[:'connect_timeout_in_ms']

      self.read_timeout_in_ms = attributes[:'readTimeoutInMs'] if attributes[:'readTimeoutInMs']

      raise 'You cannot provide both :readTimeoutInMs and :read_timeout_in_ms' if attributes.key?(:'readTimeoutInMs') && attributes.key?(:'read_timeout_in_ms')

      self.read_timeout_in_ms = attributes[:'read_timeout_in_ms'] if attributes[:'read_timeout_in_ms']

      self.send_timeout_in_ms = attributes[:'sendTimeoutInMs'] if attributes[:'sendTimeoutInMs']

      raise 'You cannot provide both :sendTimeoutInMs and :send_timeout_in_ms' if attributes.key?(:'sendTimeoutInMs') && attributes.key?(:'send_timeout_in_ms')

      self.send_timeout_in_ms = attributes[:'send_timeout_in_ms'] if attributes[:'send_timeout_in_ms']
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
        servers == other.servers &&
        authentication_secret_id == other.authentication_secret_id &&
        authentication_secret_version_number == other.authentication_secret_version_number &&
        is_ssl_enabled == other.is_ssl_enabled &&
        is_ssl_verify_disabled == other.is_ssl_verify_disabled &&
        connect_timeout_in_ms == other.connect_timeout_in_ms &&
        read_timeout_in_ms == other.read_timeout_in_ms &&
        send_timeout_in_ms == other.send_timeout_in_ms
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
      [type, servers, authentication_secret_id, authentication_secret_version_number, is_ssl_enabled, is_ssl_verify_disabled, connect_timeout_in_ms, read_timeout_in_ms, send_timeout_in_ms].hash
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
