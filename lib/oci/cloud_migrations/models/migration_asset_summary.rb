# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220919
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of the migration asset.
  class CloudMigrations::Models::MigrationAssetSummary
    NOTIFICATIONS_ENUM = [
      NOTIFICATIONS_OUT_OF_DATE = 'OUT_OF_DATE'.freeze,
      NOTIFICATIONS_SOURCE_REMOVED = 'SOURCE_REMOVED'.freeze,
      NOTIFICATIONS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The asset ID generated by the mirgration service. It is used in the migration service pipeline.
    # @return [String]
    attr_accessor :id

    # **[Required]** The type of asset referenced for an inventory.
    # @return [String]
    attr_accessor :type

    # A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information.
    # @return [String]
    attr_accessor :display_name

    # Compartment identifier
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The current state of the migration asset.
    # @return [String]
    attr_accessor :lifecycle_state

    # A message describing the current state in more detail. For example, it can be used to provide actionable information for a resource in Failed state.
    # @return [String]
    attr_accessor :lifecycle_details

    # **[Required]** The time when the migration asset was created. An RFC3339 formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_created

    # The time when the migration asset was updated. An RFC3339 formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** OCID of the associated migration.
    # @return [String]
    attr_accessor :migration_id

    # Key-value pair representing disk's ID that is mapped to the OCIDs of replicated/hydration server volume snapshots.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, OCI::CloudMigrations::Models::HydratedVolume>]
    attr_accessor :snapshots

    # The parent snapshot of the mgration asset to be used by the replication task.
    # @return [String]
    attr_accessor :parent_snapshot

    # The snapshot information.
    # @return [String]
    attr_accessor :snapshot_info

    # Key-value pair representing asset metadata keys and values scoped to a namespace.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, Object>]
    attr_accessor :source_asset_data

    # List of notifications.
    # @return [Array<String>]
    attr_reader :notifications

    # OCID that is referenced to an asset, for an inventory.
    # @return [String]
    attr_accessor :source_asset_id

    # List of migration assets that depend on this asset.
    # @return [Array<String>]
    attr_accessor :depended_on_by

    # List of migration assets that depend on this asset.
    # @return [Array<String>]
    attr_accessor :depends_on

    # Replication schedule identifier
    # @return [String]
    attr_accessor :replication_schedule_id

    # Tenancy Identifier
    # @return [String]
    attr_accessor :tenancy_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'type': :'type',
        'display_name': :'displayName',
        'compartment_id': :'compartmentId',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'migration_id': :'migrationId',
        'snapshots': :'snapshots',
        'parent_snapshot': :'parentSnapshot',
        'snapshot_info': :'snapshotInfo',
        'source_asset_data': :'sourceAssetData',
        'notifications': :'notifications',
        'source_asset_id': :'sourceAssetId',
        'depended_on_by': :'dependedOnBy',
        'depends_on': :'dependsOn',
        'replication_schedule_id': :'replicationScheduleId',
        'tenancy_id': :'tenancyId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'type': :'String',
        'display_name': :'String',
        'compartment_id': :'String',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'migration_id': :'String',
        'snapshots': :'Hash<String, OCI::CloudMigrations::Models::HydratedVolume>',
        'parent_snapshot': :'String',
        'snapshot_info': :'String',
        'source_asset_data': :'Hash<String, Object>',
        'notifications': :'Array<String>',
        'source_asset_id': :'String',
        'depended_on_by': :'Array<String>',
        'depends_on': :'Array<String>',
        'replication_schedule_id': :'String',
        'tenancy_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :migration_id The value to assign to the {#migration_id} property
    # @option attributes [Hash<String, OCI::CloudMigrations::Models::HydratedVolume>] :snapshots The value to assign to the {#snapshots} property
    # @option attributes [String] :parent_snapshot The value to assign to the {#parent_snapshot} property
    # @option attributes [String] :snapshot_info The value to assign to the {#snapshot_info} property
    # @option attributes [Hash<String, Object>] :source_asset_data The value to assign to the {#source_asset_data} property
    # @option attributes [Array<String>] :notifications The value to assign to the {#notifications} property
    # @option attributes [String] :source_asset_id The value to assign to the {#source_asset_id} property
    # @option attributes [Array<String>] :depended_on_by The value to assign to the {#depended_on_by} property
    # @option attributes [Array<String>] :depends_on The value to assign to the {#depends_on} property
    # @option attributes [String] :replication_schedule_id The value to assign to the {#replication_schedule_id} property
    # @option attributes [String] :tenancy_id The value to assign to the {#tenancy_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.type = attributes[:'type'] if attributes[:'type']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.migration_id = attributes[:'migrationId'] if attributes[:'migrationId']

      raise 'You cannot provide both :migrationId and :migration_id' if attributes.key?(:'migrationId') && attributes.key?(:'migration_id')

      self.migration_id = attributes[:'migration_id'] if attributes[:'migration_id']

      self.snapshots = attributes[:'snapshots'] if attributes[:'snapshots']

      self.parent_snapshot = attributes[:'parentSnapshot'] if attributes[:'parentSnapshot']

      raise 'You cannot provide both :parentSnapshot and :parent_snapshot' if attributes.key?(:'parentSnapshot') && attributes.key?(:'parent_snapshot')

      self.parent_snapshot = attributes[:'parent_snapshot'] if attributes[:'parent_snapshot']

      self.snapshot_info = attributes[:'snapshotInfo'] if attributes[:'snapshotInfo']

      raise 'You cannot provide both :snapshotInfo and :snapshot_info' if attributes.key?(:'snapshotInfo') && attributes.key?(:'snapshot_info')

      self.snapshot_info = attributes[:'snapshot_info'] if attributes[:'snapshot_info']

      self.source_asset_data = attributes[:'sourceAssetData'] if attributes[:'sourceAssetData']

      raise 'You cannot provide both :sourceAssetData and :source_asset_data' if attributes.key?(:'sourceAssetData') && attributes.key?(:'source_asset_data')

      self.source_asset_data = attributes[:'source_asset_data'] if attributes[:'source_asset_data']

      self.notifications = attributes[:'notifications'] if attributes[:'notifications']

      self.source_asset_id = attributes[:'sourceAssetId'] if attributes[:'sourceAssetId']

      raise 'You cannot provide both :sourceAssetId and :source_asset_id' if attributes.key?(:'sourceAssetId') && attributes.key?(:'source_asset_id')

      self.source_asset_id = attributes[:'source_asset_id'] if attributes[:'source_asset_id']

      self.depended_on_by = attributes[:'dependedOnBy'] if attributes[:'dependedOnBy']

      raise 'You cannot provide both :dependedOnBy and :depended_on_by' if attributes.key?(:'dependedOnBy') && attributes.key?(:'depended_on_by')

      self.depended_on_by = attributes[:'depended_on_by'] if attributes[:'depended_on_by']

      self.depends_on = attributes[:'dependsOn'] if attributes[:'dependsOn']

      raise 'You cannot provide both :dependsOn and :depends_on' if attributes.key?(:'dependsOn') && attributes.key?(:'depends_on')

      self.depends_on = attributes[:'depends_on'] if attributes[:'depends_on']

      self.replication_schedule_id = attributes[:'replicationScheduleId'] if attributes[:'replicationScheduleId']

      raise 'You cannot provide both :replicationScheduleId and :replication_schedule_id' if attributes.key?(:'replicationScheduleId') && attributes.key?(:'replication_schedule_id')

      self.replication_schedule_id = attributes[:'replication_schedule_id'] if attributes[:'replication_schedule_id']

      self.tenancy_id = attributes[:'tenancyId'] if attributes[:'tenancyId']

      raise 'You cannot provide both :tenancyId and :tenancy_id' if attributes.key?(:'tenancyId') && attributes.key?(:'tenancy_id')

      self.tenancy_id = attributes[:'tenancy_id'] if attributes[:'tenancy_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] notifications Object to be assigned
    def notifications=(notifications)
      # rubocop:disable Style/ConditionalAssignment
      if notifications.nil?
        @notifications = nil
      else
        @notifications =
          notifications.collect do |item|
            if NOTIFICATIONS_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'notifications' [#{item}]. Mapping to 'NOTIFICATIONS_UNKNOWN_ENUM_VALUE'") if OCI.logger
              NOTIFICATIONS_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        type == other.type &&
        display_name == other.display_name &&
        compartment_id == other.compartment_id &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        migration_id == other.migration_id &&
        snapshots == other.snapshots &&
        parent_snapshot == other.parent_snapshot &&
        snapshot_info == other.snapshot_info &&
        source_asset_data == other.source_asset_data &&
        notifications == other.notifications &&
        source_asset_id == other.source_asset_id &&
        depended_on_by == other.depended_on_by &&
        depends_on == other.depends_on &&
        replication_schedule_id == other.replication_schedule_id &&
        tenancy_id == other.tenancy_id
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
      [id, type, display_name, compartment_id, lifecycle_state, lifecycle_details, time_created, time_updated, migration_id, snapshots, parent_snapshot, snapshot_info, source_asset_data, notifications, source_asset_id, depended_on_by, depends_on, replication_schedule_id, tenancy_id].hash
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
