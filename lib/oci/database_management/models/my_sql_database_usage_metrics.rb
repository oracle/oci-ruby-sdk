# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20201101
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The list of aggregated metrics for Managed MySQL Databases in the fleet.
  class DatabaseManagement::Models::MySqlDatabaseUsageMetrics
    DATABASE_STATUS_ENUM = [
      DATABASE_STATUS_UP = 'UP'.freeze,
      DATABASE_STATUS_DOWN = 'DOWN'.freeze,
      DATABASE_STATUS_UNKNOWN = 'UNKNOWN'.freeze,
      DATABASE_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the compartment where the Managed MySQL Database resides.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The display name of the Managed MySQL Database.
    # @return [String]
    attr_accessor :database_name

    # **[Required]** Indicates MySQL Database type, ONPREMISE or MySQL Database System.
    # @return [String]
    attr_accessor :database_type

    # **[Required]** The type of MySQL Database System.
    # @return [String]
    attr_accessor :mds_deployment_type

    # **[Required]** The lifecycle state of the MySQL Database System.
    # @return [String]
    attr_accessor :mdslifecycle_state

    # **[Required]** The version of the MySQL Database.
    # @return [String]
    attr_accessor :database_version

    # **[Required]** The OCID of the Managed MySQL Database.
    # @return [String]
    attr_accessor :db_id

    # **[Required]** The status of the MySQL Database. Indicates whether the status of the database
    # is UP, DOWN, or UNKNOWN at the current time.
    #
    # @return [String]
    attr_reader :database_status

    # Indicates whether HeatWave is enabled for the MySQL Database System or not.
    # @return [BOOLEAN]
    attr_accessor :is_heat_wave_enabled

    # The name of the HeatWave cluster.
    # @return [String]
    attr_accessor :heat_wave_cluster_display_name

    # The number of nodes in the HeatWave cluster.
    # @return [Integer]
    attr_accessor :heat_wave_node_count

    # **[Required]** A list of the database health metrics like CPU, Storage, and Memory.
    # @return [Array<OCI::DatabaseManagement::Models::MySqlFleetMetricDefinition>]
    attr_accessor :metrics

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'database_name': :'databaseName',
        'database_type': :'databaseType',
        'mds_deployment_type': :'mdsDeploymentType',
        'mdslifecycle_state': :'mdslifecycleState',
        'database_version': :'databaseVersion',
        'db_id': :'dbId',
        'database_status': :'databaseStatus',
        'is_heat_wave_enabled': :'isHeatWaveEnabled',
        'heat_wave_cluster_display_name': :'heatWaveClusterDisplayName',
        'heat_wave_node_count': :'heatWaveNodeCount',
        'metrics': :'metrics'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'database_name': :'String',
        'database_type': :'String',
        'mds_deployment_type': :'String',
        'mdslifecycle_state': :'String',
        'database_version': :'String',
        'db_id': :'String',
        'database_status': :'String',
        'is_heat_wave_enabled': :'BOOLEAN',
        'heat_wave_cluster_display_name': :'String',
        'heat_wave_node_count': :'Integer',
        'metrics': :'Array<OCI::DatabaseManagement::Models::MySqlFleetMetricDefinition>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :database_name The value to assign to the {#database_name} property
    # @option attributes [String] :database_type The value to assign to the {#database_type} property
    # @option attributes [String] :mds_deployment_type The value to assign to the {#mds_deployment_type} property
    # @option attributes [String] :mdslifecycle_state The value to assign to the {#mdslifecycle_state} property
    # @option attributes [String] :database_version The value to assign to the {#database_version} property
    # @option attributes [String] :db_id The value to assign to the {#db_id} property
    # @option attributes [String] :database_status The value to assign to the {#database_status} property
    # @option attributes [BOOLEAN] :is_heat_wave_enabled The value to assign to the {#is_heat_wave_enabled} property
    # @option attributes [String] :heat_wave_cluster_display_name The value to assign to the {#heat_wave_cluster_display_name} property
    # @option attributes [Integer] :heat_wave_node_count The value to assign to the {#heat_wave_node_count} property
    # @option attributes [Array<OCI::DatabaseManagement::Models::MySqlFleetMetricDefinition>] :metrics The value to assign to the {#metrics} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.database_name = attributes[:'databaseName'] if attributes[:'databaseName']

      raise 'You cannot provide both :databaseName and :database_name' if attributes.key?(:'databaseName') && attributes.key?(:'database_name')

      self.database_name = attributes[:'database_name'] if attributes[:'database_name']

      self.database_type = attributes[:'databaseType'] if attributes[:'databaseType']

      raise 'You cannot provide both :databaseType and :database_type' if attributes.key?(:'databaseType') && attributes.key?(:'database_type')

      self.database_type = attributes[:'database_type'] if attributes[:'database_type']

      self.mds_deployment_type = attributes[:'mdsDeploymentType'] if attributes[:'mdsDeploymentType']

      raise 'You cannot provide both :mdsDeploymentType and :mds_deployment_type' if attributes.key?(:'mdsDeploymentType') && attributes.key?(:'mds_deployment_type')

      self.mds_deployment_type = attributes[:'mds_deployment_type'] if attributes[:'mds_deployment_type']

      self.mdslifecycle_state = attributes[:'mdslifecycleState'] if attributes[:'mdslifecycleState']

      raise 'You cannot provide both :mdslifecycleState and :mdslifecycle_state' if attributes.key?(:'mdslifecycleState') && attributes.key?(:'mdslifecycle_state')

      self.mdslifecycle_state = attributes[:'mdslifecycle_state'] if attributes[:'mdslifecycle_state']

      self.database_version = attributes[:'databaseVersion'] if attributes[:'databaseVersion']

      raise 'You cannot provide both :databaseVersion and :database_version' if attributes.key?(:'databaseVersion') && attributes.key?(:'database_version')

      self.database_version = attributes[:'database_version'] if attributes[:'database_version']

      self.db_id = attributes[:'dbId'] if attributes[:'dbId']

      raise 'You cannot provide both :dbId and :db_id' if attributes.key?(:'dbId') && attributes.key?(:'db_id')

      self.db_id = attributes[:'db_id'] if attributes[:'db_id']

      self.database_status = attributes[:'databaseStatus'] if attributes[:'databaseStatus']

      raise 'You cannot provide both :databaseStatus and :database_status' if attributes.key?(:'databaseStatus') && attributes.key?(:'database_status')

      self.database_status = attributes[:'database_status'] if attributes[:'database_status']

      self.is_heat_wave_enabled = attributes[:'isHeatWaveEnabled'] unless attributes[:'isHeatWaveEnabled'].nil?

      raise 'You cannot provide both :isHeatWaveEnabled and :is_heat_wave_enabled' if attributes.key?(:'isHeatWaveEnabled') && attributes.key?(:'is_heat_wave_enabled')

      self.is_heat_wave_enabled = attributes[:'is_heat_wave_enabled'] unless attributes[:'is_heat_wave_enabled'].nil?

      self.heat_wave_cluster_display_name = attributes[:'heatWaveClusterDisplayName'] if attributes[:'heatWaveClusterDisplayName']

      raise 'You cannot provide both :heatWaveClusterDisplayName and :heat_wave_cluster_display_name' if attributes.key?(:'heatWaveClusterDisplayName') && attributes.key?(:'heat_wave_cluster_display_name')

      self.heat_wave_cluster_display_name = attributes[:'heat_wave_cluster_display_name'] if attributes[:'heat_wave_cluster_display_name']

      self.heat_wave_node_count = attributes[:'heatWaveNodeCount'] if attributes[:'heatWaveNodeCount']

      raise 'You cannot provide both :heatWaveNodeCount and :heat_wave_node_count' if attributes.key?(:'heatWaveNodeCount') && attributes.key?(:'heat_wave_node_count')

      self.heat_wave_node_count = attributes[:'heat_wave_node_count'] if attributes[:'heat_wave_node_count']

      self.metrics = attributes[:'metrics'] if attributes[:'metrics']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] database_status Object to be assigned
    def database_status=(database_status)
      # rubocop:disable Style/ConditionalAssignment
      if database_status && !DATABASE_STATUS_ENUM.include?(database_status)
        OCI.logger.debug("Unknown value for 'database_status' [" + database_status + "]. Mapping to 'DATABASE_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @database_status = DATABASE_STATUS_UNKNOWN_ENUM_VALUE
      else
        @database_status = database_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        database_name == other.database_name &&
        database_type == other.database_type &&
        mds_deployment_type == other.mds_deployment_type &&
        mdslifecycle_state == other.mdslifecycle_state &&
        database_version == other.database_version &&
        db_id == other.db_id &&
        database_status == other.database_status &&
        is_heat_wave_enabled == other.is_heat_wave_enabled &&
        heat_wave_cluster_display_name == other.heat_wave_cluster_display_name &&
        heat_wave_node_count == other.heat_wave_node_count &&
        metrics == other.metrics
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
      [compartment_id, database_name, database_type, mds_deployment_type, mdslifecycle_state, database_version, db_id, database_status, is_heat_wave_enabled, heat_wave_cluster_display_name, heat_wave_node_count, metrics].hash
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
