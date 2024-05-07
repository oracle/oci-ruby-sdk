# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20160918
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details to update SaaS administrative user configuration.
  class Database::Models::ConfigureSaasAdminUserDetails
    ACCESS_TYPE_ENUM = [
      ACCESS_TYPE_READ_ONLY = 'READ_ONLY'.freeze,
      ACCESS_TYPE_READ_WRITE = 'READ_WRITE'.freeze,
      ACCESS_TYPE_ADMIN = 'ADMIN'.freeze
    ].freeze

    # A strong password for SaaS administrative user. The password must be a minimum of nine (9) characters and contain a minimum of two (2) uppercase, two (2) lowercase, two (2) numbers, and two (2) special characters from _ (underscore), \\# (hashtag), or - (dash).
    # @return [String]
    attr_accessor :password

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Oracle Cloud Infrastructure [secret](https://docs.cloud.oracle.com/Content/KeyManagement/Concepts/keyoverview.htm#concepts).
    # @return [String]
    attr_accessor :secret_id

    # The version of the vault secret. If no version is specified, the latest version will be used.
    # @return [Integer]
    attr_accessor :secret_version_number

    # How long, in hours, the SaaS administrative user will stay enabled. If no duration is specified, the default value 1 will be used.
    # @return [Integer]
    attr_accessor :duration

    # Indicates if the SaaS administrative user is enabled for the Autonomous Database.
    # @return [BOOLEAN]
    attr_accessor :is_enabled

    # The access type for the SaaS administrative user. If no access type is specified, the READ_ONLY access type is used.
    # @return [String]
    attr_reader :access_type

    # The date and time the SaaS administrative user was enabled at, for the Autonomous Database.
    # @return [DateTime]
    attr_accessor :time_saas_admin_user_enabled

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'password': :'password',
        'secret_id': :'secretId',
        'secret_version_number': :'secretVersionNumber',
        'duration': :'duration',
        'is_enabled': :'isEnabled',
        'access_type': :'accessType',
        'time_saas_admin_user_enabled': :'timeSaasAdminUserEnabled'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'password': :'String',
        'secret_id': :'String',
        'secret_version_number': :'Integer',
        'duration': :'Integer',
        'is_enabled': :'BOOLEAN',
        'access_type': :'String',
        'time_saas_admin_user_enabled': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :password The value to assign to the {#password} property
    # @option attributes [String] :secret_id The value to assign to the {#secret_id} property
    # @option attributes [Integer] :secret_version_number The value to assign to the {#secret_version_number} property
    # @option attributes [Integer] :duration The value to assign to the {#duration} property
    # @option attributes [BOOLEAN] :is_enabled The value to assign to the {#is_enabled} property
    # @option attributes [String] :access_type The value to assign to the {#access_type} property
    # @option attributes [DateTime] :time_saas_admin_user_enabled The value to assign to the {#time_saas_admin_user_enabled} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.password = attributes[:'password'] if attributes[:'password']

      self.secret_id = attributes[:'secretId'] if attributes[:'secretId']

      raise 'You cannot provide both :secretId and :secret_id' if attributes.key?(:'secretId') && attributes.key?(:'secret_id')

      self.secret_id = attributes[:'secret_id'] if attributes[:'secret_id']

      self.secret_version_number = attributes[:'secretVersionNumber'] if attributes[:'secretVersionNumber']

      raise 'You cannot provide both :secretVersionNumber and :secret_version_number' if attributes.key?(:'secretVersionNumber') && attributes.key?(:'secret_version_number')

      self.secret_version_number = attributes[:'secret_version_number'] if attributes[:'secret_version_number']

      self.duration = attributes[:'duration'] if attributes[:'duration']

      self.is_enabled = attributes[:'isEnabled'] unless attributes[:'isEnabled'].nil?

      raise 'You cannot provide both :isEnabled and :is_enabled' if attributes.key?(:'isEnabled') && attributes.key?(:'is_enabled')

      self.is_enabled = attributes[:'is_enabled'] unless attributes[:'is_enabled'].nil?

      self.access_type = attributes[:'accessType'] if attributes[:'accessType']

      raise 'You cannot provide both :accessType and :access_type' if attributes.key?(:'accessType') && attributes.key?(:'access_type')

      self.access_type = attributes[:'access_type'] if attributes[:'access_type']

      self.time_saas_admin_user_enabled = attributes[:'timeSaasAdminUserEnabled'] if attributes[:'timeSaasAdminUserEnabled']

      raise 'You cannot provide both :timeSaasAdminUserEnabled and :time_saas_admin_user_enabled' if attributes.key?(:'timeSaasAdminUserEnabled') && attributes.key?(:'time_saas_admin_user_enabled')

      self.time_saas_admin_user_enabled = attributes[:'time_saas_admin_user_enabled'] if attributes[:'time_saas_admin_user_enabled']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] access_type Object to be assigned
    def access_type=(access_type)
      raise "Invalid value for 'access_type': this must be one of the values in ACCESS_TYPE_ENUM." if access_type && !ACCESS_TYPE_ENUM.include?(access_type)

      @access_type = access_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        password == other.password &&
        secret_id == other.secret_id &&
        secret_version_number == other.secret_version_number &&
        duration == other.duration &&
        is_enabled == other.is_enabled &&
        access_type == other.access_type &&
        time_saas_admin_user_enabled == other.time_saas_admin_user_enabled
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
      [password, secret_id, secret_version_number, duration, is_enabled, access_type, time_saas_admin_user_enabled].hash
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
