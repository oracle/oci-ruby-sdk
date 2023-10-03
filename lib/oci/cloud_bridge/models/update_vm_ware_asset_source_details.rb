# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220509
require 'date'
require_relative 'update_asset_source_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Asset source update details.
  class CloudBridge::Models::UpdateVmWareAssetSourceDetails < CloudBridge::Models::UpdateAssetSourceDetails
    # Endpoint for VMware asset discovery and replication in the form of ```https://<host>:<port>/sdk```
    # @return [String]
    attr_accessor :vcenter_endpoint

    # @return [OCI::CloudBridge::Models::AssetSourceCredentials]
    attr_accessor :discovery_credentials

    # @return [OCI::CloudBridge::Models::AssetSourceCredentials]
    attr_accessor :replication_credentials

    # Flag indicating whether historical metrics are collected for assets, originating from this asset source.
    # @return [BOOLEAN]
    attr_accessor :are_historical_metrics_collected

    # Flag indicating whether real-time metrics are collected for assets, originating from this asset source.
    # @return [BOOLEAN]
    attr_accessor :are_realtime_metrics_collected

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the discovery schedule that is going to be assigned to an asset source.
    # @return [String]
    attr_accessor :discovery_schedule_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'display_name': :'displayName',
        'assets_compartment_id': :'assetsCompartmentId',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags',
        'vcenter_endpoint': :'vcenterEndpoint',
        'discovery_credentials': :'discoveryCredentials',
        'replication_credentials': :'replicationCredentials',
        'are_historical_metrics_collected': :'areHistoricalMetricsCollected',
        'are_realtime_metrics_collected': :'areRealtimeMetricsCollected',
        'discovery_schedule_id': :'discoveryScheduleId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'display_name': :'String',
        'assets_compartment_id': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>',
        'vcenter_endpoint': :'String',
        'discovery_credentials': :'OCI::CloudBridge::Models::AssetSourceCredentials',
        'replication_credentials': :'OCI::CloudBridge::Models::AssetSourceCredentials',
        'are_historical_metrics_collected': :'BOOLEAN',
        'are_realtime_metrics_collected': :'BOOLEAN',
        'discovery_schedule_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {OCI::CloudBridge::Models::UpdateAssetSourceDetails#display_name #display_name} proprety
    # @option attributes [String] :assets_compartment_id The value to assign to the {OCI::CloudBridge::Models::UpdateAssetSourceDetails#assets_compartment_id #assets_compartment_id} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::CloudBridge::Models::UpdateAssetSourceDetails#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::CloudBridge::Models::UpdateAssetSourceDetails#defined_tags #defined_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {OCI::CloudBridge::Models::UpdateAssetSourceDetails#system_tags #system_tags} proprety
    # @option attributes [String] :vcenter_endpoint The value to assign to the {#vcenter_endpoint} property
    # @option attributes [OCI::CloudBridge::Models::AssetSourceCredentials] :discovery_credentials The value to assign to the {#discovery_credentials} property
    # @option attributes [OCI::CloudBridge::Models::AssetSourceCredentials] :replication_credentials The value to assign to the {#replication_credentials} property
    # @option attributes [BOOLEAN] :are_historical_metrics_collected The value to assign to the {#are_historical_metrics_collected} property
    # @option attributes [BOOLEAN] :are_realtime_metrics_collected The value to assign to the {#are_realtime_metrics_collected} property
    # @option attributes [String] :discovery_schedule_id The value to assign to the {#discovery_schedule_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'VMWARE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.vcenter_endpoint = attributes[:'vcenterEndpoint'] if attributes[:'vcenterEndpoint']

      raise 'You cannot provide both :vcenterEndpoint and :vcenter_endpoint' if attributes.key?(:'vcenterEndpoint') && attributes.key?(:'vcenter_endpoint')

      self.vcenter_endpoint = attributes[:'vcenter_endpoint'] if attributes[:'vcenter_endpoint']

      self.discovery_credentials = attributes[:'discoveryCredentials'] if attributes[:'discoveryCredentials']

      raise 'You cannot provide both :discoveryCredentials and :discovery_credentials' if attributes.key?(:'discoveryCredentials') && attributes.key?(:'discovery_credentials')

      self.discovery_credentials = attributes[:'discovery_credentials'] if attributes[:'discovery_credentials']

      self.replication_credentials = attributes[:'replicationCredentials'] if attributes[:'replicationCredentials']

      raise 'You cannot provide both :replicationCredentials and :replication_credentials' if attributes.key?(:'replicationCredentials') && attributes.key?(:'replication_credentials')

      self.replication_credentials = attributes[:'replication_credentials'] if attributes[:'replication_credentials']

      self.are_historical_metrics_collected = attributes[:'areHistoricalMetricsCollected'] unless attributes[:'areHistoricalMetricsCollected'].nil?

      raise 'You cannot provide both :areHistoricalMetricsCollected and :are_historical_metrics_collected' if attributes.key?(:'areHistoricalMetricsCollected') && attributes.key?(:'are_historical_metrics_collected')

      self.are_historical_metrics_collected = attributes[:'are_historical_metrics_collected'] unless attributes[:'are_historical_metrics_collected'].nil?

      self.are_realtime_metrics_collected = attributes[:'areRealtimeMetricsCollected'] unless attributes[:'areRealtimeMetricsCollected'].nil?

      raise 'You cannot provide both :areRealtimeMetricsCollected and :are_realtime_metrics_collected' if attributes.key?(:'areRealtimeMetricsCollected') && attributes.key?(:'are_realtime_metrics_collected')

      self.are_realtime_metrics_collected = attributes[:'are_realtime_metrics_collected'] unless attributes[:'are_realtime_metrics_collected'].nil?

      self.discovery_schedule_id = attributes[:'discoveryScheduleId'] if attributes[:'discoveryScheduleId']

      raise 'You cannot provide both :discoveryScheduleId and :discovery_schedule_id' if attributes.key?(:'discoveryScheduleId') && attributes.key?(:'discovery_schedule_id')

      self.discovery_schedule_id = attributes[:'discovery_schedule_id'] if attributes[:'discovery_schedule_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        display_name == other.display_name &&
        assets_compartment_id == other.assets_compartment_id &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags &&
        vcenter_endpoint == other.vcenter_endpoint &&
        discovery_credentials == other.discovery_credentials &&
        replication_credentials == other.replication_credentials &&
        are_historical_metrics_collected == other.are_historical_metrics_collected &&
        are_realtime_metrics_collected == other.are_realtime_metrics_collected &&
        discovery_schedule_id == other.discovery_schedule_id
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
      [type, display_name, assets_compartment_id, freeform_tags, defined_tags, system_tags, vcenter_endpoint, discovery_credentials, replication_credentials, are_historical_metrics_collected, are_realtime_metrics_collected, discovery_schedule_id].hash
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
