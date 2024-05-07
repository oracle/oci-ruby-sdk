# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20230301
require 'date'
require_relative 'create_sharded_database_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Request details for creation of ATP-Dedicated based sharded database.
  class GloballyDistributedDatabase::Models::CreateDedicatedShardedDatabase < GloballyDistributedDatabase::Models::CreateShardedDatabaseDetails
    DB_WORKLOAD_ENUM = [
      DB_WORKLOAD_OLTP = 'OLTP'.freeze,
      DB_WORKLOAD_DW = 'DW'.freeze
    ].freeze

    SHARDING_METHOD_ENUM = [
      SHARDING_METHOD_USER = 'USER'.freeze,
      SHARDING_METHOD_SYSTEM = 'SYSTEM'.freeze
    ].freeze

    # The certificate common name used in all cloudAutonomousVmClusters for the sharded database topology. Eg. Production.
    # All the clusters used in one sharded database topology shall have same CABundle setup. Valid characterset for
    # clusterCertificateCommonName include uppercase or lowercase letters, numbers, hyphens, underscores, and period.
    #
    # @return [String]
    attr_accessor :cluster_certificate_common_name

    # The default number of unique chunks in a shardspace. The value of chunks must be
    # greater than 2 times the size of the largest shardgroup in any shardspace.
    #
    # @return [Integer]
    attr_accessor :chunks

    # **[Required]** Possible workload types.
    # @return [String]
    attr_reader :db_workload

    # **[Required]** Sharding Method.
    # @return [String]
    attr_reader :sharding_method

    # **[Required]** Oracle Database version of the Autonomous Container Database.
    # @return [String]
    attr_accessor :db_version

    # **[Required]** The character set for the new shard database being created. Use database api ListAutonomousDatabaseCharacterSets to
    # get the list of allowed character set for autonomous dedicated database. See documentation:
    # https://docs.oracle.com/en-us/iaas/api/#/en/database/20160918/AutonomousDatabaseCharacterSets/ListAutonomousDatabaseCharacterSets
    #
    # @return [String]
    attr_accessor :character_set

    # **[Required]** The national character set for the new shard database being created. Use database api ListAutonomousDatabaseCharacterSets to
    # get the list of allowed national character set for autonomous dedicated database. See documentation:
    # https://docs.oracle.com/en-us/iaas/api/#/en/database/20160918/AutonomousDatabaseCharacterSets/ListAutonomousDatabaseCharacterSets
    #
    # @return [String]
    attr_accessor :ncharacter_set

    # **[Required]** The listener port number for sharded database.
    # @return [Integer]
    attr_accessor :listener_port

    # **[Required]** The TLS listener port number for sharded database.
    # @return [Integer]
    attr_accessor :listener_port_tls

    # **[Required]** Ons port local for sharded database.
    # @return [Integer]
    attr_accessor :ons_port_local

    # **[Required]** Ons remote port for sharded database.
    # @return [Integer]
    attr_accessor :ons_port_remote

    # **[Required]** Unique name prefix for the sharded databases. Only alpha-numeric values are allowed. First character
    # has to be a letter followed by any combination of letter and number.
    #
    # @return [String]
    attr_accessor :prefix

    # **[Required]** Collection of ATP-Dedicated shards that needs to be created.
    # @return [Array<OCI::GloballyDistributedDatabase::Models::CreateDedicatedShardDetail>]
    attr_accessor :shard_details

    # **[Required]** Collection of ATP-Dedicated catalogs that needs to be created.
    # @return [Array<OCI::GloballyDistributedDatabase::Models::CreateDedicatedCatalogDetail>]
    attr_accessor :catalog_details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'db_deployment_type': :'dbDeploymentType',
        'display_name': :'displayName',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'cluster_certificate_common_name': :'clusterCertificateCommonName',
        'chunks': :'chunks',
        'db_workload': :'dbWorkload',
        'sharding_method': :'shardingMethod',
        'db_version': :'dbVersion',
        'character_set': :'characterSet',
        'ncharacter_set': :'ncharacterSet',
        'listener_port': :'listenerPort',
        'listener_port_tls': :'listenerPortTls',
        'ons_port_local': :'onsPortLocal',
        'ons_port_remote': :'onsPortRemote',
        'prefix': :'prefix',
        'shard_details': :'shardDetails',
        'catalog_details': :'catalogDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'db_deployment_type': :'String',
        'display_name': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'cluster_certificate_common_name': :'String',
        'chunks': :'Integer',
        'db_workload': :'String',
        'sharding_method': :'String',
        'db_version': :'String',
        'character_set': :'String',
        'ncharacter_set': :'String',
        'listener_port': :'Integer',
        'listener_port_tls': :'Integer',
        'ons_port_local': :'Integer',
        'ons_port_remote': :'Integer',
        'prefix': :'String',
        'shard_details': :'Array<OCI::GloballyDistributedDatabase::Models::CreateDedicatedShardDetail>',
        'catalog_details': :'Array<OCI::GloballyDistributedDatabase::Models::CreateDedicatedCatalogDetail>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {OCI::GloballyDistributedDatabase::Models::CreateShardedDatabaseDetails#compartment_id #compartment_id} proprety
    # @option attributes [String] :display_name The value to assign to the {OCI::GloballyDistributedDatabase::Models::CreateShardedDatabaseDetails#display_name #display_name} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::GloballyDistributedDatabase::Models::CreateShardedDatabaseDetails#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::GloballyDistributedDatabase::Models::CreateShardedDatabaseDetails#defined_tags #defined_tags} proprety
    # @option attributes [String] :cluster_certificate_common_name The value to assign to the {#cluster_certificate_common_name} property
    # @option attributes [Integer] :chunks The value to assign to the {#chunks} property
    # @option attributes [String] :db_workload The value to assign to the {#db_workload} property
    # @option attributes [String] :sharding_method The value to assign to the {#sharding_method} property
    # @option attributes [String] :db_version The value to assign to the {#db_version} property
    # @option attributes [String] :character_set The value to assign to the {#character_set} property
    # @option attributes [String] :ncharacter_set The value to assign to the {#ncharacter_set} property
    # @option attributes [Integer] :listener_port The value to assign to the {#listener_port} property
    # @option attributes [Integer] :listener_port_tls The value to assign to the {#listener_port_tls} property
    # @option attributes [Integer] :ons_port_local The value to assign to the {#ons_port_local} property
    # @option attributes [Integer] :ons_port_remote The value to assign to the {#ons_port_remote} property
    # @option attributes [String] :prefix The value to assign to the {#prefix} property
    # @option attributes [Array<OCI::GloballyDistributedDatabase::Models::CreateDedicatedShardDetail>] :shard_details The value to assign to the {#shard_details} property
    # @option attributes [Array<OCI::GloballyDistributedDatabase::Models::CreateDedicatedCatalogDetail>] :catalog_details The value to assign to the {#catalog_details} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['dbDeploymentType'] = 'DEDICATED'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.cluster_certificate_common_name = attributes[:'clusterCertificateCommonName'] if attributes[:'clusterCertificateCommonName']

      raise 'You cannot provide both :clusterCertificateCommonName and :cluster_certificate_common_name' if attributes.key?(:'clusterCertificateCommonName') && attributes.key?(:'cluster_certificate_common_name')

      self.cluster_certificate_common_name = attributes[:'cluster_certificate_common_name'] if attributes[:'cluster_certificate_common_name']

      self.chunks = attributes[:'chunks'] if attributes[:'chunks']

      self.db_workload = attributes[:'dbWorkload'] if attributes[:'dbWorkload']

      raise 'You cannot provide both :dbWorkload and :db_workload' if attributes.key?(:'dbWorkload') && attributes.key?(:'db_workload')

      self.db_workload = attributes[:'db_workload'] if attributes[:'db_workload']

      self.sharding_method = attributes[:'shardingMethod'] if attributes[:'shardingMethod']

      raise 'You cannot provide both :shardingMethod and :sharding_method' if attributes.key?(:'shardingMethod') && attributes.key?(:'sharding_method')

      self.sharding_method = attributes[:'sharding_method'] if attributes[:'sharding_method']

      self.db_version = attributes[:'dbVersion'] if attributes[:'dbVersion']

      raise 'You cannot provide both :dbVersion and :db_version' if attributes.key?(:'dbVersion') && attributes.key?(:'db_version')

      self.db_version = attributes[:'db_version'] if attributes[:'db_version']

      self.character_set = attributes[:'characterSet'] if attributes[:'characterSet']

      raise 'You cannot provide both :characterSet and :character_set' if attributes.key?(:'characterSet') && attributes.key?(:'character_set')

      self.character_set = attributes[:'character_set'] if attributes[:'character_set']

      self.ncharacter_set = attributes[:'ncharacterSet'] if attributes[:'ncharacterSet']

      raise 'You cannot provide both :ncharacterSet and :ncharacter_set' if attributes.key?(:'ncharacterSet') && attributes.key?(:'ncharacter_set')

      self.ncharacter_set = attributes[:'ncharacter_set'] if attributes[:'ncharacter_set']

      self.listener_port = attributes[:'listenerPort'] if attributes[:'listenerPort']

      raise 'You cannot provide both :listenerPort and :listener_port' if attributes.key?(:'listenerPort') && attributes.key?(:'listener_port')

      self.listener_port = attributes[:'listener_port'] if attributes[:'listener_port']

      self.listener_port_tls = attributes[:'listenerPortTls'] if attributes[:'listenerPortTls']

      raise 'You cannot provide both :listenerPortTls and :listener_port_tls' if attributes.key?(:'listenerPortTls') && attributes.key?(:'listener_port_tls')

      self.listener_port_tls = attributes[:'listener_port_tls'] if attributes[:'listener_port_tls']

      self.ons_port_local = attributes[:'onsPortLocal'] if attributes[:'onsPortLocal']

      raise 'You cannot provide both :onsPortLocal and :ons_port_local' if attributes.key?(:'onsPortLocal') && attributes.key?(:'ons_port_local')

      self.ons_port_local = attributes[:'ons_port_local'] if attributes[:'ons_port_local']

      self.ons_port_remote = attributes[:'onsPortRemote'] if attributes[:'onsPortRemote']

      raise 'You cannot provide both :onsPortRemote and :ons_port_remote' if attributes.key?(:'onsPortRemote') && attributes.key?(:'ons_port_remote')

      self.ons_port_remote = attributes[:'ons_port_remote'] if attributes[:'ons_port_remote']

      self.prefix = attributes[:'prefix'] if attributes[:'prefix']

      self.shard_details = attributes[:'shardDetails'] if attributes[:'shardDetails']

      raise 'You cannot provide both :shardDetails and :shard_details' if attributes.key?(:'shardDetails') && attributes.key?(:'shard_details')

      self.shard_details = attributes[:'shard_details'] if attributes[:'shard_details']

      self.catalog_details = attributes[:'catalogDetails'] if attributes[:'catalogDetails']

      raise 'You cannot provide both :catalogDetails and :catalog_details' if attributes.key?(:'catalogDetails') && attributes.key?(:'catalog_details')

      self.catalog_details = attributes[:'catalog_details'] if attributes[:'catalog_details']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] db_workload Object to be assigned
    def db_workload=(db_workload)
      raise "Invalid value for 'db_workload': this must be one of the values in DB_WORKLOAD_ENUM." if db_workload && !DB_WORKLOAD_ENUM.include?(db_workload)

      @db_workload = db_workload
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] sharding_method Object to be assigned
    def sharding_method=(sharding_method)
      raise "Invalid value for 'sharding_method': this must be one of the values in SHARDING_METHOD_ENUM." if sharding_method && !SHARDING_METHOD_ENUM.include?(sharding_method)

      @sharding_method = sharding_method
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        db_deployment_type == other.db_deployment_type &&
        display_name == other.display_name &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        cluster_certificate_common_name == other.cluster_certificate_common_name &&
        chunks == other.chunks &&
        db_workload == other.db_workload &&
        sharding_method == other.sharding_method &&
        db_version == other.db_version &&
        character_set == other.character_set &&
        ncharacter_set == other.ncharacter_set &&
        listener_port == other.listener_port &&
        listener_port_tls == other.listener_port_tls &&
        ons_port_local == other.ons_port_local &&
        ons_port_remote == other.ons_port_remote &&
        prefix == other.prefix &&
        shard_details == other.shard_details &&
        catalog_details == other.catalog_details
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
      [compartment_id, db_deployment_type, display_name, freeform_tags, defined_tags, cluster_certificate_common_name, chunks, db_workload, sharding_method, db_version, character_set, ncharacter_set, listener_port, listener_port_tls, ons_port_local, ons_port_remote, prefix, shard_details, catalog_details].hash
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
