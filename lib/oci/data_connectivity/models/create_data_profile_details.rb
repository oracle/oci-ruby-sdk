# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The data profile payload.
  class DataConnectivity::Models::CreateDataProfileDetails
    # @return [OCI::DataConnectivity::Models::ReadOperationConfig]
    attr_accessor :read_operation_config

    # @return [OCI::DataConnectivity::Models::DataAsset]
    attr_accessor :data_asset

    # @return [OCI::DataConnectivity::Models::Connection]
    attr_accessor :connection

    # @return [OCI::DataConnectivity::Models::Schema]
    attr_accessor :schema

    # @return [OCI::DataConnectivity::Models::DataEntity]
    attr_accessor :data_entity

    # @return [OCI::DataConnectivity::Models::ProfileConfig]
    attr_accessor :profile_config

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'read_operation_config': :'readOperationConfig',
        'data_asset': :'dataAsset',
        'connection': :'connection',
        'schema': :'schema',
        'data_entity': :'dataEntity',
        'profile_config': :'profileConfig'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'read_operation_config': :'OCI::DataConnectivity::Models::ReadOperationConfig',
        'data_asset': :'OCI::DataConnectivity::Models::DataAsset',
        'connection': :'OCI::DataConnectivity::Models::Connection',
        'schema': :'OCI::DataConnectivity::Models::Schema',
        'data_entity': :'OCI::DataConnectivity::Models::DataEntity',
        'profile_config': :'OCI::DataConnectivity::Models::ProfileConfig'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::DataConnectivity::Models::ReadOperationConfig] :read_operation_config The value to assign to the {#read_operation_config} property
    # @option attributes [OCI::DataConnectivity::Models::DataAsset] :data_asset The value to assign to the {#data_asset} property
    # @option attributes [OCI::DataConnectivity::Models::Connection] :connection The value to assign to the {#connection} property
    # @option attributes [OCI::DataConnectivity::Models::Schema] :schema The value to assign to the {#schema} property
    # @option attributes [OCI::DataConnectivity::Models::DataEntity] :data_entity The value to assign to the {#data_entity} property
    # @option attributes [OCI::DataConnectivity::Models::ProfileConfig] :profile_config The value to assign to the {#profile_config} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.read_operation_config = attributes[:'readOperationConfig'] if attributes[:'readOperationConfig']

      raise 'You cannot provide both :readOperationConfig and :read_operation_config' if attributes.key?(:'readOperationConfig') && attributes.key?(:'read_operation_config')

      self.read_operation_config = attributes[:'read_operation_config'] if attributes[:'read_operation_config']

      self.data_asset = attributes[:'dataAsset'] if attributes[:'dataAsset']

      raise 'You cannot provide both :dataAsset and :data_asset' if attributes.key?(:'dataAsset') && attributes.key?(:'data_asset')

      self.data_asset = attributes[:'data_asset'] if attributes[:'data_asset']

      self.connection = attributes[:'connection'] if attributes[:'connection']

      self.schema = attributes[:'schema'] if attributes[:'schema']

      self.data_entity = attributes[:'dataEntity'] if attributes[:'dataEntity']

      raise 'You cannot provide both :dataEntity and :data_entity' if attributes.key?(:'dataEntity') && attributes.key?(:'data_entity')

      self.data_entity = attributes[:'data_entity'] if attributes[:'data_entity']

      self.profile_config = attributes[:'profileConfig'] if attributes[:'profileConfig']

      raise 'You cannot provide both :profileConfig and :profile_config' if attributes.key?(:'profileConfig') && attributes.key?(:'profile_config')

      self.profile_config = attributes[:'profile_config'] if attributes[:'profile_config']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        read_operation_config == other.read_operation_config &&
        data_asset == other.data_asset &&
        connection == other.connection &&
        schema == other.schema &&
        data_entity == other.data_entity &&
        profile_config == other.profile_config
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
      [read_operation_config, data_asset, connection, schema, data_entity, profile_config].hash
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
