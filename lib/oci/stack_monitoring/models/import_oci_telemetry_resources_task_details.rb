# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210330
require 'date'
require 'logger'
require_relative 'monitored_resource_task_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Request details for importing resources from Telemetry like resources from OCI Native Services and prometheus.
  #
  class StackMonitoring::Models::ImportOciTelemetryResourcesTaskDetails < StackMonitoring::Models::MonitoredResourceTaskDetails
    SOURCE_ENUM = [
      SOURCE_OCI_TELEMETRY_NATIVE = 'OCI_TELEMETRY_NATIVE'.freeze,
      SOURCE_OCI_TELEMETRY_PROMETHEUS = 'OCI_TELEMETRY_PROMETHEUS'.freeze,
      SOURCE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Source from where the metrics pushed to telemetry.
    # Possible values:
    #   * OCI_TELEMETRY_NATIVE      - The metrics are pushed to telemetry from OCI Native Services.
    #   * OCI_TELEMETRY_PROMETHEUS  - The metrics are pushed to telemetry from Prometheus.
    #
    # @return [String]
    attr_reader :source

    # **[Required]** Name space to be used for OCI Native service resources discovery.
    # @return [String]
    attr_accessor :namespace

    # The resource group to use while fetching metrics from telemetry.
    # If not specified, resource group will be skipped in the list metrics request.
    #
    # @return [String]
    attr_accessor :resource_group

    # List of metrics to be used to calculate the availability of the resource.
    # Resource is considered to be up if at least one of the specified metrics is available for
    # the resource during the specified interval using the property
    # 'availabilityProxyMetricCollectionIntervalInSeconds'.
    # If no metrics are specified, availability will not be calculated for the resource.
    #
    # @return [Array<String>]
    attr_accessor :availability_proxy_metrics

    # Metrics collection interval in seconds used when calculating the availability of the
    # resource based on metrics specified using the property 'availabilityProxyMetrics'.
    #
    # @return [Integer]
    attr_accessor :availability_proxy_metric_collection_interval

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'source': :'source',
        'namespace': :'namespace',
        'resource_group': :'resourceGroup',
        'availability_proxy_metrics': :'availabilityProxyMetrics',
        'availability_proxy_metric_collection_interval': :'availabilityProxyMetricCollectionInterval'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'source': :'String',
        'namespace': :'String',
        'resource_group': :'String',
        'availability_proxy_metrics': :'Array<String>',
        'availability_proxy_metric_collection_interval': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :source The value to assign to the {#source} property
    # @option attributes [String] :namespace The value to assign to the {#namespace} property
    # @option attributes [String] :resource_group The value to assign to the {#resource_group} property
    # @option attributes [Array<String>] :availability_proxy_metrics The value to assign to the {#availability_proxy_metrics} property
    # @option attributes [Integer] :availability_proxy_metric_collection_interval The value to assign to the {#availability_proxy_metric_collection_interval} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'IMPORT_OCI_TELEMETRY_RESOURCES'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.source = attributes[:'source'] if attributes[:'source']

      self.namespace = attributes[:'namespace'] if attributes[:'namespace']

      self.resource_group = attributes[:'resourceGroup'] if attributes[:'resourceGroup']

      raise 'You cannot provide both :resourceGroup and :resource_group' if attributes.key?(:'resourceGroup') && attributes.key?(:'resource_group')

      self.resource_group = attributes[:'resource_group'] if attributes[:'resource_group']

      self.availability_proxy_metrics = attributes[:'availabilityProxyMetrics'] if attributes[:'availabilityProxyMetrics']

      raise 'You cannot provide both :availabilityProxyMetrics and :availability_proxy_metrics' if attributes.key?(:'availabilityProxyMetrics') && attributes.key?(:'availability_proxy_metrics')

      self.availability_proxy_metrics = attributes[:'availability_proxy_metrics'] if attributes[:'availability_proxy_metrics']

      self.availability_proxy_metric_collection_interval = attributes[:'availabilityProxyMetricCollectionInterval'] if attributes[:'availabilityProxyMetricCollectionInterval']

      raise 'You cannot provide both :availabilityProxyMetricCollectionInterval and :availability_proxy_metric_collection_interval' if attributes.key?(:'availabilityProxyMetricCollectionInterval') && attributes.key?(:'availability_proxy_metric_collection_interval')

      self.availability_proxy_metric_collection_interval = attributes[:'availability_proxy_metric_collection_interval'] if attributes[:'availability_proxy_metric_collection_interval']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] source Object to be assigned
    def source=(source)
      # rubocop:disable Style/ConditionalAssignment
      if source && !SOURCE_ENUM.include?(source)
        OCI.logger.debug("Unknown value for 'source' [" + source + "]. Mapping to 'SOURCE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @source = SOURCE_UNKNOWN_ENUM_VALUE
      else
        @source = source
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        source == other.source &&
        namespace == other.namespace &&
        resource_group == other.resource_group &&
        availability_proxy_metrics == other.availability_proxy_metrics &&
        availability_proxy_metric_collection_interval == other.availability_proxy_metric_collection_interval
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
      [type, source, namespace, resource_group, availability_proxy_metrics, availability_proxy_metric_collection_interval].hash
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
