# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20160918
require 'date'
require 'logger'
require_relative 'database_connection_credentials'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Ssl connection credential details used to connect to the database.
  #
  class Database::Models::DatabaseSslConnectionCredentials < Database::Models::DatabaseConnectionCredentials
    ROLE_ENUM = [
      ROLE_SYSDBA = 'SYSDBA'.freeze,
      ROLE_NORMAL = 'NORMAL'.freeze,
      ROLE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The name of the credential information that used to connect to the database. The name should be in \"x.y\" format, where
    # the length of \"x\" has a maximum of 64 characters, and length of \"y\" has a maximum of 199 characters.
    # The name strings can contain letters, numbers and the underscore character only. Other characters are not valid, except for
    # the \".\" character that separates the \"x\" and \"y\" portions of the name.
    # *IMPORTANT* - The name must be unique within the OCI region the credential is being created in. If you specify a name
    # that duplicates the name of another credential within the same OCI region, you may overwrite or corrupt the credential that is already
    # using the name.
    #
    # For example: inventorydb.abc112233445566778899
    #
    # @return [String]
    attr_accessor :credential_name

    # **[Required]** The username that will be used to connect to the database.
    # @return [String]
    attr_accessor :username

    # **[Required]** The password that will be used to connect to the database.
    # @return [String]
    attr_accessor :password

    # **[Required]** The role of the user that will be connecting to the database.
    # @return [String]
    attr_reader :role

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Oracle Cloud Infrastructure [secret](https://docs.cloud.oracle.com/Content/KeyManagement/Concepts/keyoverview.htm#concepts).
    # @return [String]
    attr_accessor :ssl_secret_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'credential_type': :'credentialType',
        'credential_name': :'credentialName',
        'username': :'username',
        'password': :'password',
        'role': :'role',
        'ssl_secret_id': :'sslSecretId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'credential_type': :'String',
        'credential_name': :'String',
        'username': :'String',
        'password': :'String',
        'role': :'String',
        'ssl_secret_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :credential_name The value to assign to the {#credential_name} property
    # @option attributes [String] :username The value to assign to the {#username} property
    # @option attributes [String] :password The value to assign to the {#password} property
    # @option attributes [String] :role The value to assign to the {#role} property
    # @option attributes [String] :ssl_secret_id The value to assign to the {#ssl_secret_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['credentialType'] = 'SSL_DETAILS'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.credential_name = attributes[:'credentialName'] if attributes[:'credentialName']

      raise 'You cannot provide both :credentialName and :credential_name' if attributes.key?(:'credentialName') && attributes.key?(:'credential_name')

      self.credential_name = attributes[:'credential_name'] if attributes[:'credential_name']

      self.username = attributes[:'username'] if attributes[:'username']

      self.password = attributes[:'password'] if attributes[:'password']

      self.role = attributes[:'role'] if attributes[:'role']

      self.ssl_secret_id = attributes[:'sslSecretId'] if attributes[:'sslSecretId']

      raise 'You cannot provide both :sslSecretId and :ssl_secret_id' if attributes.key?(:'sslSecretId') && attributes.key?(:'ssl_secret_id')

      self.ssl_secret_id = attributes[:'ssl_secret_id'] if attributes[:'ssl_secret_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] role Object to be assigned
    def role=(role)
      # rubocop:disable Style/ConditionalAssignment
      if role && !ROLE_ENUM.include?(role)
        OCI.logger.debug("Unknown value for 'role' [" + role + "]. Mapping to 'ROLE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @role = ROLE_UNKNOWN_ENUM_VALUE
      else
        @role = role
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        credential_type == other.credential_type &&
        credential_name == other.credential_name &&
        username == other.username &&
        password == other.password &&
        role == other.role &&
        ssl_secret_id == other.ssl_secret_id
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
      [credential_type, credential_name, username, password, role, ssl_secret_id].hash
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
