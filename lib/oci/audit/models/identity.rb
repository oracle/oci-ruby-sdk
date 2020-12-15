# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A container object for identity attributes.
  #
  class Audit::Models::Identity
    # The name of the user or service. This value is the friendly name associated with `principalId`.
    #
    # Example: `ExampleName`
    #
    # @return [String]
    attr_accessor :principal_name

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the principal.
    #
    # @return [String]
    attr_accessor :principal_id

    # The type of authentication used.
    #
    # Example: `natv`
    #
    # @return [String]
    attr_accessor :auth_type

    # The name of the user or service. This value is the friendly name associated with `callerId`.
    #
    # @return [String]
    attr_accessor :caller_name

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the caller. The caller that made a
    # request on behalf of the prinicpal.
    #
    # @return [String]
    attr_accessor :caller_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the tenant.
    #
    # @return [String]
    attr_accessor :tenant_id

    # The IP address of the source of the request.
    #
    # Example: `172.24.80.88`
    #
    # @return [String]
    attr_accessor :ip_address

    # The credential ID of the user. This value is extracted from the HTTP 'Authorization' request
    # header. It consists of the tenantId, userId, and user fingerprint, all delimited by a slash (/).
    #
    # @return [String]
    attr_accessor :credentials

    # The user agent of the client that made the request.
    #
    # Example: `Jersey/2.23 (HttpUrlConnection 1.8.0_212)`
    #
    # @return [String]
    attr_accessor :user_agent

    # This value identifies any Console session associated with this request.
    #
    # @return [String]
    attr_accessor :console_session_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'principal_name': :'principalName',
        'principal_id': :'principalId',
        'auth_type': :'authType',
        'caller_name': :'callerName',
        'caller_id': :'callerId',
        'tenant_id': :'tenantId',
        'ip_address': :'ipAddress',
        'credentials': :'credentials',
        'user_agent': :'userAgent',
        'console_session_id': :'consoleSessionId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'principal_name': :'String',
        'principal_id': :'String',
        'auth_type': :'String',
        'caller_name': :'String',
        'caller_id': :'String',
        'tenant_id': :'String',
        'ip_address': :'String',
        'credentials': :'String',
        'user_agent': :'String',
        'console_session_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :principal_name The value to assign to the {#principal_name} property
    # @option attributes [String] :principal_id The value to assign to the {#principal_id} property
    # @option attributes [String] :auth_type The value to assign to the {#auth_type} property
    # @option attributes [String] :caller_name The value to assign to the {#caller_name} property
    # @option attributes [String] :caller_id The value to assign to the {#caller_id} property
    # @option attributes [String] :tenant_id The value to assign to the {#tenant_id} property
    # @option attributes [String] :ip_address The value to assign to the {#ip_address} property
    # @option attributes [String] :credentials The value to assign to the {#credentials} property
    # @option attributes [String] :user_agent The value to assign to the {#user_agent} property
    # @option attributes [String] :console_session_id The value to assign to the {#console_session_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.principal_name = attributes[:'principalName'] if attributes[:'principalName']

      raise 'You cannot provide both :principalName and :principal_name' if attributes.key?(:'principalName') && attributes.key?(:'principal_name')

      self.principal_name = attributes[:'principal_name'] if attributes[:'principal_name']

      self.principal_id = attributes[:'principalId'] if attributes[:'principalId']

      raise 'You cannot provide both :principalId and :principal_id' if attributes.key?(:'principalId') && attributes.key?(:'principal_id')

      self.principal_id = attributes[:'principal_id'] if attributes[:'principal_id']

      self.auth_type = attributes[:'authType'] if attributes[:'authType']

      raise 'You cannot provide both :authType and :auth_type' if attributes.key?(:'authType') && attributes.key?(:'auth_type')

      self.auth_type = attributes[:'auth_type'] if attributes[:'auth_type']

      self.caller_name = attributes[:'callerName'] if attributes[:'callerName']

      raise 'You cannot provide both :callerName and :caller_name' if attributes.key?(:'callerName') && attributes.key?(:'caller_name')

      self.caller_name = attributes[:'caller_name'] if attributes[:'caller_name']

      self.caller_id = attributes[:'callerId'] if attributes[:'callerId']

      raise 'You cannot provide both :callerId and :caller_id' if attributes.key?(:'callerId') && attributes.key?(:'caller_id')

      self.caller_id = attributes[:'caller_id'] if attributes[:'caller_id']

      self.tenant_id = attributes[:'tenantId'] if attributes[:'tenantId']

      raise 'You cannot provide both :tenantId and :tenant_id' if attributes.key?(:'tenantId') && attributes.key?(:'tenant_id')

      self.tenant_id = attributes[:'tenant_id'] if attributes[:'tenant_id']

      self.ip_address = attributes[:'ipAddress'] if attributes[:'ipAddress']

      raise 'You cannot provide both :ipAddress and :ip_address' if attributes.key?(:'ipAddress') && attributes.key?(:'ip_address')

      self.ip_address = attributes[:'ip_address'] if attributes[:'ip_address']

      self.credentials = attributes[:'credentials'] if attributes[:'credentials']

      self.user_agent = attributes[:'userAgent'] if attributes[:'userAgent']

      raise 'You cannot provide both :userAgent and :user_agent' if attributes.key?(:'userAgent') && attributes.key?(:'user_agent')

      self.user_agent = attributes[:'user_agent'] if attributes[:'user_agent']

      self.console_session_id = attributes[:'consoleSessionId'] if attributes[:'consoleSessionId']

      raise 'You cannot provide both :consoleSessionId and :console_session_id' if attributes.key?(:'consoleSessionId') && attributes.key?(:'console_session_id')

      self.console_session_id = attributes[:'console_session_id'] if attributes[:'console_session_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        principal_name == other.principal_name &&
        principal_id == other.principal_id &&
        auth_type == other.auth_type &&
        caller_name == other.caller_name &&
        caller_id == other.caller_id &&
        tenant_id == other.tenant_id &&
        ip_address == other.ip_address &&
        credentials == other.credentials &&
        user_agent == other.user_agent &&
        console_session_id == other.console_session_id
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
      [principal_name, principal_id, auth_type, caller_name, caller_id, tenant_id, ip_address, credentials, user_agent, console_session_id].hash
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
