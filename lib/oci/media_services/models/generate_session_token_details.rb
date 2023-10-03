# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20211101
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Information about the new session token.
  class MediaServices::Models::GenerateSessionTokenDetails
    SCOPES_ENUM = [
      SCOPES_PLAYLIST = 'PLAYLIST'.freeze,
      SCOPES_EDGE = 'EDGE'.freeze
    ].freeze

    # Token expiry time. An RFC3339 formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_expires

    # **[Required]** Array of scopes the token can act upon.
    # @return [Array<String>]
    attr_reader :scopes

    # **[Required]** The packaging config resource identifier used to limit the scope of the token.
    # @return [String]
    attr_accessor :packaging_config_id

    # Array of asset resource IDs used to limit the scope of the token.
    # @return [Array<String>]
    attr_accessor :asset_ids

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'time_expires': :'timeExpires',
        'scopes': :'scopes',
        'packaging_config_id': :'packagingConfigId',
        'asset_ids': :'assetIds'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'time_expires': :'DateTime',
        'scopes': :'Array<String>',
        'packaging_config_id': :'String',
        'asset_ids': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :time_expires The value to assign to the {#time_expires} property
    # @option attributes [Array<String>] :scopes The value to assign to the {#scopes} property
    # @option attributes [String] :packaging_config_id The value to assign to the {#packaging_config_id} property
    # @option attributes [Array<String>] :asset_ids The value to assign to the {#asset_ids} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.time_expires = attributes[:'timeExpires'] if attributes[:'timeExpires']

      raise 'You cannot provide both :timeExpires and :time_expires' if attributes.key?(:'timeExpires') && attributes.key?(:'time_expires')

      self.time_expires = attributes[:'time_expires'] if attributes[:'time_expires']

      self.scopes = attributes[:'scopes'] if attributes[:'scopes']

      self.packaging_config_id = attributes[:'packagingConfigId'] if attributes[:'packagingConfigId']

      raise 'You cannot provide both :packagingConfigId and :packaging_config_id' if attributes.key?(:'packagingConfigId') && attributes.key?(:'packaging_config_id')

      self.packaging_config_id = attributes[:'packaging_config_id'] if attributes[:'packaging_config_id']

      self.asset_ids = attributes[:'assetIds'] if attributes[:'assetIds']

      raise 'You cannot provide both :assetIds and :asset_ids' if attributes.key?(:'assetIds') && attributes.key?(:'asset_ids')

      self.asset_ids = attributes[:'asset_ids'] if attributes[:'asset_ids']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] scopes Object to be assigned
    def scopes=(scopes)
      # rubocop:disable Style/ConditionalAssignment
      if scopes.nil?
        @scopes = nil
      else
        scopes.each do |item|
          raise "Invalid value for 'scopes': this must be one of the values in SCOPES_ENUM." unless SCOPES_ENUM.include?(item)
        end
        @scopes = scopes
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        time_expires == other.time_expires &&
        scopes == other.scopes &&
        packaging_config_id == other.packaging_config_id &&
        asset_ids == other.asset_ids
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
      [time_expires, scopes, packaging_config_id, asset_ids].hash
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
