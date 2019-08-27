# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The request details for retrieving aggregated data.
  # Use the query and optional properties to filter the returned results.
  #
  class Monitoring::Models::SummarizeMetricsDataDetails
    # **[Required]** The source service or application to use when searching for metric data points to aggregate.
    #
    # Example: `oci_computeagent`
    #
    # @return [String]
    attr_accessor :namespace

    # Resource group that you want to use as a filter. The specified resource group must exist in the definition of the posted metric. Only one resource group can be applied per metric.
    # A valid resourceGroup value starts with an alphabetical character and includes only alphanumeric characters, periods (.), underscores (_), hyphens (-), and dollar signs ($).
    # Avoid entering confidential information.
    #
    # Example: `frontend-fleet`
    #
    # @return [String]
    attr_accessor :resource_group

    # **[Required]** The Monitoring Query Language (MQL) expression to use when searching for metric data points to
    # aggregate. The query must specify a metric, statistic, and interval. Supported values for
    # interval: `1m`-`60m` (also `1h`). You can optionally specify dimensions and grouping functions.
    # Supported grouping functions: `grouping()`, `groupBy()`.
    #
    # Construct your query to avoid exceeding limits on returned data. See {MetricData}.
    #
    # For details about Monitoring Query Language (MQL), see
    # [Monitoring Query Language (MQL) Reference](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Reference/mql.htm).
    # For available dimensions, review the metric definition for the supported service.
    # See [Supported Services](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Concepts/monitoringoverview.htm#SupportedServices).
    #
    # Example: `CpuUtilization[1m].sum()`
    #
    # @return [String]
    attr_accessor :query

    # The beginning of the time range to use when searching for metric data points.
    # Format is defined by RFC3339. The response includes metric data points for the startTime.
    # Default value: the timestamp 3 hours before the call was sent.
    #
    # Example: `2019-02-01T01:02:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :start_time

    # The end of the time range to use when searching for metric data points.
    # Format is defined by RFC3339. The response excludes metric data points for the endTime.
    # Default value: the timestamp representing when the call was sent.
    #
    # Example: `2019-02-01T02:02:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :end_time

    # The time between calculated aggregation windows. Use with the query interval to vary the
    # frequency at which aggregated data points are returned. For example, use a query interval of
    # 5 minutes with a resolution of 1 minute to retrieve five-minute aggregations at a one-minute
    # frequency. The resolution must be equal or less than the interval in the query. The default
    # resolution is 1m (one minute). Supported values: `1m`-`60m` (also `1h`).
    #
    # Example: `5m`
    #
    # @return [String]
    attr_accessor :resolution

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'namespace': :'namespace',
        'resource_group': :'resourceGroup',
        'query': :'query',
        'start_time': :'startTime',
        'end_time': :'endTime',
        'resolution': :'resolution'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'namespace': :'String',
        'resource_group': :'String',
        'query': :'String',
        'start_time': :'DateTime',
        'end_time': :'DateTime',
        'resolution': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :namespace The value to assign to the {#namespace} property
    # @option attributes [String] :resource_group The value to assign to the {#resource_group} property
    # @option attributes [String] :query The value to assign to the {#query} property
    # @option attributes [DateTime] :start_time The value to assign to the {#start_time} property
    # @option attributes [DateTime] :end_time The value to assign to the {#end_time} property
    # @option attributes [String] :resolution The value to assign to the {#resolution} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.namespace = attributes[:'namespace'] if attributes[:'namespace']

      self.resource_group = attributes[:'resourceGroup'] if attributes[:'resourceGroup']

      raise 'You cannot provide both :resourceGroup and :resource_group' if attributes.key?(:'resourceGroup') && attributes.key?(:'resource_group')

      self.resource_group = attributes[:'resource_group'] if attributes[:'resource_group']

      self.query = attributes[:'query'] if attributes[:'query']

      self.start_time = attributes[:'startTime'] if attributes[:'startTime']

      raise 'You cannot provide both :startTime and :start_time' if attributes.key?(:'startTime') && attributes.key?(:'start_time')

      self.start_time = attributes[:'start_time'] if attributes[:'start_time']

      self.end_time = attributes[:'endTime'] if attributes[:'endTime']

      raise 'You cannot provide both :endTime and :end_time' if attributes.key?(:'endTime') && attributes.key?(:'end_time')

      self.end_time = attributes[:'end_time'] if attributes[:'end_time']

      self.resolution = attributes[:'resolution'] if attributes[:'resolution']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        namespace == other.namespace &&
        resource_group == other.resource_group &&
        query == other.query &&
        start_time == other.start_time &&
        end_time == other.end_time &&
        resolution == other.resolution
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
      [namespace, resource_group, query, start_time, end_time, resolution].hash
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
