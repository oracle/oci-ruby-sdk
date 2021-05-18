# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The response containing the CPU, Wait, DB Time, and Memory metrics
  # for a specific Oracle Real Application Clusters (Oracle RAC) database
  # instance.
  #
  class DatabaseManagement::Models::DatabaseInstanceHomeMetricsDefinition
    # **[Required]** The name of the Oracle Real Application Clusters (Oracle RAC)
    # database instance to which the corresponding metrics belong.
    #
    # @return [String]
    attr_accessor :instance_name

    # **[Required]** The number of Oracle Real Application Clusters (Oracle RAC)
    # database instance to which the corresponding metrics belong.
    #
    # @return [Integer]
    attr_accessor :instance_number

    # **[Required]** A list of the active session metrics for CPU and Wait time for
    # a specific Oracle Real Application Clusters (Oracle RAC)
    # database instance.
    #
    # @return [Array<OCI::DatabaseManagement::Models::ActivityTimeSeriesMetrics>]
    attr_accessor :activity_time_series_metrics

    # This attribute is required.
    # @return [OCI::DatabaseManagement::Models::DatabaseTimeAggregateMetrics]
    attr_accessor :db_time_aggregate_metrics

    # This attribute is required.
    # @return [OCI::DatabaseManagement::Models::DatabaseIOAggregateMetrics]
    attr_accessor :io_aggregate_metrics

    # This attribute is required.
    # @return [OCI::DatabaseManagement::Models::MemoryAggregateMetrics]
    attr_accessor :memory_aggregate_metrics

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'instance_name': :'instanceName',
        'instance_number': :'instanceNumber',
        'activity_time_series_metrics': :'activityTimeSeriesMetrics',
        'db_time_aggregate_metrics': :'dbTimeAggregateMetrics',
        'io_aggregate_metrics': :'ioAggregateMetrics',
        'memory_aggregate_metrics': :'memoryAggregateMetrics'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'instance_name': :'String',
        'instance_number': :'Integer',
        'activity_time_series_metrics': :'Array<OCI::DatabaseManagement::Models::ActivityTimeSeriesMetrics>',
        'db_time_aggregate_metrics': :'OCI::DatabaseManagement::Models::DatabaseTimeAggregateMetrics',
        'io_aggregate_metrics': :'OCI::DatabaseManagement::Models::DatabaseIOAggregateMetrics',
        'memory_aggregate_metrics': :'OCI::DatabaseManagement::Models::MemoryAggregateMetrics'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :instance_name The value to assign to the {#instance_name} property
    # @option attributes [Integer] :instance_number The value to assign to the {#instance_number} property
    # @option attributes [Array<OCI::DatabaseManagement::Models::ActivityTimeSeriesMetrics>] :activity_time_series_metrics The value to assign to the {#activity_time_series_metrics} property
    # @option attributes [OCI::DatabaseManagement::Models::DatabaseTimeAggregateMetrics] :db_time_aggregate_metrics The value to assign to the {#db_time_aggregate_metrics} property
    # @option attributes [OCI::DatabaseManagement::Models::DatabaseIOAggregateMetrics] :io_aggregate_metrics The value to assign to the {#io_aggregate_metrics} property
    # @option attributes [OCI::DatabaseManagement::Models::MemoryAggregateMetrics] :memory_aggregate_metrics The value to assign to the {#memory_aggregate_metrics} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.instance_name = attributes[:'instanceName'] if attributes[:'instanceName']

      raise 'You cannot provide both :instanceName and :instance_name' if attributes.key?(:'instanceName') && attributes.key?(:'instance_name')

      self.instance_name = attributes[:'instance_name'] if attributes[:'instance_name']

      self.instance_number = attributes[:'instanceNumber'] if attributes[:'instanceNumber']

      raise 'You cannot provide both :instanceNumber and :instance_number' if attributes.key?(:'instanceNumber') && attributes.key?(:'instance_number')

      self.instance_number = attributes[:'instance_number'] if attributes[:'instance_number']

      self.activity_time_series_metrics = attributes[:'activityTimeSeriesMetrics'] if attributes[:'activityTimeSeriesMetrics']

      raise 'You cannot provide both :activityTimeSeriesMetrics and :activity_time_series_metrics' if attributes.key?(:'activityTimeSeriesMetrics') && attributes.key?(:'activity_time_series_metrics')

      self.activity_time_series_metrics = attributes[:'activity_time_series_metrics'] if attributes[:'activity_time_series_metrics']

      self.db_time_aggregate_metrics = attributes[:'dbTimeAggregateMetrics'] if attributes[:'dbTimeAggregateMetrics']

      raise 'You cannot provide both :dbTimeAggregateMetrics and :db_time_aggregate_metrics' if attributes.key?(:'dbTimeAggregateMetrics') && attributes.key?(:'db_time_aggregate_metrics')

      self.db_time_aggregate_metrics = attributes[:'db_time_aggregate_metrics'] if attributes[:'db_time_aggregate_metrics']

      self.io_aggregate_metrics = attributes[:'ioAggregateMetrics'] if attributes[:'ioAggregateMetrics']

      raise 'You cannot provide both :ioAggregateMetrics and :io_aggregate_metrics' if attributes.key?(:'ioAggregateMetrics') && attributes.key?(:'io_aggregate_metrics')

      self.io_aggregate_metrics = attributes[:'io_aggregate_metrics'] if attributes[:'io_aggregate_metrics']

      self.memory_aggregate_metrics = attributes[:'memoryAggregateMetrics'] if attributes[:'memoryAggregateMetrics']

      raise 'You cannot provide both :memoryAggregateMetrics and :memory_aggregate_metrics' if attributes.key?(:'memoryAggregateMetrics') && attributes.key?(:'memory_aggregate_metrics')

      self.memory_aggregate_metrics = attributes[:'memory_aggregate_metrics'] if attributes[:'memory_aggregate_metrics']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        instance_name == other.instance_name &&
        instance_number == other.instance_number &&
        activity_time_series_metrics == other.activity_time_series_metrics &&
        db_time_aggregate_metrics == other.db_time_aggregate_metrics &&
        io_aggregate_metrics == other.io_aggregate_metrics &&
        memory_aggregate_metrics == other.memory_aggregate_metrics
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
      [instance_name, instance_number, activity_time_series_metrics, db_time_aggregate_metrics, io_aggregate_metrics, memory_aggregate_metrics].hash
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
