# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20201101
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of an external cluster.
  class DatabaseManagement::Models::ExternalCluster
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_NOT_CONNECTED = 'NOT_CONNECTED'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the external cluster.
    # @return [String]
    attr_accessor :id

    # **[Required]** The user-friendly name for the external cluster. The name does not have to be unique.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The name of the external cluster.
    # @return [String]
    attr_accessor :component_name

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the external DB system that the cluster is a part of.
    # @return [String]
    attr_accessor :external_db_system_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the external connector.
    # @return [String]
    attr_accessor :external_connector_id

    # The directory in which Oracle Grid Infrastructure is installed.
    # @return [String]
    attr_accessor :grid_home

    # Indicates whether the cluster is Oracle Flex Cluster or not.
    # @return [BOOLEAN]
    attr_accessor :is_flex_cluster

    # The additional details of the external cluster defined in `{\"key\": \"value\"}` format.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :additional_details

    # **[Required]** The current lifecycle state of the external cluster.
    # @return [String]
    attr_reader :lifecycle_state

    # Additional information about the current lifecycle state.
    # @return [String]
    attr_accessor :lifecycle_details

    # The list of network address configurations of the external cluster.
    # @return [Array<OCI::DatabaseManagement::Models::ExternalClusterNetworkConfiguration>]
    attr_accessor :network_configurations

    # The list of Virtual IP (VIP) configurations of the external cluster.
    # @return [Array<OCI::DatabaseManagement::Models::ExternalClusterVipConfiguration>]
    attr_accessor :vip_configurations

    # The list of Single Client Access Name (SCAN) configurations of the external cluster.
    # @return [Array<OCI::DatabaseManagement::Models::ExternalClusterScanListenerConfiguration>]
    attr_accessor :scan_configurations

    # The location of the Oracle Cluster Registry (OCR).
    # @return [String]
    attr_accessor :ocr_file_location

    # **[Required]** The date and time the external cluster was created.
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The date and time the external cluster was last updated.
    # @return [DateTime]
    attr_accessor :time_updated

    # The cluster version.
    # @return [String]
    attr_accessor :version

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'component_name': :'componentName',
        'compartment_id': :'compartmentId',
        'external_db_system_id': :'externalDbSystemId',
        'external_connector_id': :'externalConnectorId',
        'grid_home': :'gridHome',
        'is_flex_cluster': :'isFlexCluster',
        'additional_details': :'additionalDetails',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'network_configurations': :'networkConfigurations',
        'vip_configurations': :'vipConfigurations',
        'scan_configurations': :'scanConfigurations',
        'ocr_file_location': :'ocrFileLocation',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'version': :'version'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'display_name': :'String',
        'component_name': :'String',
        'compartment_id': :'String',
        'external_db_system_id': :'String',
        'external_connector_id': :'String',
        'grid_home': :'String',
        'is_flex_cluster': :'BOOLEAN',
        'additional_details': :'Hash<String, String>',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'network_configurations': :'Array<OCI::DatabaseManagement::Models::ExternalClusterNetworkConfiguration>',
        'vip_configurations': :'Array<OCI::DatabaseManagement::Models::ExternalClusterVipConfiguration>',
        'scan_configurations': :'Array<OCI::DatabaseManagement::Models::ExternalClusterScanListenerConfiguration>',
        'ocr_file_location': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'version': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :component_name The value to assign to the {#component_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :external_db_system_id The value to assign to the {#external_db_system_id} property
    # @option attributes [String] :external_connector_id The value to assign to the {#external_connector_id} property
    # @option attributes [String] :grid_home The value to assign to the {#grid_home} property
    # @option attributes [BOOLEAN] :is_flex_cluster The value to assign to the {#is_flex_cluster} property
    # @option attributes [Hash<String, String>] :additional_details The value to assign to the {#additional_details} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [Array<OCI::DatabaseManagement::Models::ExternalClusterNetworkConfiguration>] :network_configurations The value to assign to the {#network_configurations} property
    # @option attributes [Array<OCI::DatabaseManagement::Models::ExternalClusterVipConfiguration>] :vip_configurations The value to assign to the {#vip_configurations} property
    # @option attributes [Array<OCI::DatabaseManagement::Models::ExternalClusterScanListenerConfiguration>] :scan_configurations The value to assign to the {#scan_configurations} property
    # @option attributes [String] :ocr_file_location The value to assign to the {#ocr_file_location} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :version The value to assign to the {#version} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.component_name = attributes[:'componentName'] if attributes[:'componentName']

      raise 'You cannot provide both :componentName and :component_name' if attributes.key?(:'componentName') && attributes.key?(:'component_name')

      self.component_name = attributes[:'component_name'] if attributes[:'component_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.external_db_system_id = attributes[:'externalDbSystemId'] if attributes[:'externalDbSystemId']

      raise 'You cannot provide both :externalDbSystemId and :external_db_system_id' if attributes.key?(:'externalDbSystemId') && attributes.key?(:'external_db_system_id')

      self.external_db_system_id = attributes[:'external_db_system_id'] if attributes[:'external_db_system_id']

      self.external_connector_id = attributes[:'externalConnectorId'] if attributes[:'externalConnectorId']

      raise 'You cannot provide both :externalConnectorId and :external_connector_id' if attributes.key?(:'externalConnectorId') && attributes.key?(:'external_connector_id')

      self.external_connector_id = attributes[:'external_connector_id'] if attributes[:'external_connector_id']

      self.grid_home = attributes[:'gridHome'] if attributes[:'gridHome']

      raise 'You cannot provide both :gridHome and :grid_home' if attributes.key?(:'gridHome') && attributes.key?(:'grid_home')

      self.grid_home = attributes[:'grid_home'] if attributes[:'grid_home']

      self.is_flex_cluster = attributes[:'isFlexCluster'] unless attributes[:'isFlexCluster'].nil?

      raise 'You cannot provide both :isFlexCluster and :is_flex_cluster' if attributes.key?(:'isFlexCluster') && attributes.key?(:'is_flex_cluster')

      self.is_flex_cluster = attributes[:'is_flex_cluster'] unless attributes[:'is_flex_cluster'].nil?

      self.additional_details = attributes[:'additionalDetails'] if attributes[:'additionalDetails']

      raise 'You cannot provide both :additionalDetails and :additional_details' if attributes.key?(:'additionalDetails') && attributes.key?(:'additional_details')

      self.additional_details = attributes[:'additional_details'] if attributes[:'additional_details']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.network_configurations = attributes[:'networkConfigurations'] if attributes[:'networkConfigurations']

      raise 'You cannot provide both :networkConfigurations and :network_configurations' if attributes.key?(:'networkConfigurations') && attributes.key?(:'network_configurations')

      self.network_configurations = attributes[:'network_configurations'] if attributes[:'network_configurations']

      self.vip_configurations = attributes[:'vipConfigurations'] if attributes[:'vipConfigurations']

      raise 'You cannot provide both :vipConfigurations and :vip_configurations' if attributes.key?(:'vipConfigurations') && attributes.key?(:'vip_configurations')

      self.vip_configurations = attributes[:'vip_configurations'] if attributes[:'vip_configurations']

      self.scan_configurations = attributes[:'scanConfigurations'] if attributes[:'scanConfigurations']

      raise 'You cannot provide both :scanConfigurations and :scan_configurations' if attributes.key?(:'scanConfigurations') && attributes.key?(:'scan_configurations')

      self.scan_configurations = attributes[:'scan_configurations'] if attributes[:'scan_configurations']

      self.ocr_file_location = attributes[:'ocrFileLocation'] if attributes[:'ocrFileLocation']

      raise 'You cannot provide both :ocrFileLocation and :ocr_file_location' if attributes.key?(:'ocrFileLocation') && attributes.key?(:'ocr_file_location')

      self.ocr_file_location = attributes[:'ocr_file_location'] if attributes[:'ocr_file_location']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.version = attributes[:'version'] if attributes[:'version']
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        display_name == other.display_name &&
        component_name == other.component_name &&
        compartment_id == other.compartment_id &&
        external_db_system_id == other.external_db_system_id &&
        external_connector_id == other.external_connector_id &&
        grid_home == other.grid_home &&
        is_flex_cluster == other.is_flex_cluster &&
        additional_details == other.additional_details &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        network_configurations == other.network_configurations &&
        vip_configurations == other.vip_configurations &&
        scan_configurations == other.scan_configurations &&
        ocr_file_location == other.ocr_file_location &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        version == other.version
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
      [id, display_name, component_name, compartment_id, external_db_system_id, external_connector_id, grid_home, is_flex_cluster, additional_details, lifecycle_state, lifecycle_details, network_configurations, vip_configurations, scan_configurations, ocr_file_location, time_created, time_updated, version].hash
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
