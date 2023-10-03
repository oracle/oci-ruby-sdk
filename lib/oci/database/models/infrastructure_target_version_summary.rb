# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20160918
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The target Exadata Infrastructure system software version for an infrastructure resource. Applies to Exadata Cloud@Customer and Exadata Cloud instances only.
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
  # talk to an administrator. If you're an administrator who needs to write policies to give users access,
  # see [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  class Database::Models::InfrastructureTargetVersionSummary
    TARGET_RESOURCE_TYPE_ENUM = [
      TARGET_RESOURCE_TYPE_EXADATA_DB_SYSTEM = 'EXADATA_DB_SYSTEM'.freeze,
      TARGET_RESOURCE_TYPE_CLOUD_EXADATA_INFRASTRUCTURE = 'CLOUD_EXADATA_INFRASTRUCTURE'.freeze,
      TARGET_RESOURCE_TYPE_EXACC_INFRASTRUCTURE = 'EXACC_INFRASTRUCTURE'.freeze
    ].freeze

    # **[Required]** The history entry of the target system software version for the database server patching operation.
    # @return [Array<String>]
    attr_accessor :target_db_version_history_entry

    # **[Required]** The history entry of the target storage cell system software version for the storage cell patching operation.
    # @return [Array<String>]
    attr_accessor :target_storage_version_history_entry

    # The resource type of the target Exadata infrastructure resource that will receive the system software update.
    # @return [String]
    attr_reader :target_resource_type

    # The OCID of the target Exadata Infrastructure resource that will receive the maintenance update.
    # @return [String]
    attr_accessor :target_resource_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'target_db_version_history_entry': :'targetDbVersionHistoryEntry',
        'target_storage_version_history_entry': :'targetStorageVersionHistoryEntry',
        'target_resource_type': :'targetResourceType',
        'target_resource_id': :'targetResourceId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'target_db_version_history_entry': :'Array<String>',
        'target_storage_version_history_entry': :'Array<String>',
        'target_resource_type': :'String',
        'target_resource_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<String>] :target_db_version_history_entry The value to assign to the {#target_db_version_history_entry} property
    # @option attributes [Array<String>] :target_storage_version_history_entry The value to assign to the {#target_storage_version_history_entry} property
    # @option attributes [String] :target_resource_type The value to assign to the {#target_resource_type} property
    # @option attributes [String] :target_resource_id The value to assign to the {#target_resource_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.target_db_version_history_entry = attributes[:'targetDbVersionHistoryEntry'] if attributes[:'targetDbVersionHistoryEntry']

      raise 'You cannot provide both :targetDbVersionHistoryEntry and :target_db_version_history_entry' if attributes.key?(:'targetDbVersionHistoryEntry') && attributes.key?(:'target_db_version_history_entry')

      self.target_db_version_history_entry = attributes[:'target_db_version_history_entry'] if attributes[:'target_db_version_history_entry']

      self.target_storage_version_history_entry = attributes[:'targetStorageVersionHistoryEntry'] if attributes[:'targetStorageVersionHistoryEntry']

      raise 'You cannot provide both :targetStorageVersionHistoryEntry and :target_storage_version_history_entry' if attributes.key?(:'targetStorageVersionHistoryEntry') && attributes.key?(:'target_storage_version_history_entry')

      self.target_storage_version_history_entry = attributes[:'target_storage_version_history_entry'] if attributes[:'target_storage_version_history_entry']

      self.target_resource_type = attributes[:'targetResourceType'] if attributes[:'targetResourceType']

      raise 'You cannot provide both :targetResourceType and :target_resource_type' if attributes.key?(:'targetResourceType') && attributes.key?(:'target_resource_type')

      self.target_resource_type = attributes[:'target_resource_type'] if attributes[:'target_resource_type']

      self.target_resource_id = attributes[:'targetResourceId'] if attributes[:'targetResourceId']

      raise 'You cannot provide both :targetResourceId and :target_resource_id' if attributes.key?(:'targetResourceId') && attributes.key?(:'target_resource_id')

      self.target_resource_id = attributes[:'target_resource_id'] if attributes[:'target_resource_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] target_resource_type Object to be assigned
    def target_resource_type=(target_resource_type)
      raise "Invalid value for 'target_resource_type': this must be one of the values in TARGET_RESOURCE_TYPE_ENUM." if target_resource_type && !TARGET_RESOURCE_TYPE_ENUM.include?(target_resource_type)

      @target_resource_type = target_resource_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        target_db_version_history_entry == other.target_db_version_history_entry &&
        target_storage_version_history_entry == other.target_storage_version_history_entry &&
        target_resource_type == other.target_resource_type &&
        target_resource_id == other.target_resource_id
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
      [target_db_version_history_entry, target_storage_version_history_entry, target_resource_type, target_resource_id].hash
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
