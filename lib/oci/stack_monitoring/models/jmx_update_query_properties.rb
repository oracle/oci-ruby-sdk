# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210330
require 'date'
require_relative 'metric_extension_update_query_properties'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Query Properties applicable to JMX type of collection method
  class StackMonitoring::Models::JmxUpdateQueryProperties < StackMonitoring::Models::MetricExtensionUpdateQueryProperties
    # JMX Managed Bean Query or Metric Service Table name
    # @return [String]
    attr_accessor :managed_bean_query

    # List of JMX attributes or Metric Service Table columns separated by semi-colon
    # @return [String]
    attr_accessor :jmx_attributes

    # Semi-colon separated list of key properties from Managed Bean ObjectName to be used as key metrics
    # @return [String]
    attr_accessor :identity_metric

    # Prefix for an auto generated metric, in case multiple rows with non unique key values are returned
    # @return [String]
    attr_accessor :auto_row_prefix

    # Indicates if Metric Service is enabled on server domain
    # @return [BOOLEAN]
    attr_accessor :is_metric_service_enabled

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'collection_method': :'collectionMethod',
        'managed_bean_query': :'managedBeanQuery',
        'jmx_attributes': :'jmxAttributes',
        'identity_metric': :'identityMetric',
        'auto_row_prefix': :'autoRowPrefix',
        'is_metric_service_enabled': :'isMetricServiceEnabled'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'collection_method': :'String',
        'managed_bean_query': :'String',
        'jmx_attributes': :'String',
        'identity_metric': :'String',
        'auto_row_prefix': :'String',
        'is_metric_service_enabled': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :managed_bean_query The value to assign to the {#managed_bean_query} property
    # @option attributes [String] :jmx_attributes The value to assign to the {#jmx_attributes} property
    # @option attributes [String] :identity_metric The value to assign to the {#identity_metric} property
    # @option attributes [String] :auto_row_prefix The value to assign to the {#auto_row_prefix} property
    # @option attributes [BOOLEAN] :is_metric_service_enabled The value to assign to the {#is_metric_service_enabled} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['collectionMethod'] = 'JMX'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.managed_bean_query = attributes[:'managedBeanQuery'] if attributes[:'managedBeanQuery']

      raise 'You cannot provide both :managedBeanQuery and :managed_bean_query' if attributes.key?(:'managedBeanQuery') && attributes.key?(:'managed_bean_query')

      self.managed_bean_query = attributes[:'managed_bean_query'] if attributes[:'managed_bean_query']

      self.jmx_attributes = attributes[:'jmxAttributes'] if attributes[:'jmxAttributes']

      raise 'You cannot provide both :jmxAttributes and :jmx_attributes' if attributes.key?(:'jmxAttributes') && attributes.key?(:'jmx_attributes')

      self.jmx_attributes = attributes[:'jmx_attributes'] if attributes[:'jmx_attributes']

      self.identity_metric = attributes[:'identityMetric'] if attributes[:'identityMetric']

      raise 'You cannot provide both :identityMetric and :identity_metric' if attributes.key?(:'identityMetric') && attributes.key?(:'identity_metric')

      self.identity_metric = attributes[:'identity_metric'] if attributes[:'identity_metric']

      self.auto_row_prefix = attributes[:'autoRowPrefix'] if attributes[:'autoRowPrefix']

      raise 'You cannot provide both :autoRowPrefix and :auto_row_prefix' if attributes.key?(:'autoRowPrefix') && attributes.key?(:'auto_row_prefix')

      self.auto_row_prefix = attributes[:'auto_row_prefix'] if attributes[:'auto_row_prefix']

      self.is_metric_service_enabled = attributes[:'isMetricServiceEnabled'] unless attributes[:'isMetricServiceEnabled'].nil?
      self.is_metric_service_enabled = false if is_metric_service_enabled.nil? && !attributes.key?(:'isMetricServiceEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isMetricServiceEnabled and :is_metric_service_enabled' if attributes.key?(:'isMetricServiceEnabled') && attributes.key?(:'is_metric_service_enabled')

      self.is_metric_service_enabled = attributes[:'is_metric_service_enabled'] unless attributes[:'is_metric_service_enabled'].nil?
      self.is_metric_service_enabled = false if is_metric_service_enabled.nil? && !attributes.key?(:'isMetricServiceEnabled') && !attributes.key?(:'is_metric_service_enabled') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        collection_method == other.collection_method &&
        managed_bean_query == other.managed_bean_query &&
        jmx_attributes == other.jmx_attributes &&
        identity_metric == other.identity_metric &&
        auto_row_prefix == other.auto_row_prefix &&
        is_metric_service_enabled == other.is_metric_service_enabled
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
      [collection_method, managed_bean_query, jmx_attributes, identity_metric, auto_row_prefix, is_metric_service_enabled].hash
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