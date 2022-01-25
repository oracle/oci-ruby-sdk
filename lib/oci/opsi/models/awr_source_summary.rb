# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of an AwrSource.
  class Opsi::Models::AwrSourceSummary
    # **[Required]** AWR Hub OCID
    # @return [String]
    attr_accessor :awr_hub_id

    # **[Required]** Database name of the Source database for which AWR Data will be uploaded to AWR Hub.
    # @return [String]
    attr_accessor :name

    # **[Required]** DatabaseId of the Source database for which AWR Data will be uploaded to AWR Hub.
    # @return [String]
    attr_accessor :awr_source_database_id

    # **[Required]** Number of AWR snapshots uploaded from the Source database.
    # @return [Float]
    attr_accessor :snapshots_uploaded

    # **[Required]** The minimum snapshot identifier of the source database for which AWR data is uploaded to AWR Hub.
    # @return [Float]
    attr_accessor :min_snapshot_identifier

    # **[Required]** The maximum snapshot identifier of the source database for which AWR data is uploaded to AWR Hub.
    # @return [Float]
    attr_accessor :max_snapshot_identifier

    # **[Required]** The time at which the earliest snapshot was generated in the source database for which data is uploaded to AWR Hub. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_first_snapshot_generated

    # **[Required]** The time at which the latest snapshot was generated in the source database for which data is uploaded to AWR Hub. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_last_snapshot_generated

    # **[Required]** Number of hours since last AWR snapshots import happened from the Source database.
    # @return [Float]
    attr_accessor :hours_since_last_import

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'awr_hub_id': :'awrHubId',
        'name': :'name',
        'awr_source_database_id': :'awrSourceDatabaseId',
        'snapshots_uploaded': :'snapshotsUploaded',
        'min_snapshot_identifier': :'minSnapshotIdentifier',
        'max_snapshot_identifier': :'maxSnapshotIdentifier',
        'time_first_snapshot_generated': :'timeFirstSnapshotGenerated',
        'time_last_snapshot_generated': :'timeLastSnapshotGenerated',
        'hours_since_last_import': :'hoursSinceLastImport'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'awr_hub_id': :'String',
        'name': :'String',
        'awr_source_database_id': :'String',
        'snapshots_uploaded': :'Float',
        'min_snapshot_identifier': :'Float',
        'max_snapshot_identifier': :'Float',
        'time_first_snapshot_generated': :'DateTime',
        'time_last_snapshot_generated': :'DateTime',
        'hours_since_last_import': :'Float'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :awr_hub_id The value to assign to the {#awr_hub_id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :awr_source_database_id The value to assign to the {#awr_source_database_id} property
    # @option attributes [Float] :snapshots_uploaded The value to assign to the {#snapshots_uploaded} property
    # @option attributes [Float] :min_snapshot_identifier The value to assign to the {#min_snapshot_identifier} property
    # @option attributes [Float] :max_snapshot_identifier The value to assign to the {#max_snapshot_identifier} property
    # @option attributes [DateTime] :time_first_snapshot_generated The value to assign to the {#time_first_snapshot_generated} property
    # @option attributes [DateTime] :time_last_snapshot_generated The value to assign to the {#time_last_snapshot_generated} property
    # @option attributes [Float] :hours_since_last_import The value to assign to the {#hours_since_last_import} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.awr_hub_id = attributes[:'awrHubId'] if attributes[:'awrHubId']

      raise 'You cannot provide both :awrHubId and :awr_hub_id' if attributes.key?(:'awrHubId') && attributes.key?(:'awr_hub_id')

      self.awr_hub_id = attributes[:'awr_hub_id'] if attributes[:'awr_hub_id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.awr_source_database_id = attributes[:'awrSourceDatabaseId'] if attributes[:'awrSourceDatabaseId']

      raise 'You cannot provide both :awrSourceDatabaseId and :awr_source_database_id' if attributes.key?(:'awrSourceDatabaseId') && attributes.key?(:'awr_source_database_id')

      self.awr_source_database_id = attributes[:'awr_source_database_id'] if attributes[:'awr_source_database_id']

      self.snapshots_uploaded = attributes[:'snapshotsUploaded'] if attributes[:'snapshotsUploaded']

      raise 'You cannot provide both :snapshotsUploaded and :snapshots_uploaded' if attributes.key?(:'snapshotsUploaded') && attributes.key?(:'snapshots_uploaded')

      self.snapshots_uploaded = attributes[:'snapshots_uploaded'] if attributes[:'snapshots_uploaded']

      self.min_snapshot_identifier = attributes[:'minSnapshotIdentifier'] if attributes[:'minSnapshotIdentifier']

      raise 'You cannot provide both :minSnapshotIdentifier and :min_snapshot_identifier' if attributes.key?(:'minSnapshotIdentifier') && attributes.key?(:'min_snapshot_identifier')

      self.min_snapshot_identifier = attributes[:'min_snapshot_identifier'] if attributes[:'min_snapshot_identifier']

      self.max_snapshot_identifier = attributes[:'maxSnapshotIdentifier'] if attributes[:'maxSnapshotIdentifier']

      raise 'You cannot provide both :maxSnapshotIdentifier and :max_snapshot_identifier' if attributes.key?(:'maxSnapshotIdentifier') && attributes.key?(:'max_snapshot_identifier')

      self.max_snapshot_identifier = attributes[:'max_snapshot_identifier'] if attributes[:'max_snapshot_identifier']

      self.time_first_snapshot_generated = attributes[:'timeFirstSnapshotGenerated'] if attributes[:'timeFirstSnapshotGenerated']

      raise 'You cannot provide both :timeFirstSnapshotGenerated and :time_first_snapshot_generated' if attributes.key?(:'timeFirstSnapshotGenerated') && attributes.key?(:'time_first_snapshot_generated')

      self.time_first_snapshot_generated = attributes[:'time_first_snapshot_generated'] if attributes[:'time_first_snapshot_generated']

      self.time_last_snapshot_generated = attributes[:'timeLastSnapshotGenerated'] if attributes[:'timeLastSnapshotGenerated']

      raise 'You cannot provide both :timeLastSnapshotGenerated and :time_last_snapshot_generated' if attributes.key?(:'timeLastSnapshotGenerated') && attributes.key?(:'time_last_snapshot_generated')

      self.time_last_snapshot_generated = attributes[:'time_last_snapshot_generated'] if attributes[:'time_last_snapshot_generated']

      self.hours_since_last_import = attributes[:'hoursSinceLastImport'] if attributes[:'hoursSinceLastImport']

      raise 'You cannot provide both :hoursSinceLastImport and :hours_since_last_import' if attributes.key?(:'hoursSinceLastImport') && attributes.key?(:'hours_since_last_import')

      self.hours_since_last_import = attributes[:'hours_since_last_import'] if attributes[:'hours_since_last_import']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        awr_hub_id == other.awr_hub_id &&
        name == other.name &&
        awr_source_database_id == other.awr_source_database_id &&
        snapshots_uploaded == other.snapshots_uploaded &&
        min_snapshot_identifier == other.min_snapshot_identifier &&
        max_snapshot_identifier == other.max_snapshot_identifier &&
        time_first_snapshot_generated == other.time_first_snapshot_generated &&
        time_last_snapshot_generated == other.time_last_snapshot_generated &&
        hours_since_last_import == other.hours_since_last_import
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
      [awr_hub_id, name, awr_source_database_id, snapshots_uploaded, min_snapshot_identifier, max_snapshot_identifier, time_first_snapshot_generated, time_last_snapshot_generated, hours_since_last_import].hash
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
