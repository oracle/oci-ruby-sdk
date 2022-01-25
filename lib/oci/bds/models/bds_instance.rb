# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Description of the cluster.
  class Bds::Models::BdsInstance
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_SUSPENDING = 'SUSPENDING'.freeze,
      LIFECYCLE_STATE_SUSPENDED = 'SUSPENDED'.freeze,
      LIFECYCLE_STATE_RESUMING = 'RESUMING'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    CLUSTER_VERSION_ENUM = [
      CLUSTER_VERSION_CDH5 = 'CDH5'.freeze,
      CLUSTER_VERSION_CDH6 = 'CDH6'.freeze,
      CLUSTER_VERSION_ODH1 = 'ODH1'.freeze,
      CLUSTER_VERSION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the Big Data Service resource.
    # @return [String]
    attr_accessor :id

    # **[Required]** The OCID of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The name of the cluster.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The state of the cluster.
    # @return [String]
    attr_reader :lifecycle_state

    # Version of the Hadoop distribution.
    # @return [String]
    attr_reader :cluster_version

    # **[Required]** Boolean flag specifying whether or not the cluster is highly available (HA)
    # @return [BOOLEAN]
    attr_accessor :is_high_availability

    # **[Required]** Boolean flag specifying whether or not the cluster should be set up as secure.
    # @return [BOOLEAN]
    attr_accessor :is_secure

    # **[Required]** Boolean flag specifying whether or not Cloud SQL should be configured.
    # @return [BOOLEAN]
    attr_accessor :is_cloud_sql_configured

    # @return [OCI::Bds::Models::NetworkConfig]
    attr_accessor :network_config

    # @return [OCI::Bds::Models::ClusterDetails]
    attr_accessor :cluster_details

    # **[Required]** The list of nodes in the cluster.
    # @return [Array<OCI::Bds::Models::Node>]
    attr_accessor :nodes

    # @return [OCI::Bds::Models::CloudSqlDetails]
    attr_accessor :cloud_sql_details

    # The user who created the cluster.
    # @return [String]
    attr_accessor :created_by

    # The time the cluster was created, shown as an RFC 3339 formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_created

    # The time the cluster was updated, shown as an RFC 3339 formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** Number of nodes that forming the cluster
    # @return [Integer]
    attr_accessor :number_of_nodes

    # Simple key-value pair that is applied without any predefined name, type, or scope.
    # Exists for cross-compatibility only. For example, `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For example, `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'lifecycle_state': :'lifecycleState',
        'cluster_version': :'clusterVersion',
        'is_high_availability': :'isHighAvailability',
        'is_secure': :'isSecure',
        'is_cloud_sql_configured': :'isCloudSqlConfigured',
        'network_config': :'networkConfig',
        'cluster_details': :'clusterDetails',
        'nodes': :'nodes',
        'cloud_sql_details': :'cloudSqlDetails',
        'created_by': :'createdBy',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'number_of_nodes': :'numberOfNodes',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'display_name': :'String',
        'lifecycle_state': :'String',
        'cluster_version': :'String',
        'is_high_availability': :'BOOLEAN',
        'is_secure': :'BOOLEAN',
        'is_cloud_sql_configured': :'BOOLEAN',
        'network_config': :'OCI::Bds::Models::NetworkConfig',
        'cluster_details': :'OCI::Bds::Models::ClusterDetails',
        'nodes': :'Array<OCI::Bds::Models::Node>',
        'cloud_sql_details': :'OCI::Bds::Models::CloudSqlDetails',
        'created_by': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'number_of_nodes': :'Integer',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :cluster_version The value to assign to the {#cluster_version} property
    # @option attributes [BOOLEAN] :is_high_availability The value to assign to the {#is_high_availability} property
    # @option attributes [BOOLEAN] :is_secure The value to assign to the {#is_secure} property
    # @option attributes [BOOLEAN] :is_cloud_sql_configured The value to assign to the {#is_cloud_sql_configured} property
    # @option attributes [OCI::Bds::Models::NetworkConfig] :network_config The value to assign to the {#network_config} property
    # @option attributes [OCI::Bds::Models::ClusterDetails] :cluster_details The value to assign to the {#cluster_details} property
    # @option attributes [Array<OCI::Bds::Models::Node>] :nodes The value to assign to the {#nodes} property
    # @option attributes [OCI::Bds::Models::CloudSqlDetails] :cloud_sql_details The value to assign to the {#cloud_sql_details} property
    # @option attributes [String] :created_by The value to assign to the {#created_by} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [Integer] :number_of_nodes The value to assign to the {#number_of_nodes} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.cluster_version = attributes[:'clusterVersion'] if attributes[:'clusterVersion']

      raise 'You cannot provide both :clusterVersion and :cluster_version' if attributes.key?(:'clusterVersion') && attributes.key?(:'cluster_version')

      self.cluster_version = attributes[:'cluster_version'] if attributes[:'cluster_version']

      self.is_high_availability = attributes[:'isHighAvailability'] unless attributes[:'isHighAvailability'].nil?

      raise 'You cannot provide both :isHighAvailability and :is_high_availability' if attributes.key?(:'isHighAvailability') && attributes.key?(:'is_high_availability')

      self.is_high_availability = attributes[:'is_high_availability'] unless attributes[:'is_high_availability'].nil?

      self.is_secure = attributes[:'isSecure'] unless attributes[:'isSecure'].nil?

      raise 'You cannot provide both :isSecure and :is_secure' if attributes.key?(:'isSecure') && attributes.key?(:'is_secure')

      self.is_secure = attributes[:'is_secure'] unless attributes[:'is_secure'].nil?

      self.is_cloud_sql_configured = attributes[:'isCloudSqlConfigured'] unless attributes[:'isCloudSqlConfigured'].nil?
      self.is_cloud_sql_configured = false if is_cloud_sql_configured.nil? && !attributes.key?(:'isCloudSqlConfigured') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isCloudSqlConfigured and :is_cloud_sql_configured' if attributes.key?(:'isCloudSqlConfigured') && attributes.key?(:'is_cloud_sql_configured')

      self.is_cloud_sql_configured = attributes[:'is_cloud_sql_configured'] unless attributes[:'is_cloud_sql_configured'].nil?
      self.is_cloud_sql_configured = false if is_cloud_sql_configured.nil? && !attributes.key?(:'isCloudSqlConfigured') && !attributes.key?(:'is_cloud_sql_configured') # rubocop:disable Style/StringLiterals

      self.network_config = attributes[:'networkConfig'] if attributes[:'networkConfig']

      raise 'You cannot provide both :networkConfig and :network_config' if attributes.key?(:'networkConfig') && attributes.key?(:'network_config')

      self.network_config = attributes[:'network_config'] if attributes[:'network_config']

      self.cluster_details = attributes[:'clusterDetails'] if attributes[:'clusterDetails']

      raise 'You cannot provide both :clusterDetails and :cluster_details' if attributes.key?(:'clusterDetails') && attributes.key?(:'cluster_details')

      self.cluster_details = attributes[:'cluster_details'] if attributes[:'cluster_details']

      self.nodes = attributes[:'nodes'] if attributes[:'nodes']

      self.cloud_sql_details = attributes[:'cloudSqlDetails'] if attributes[:'cloudSqlDetails']

      raise 'You cannot provide both :cloudSqlDetails and :cloud_sql_details' if attributes.key?(:'cloudSqlDetails') && attributes.key?(:'cloud_sql_details')

      self.cloud_sql_details = attributes[:'cloud_sql_details'] if attributes[:'cloud_sql_details']

      self.created_by = attributes[:'createdBy'] if attributes[:'createdBy']

      raise 'You cannot provide both :createdBy and :created_by' if attributes.key?(:'createdBy') && attributes.key?(:'created_by')

      self.created_by = attributes[:'created_by'] if attributes[:'created_by']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.number_of_nodes = attributes[:'numberOfNodes'] if attributes[:'numberOfNodes']

      raise 'You cannot provide both :numberOfNodes and :number_of_nodes' if attributes.key?(:'numberOfNodes') && attributes.key?(:'number_of_nodes')

      self.number_of_nodes = attributes[:'number_of_nodes'] if attributes[:'number_of_nodes']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] cluster_version Object to be assigned
    def cluster_version=(cluster_version)
      # rubocop:disable Style/ConditionalAssignment
      if cluster_version && !CLUSTER_VERSION_ENUM.include?(cluster_version)
        OCI.logger.debug("Unknown value for 'cluster_version' [" + cluster_version + "]. Mapping to 'CLUSTER_VERSION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @cluster_version = CLUSTER_VERSION_UNKNOWN_ENUM_VALUE
      else
        @cluster_version = cluster_version
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
        display_name == other.display_name &&
        lifecycle_state == other.lifecycle_state &&
        cluster_version == other.cluster_version &&
        is_high_availability == other.is_high_availability &&
        is_secure == other.is_secure &&
        is_cloud_sql_configured == other.is_cloud_sql_configured &&
        network_config == other.network_config &&
        cluster_details == other.cluster_details &&
        nodes == other.nodes &&
        cloud_sql_details == other.cloud_sql_details &&
        created_by == other.created_by &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        number_of_nodes == other.number_of_nodes &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
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
      [id, compartment_id, display_name, lifecycle_state, cluster_version, is_high_availability, is_secure, is_cloud_sql_configured, network_config, cluster_details, nodes, cloud_sql_details, created_by, time_created, time_updated, number_of_nodes, freeform_tags, defined_tags].hash
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
