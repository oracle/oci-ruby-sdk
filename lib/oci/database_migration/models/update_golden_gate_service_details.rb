# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210929
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details about the Oracle GoldenGate Microservices. If an empty object is specified, the stored Golden Gate details will be removed.
  #
  class DatabaseMigration::Models::UpdateGoldenGateServiceDetails
    # @return [OCI::DatabaseMigration::Models::DatabaseCredentials]
    attr_accessor :source_db_credentials

    # @return [OCI::DatabaseMigration::Models::DatabaseCredentials]
    attr_accessor :source_container_db_credentials

    # @return [OCI::DatabaseMigration::Models::DatabaseCredentials]
    attr_accessor :target_db_credentials

    # @return [OCI::DatabaseMigration::Models::UpdateGoldenGateSettings]
    attr_accessor :settings

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'source_db_credentials': :'sourceDbCredentials',
        'source_container_db_credentials': :'sourceContainerDbCredentials',
        'target_db_credentials': :'targetDbCredentials',
        'settings': :'settings'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'source_db_credentials': :'OCI::DatabaseMigration::Models::DatabaseCredentials',
        'source_container_db_credentials': :'OCI::DatabaseMigration::Models::DatabaseCredentials',
        'target_db_credentials': :'OCI::DatabaseMigration::Models::DatabaseCredentials',
        'settings': :'OCI::DatabaseMigration::Models::UpdateGoldenGateSettings'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::DatabaseMigration::Models::DatabaseCredentials] :source_db_credentials The value to assign to the {#source_db_credentials} property
    # @option attributes [OCI::DatabaseMigration::Models::DatabaseCredentials] :source_container_db_credentials The value to assign to the {#source_container_db_credentials} property
    # @option attributes [OCI::DatabaseMigration::Models::DatabaseCredentials] :target_db_credentials The value to assign to the {#target_db_credentials} property
    # @option attributes [OCI::DatabaseMigration::Models::UpdateGoldenGateSettings] :settings The value to assign to the {#settings} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.source_db_credentials = attributes[:'sourceDbCredentials'] if attributes[:'sourceDbCredentials']

      raise 'You cannot provide both :sourceDbCredentials and :source_db_credentials' if attributes.key?(:'sourceDbCredentials') && attributes.key?(:'source_db_credentials')

      self.source_db_credentials = attributes[:'source_db_credentials'] if attributes[:'source_db_credentials']

      self.source_container_db_credentials = attributes[:'sourceContainerDbCredentials'] if attributes[:'sourceContainerDbCredentials']

      raise 'You cannot provide both :sourceContainerDbCredentials and :source_container_db_credentials' if attributes.key?(:'sourceContainerDbCredentials') && attributes.key?(:'source_container_db_credentials')

      self.source_container_db_credentials = attributes[:'source_container_db_credentials'] if attributes[:'source_container_db_credentials']

      self.target_db_credentials = attributes[:'targetDbCredentials'] if attributes[:'targetDbCredentials']

      raise 'You cannot provide both :targetDbCredentials and :target_db_credentials' if attributes.key?(:'targetDbCredentials') && attributes.key?(:'target_db_credentials')

      self.target_db_credentials = attributes[:'target_db_credentials'] if attributes[:'target_db_credentials']

      self.settings = attributes[:'settings'] if attributes[:'settings']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        source_db_credentials == other.source_db_credentials &&
        source_container_db_credentials == other.source_container_db_credentials &&
        target_db_credentials == other.target_db_credentials &&
        settings == other.settings
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
      [source_db_credentials, source_container_db_credentials, target_db_credentials, settings].hash
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
