# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'launch_db_system_base'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Used for creating a new DB system from a database backup.
  #
  class Database::Models::LaunchDbSystemFromBackupDetails < Database::Models::LaunchDbSystemBase
    DATABASE_EDITION_ENUM = [
      DATABASE_EDITION_STANDARD_EDITION = 'STANDARD_EDITION'.freeze,
      DATABASE_EDITION_ENTERPRISE_EDITION = 'ENTERPRISE_EDITION'.freeze,
      DATABASE_EDITION_ENTERPRISE_EDITION_HIGH_PERFORMANCE = 'ENTERPRISE_EDITION_HIGH_PERFORMANCE'.freeze,
      DATABASE_EDITION_ENTERPRISE_EDITION_EXTREME_PERFORMANCE = 'ENTERPRISE_EDITION_EXTREME_PERFORMANCE'.freeze
    ].freeze

    DISK_REDUNDANCY_ENUM = [
      DISK_REDUNDANCY_HIGH = 'HIGH'.freeze,
      DISK_REDUNDANCY_NORMAL = 'NORMAL'.freeze
    ].freeze

    LICENSE_MODEL_ENUM = [
      LICENSE_MODEL_LICENSE_INCLUDED = 'LICENSE_INCLUDED'.freeze,
      LICENSE_MODEL_BRING_YOUR_OWN_LICENSE = 'BRING_YOUR_OWN_LICENSE'.freeze
    ].freeze

    # This attribute is required.
    # @return [OCI::Database::Models::CreateDbHomeFromBackupDetails]
    attr_accessor :db_home

    # **[Required]** The Oracle Database Edition that applies to all the databases on the DB system.
    # Exadata DB systems and 2-node RAC DB systems require ENTERPRISE_EDITION_EXTREME_PERFORMANCE.
    #
    # @return [String]
    attr_reader :database_edition

    # The type of redundancy configured for the DB system.
    # NORMAL 2-way redundancy, recommended for test and development systems.
    # HIGH is 3-way redundancy, recommended for production systems.
    #
    # @return [String]
    attr_reader :disk_redundancy

    # The Oracle license model that applies to all the databases on the DB system. The default is LICENSE_INCLUDED.
    #
    # @return [String]
    attr_reader :license_model

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'fault_domains': :'faultDomains',
        'display_name': :'displayName',
        'availability_domain': :'availabilityDomain',
        'subnet_id': :'subnetId',
        'backup_subnet_id': :'backupSubnetId',
        'nsg_ids': :'nsgIds',
        'backup_network_nsg_ids': :'backupNetworkNsgIds',
        'shape': :'shape',
        'time_zone': :'timeZone',
        'db_system_options': :'dbSystemOptions',
        'sparse_diskgroup': :'sparseDiskgroup',
        'ssh_public_keys': :'sshPublicKeys',
        'hostname': :'hostname',
        'domain': :'domain',
        'cpu_core_count': :'cpuCoreCount',
        'cluster_name': :'clusterName',
        'data_storage_percentage': :'dataStoragePercentage',
        'initial_data_storage_size_in_gb': :'initialDataStorageSizeInGB',
        'node_count': :'nodeCount',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'source': :'source',
        'private_ip': :'privateIp',
        'db_home': :'dbHome',
        'database_edition': :'databaseEdition',
        'disk_redundancy': :'diskRedundancy',
        'license_model': :'licenseModel'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'fault_domains': :'Array<String>',
        'display_name': :'String',
        'availability_domain': :'String',
        'subnet_id': :'String',
        'backup_subnet_id': :'String',
        'nsg_ids': :'Array<String>',
        'backup_network_nsg_ids': :'Array<String>',
        'shape': :'String',
        'time_zone': :'String',
        'db_system_options': :'OCI::Database::Models::DbSystemOptions',
        'sparse_diskgroup': :'BOOLEAN',
        'ssh_public_keys': :'Array<String>',
        'hostname': :'String',
        'domain': :'String',
        'cpu_core_count': :'Integer',
        'cluster_name': :'String',
        'data_storage_percentage': :'Integer',
        'initial_data_storage_size_in_gb': :'Integer',
        'node_count': :'Integer',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'source': :'String',
        'private_ip': :'String',
        'db_home': :'OCI::Database::Models::CreateDbHomeFromBackupDetails',
        'database_edition': :'String',
        'disk_redundancy': :'String',
        'license_model': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#compartment_id #compartment_id} proprety
    # @option attributes [Array<String>] :fault_domains The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#fault_domains #fault_domains} proprety
    # @option attributes [String] :display_name The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#display_name #display_name} proprety
    # @option attributes [String] :availability_domain The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#availability_domain #availability_domain} proprety
    # @option attributes [String] :subnet_id The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#subnet_id #subnet_id} proprety
    # @option attributes [String] :backup_subnet_id The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#backup_subnet_id #backup_subnet_id} proprety
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#nsg_ids #nsg_ids} proprety
    # @option attributes [Array<String>] :backup_network_nsg_ids The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#backup_network_nsg_ids #backup_network_nsg_ids} proprety
    # @option attributes [String] :shape The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#shape #shape} proprety
    # @option attributes [String] :time_zone The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#time_zone #time_zone} proprety
    # @option attributes [OCI::Database::Models::DbSystemOptions] :db_system_options The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#db_system_options #db_system_options} proprety
    # @option attributes [BOOLEAN] :sparse_diskgroup The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#sparse_diskgroup #sparse_diskgroup} proprety
    # @option attributes [Array<String>] :ssh_public_keys The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#ssh_public_keys #ssh_public_keys} proprety
    # @option attributes [String] :hostname The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#hostname #hostname} proprety
    # @option attributes [String] :domain The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#domain #domain} proprety
    # @option attributes [Integer] :cpu_core_count The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#cpu_core_count #cpu_core_count} proprety
    # @option attributes [String] :cluster_name The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#cluster_name #cluster_name} proprety
    # @option attributes [Integer] :data_storage_percentage The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#data_storage_percentage #data_storage_percentage} proprety
    # @option attributes [Integer] :initial_data_storage_size_in_gb The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#initial_data_storage_size_in_gb #initial_data_storage_size_in_gb} proprety
    # @option attributes [Integer] :node_count The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#node_count #node_count} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#defined_tags #defined_tags} proprety
    # @option attributes [String] :private_ip The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#private_ip #private_ip} proprety
    # @option attributes [OCI::Database::Models::CreateDbHomeFromBackupDetails] :db_home The value to assign to the {#db_home} property
    # @option attributes [String] :database_edition The value to assign to the {#database_edition} property
    # @option attributes [String] :disk_redundancy The value to assign to the {#disk_redundancy} property
    # @option attributes [String] :license_model The value to assign to the {#license_model} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['source'] = 'DB_BACKUP'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.db_home = attributes[:'dbHome'] if attributes[:'dbHome']

      raise 'You cannot provide both :dbHome and :db_home' if attributes.key?(:'dbHome') && attributes.key?(:'db_home')

      self.db_home = attributes[:'db_home'] if attributes[:'db_home']

      self.database_edition = attributes[:'databaseEdition'] if attributes[:'databaseEdition']

      raise 'You cannot provide both :databaseEdition and :database_edition' if attributes.key?(:'databaseEdition') && attributes.key?(:'database_edition')

      self.database_edition = attributes[:'database_edition'] if attributes[:'database_edition']

      self.disk_redundancy = attributes[:'diskRedundancy'] if attributes[:'diskRedundancy']

      raise 'You cannot provide both :diskRedundancy and :disk_redundancy' if attributes.key?(:'diskRedundancy') && attributes.key?(:'disk_redundancy')

      self.disk_redundancy = attributes[:'disk_redundancy'] if attributes[:'disk_redundancy']

      self.license_model = attributes[:'licenseModel'] if attributes[:'licenseModel']

      raise 'You cannot provide both :licenseModel and :license_model' if attributes.key?(:'licenseModel') && attributes.key?(:'license_model')

      self.license_model = attributes[:'license_model'] if attributes[:'license_model']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] database_edition Object to be assigned
    def database_edition=(database_edition)
      raise "Invalid value for 'database_edition': this must be one of the values in DATABASE_EDITION_ENUM." if database_edition && !DATABASE_EDITION_ENUM.include?(database_edition)

      @database_edition = database_edition
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] disk_redundancy Object to be assigned
    def disk_redundancy=(disk_redundancy)
      raise "Invalid value for 'disk_redundancy': this must be one of the values in DISK_REDUNDANCY_ENUM." if disk_redundancy && !DISK_REDUNDANCY_ENUM.include?(disk_redundancy)

      @disk_redundancy = disk_redundancy
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] license_model Object to be assigned
    def license_model=(license_model)
      raise "Invalid value for 'license_model': this must be one of the values in LICENSE_MODEL_ENUM." if license_model && !LICENSE_MODEL_ENUM.include?(license_model)

      @license_model = license_model
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        fault_domains == other.fault_domains &&
        display_name == other.display_name &&
        availability_domain == other.availability_domain &&
        subnet_id == other.subnet_id &&
        backup_subnet_id == other.backup_subnet_id &&
        nsg_ids == other.nsg_ids &&
        backup_network_nsg_ids == other.backup_network_nsg_ids &&
        shape == other.shape &&
        time_zone == other.time_zone &&
        db_system_options == other.db_system_options &&
        sparse_diskgroup == other.sparse_diskgroup &&
        ssh_public_keys == other.ssh_public_keys &&
        hostname == other.hostname &&
        domain == other.domain &&
        cpu_core_count == other.cpu_core_count &&
        cluster_name == other.cluster_name &&
        data_storage_percentage == other.data_storage_percentage &&
        initial_data_storage_size_in_gb == other.initial_data_storage_size_in_gb &&
        node_count == other.node_count &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        source == other.source &&
        private_ip == other.private_ip &&
        db_home == other.db_home &&
        database_edition == other.database_edition &&
        disk_redundancy == other.disk_redundancy &&
        license_model == other.license_model
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
      [compartment_id, fault_domains, display_name, availability_domain, subnet_id, backup_subnet_id, nsg_ids, backup_network_nsg_ids, shape, time_zone, db_system_options, sparse_diskgroup, ssh_public_keys, hostname, domain, cpu_core_count, cluster_name, data_storage_percentage, initial_data_storage_size_in_gb, node_count, freeform_tags, defined_tags, source, private_ip, db_home, database_edition, disk_redundancy, license_model].hash
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
