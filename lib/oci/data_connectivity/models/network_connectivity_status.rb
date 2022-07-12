# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The network validation status for a Private Endpoint - Data Asset pair.
  class DataConnectivity::Models::NetworkConnectivityStatus
    NETWORK_VALIDATION_STATUS_ENUM_ENUM = [
      NETWORK_VALIDATION_STATUS_ENUM_REACHABLE = 'REACHABLE'.freeze,
      NETWORK_VALIDATION_STATUS_ENUM_NOT_REACHABLE = 'NOT_REACHABLE'.freeze,
      NETWORK_VALIDATION_STATUS_ENUM_ERROR = 'ERROR'.freeze,
      NETWORK_VALIDATION_STATUS_ENUM_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** DataAsset key to which the NetworkValidationStatus belongs to.
    # @return [String]
    attr_accessor :data_asset_key

    # PrivateEndpoint key, if any, to which the NetworkValidationStatus belongs to.
    # @return [String]
    attr_accessor :private_end_point_key

    # Exception or error message encountered while testing network reachability for the data asset.
    # @return [String]
    attr_accessor :error_message

    # Instant when the network validation was last done for the given DataAsset-PrivateEndpoint pair..
    # @return [DateTime]
    attr_accessor :time_last_updated

    # Exception or error message encountered while testing network reachability for the data asset.
    # @return [String]
    attr_reader :network_validation_status_enum

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'data_asset_key': :'dataAssetKey',
        'private_end_point_key': :'privateEndPointKey',
        'error_message': :'errorMessage',
        'time_last_updated': :'timeLastUpdated',
        'network_validation_status_enum': :'networkValidationStatusEnum'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'data_asset_key': :'String',
        'private_end_point_key': :'String',
        'error_message': :'String',
        'time_last_updated': :'DateTime',
        'network_validation_status_enum': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :data_asset_key The value to assign to the {#data_asset_key} property
    # @option attributes [String] :private_end_point_key The value to assign to the {#private_end_point_key} property
    # @option attributes [String] :error_message The value to assign to the {#error_message} property
    # @option attributes [DateTime] :time_last_updated The value to assign to the {#time_last_updated} property
    # @option attributes [String] :network_validation_status_enum The value to assign to the {#network_validation_status_enum} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.data_asset_key = attributes[:'dataAssetKey'] if attributes[:'dataAssetKey']

      raise 'You cannot provide both :dataAssetKey and :data_asset_key' if attributes.key?(:'dataAssetKey') && attributes.key?(:'data_asset_key')

      self.data_asset_key = attributes[:'data_asset_key'] if attributes[:'data_asset_key']

      self.private_end_point_key = attributes[:'privateEndPointKey'] if attributes[:'privateEndPointKey']

      raise 'You cannot provide both :privateEndPointKey and :private_end_point_key' if attributes.key?(:'privateEndPointKey') && attributes.key?(:'private_end_point_key')

      self.private_end_point_key = attributes[:'private_end_point_key'] if attributes[:'private_end_point_key']

      self.error_message = attributes[:'errorMessage'] if attributes[:'errorMessage']

      raise 'You cannot provide both :errorMessage and :error_message' if attributes.key?(:'errorMessage') && attributes.key?(:'error_message')

      self.error_message = attributes[:'error_message'] if attributes[:'error_message']

      self.time_last_updated = attributes[:'timeLastUpdated'] if attributes[:'timeLastUpdated']

      raise 'You cannot provide both :timeLastUpdated and :time_last_updated' if attributes.key?(:'timeLastUpdated') && attributes.key?(:'time_last_updated')

      self.time_last_updated = attributes[:'time_last_updated'] if attributes[:'time_last_updated']

      self.network_validation_status_enum = attributes[:'networkValidationStatusEnum'] if attributes[:'networkValidationStatusEnum']

      raise 'You cannot provide both :networkValidationStatusEnum and :network_validation_status_enum' if attributes.key?(:'networkValidationStatusEnum') && attributes.key?(:'network_validation_status_enum')

      self.network_validation_status_enum = attributes[:'network_validation_status_enum'] if attributes[:'network_validation_status_enum']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] network_validation_status_enum Object to be assigned
    def network_validation_status_enum=(network_validation_status_enum)
      # rubocop:disable Style/ConditionalAssignment
      if network_validation_status_enum && !NETWORK_VALIDATION_STATUS_ENUM_ENUM.include?(network_validation_status_enum)
        OCI.logger.debug("Unknown value for 'network_validation_status_enum' [" + network_validation_status_enum + "]. Mapping to 'NETWORK_VALIDATION_STATUS_ENUM_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @network_validation_status_enum = NETWORK_VALIDATION_STATUS_ENUM_UNKNOWN_ENUM_VALUE
      else
        @network_validation_status_enum = network_validation_status_enum
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        data_asset_key == other.data_asset_key &&
        private_end_point_key == other.private_end_point_key &&
        error_message == other.error_message &&
        time_last_updated == other.time_last_updated &&
        network_validation_status_enum == other.network_validation_status_enum
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
      [data_asset_key, private_end_point_key, error_message, time_last_updated, network_validation_status_enum].hash
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
