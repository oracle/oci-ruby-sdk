# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20201101
require 'date'
require_relative 'entity_discovered'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The summary of the Exadata storage server grid discovery.
  class DatabaseManagement::Models::ExternalStorageGridDiscoverySummary < DatabaseManagement::Models::EntityDiscovered
    # The total number of Exadata storage servers discovered.
    # @return [Integer]
    attr_accessor :count_of_storage_servers_discovered

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'agent_id': :'agentId',
        'connector_id': :'connectorId',
        'display_name': :'displayName',
        'version': :'version',
        'internal_id': :'internalId',
        'status': :'status',
        'discover_status': :'discoverStatus',
        'discover_error_code': :'discoverErrorCode',
        'discover_error_msg': :'discoverErrorMsg',
        'entity_type': :'entityType',
        'count_of_storage_servers_discovered': :'countOfStorageServersDiscovered'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'agent_id': :'String',
        'connector_id': :'String',
        'display_name': :'String',
        'version': :'String',
        'internal_id': :'String',
        'status': :'String',
        'discover_status': :'String',
        'discover_error_code': :'String',
        'discover_error_msg': :'String',
        'entity_type': :'String',
        'count_of_storage_servers_discovered': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::DatabaseManagement::Models::EntityDiscovered#id #id} proprety
    # @option attributes [String] :agent_id The value to assign to the {OCI::DatabaseManagement::Models::EntityDiscovered#agent_id #agent_id} proprety
    # @option attributes [String] :connector_id The value to assign to the {OCI::DatabaseManagement::Models::EntityDiscovered#connector_id #connector_id} proprety
    # @option attributes [String] :display_name The value to assign to the {OCI::DatabaseManagement::Models::EntityDiscovered#display_name #display_name} proprety
    # @option attributes [String] :version The value to assign to the {OCI::DatabaseManagement::Models::EntityDiscovered#version #version} proprety
    # @option attributes [String] :internal_id The value to assign to the {OCI::DatabaseManagement::Models::EntityDiscovered#internal_id #internal_id} proprety
    # @option attributes [String] :status The value to assign to the {OCI::DatabaseManagement::Models::EntityDiscovered#status #status} proprety
    # @option attributes [String] :discover_status The value to assign to the {OCI::DatabaseManagement::Models::EntityDiscovered#discover_status #discover_status} proprety
    # @option attributes [String] :discover_error_code The value to assign to the {OCI::DatabaseManagement::Models::EntityDiscovered#discover_error_code #discover_error_code} proprety
    # @option attributes [String] :discover_error_msg The value to assign to the {OCI::DatabaseManagement::Models::EntityDiscovered#discover_error_msg #discover_error_msg} proprety
    # @option attributes [Integer] :count_of_storage_servers_discovered The value to assign to the {#count_of_storage_servers_discovered} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['entityType'] = 'STORAGE_GRID_DISCOVER_SUMMARY'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.count_of_storage_servers_discovered = attributes[:'countOfStorageServersDiscovered'] if attributes[:'countOfStorageServersDiscovered']

      raise 'You cannot provide both :countOfStorageServersDiscovered and :count_of_storage_servers_discovered' if attributes.key?(:'countOfStorageServersDiscovered') && attributes.key?(:'count_of_storage_servers_discovered')

      self.count_of_storage_servers_discovered = attributes[:'count_of_storage_servers_discovered'] if attributes[:'count_of_storage_servers_discovered']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        agent_id == other.agent_id &&
        connector_id == other.connector_id &&
        display_name == other.display_name &&
        version == other.version &&
        internal_id == other.internal_id &&
        status == other.status &&
        discover_status == other.discover_status &&
        discover_error_code == other.discover_error_code &&
        discover_error_msg == other.discover_error_msg &&
        entity_type == other.entity_type &&
        count_of_storage_servers_discovered == other.count_of_storage_servers_discovered
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
      [id, agent_id, connector_id, display_name, version, internal_id, status, discover_status, discover_error_code, discover_error_msg, entity_type, count_of_storage_servers_discovered].hash
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
