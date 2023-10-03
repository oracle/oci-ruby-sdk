# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200430
require 'date'
require_relative 'update_connection_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details to update an Oracle PeopleSoft data asset connection.
  class DataIntegration::Models::UpdateConnectionFromOraclePeopleSoft < DataIntegration::Models::UpdateConnectionDetails
    # **[Required]** The user name for the connection.
    # @return [String]
    attr_accessor :username

    # **[Required]** The password for the connection.
    # @return [String]
    attr_accessor :password

    # @return [OCI::DataIntegration::Models::SensitiveAttribute]
    attr_accessor :password_secret

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'modelType',
        'key': :'key',
        'model_version': :'modelVersion',
        'parent_ref': :'parentRef',
        'name': :'name',
        'description': :'description',
        'object_status': :'objectStatus',
        'object_version': :'objectVersion',
        'identifier': :'identifier',
        'connection_properties': :'connectionProperties',
        'registry_metadata': :'registryMetadata',
        'username': :'username',
        'password': :'password',
        'password_secret': :'passwordSecret'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'String',
        'key': :'String',
        'model_version': :'String',
        'parent_ref': :'OCI::DataIntegration::Models::ParentReference',
        'name': :'String',
        'description': :'String',
        'object_status': :'Integer',
        'object_version': :'Integer',
        'identifier': :'String',
        'connection_properties': :'Array<OCI::DataIntegration::Models::ConnectionProperty>',
        'registry_metadata': :'OCI::DataIntegration::Models::RegistryMetadata',
        'username': :'String',
        'password': :'String',
        'password_secret': :'OCI::DataIntegration::Models::SensitiveAttribute'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {OCI::DataIntegration::Models::UpdateConnectionDetails#key #key} proprety
    # @option attributes [String] :model_version The value to assign to the {OCI::DataIntegration::Models::UpdateConnectionDetails#model_version #model_version} proprety
    # @option attributes [OCI::DataIntegration::Models::ParentReference] :parent_ref The value to assign to the {OCI::DataIntegration::Models::UpdateConnectionDetails#parent_ref #parent_ref} proprety
    # @option attributes [String] :name The value to assign to the {OCI::DataIntegration::Models::UpdateConnectionDetails#name #name} proprety
    # @option attributes [String] :description The value to assign to the {OCI::DataIntegration::Models::UpdateConnectionDetails#description #description} proprety
    # @option attributes [Integer] :object_status The value to assign to the {OCI::DataIntegration::Models::UpdateConnectionDetails#object_status #object_status} proprety
    # @option attributes [Integer] :object_version The value to assign to the {OCI::DataIntegration::Models::UpdateConnectionDetails#object_version #object_version} proprety
    # @option attributes [String] :identifier The value to assign to the {OCI::DataIntegration::Models::UpdateConnectionDetails#identifier #identifier} proprety
    # @option attributes [Array<OCI::DataIntegration::Models::ConnectionProperty>] :connection_properties The value to assign to the {OCI::DataIntegration::Models::UpdateConnectionDetails#connection_properties #connection_properties} proprety
    # @option attributes [OCI::DataIntegration::Models::RegistryMetadata] :registry_metadata The value to assign to the {OCI::DataIntegration::Models::UpdateConnectionDetails#registry_metadata #registry_metadata} proprety
    # @option attributes [String] :username The value to assign to the {#username} property
    # @option attributes [String] :password The value to assign to the {#password} property
    # @option attributes [OCI::DataIntegration::Models::SensitiveAttribute] :password_secret The value to assign to the {#password_secret} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['modelType'] = 'ORACLE_PEOPLESOFT_CONNECTION'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.username = attributes[:'username'] if attributes[:'username']

      self.password = attributes[:'password'] if attributes[:'password']

      self.password_secret = attributes[:'passwordSecret'] if attributes[:'passwordSecret']

      raise 'You cannot provide both :passwordSecret and :password_secret' if attributes.key?(:'passwordSecret') && attributes.key?(:'password_secret')

      self.password_secret = attributes[:'password_secret'] if attributes[:'password_secret']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        model_type == other.model_type &&
        key == other.key &&
        model_version == other.model_version &&
        parent_ref == other.parent_ref &&
        name == other.name &&
        description == other.description &&
        object_status == other.object_status &&
        object_version == other.object_version &&
        identifier == other.identifier &&
        connection_properties == other.connection_properties &&
        registry_metadata == other.registry_metadata &&
        username == other.username &&
        password == other.password &&
        password_secret == other.password_secret
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
      [model_type, key, model_version, parent_ref, name, description, object_status, object_version, identifier, connection_properties, registry_metadata, username, password, password_secret].hash
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
