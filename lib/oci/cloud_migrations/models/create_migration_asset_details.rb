# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220919
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of the new migration asset.
  class CloudMigrations::Models::CreateMigrationAssetDetails
    # A user-friendly name. If empty, then source asset name will be used. Does not have to be unique, and it's changeable. Avoid entering confidential information.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** OCID of an asset for an inventory.
    # @return [String]
    attr_accessor :inventory_asset_id

    # **[Required]** OCID of the associated migration.
    # @return [String]
    attr_accessor :migration_id

    # Replication schedule identifier
    # @return [String]
    attr_accessor :replication_schedule_id

    # **[Required]** Availability domain
    # @return [String]
    attr_accessor :availability_domain

    # **[Required]** Replication compartment identifier
    # @return [String]
    attr_accessor :replication_compartment_id

    # **[Required]** Name of snapshot bucket
    # @return [String]
    attr_accessor :snap_shot_bucket_name

    # List of migration assets that depends on this asset.
    # @return [Array<String>]
    attr_accessor :depends_on

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'inventory_asset_id': :'inventoryAssetId',
        'migration_id': :'migrationId',
        'replication_schedule_id': :'replicationScheduleId',
        'availability_domain': :'availabilityDomain',
        'replication_compartment_id': :'replicationCompartmentId',
        'snap_shot_bucket_name': :'snapShotBucketName',
        'depends_on': :'dependsOn'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'inventory_asset_id': :'String',
        'migration_id': :'String',
        'replication_schedule_id': :'String',
        'availability_domain': :'String',
        'replication_compartment_id': :'String',
        'snap_shot_bucket_name': :'String',
        'depends_on': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :inventory_asset_id The value to assign to the {#inventory_asset_id} property
    # @option attributes [String] :migration_id The value to assign to the {#migration_id} property
    # @option attributes [String] :replication_schedule_id The value to assign to the {#replication_schedule_id} property
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [String] :replication_compartment_id The value to assign to the {#replication_compartment_id} property
    # @option attributes [String] :snap_shot_bucket_name The value to assign to the {#snap_shot_bucket_name} property
    # @option attributes [Array<String>] :depends_on The value to assign to the {#depends_on} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.inventory_asset_id = attributes[:'inventoryAssetId'] if attributes[:'inventoryAssetId']

      raise 'You cannot provide both :inventoryAssetId and :inventory_asset_id' if attributes.key?(:'inventoryAssetId') && attributes.key?(:'inventory_asset_id')

      self.inventory_asset_id = attributes[:'inventory_asset_id'] if attributes[:'inventory_asset_id']

      self.migration_id = attributes[:'migrationId'] if attributes[:'migrationId']

      raise 'You cannot provide both :migrationId and :migration_id' if attributes.key?(:'migrationId') && attributes.key?(:'migration_id')

      self.migration_id = attributes[:'migration_id'] if attributes[:'migration_id']

      self.replication_schedule_id = attributes[:'replicationScheduleId'] if attributes[:'replicationScheduleId']

      raise 'You cannot provide both :replicationScheduleId and :replication_schedule_id' if attributes.key?(:'replicationScheduleId') && attributes.key?(:'replication_schedule_id')

      self.replication_schedule_id = attributes[:'replication_schedule_id'] if attributes[:'replication_schedule_id']

      self.availability_domain = attributes[:'availabilityDomain'] if attributes[:'availabilityDomain']

      raise 'You cannot provide both :availabilityDomain and :availability_domain' if attributes.key?(:'availabilityDomain') && attributes.key?(:'availability_domain')

      self.availability_domain = attributes[:'availability_domain'] if attributes[:'availability_domain']

      self.replication_compartment_id = attributes[:'replicationCompartmentId'] if attributes[:'replicationCompartmentId']

      raise 'You cannot provide both :replicationCompartmentId and :replication_compartment_id' if attributes.key?(:'replicationCompartmentId') && attributes.key?(:'replication_compartment_id')

      self.replication_compartment_id = attributes[:'replication_compartment_id'] if attributes[:'replication_compartment_id']

      self.snap_shot_bucket_name = attributes[:'snapShotBucketName'] if attributes[:'snapShotBucketName']

      raise 'You cannot provide both :snapShotBucketName and :snap_shot_bucket_name' if attributes.key?(:'snapShotBucketName') && attributes.key?(:'snap_shot_bucket_name')

      self.snap_shot_bucket_name = attributes[:'snap_shot_bucket_name'] if attributes[:'snap_shot_bucket_name']

      self.depends_on = attributes[:'dependsOn'] if attributes[:'dependsOn']

      raise 'You cannot provide both :dependsOn and :depends_on' if attributes.key?(:'dependsOn') && attributes.key?(:'depends_on')

      self.depends_on = attributes[:'depends_on'] if attributes[:'depends_on']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        inventory_asset_id == other.inventory_asset_id &&
        migration_id == other.migration_id &&
        replication_schedule_id == other.replication_schedule_id &&
        availability_domain == other.availability_domain &&
        replication_compartment_id == other.replication_compartment_id &&
        snap_shot_bucket_name == other.snap_shot_bucket_name &&
        depends_on == other.depends_on
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
      [display_name, inventory_asset_id, migration_id, replication_schedule_id, availability_domain, replication_compartment_id, snap_shot_bucket_name, depends_on].hash
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
