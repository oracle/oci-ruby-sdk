# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Information about the Exadata DB system migration. The migration is used to move the Exadata Cloud Service instance from the DB system resource model to the new cloud Exadata infrastructure resource model.
  #
  class Database::Models::ExadataDbSystemMigration
    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the DB system.
    # @return [String]
    attr_accessor :db_system_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the cloud VM cluster.
    # @return [String]
    attr_accessor :cloud_vm_cluster_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the cloud Exadata infrastructure.
    # @return [String]
    attr_accessor :cloud_exadata_infrastructure_id

    # The details of addtional resources related to the migration.
    # @return [Array<OCI::Database::Models::ExadataDbSystemMigrationSummary>]
    attr_accessor :additional_migrations

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'db_system_id': :'dbSystemId',
        'cloud_vm_cluster_id': :'cloudVmClusterId',
        'cloud_exadata_infrastructure_id': :'cloudExadataInfrastructureId',
        'additional_migrations': :'additionalMigrations'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'db_system_id': :'String',
        'cloud_vm_cluster_id': :'String',
        'cloud_exadata_infrastructure_id': :'String',
        'additional_migrations': :'Array<OCI::Database::Models::ExadataDbSystemMigrationSummary>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :db_system_id The value to assign to the {#db_system_id} property
    # @option attributes [String] :cloud_vm_cluster_id The value to assign to the {#cloud_vm_cluster_id} property
    # @option attributes [String] :cloud_exadata_infrastructure_id The value to assign to the {#cloud_exadata_infrastructure_id} property
    # @option attributes [Array<OCI::Database::Models::ExadataDbSystemMigrationSummary>] :additional_migrations The value to assign to the {#additional_migrations} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.db_system_id = attributes[:'dbSystemId'] if attributes[:'dbSystemId']

      raise 'You cannot provide both :dbSystemId and :db_system_id' if attributes.key?(:'dbSystemId') && attributes.key?(:'db_system_id')

      self.db_system_id = attributes[:'db_system_id'] if attributes[:'db_system_id']

      self.cloud_vm_cluster_id = attributes[:'cloudVmClusterId'] if attributes[:'cloudVmClusterId']

      raise 'You cannot provide both :cloudVmClusterId and :cloud_vm_cluster_id' if attributes.key?(:'cloudVmClusterId') && attributes.key?(:'cloud_vm_cluster_id')

      self.cloud_vm_cluster_id = attributes[:'cloud_vm_cluster_id'] if attributes[:'cloud_vm_cluster_id']

      self.cloud_exadata_infrastructure_id = attributes[:'cloudExadataInfrastructureId'] if attributes[:'cloudExadataInfrastructureId']

      raise 'You cannot provide both :cloudExadataInfrastructureId and :cloud_exadata_infrastructure_id' if attributes.key?(:'cloudExadataInfrastructureId') && attributes.key?(:'cloud_exadata_infrastructure_id')

      self.cloud_exadata_infrastructure_id = attributes[:'cloud_exadata_infrastructure_id'] if attributes[:'cloud_exadata_infrastructure_id']

      self.additional_migrations = attributes[:'additionalMigrations'] if attributes[:'additionalMigrations']

      raise 'You cannot provide both :additionalMigrations and :additional_migrations' if attributes.key?(:'additionalMigrations') && attributes.key?(:'additional_migrations')

      self.additional_migrations = attributes[:'additional_migrations'] if attributes[:'additional_migrations']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        db_system_id == other.db_system_id &&
        cloud_vm_cluster_id == other.cloud_vm_cluster_id &&
        cloud_exadata_infrastructure_id == other.cloud_exadata_infrastructure_id &&
        additional_migrations == other.additional_migrations
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
      [db_system_id, cloud_vm_cluster_id, cloud_exadata_infrastructure_id, additional_migrations].hash
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
