# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'
require_relative 'launch_db_system_base'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # LaunchDbSystemDetails model.
  class Database::Models::LaunchDbSystemDetails < Database::Models::LaunchDbSystemBase # rubocop:disable Metrics/LineLength
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

    # **[Required]** The Oracle Database Edition that applies to all the databases on the DB system.
    # Exadata DB systems and 2-node RAC DB systems require ENTERPRISE_EDITION_EXTREME_PERFORMANCE.
    #
    # @return [String]
    attr_reader :database_edition

    # This attribute is required.
    # @return [OCI::Database::Models::CreateDbHomeDetails]
    attr_accessor :db_home

    # The type of redundancy configured for the DB system.
    # Normal is 2-way redundancy, recommended for test and development systems.
    # High is 3-way redundancy, recommended for production systems.
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
        'availability_domain': :'availabilityDomain',
        'backup_subnet_id': :'backupSubnetId',
        'cluster_name': :'clusterName',
        'compartment_id': :'compartmentId',
        'cpu_core_count': :'cpuCoreCount',
        'data_storage_percentage': :'dataStoragePercentage',
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'domain': :'domain',
        'freeform_tags': :'freeformTags',
        'hostname': :'hostname',
        'initial_data_storage_size_in_gb': :'initialDataStorageSizeInGB',
        'node_count': :'nodeCount',
        'shape': :'shape',
        'source': :'source',
        'ssh_public_keys': :'sshPublicKeys',
        'subnet_id': :'subnetId',
        'database_edition': :'databaseEdition',
        'db_home': :'dbHome',
        'disk_redundancy': :'diskRedundancy',
        'license_model': :'licenseModel'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'availability_domain': :'String',
        'backup_subnet_id': :'String',
        'cluster_name': :'String',
        'compartment_id': :'String',
        'cpu_core_count': :'Integer',
        'data_storage_percentage': :'Integer',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'domain': :'String',
        'freeform_tags': :'Hash<String, String>',
        'hostname': :'String',
        'initial_data_storage_size_in_gb': :'Integer',
        'node_count': :'Integer',
        'shape': :'String',
        'source': :'String',
        'ssh_public_keys': :'Array<String>',
        'subnet_id': :'String',
        'database_edition': :'String',
        'db_home': :'OCI::Database::Models::CreateDbHomeDetails',
        'disk_redundancy': :'String',
        'license_model': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :availability_domain The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#availability_domain #availability_domain} proprety
    # @option attributes [String] :backup_subnet_id The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#backup_subnet_id #backup_subnet_id} proprety
    # @option attributes [String] :cluster_name The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#cluster_name #cluster_name} proprety
    # @option attributes [String] :compartment_id The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#compartment_id #compartment_id} proprety
    # @option attributes [Integer] :cpu_core_count The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#cpu_core_count #cpu_core_count} proprety
    # @option attributes [Integer] :data_storage_percentage The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#data_storage_percentage #data_storage_percentage} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#defined_tags #defined_tags} proprety
    # @option attributes [String] :display_name The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#display_name #display_name} proprety
    # @option attributes [String] :domain The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#domain #domain} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#freeform_tags #freeform_tags} proprety
    # @option attributes [String] :hostname The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#hostname #hostname} proprety
    # @option attributes [Integer] :initial_data_storage_size_in_gb The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#initial_data_storage_size_in_gb #initial_data_storage_size_in_gb} proprety
    # @option attributes [Integer] :node_count The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#node_count #node_count} proprety
    # @option attributes [String] :shape The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#shape #shape} proprety
    # @option attributes [Array<String>] :ssh_public_keys The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#ssh_public_keys #ssh_public_keys} proprety
    # @option attributes [String] :subnet_id The value to assign to the {OCI::Database::Models::LaunchDbSystemBase#subnet_id #subnet_id} proprety
    # @option attributes [String] :database_edition The value to assign to the {#database_edition} property
    # @option attributes [OCI::Database::Models::CreateDbHomeDetails] :db_home The value to assign to the {#db_home} property
    # @option attributes [String] :disk_redundancy The value to assign to the {#disk_redundancy} property
    # @option attributes [String] :license_model The value to assign to the {#license_model} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['source'] = 'NONE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.database_edition = attributes[:'databaseEdition'] if attributes[:'databaseEdition']

      raise 'You cannot provide both :databaseEdition and :database_edition' if attributes.key?(:'databaseEdition') && attributes.key?(:'database_edition')

      self.database_edition = attributes[:'database_edition'] if attributes[:'database_edition']

      self.db_home = attributes[:'dbHome'] if attributes[:'dbHome']

      raise 'You cannot provide both :dbHome and :db_home' if attributes.key?(:'dbHome') && attributes.key?(:'db_home')

      self.db_home = attributes[:'db_home'] if attributes[:'db_home']

      self.disk_redundancy = attributes[:'diskRedundancy'] if attributes[:'diskRedundancy']

      raise 'You cannot provide both :diskRedundancy and :disk_redundancy' if attributes.key?(:'diskRedundancy') && attributes.key?(:'disk_redundancy')

      self.disk_redundancy = attributes[:'disk_redundancy'] if attributes[:'disk_redundancy']

      self.license_model = attributes[:'licenseModel'] if attributes[:'licenseModel']

      raise 'You cannot provide both :licenseModel and :license_model' if attributes.key?(:'licenseModel') && attributes.key?(:'license_model')

      self.license_model = attributes[:'license_model'] if attributes[:'license_model']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] database_edition Object to be assigned
    def database_edition=(database_edition)
      # rubocop: disable Metrics/LineLength
      raise "Invalid value for 'database_edition': this must be one of the values in DATABASE_EDITION_ENUM." if database_edition && !DATABASE_EDITION_ENUM.include?(database_edition)
      # rubocop: enable Metrics/LineLength
      @database_edition = database_edition
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] disk_redundancy Object to be assigned
    def disk_redundancy=(disk_redundancy)
      # rubocop: disable Metrics/LineLength
      raise "Invalid value for 'disk_redundancy': this must be one of the values in DISK_REDUNDANCY_ENUM." if disk_redundancy && !DISK_REDUNDANCY_ENUM.include?(disk_redundancy)
      # rubocop: enable Metrics/LineLength
      @disk_redundancy = disk_redundancy
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] license_model Object to be assigned
    def license_model=(license_model)
      # rubocop: disable Metrics/LineLength
      raise "Invalid value for 'license_model': this must be one of the values in LICENSE_MODEL_ENUM." if license_model && !LICENSE_MODEL_ENUM.include?(license_model)
      # rubocop: enable Metrics/LineLength
      @license_model = license_model
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        availability_domain == other.availability_domain &&
        backup_subnet_id == other.backup_subnet_id &&
        cluster_name == other.cluster_name &&
        compartment_id == other.compartment_id &&
        cpu_core_count == other.cpu_core_count &&
        data_storage_percentage == other.data_storage_percentage &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        domain == other.domain &&
        freeform_tags == other.freeform_tags &&
        hostname == other.hostname &&
        initial_data_storage_size_in_gb == other.initial_data_storage_size_in_gb &&
        node_count == other.node_count &&
        shape == other.shape &&
        source == other.source &&
        ssh_public_keys == other.ssh_public_keys &&
        subnet_id == other.subnet_id &&
        database_edition == other.database_edition &&
        db_home == other.db_home &&
        disk_redundancy == other.disk_redundancy &&
        license_model == other.license_model
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [availability_domain, backup_subnet_id, cluster_name, compartment_id, cpu_core_count, data_storage_percentage, defined_tags, display_name, domain, freeform_tags, hostname, initial_data_storage_size_in_gb, node_count, shape, source, ssh_public_keys, subnet_id, database_edition, db_home, disk_redundancy, license_model].hash
    end
    # rubocop:enable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines

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
# rubocop:enable Lint/UnneededCopDisableDirective
