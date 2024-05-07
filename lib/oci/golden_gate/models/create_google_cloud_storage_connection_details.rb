# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200407
require 'date'
require_relative 'create_connection_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information about a new Google Cloud Storage Connection.
  #
  class GoldenGate::Models::CreateGoogleCloudStorageConnectionDetails < GoldenGate::Models::CreateConnectionDetails
    # **[Required]** The Google Cloud Storage technology type.
    # @return [String]
    attr_accessor :technology_type

    # **[Required]** The base64 encoded content of the service account key file containing
    # the credentials required to use Google Cloud Storage.
    #
    # @return [String]
    attr_accessor :service_account_key_file

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'connection_type': :'connectionType',
        'display_name': :'displayName',
        'description': :'description',
        'compartment_id': :'compartmentId',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'vault_id': :'vaultId',
        'key_id': :'keyId',
        'nsg_ids': :'nsgIds',
        'subnet_id': :'subnetId',
        'routing_method': :'routingMethod',
        'technology_type': :'technologyType',
        'service_account_key_file': :'serviceAccountKeyFile'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'connection_type': :'String',
        'display_name': :'String',
        'description': :'String',
        'compartment_id': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'vault_id': :'String',
        'key_id': :'String',
        'nsg_ids': :'Array<String>',
        'subnet_id': :'String',
        'routing_method': :'String',
        'technology_type': :'String',
        'service_account_key_file': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {OCI::GoldenGate::Models::CreateConnectionDetails#display_name #display_name} proprety
    # @option attributes [String] :description The value to assign to the {OCI::GoldenGate::Models::CreateConnectionDetails#description #description} proprety
    # @option attributes [String] :compartment_id The value to assign to the {OCI::GoldenGate::Models::CreateConnectionDetails#compartment_id #compartment_id} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::GoldenGate::Models::CreateConnectionDetails#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::GoldenGate::Models::CreateConnectionDetails#defined_tags #defined_tags} proprety
    # @option attributes [String] :vault_id The value to assign to the {OCI::GoldenGate::Models::CreateConnectionDetails#vault_id #vault_id} proprety
    # @option attributes [String] :key_id The value to assign to the {OCI::GoldenGate::Models::CreateConnectionDetails#key_id #key_id} proprety
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {OCI::GoldenGate::Models::CreateConnectionDetails#nsg_ids #nsg_ids} proprety
    # @option attributes [String] :subnet_id The value to assign to the {OCI::GoldenGate::Models::CreateConnectionDetails#subnet_id #subnet_id} proprety
    # @option attributes [String] :routing_method The value to assign to the {OCI::GoldenGate::Models::CreateConnectionDetails#routing_method #routing_method} proprety
    # @option attributes [String] :technology_type The value to assign to the {#technology_type} property
    # @option attributes [String] :service_account_key_file The value to assign to the {#service_account_key_file} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['connectionType'] = 'GOOGLE_CLOUD_STORAGE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.technology_type = attributes[:'technologyType'] if attributes[:'technologyType']

      raise 'You cannot provide both :technologyType and :technology_type' if attributes.key?(:'technologyType') && attributes.key?(:'technology_type')

      self.technology_type = attributes[:'technology_type'] if attributes[:'technology_type']

      self.service_account_key_file = attributes[:'serviceAccountKeyFile'] if attributes[:'serviceAccountKeyFile']

      raise 'You cannot provide both :serviceAccountKeyFile and :service_account_key_file' if attributes.key?(:'serviceAccountKeyFile') && attributes.key?(:'service_account_key_file')

      self.service_account_key_file = attributes[:'service_account_key_file'] if attributes[:'service_account_key_file']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        connection_type == other.connection_type &&
        display_name == other.display_name &&
        description == other.description &&
        compartment_id == other.compartment_id &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        vault_id == other.vault_id &&
        key_id == other.key_id &&
        nsg_ids == other.nsg_ids &&
        subnet_id == other.subnet_id &&
        routing_method == other.routing_method &&
        technology_type == other.technology_type &&
        service_account_key_file == other.service_account_key_file
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
      [connection_type, display_name, description, compartment_id, freeform_tags, defined_tags, vault_id, key_id, nsg_ids, subnet_id, routing_method, technology_type, service_account_key_file].hash
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
