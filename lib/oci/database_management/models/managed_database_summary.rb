# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20201101
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A summary of the Managed Database.
  class DatabaseManagement::Models::ManagedDatabaseSummary
    DATABASE_TYPE_ENUM = [
      DATABASE_TYPE_EXTERNAL_SIDB = 'EXTERNAL_SIDB'.freeze,
      DATABASE_TYPE_EXTERNAL_RAC = 'EXTERNAL_RAC'.freeze,
      DATABASE_TYPE_CLOUD_SIDB = 'CLOUD_SIDB'.freeze,
      DATABASE_TYPE_CLOUD_RAC = 'CLOUD_RAC'.freeze,
      DATABASE_TYPE_SHARED = 'SHARED'.freeze,
      DATABASE_TYPE_DEDICATED = 'DEDICATED'.freeze,
      DATABASE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DATABASE_SUB_TYPE_ENUM = [
      DATABASE_SUB_TYPE_CDB = 'CDB'.freeze,
      DATABASE_SUB_TYPE_PDB = 'PDB'.freeze,
      DATABASE_SUB_TYPE_NON_CDB = 'NON_CDB'.freeze,
      DATABASE_SUB_TYPE_ACD = 'ACD'.freeze,
      DATABASE_SUB_TYPE_ADB = 'ADB'.freeze,
      DATABASE_SUB_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DEPLOYMENT_TYPE_ENUM = [
      DEPLOYMENT_TYPE_ONPREMISE = 'ONPREMISE'.freeze,
      DEPLOYMENT_TYPE_BM = 'BM'.freeze,
      DEPLOYMENT_TYPE_VM = 'VM'.freeze,
      DEPLOYMENT_TYPE_EXADATA = 'EXADATA'.freeze,
      DEPLOYMENT_TYPE_EXADATA_CC = 'EXADATA_CC'.freeze,
      DEPLOYMENT_TYPE_AUTONOMOUS = 'AUTONOMOUS'.freeze,
      DEPLOYMENT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    MANAGEMENT_OPTION_ENUM = [
      MANAGEMENT_OPTION_BASIC = 'BASIC'.freeze,
      MANAGEMENT_OPTION_ADVANCED = 'ADVANCED'.freeze,
      MANAGEMENT_OPTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    WORKLOAD_TYPE_ENUM = [
      WORKLOAD_TYPE_OLTP = 'OLTP'.freeze,
      WORKLOAD_TYPE_DW = 'DW'.freeze,
      WORKLOAD_TYPE_AJD = 'AJD'.freeze,
      WORKLOAD_TYPE_APEX = 'APEX'.freeze,
      WORKLOAD_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @return [String]
    attr_accessor :id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The name of the Managed Database.
    # @return [String]
    attr_accessor :name

    # **[Required]** The type of Oracle Database installation.
    # @return [String]
    attr_reader :database_type

    # **[Required]** The subtype of the Oracle Database. Indicates whether the database is a Container Database,
    # Pluggable Database, Non-container Database, Autonomous Database, or Autonomous Container Database.
    #
    # @return [String]
    attr_reader :database_sub_type

    # The infrastructure used to deploy the Oracle Database.
    # @return [String]
    attr_reader :deployment_type

    # The management option used when enabling Database Management.
    # @return [String]
    attr_reader :management_option

    # The workload type of the Autonomous Database.
    # @return [String]
    attr_reader :workload_type

    # **[Required]** Indicates whether the Oracle Database is part of a cluster.
    # @return [BOOLEAN]
    attr_accessor :is_cluster

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the parent Container Database
    # if the Managed Database is a Pluggable Database.
    #
    # @return [String]
    attr_accessor :parent_container_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the external
    # DB system that this Managed Database is part of.
    #
    # @return [String]
    attr_accessor :db_system_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the storage DB system.
    # @return [String]
    attr_accessor :storage_system_id

    # **[Required]** The date and time the Managed Database was created.
    # @return [DateTime]
    attr_accessor :time_created

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'name': :'name',
        'database_type': :'databaseType',
        'database_sub_type': :'databaseSubType',
        'deployment_type': :'deploymentType',
        'management_option': :'managementOption',
        'workload_type': :'workloadType',
        'is_cluster': :'isCluster',
        'parent_container_id': :'parentContainerId',
        'db_system_id': :'dbSystemId',
        'storage_system_id': :'storageSystemId',
        'time_created': :'timeCreated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'name': :'String',
        'database_type': :'String',
        'database_sub_type': :'String',
        'deployment_type': :'String',
        'management_option': :'String',
        'workload_type': :'String',
        'is_cluster': :'BOOLEAN',
        'parent_container_id': :'String',
        'db_system_id': :'String',
        'storage_system_id': :'String',
        'time_created': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :database_type The value to assign to the {#database_type} property
    # @option attributes [String] :database_sub_type The value to assign to the {#database_sub_type} property
    # @option attributes [String] :deployment_type The value to assign to the {#deployment_type} property
    # @option attributes [String] :management_option The value to assign to the {#management_option} property
    # @option attributes [String] :workload_type The value to assign to the {#workload_type} property
    # @option attributes [BOOLEAN] :is_cluster The value to assign to the {#is_cluster} property
    # @option attributes [String] :parent_container_id The value to assign to the {#parent_container_id} property
    # @option attributes [String] :db_system_id The value to assign to the {#db_system_id} property
    # @option attributes [String] :storage_system_id The value to assign to the {#storage_system_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.database_type = attributes[:'databaseType'] if attributes[:'databaseType']

      raise 'You cannot provide both :databaseType and :database_type' if attributes.key?(:'databaseType') && attributes.key?(:'database_type')

      self.database_type = attributes[:'database_type'] if attributes[:'database_type']

      self.database_sub_type = attributes[:'databaseSubType'] if attributes[:'databaseSubType']

      raise 'You cannot provide both :databaseSubType and :database_sub_type' if attributes.key?(:'databaseSubType') && attributes.key?(:'database_sub_type')

      self.database_sub_type = attributes[:'database_sub_type'] if attributes[:'database_sub_type']

      self.deployment_type = attributes[:'deploymentType'] if attributes[:'deploymentType']

      raise 'You cannot provide both :deploymentType and :deployment_type' if attributes.key?(:'deploymentType') && attributes.key?(:'deployment_type')

      self.deployment_type = attributes[:'deployment_type'] if attributes[:'deployment_type']

      self.management_option = attributes[:'managementOption'] if attributes[:'managementOption']

      raise 'You cannot provide both :managementOption and :management_option' if attributes.key?(:'managementOption') && attributes.key?(:'management_option')

      self.management_option = attributes[:'management_option'] if attributes[:'management_option']

      self.workload_type = attributes[:'workloadType'] if attributes[:'workloadType']

      raise 'You cannot provide both :workloadType and :workload_type' if attributes.key?(:'workloadType') && attributes.key?(:'workload_type')

      self.workload_type = attributes[:'workload_type'] if attributes[:'workload_type']

      self.is_cluster = attributes[:'isCluster'] unless attributes[:'isCluster'].nil?

      raise 'You cannot provide both :isCluster and :is_cluster' if attributes.key?(:'isCluster') && attributes.key?(:'is_cluster')

      self.is_cluster = attributes[:'is_cluster'] unless attributes[:'is_cluster'].nil?

      self.parent_container_id = attributes[:'parentContainerId'] if attributes[:'parentContainerId']

      raise 'You cannot provide both :parentContainerId and :parent_container_id' if attributes.key?(:'parentContainerId') && attributes.key?(:'parent_container_id')

      self.parent_container_id = attributes[:'parent_container_id'] if attributes[:'parent_container_id']

      self.db_system_id = attributes[:'dbSystemId'] if attributes[:'dbSystemId']

      raise 'You cannot provide both :dbSystemId and :db_system_id' if attributes.key?(:'dbSystemId') && attributes.key?(:'db_system_id')

      self.db_system_id = attributes[:'db_system_id'] if attributes[:'db_system_id']

      self.storage_system_id = attributes[:'storageSystemId'] if attributes[:'storageSystemId']

      raise 'You cannot provide both :storageSystemId and :storage_system_id' if attributes.key?(:'storageSystemId') && attributes.key?(:'storage_system_id')

      self.storage_system_id = attributes[:'storage_system_id'] if attributes[:'storage_system_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] database_type Object to be assigned
    def database_type=(database_type)
      # rubocop:disable Style/ConditionalAssignment
      if database_type && !DATABASE_TYPE_ENUM.include?(database_type)
        OCI.logger.debug("Unknown value for 'database_type' [" + database_type + "]. Mapping to 'DATABASE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @database_type = DATABASE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @database_type = database_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] database_sub_type Object to be assigned
    def database_sub_type=(database_sub_type)
      # rubocop:disable Style/ConditionalAssignment
      if database_sub_type && !DATABASE_SUB_TYPE_ENUM.include?(database_sub_type)
        OCI.logger.debug("Unknown value for 'database_sub_type' [" + database_sub_type + "]. Mapping to 'DATABASE_SUB_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @database_sub_type = DATABASE_SUB_TYPE_UNKNOWN_ENUM_VALUE
      else
        @database_sub_type = database_sub_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] deployment_type Object to be assigned
    def deployment_type=(deployment_type)
      # rubocop:disable Style/ConditionalAssignment
      if deployment_type && !DEPLOYMENT_TYPE_ENUM.include?(deployment_type)
        OCI.logger.debug("Unknown value for 'deployment_type' [" + deployment_type + "]. Mapping to 'DEPLOYMENT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @deployment_type = DEPLOYMENT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @deployment_type = deployment_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] management_option Object to be assigned
    def management_option=(management_option)
      # rubocop:disable Style/ConditionalAssignment
      if management_option && !MANAGEMENT_OPTION_ENUM.include?(management_option)
        OCI.logger.debug("Unknown value for 'management_option' [" + management_option + "]. Mapping to 'MANAGEMENT_OPTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @management_option = MANAGEMENT_OPTION_UNKNOWN_ENUM_VALUE
      else
        @management_option = management_option
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] workload_type Object to be assigned
    def workload_type=(workload_type)
      # rubocop:disable Style/ConditionalAssignment
      if workload_type && !WORKLOAD_TYPE_ENUM.include?(workload_type)
        OCI.logger.debug("Unknown value for 'workload_type' [" + workload_type + "]. Mapping to 'WORKLOAD_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @workload_type = WORKLOAD_TYPE_UNKNOWN_ENUM_VALUE
      else
        @workload_type = workload_type
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
        compartment_id == other.compartment_id &&
        name == other.name &&
        database_type == other.database_type &&
        database_sub_type == other.database_sub_type &&
        deployment_type == other.deployment_type &&
        management_option == other.management_option &&
        workload_type == other.workload_type &&
        is_cluster == other.is_cluster &&
        parent_container_id == other.parent_container_id &&
        db_system_id == other.db_system_id &&
        storage_system_id == other.storage_system_id &&
        time_created == other.time_created
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
      [id, compartment_id, name, database_type, database_sub_type, deployment_type, management_option, workload_type, is_cluster, parent_container_id, db_system_id, storage_system_id, time_created].hash
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
