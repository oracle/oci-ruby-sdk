# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The credential used to connect to the Managed Database and obtain the details of the optimizer statistics tasks.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class DatabaseManagement::Models::ManagedDatabaseCredential
    CREDENTIAL_TYPE_ENUM = [
      CREDENTIAL_TYPE_SECRET = 'SECRET'.freeze,
      CREDENTIAL_TYPE_PASSWORD = 'PASSWORD'.freeze
    ].freeze

    ROLE_ENUM = [
      ROLE_NORMAL = 'NORMAL'.freeze,
      ROLE_SYSDBA = 'SYSDBA'.freeze
    ].freeze

    # **[Required]** Indicates the type of credential required to retrieve the details of the optimizer statistics tasks.
    # @return [String]
    attr_reader :credential_type

    # **[Required]** The user name used to connect to the database.
    # @return [String]
    attr_accessor :username

    # **[Required]** The role of the database user.
    # @return [String]
    attr_reader :role

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'credential_type': :'credentialType',
        'username': :'username',
        'role': :'role'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'credential_type': :'String',
        'username': :'String',
        'role': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'credentialType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::DatabaseManagement::Models::ManagedDatabasePasswordCredential' if type == 'PASSWORD'
      return 'OCI::DatabaseManagement::Models::ManagedDatabaseSecretCredential' if type == 'SECRET'

      # TODO: Log a warning when the subtype is not found.
      'OCI::DatabaseManagement::Models::ManagedDatabaseCredential'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :credential_type The value to assign to the {#credential_type} property
    # @option attributes [String] :username The value to assign to the {#username} property
    # @option attributes [String] :role The value to assign to the {#role} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.credential_type = attributes[:'credentialType'] if attributes[:'credentialType']

      raise 'You cannot provide both :credentialType and :credential_type' if attributes.key?(:'credentialType') && attributes.key?(:'credential_type')

      self.credential_type = attributes[:'credential_type'] if attributes[:'credential_type']

      self.username = attributes[:'username'] if attributes[:'username']

      self.role = attributes[:'role'] if attributes[:'role']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] credential_type Object to be assigned
    def credential_type=(credential_type)
      raise "Invalid value for 'credential_type': this must be one of the values in CREDENTIAL_TYPE_ENUM." if credential_type && !CREDENTIAL_TYPE_ENUM.include?(credential_type)

      @credential_type = credential_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] role Object to be assigned
    def role=(role)
      raise "Invalid value for 'role': this must be one of the values in ROLE_ENUM." if role && !ROLE_ENUM.include?(role)

      @role = role
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        credential_type == other.credential_type &&
        username == other.username &&
        role == other.role
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
      [credential_type, username, role].hash
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
