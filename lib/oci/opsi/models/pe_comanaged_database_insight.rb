# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'database_insight'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Database insight resource.
  class Opsi::Models::PeComanagedDatabaseInsight < Opsi::Models::DatabaseInsight
    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the OPSI private endpoint
    # @return [String]
    attr_accessor :opsi_private_endpoint_id

    # @return [OCI::Opsi::Models::PeComanagedDatabaseConnectionDetails]
    attr_accessor :connection_details

    # @return [OCI::Opsi::Models::CredentialDetails]
    attr_accessor :credential_details

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database.
    # @return [String]
    attr_accessor :database_id

    # **[Required]** Name of database
    # @return [String]
    attr_accessor :database_name

    # Display name of database
    # @return [String]
    attr_accessor :database_display_name

    # **[Required]** OCI database resource type
    # @return [String]
    attr_accessor :database_resource_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'entity_source': :'entitySource',
        'id': :'id',
        'compartment_id': :'compartmentId',
        'status': :'status',
        'database_type': :'databaseType',
        'database_version': :'databaseVersion',
        'processor_count': :'processorCount',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'database_connection_status_details': :'databaseConnectionStatusDetails',
        'opsi_private_endpoint_id': :'opsiPrivateEndpointId',
        'connection_details': :'connectionDetails',
        'credential_details': :'credentialDetails',
        'database_id': :'databaseId',
        'database_name': :'databaseName',
        'database_display_name': :'databaseDisplayName',
        'database_resource_type': :'databaseResourceType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'entity_source': :'String',
        'id': :'String',
        'compartment_id': :'String',
        'status': :'String',
        'database_type': :'String',
        'database_version': :'String',
        'processor_count': :'Integer',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'database_connection_status_details': :'String',
        'opsi_private_endpoint_id': :'String',
        'connection_details': :'OCI::Opsi::Models::PeComanagedDatabaseConnectionDetails',
        'credential_details': :'OCI::Opsi::Models::CredentialDetails',
        'database_id': :'String',
        'database_name': :'String',
        'database_display_name': :'String',
        'database_resource_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::Opsi::Models::DatabaseInsight#id #id} proprety
    # @option attributes [String] :compartment_id The value to assign to the {OCI::Opsi::Models::DatabaseInsight#compartment_id #compartment_id} proprety
    # @option attributes [String] :status The value to assign to the {OCI::Opsi::Models::DatabaseInsight#status #status} proprety
    # @option attributes [String] :database_type The value to assign to the {OCI::Opsi::Models::DatabaseInsight#database_type #database_type} proprety
    # @option attributes [String] :database_version The value to assign to the {OCI::Opsi::Models::DatabaseInsight#database_version #database_version} proprety
    # @option attributes [Integer] :processor_count The value to assign to the {OCI::Opsi::Models::DatabaseInsight#processor_count #processor_count} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::Opsi::Models::DatabaseInsight#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::Opsi::Models::DatabaseInsight#defined_tags #defined_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {OCI::Opsi::Models::DatabaseInsight#system_tags #system_tags} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::Opsi::Models::DatabaseInsight#time_created #time_created} proprety
    # @option attributes [DateTime] :time_updated The value to assign to the {OCI::Opsi::Models::DatabaseInsight#time_updated #time_updated} proprety
    # @option attributes [String] :lifecycle_state The value to assign to the {OCI::Opsi::Models::DatabaseInsight#lifecycle_state #lifecycle_state} proprety
    # @option attributes [String] :lifecycle_details The value to assign to the {OCI::Opsi::Models::DatabaseInsight#lifecycle_details #lifecycle_details} proprety
    # @option attributes [String] :database_connection_status_details The value to assign to the {OCI::Opsi::Models::DatabaseInsight#database_connection_status_details #database_connection_status_details} proprety
    # @option attributes [String] :opsi_private_endpoint_id The value to assign to the {#opsi_private_endpoint_id} property
    # @option attributes [OCI::Opsi::Models::PeComanagedDatabaseConnectionDetails] :connection_details The value to assign to the {#connection_details} property
    # @option attributes [OCI::Opsi::Models::CredentialDetails] :credential_details The value to assign to the {#credential_details} property
    # @option attributes [String] :database_id The value to assign to the {#database_id} property
    # @option attributes [String] :database_name The value to assign to the {#database_name} property
    # @option attributes [String] :database_display_name The value to assign to the {#database_display_name} property
    # @option attributes [String] :database_resource_type The value to assign to the {#database_resource_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['entitySource'] = 'PE_COMANAGED_DATABASE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.opsi_private_endpoint_id = attributes[:'opsiPrivateEndpointId'] if attributes[:'opsiPrivateEndpointId']

      raise 'You cannot provide both :opsiPrivateEndpointId and :opsi_private_endpoint_id' if attributes.key?(:'opsiPrivateEndpointId') && attributes.key?(:'opsi_private_endpoint_id')

      self.opsi_private_endpoint_id = attributes[:'opsi_private_endpoint_id'] if attributes[:'opsi_private_endpoint_id']

      self.connection_details = attributes[:'connectionDetails'] if attributes[:'connectionDetails']

      raise 'You cannot provide both :connectionDetails and :connection_details' if attributes.key?(:'connectionDetails') && attributes.key?(:'connection_details')

      self.connection_details = attributes[:'connection_details'] if attributes[:'connection_details']

      self.credential_details = attributes[:'credentialDetails'] if attributes[:'credentialDetails']

      raise 'You cannot provide both :credentialDetails and :credential_details' if attributes.key?(:'credentialDetails') && attributes.key?(:'credential_details')

      self.credential_details = attributes[:'credential_details'] if attributes[:'credential_details']

      self.database_id = attributes[:'databaseId'] if attributes[:'databaseId']

      raise 'You cannot provide both :databaseId and :database_id' if attributes.key?(:'databaseId') && attributes.key?(:'database_id')

      self.database_id = attributes[:'database_id'] if attributes[:'database_id']

      self.database_name = attributes[:'databaseName'] if attributes[:'databaseName']

      raise 'You cannot provide both :databaseName and :database_name' if attributes.key?(:'databaseName') && attributes.key?(:'database_name')

      self.database_name = attributes[:'database_name'] if attributes[:'database_name']

      self.database_display_name = attributes[:'databaseDisplayName'] if attributes[:'databaseDisplayName']

      raise 'You cannot provide both :databaseDisplayName and :database_display_name' if attributes.key?(:'databaseDisplayName') && attributes.key?(:'database_display_name')

      self.database_display_name = attributes[:'database_display_name'] if attributes[:'database_display_name']

      self.database_resource_type = attributes[:'databaseResourceType'] if attributes[:'databaseResourceType']

      raise 'You cannot provide both :databaseResourceType and :database_resource_type' if attributes.key?(:'databaseResourceType') && attributes.key?(:'database_resource_type')

      self.database_resource_type = attributes[:'database_resource_type'] if attributes[:'database_resource_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        entity_source == other.entity_source &&
        id == other.id &&
        compartment_id == other.compartment_id &&
        status == other.status &&
        database_type == other.database_type &&
        database_version == other.database_version &&
        processor_count == other.processor_count &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        database_connection_status_details == other.database_connection_status_details &&
        opsi_private_endpoint_id == other.opsi_private_endpoint_id &&
        connection_details == other.connection_details &&
        credential_details == other.credential_details &&
        database_id == other.database_id &&
        database_name == other.database_name &&
        database_display_name == other.database_display_name &&
        database_resource_type == other.database_resource_type
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
      [entity_source, id, compartment_id, status, database_type, database_version, processor_count, freeform_tags, defined_tags, system_tags, time_created, time_updated, lifecycle_state, lifecycle_details, database_connection_status_details, opsi_private_endpoint_id, connection_details, credential_details, database_id, database_name, database_display_name, database_resource_type].hash
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
