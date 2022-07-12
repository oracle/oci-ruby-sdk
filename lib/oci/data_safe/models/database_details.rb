# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of the database for the registration in Data Safe.
  # To choose applicable database type and infrastructure type refer to
  # https://confluence.oci.oraclecorp.com/display/DATASAFE/Target+V2+Design
  #
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class DataSafe::Models::DatabaseDetails
    DATABASE_TYPE_ENUM = [
      DATABASE_TYPE_DATABASE_CLOUD_SERVICE = 'DATABASE_CLOUD_SERVICE'.freeze,
      DATABASE_TYPE_AUTONOMOUS_DATABASE = 'AUTONOMOUS_DATABASE'.freeze,
      DATABASE_TYPE_INSTALLED_DATABASE = 'INSTALLED_DATABASE'.freeze,
      DATABASE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    INFRASTRUCTURE_TYPE_ENUM = [
      INFRASTRUCTURE_TYPE_ORACLE_CLOUD = 'ORACLE_CLOUD'.freeze,
      INFRASTRUCTURE_TYPE_CLOUD_AT_CUSTOMER = 'CLOUD_AT_CUSTOMER'.freeze,
      INFRASTRUCTURE_TYPE_ON_PREMISES = 'ON_PREMISES'.freeze,
      INFRASTRUCTURE_TYPE_NON_ORACLE_CLOUD = 'NON_ORACLE_CLOUD'.freeze,
      INFRASTRUCTURE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The database type.
    # @return [String]
    attr_reader :database_type

    # **[Required]** The infrastructure type the database is running on.
    # @return [String]
    attr_reader :infrastructure_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'database_type': :'databaseType',
        'infrastructure_type': :'infrastructureType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'database_type': :'String',
        'infrastructure_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'databaseType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::DataSafe::Models::InstalledDatabaseDetails' if type == 'INSTALLED_DATABASE'
      return 'OCI::DataSafe::Models::AutonomousDatabaseDetails' if type == 'AUTONOMOUS_DATABASE'
      return 'OCI::DataSafe::Models::DatabaseCloudServiceDetails' if type == 'DATABASE_CLOUD_SERVICE'

      # TODO: Log a warning when the subtype is not found.
      'OCI::DataSafe::Models::DatabaseDetails'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :database_type The value to assign to the {#database_type} property
    # @option attributes [String] :infrastructure_type The value to assign to the {#infrastructure_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.database_type = attributes[:'databaseType'] if attributes[:'databaseType']

      raise 'You cannot provide both :databaseType and :database_type' if attributes.key?(:'databaseType') && attributes.key?(:'database_type')

      self.database_type = attributes[:'database_type'] if attributes[:'database_type']

      self.infrastructure_type = attributes[:'infrastructureType'] if attributes[:'infrastructureType']

      raise 'You cannot provide both :infrastructureType and :infrastructure_type' if attributes.key?(:'infrastructureType') && attributes.key?(:'infrastructure_type')

      self.infrastructure_type = attributes[:'infrastructure_type'] if attributes[:'infrastructure_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] database_type Object to be assigned
    def database_type=(database_type)
      # rubocop:disable Style/ConditionalAssignment
      if database_type && !DATABASE_TYPE_ENUM.include?(database_type)
        OCI.logger.debug("Unknown value for 'database_type' [" + database_type + "]. Mapping to 'DATABASE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @database_type = DATABASE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @database_type = database_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] infrastructure_type Object to be assigned
    def infrastructure_type=(infrastructure_type)
      # rubocop:disable Style/ConditionalAssignment
      if infrastructure_type && !INFRASTRUCTURE_TYPE_ENUM.include?(infrastructure_type)
        OCI.logger.debug("Unknown value for 'infrastructure_type' [" + infrastructure_type + "]. Mapping to 'INFRASTRUCTURE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @infrastructure_type = INFRASTRUCTURE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @infrastructure_type = infrastructure_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        database_type == other.database_type &&
        infrastructure_type == other.infrastructure_type
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
      [database_type, infrastructure_type].hash
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