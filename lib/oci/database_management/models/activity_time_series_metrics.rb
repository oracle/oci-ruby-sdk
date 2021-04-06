# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The response object representing activityMetric details for a specific database at a particular time.
  class DatabaseManagement::Models::ActivityTimeSeriesMetrics
    # The date and time the activity metric was created.
    # @return [DateTime]
    attr_accessor :timestamp

    # @return [OCI::DatabaseManagement::Models::MetricDataPoint]
    attr_accessor :cpu_time

    # @return [OCI::DatabaseManagement::Models::MetricDataPoint]
    attr_accessor :wait_time

    # @return [OCI::DatabaseManagement::Models::MetricDataPoint]
    attr_accessor :user_io_time

    # @return [OCI::DatabaseManagement::Models::MetricDataPoint]
    attr_accessor :cpu_count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'timestamp': :'timestamp',
        'cpu_time': :'cpuTime',
        'wait_time': :'waitTime',
        'user_io_time': :'userIoTime',
        'cpu_count': :'cpuCount'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'timestamp': :'DateTime',
        'cpu_time': :'OCI::DatabaseManagement::Models::MetricDataPoint',
        'wait_time': :'OCI::DatabaseManagement::Models::MetricDataPoint',
        'user_io_time': :'OCI::DatabaseManagement::Models::MetricDataPoint',
        'cpu_count': :'OCI::DatabaseManagement::Models::MetricDataPoint'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :timestamp The value to assign to the {#timestamp} property
    # @option attributes [OCI::DatabaseManagement::Models::MetricDataPoint] :cpu_time The value to assign to the {#cpu_time} property
    # @option attributes [OCI::DatabaseManagement::Models::MetricDataPoint] :wait_time The value to assign to the {#wait_time} property
    # @option attributes [OCI::DatabaseManagement::Models::MetricDataPoint] :user_io_time The value to assign to the {#user_io_time} property
    # @option attributes [OCI::DatabaseManagement::Models::MetricDataPoint] :cpu_count The value to assign to the {#cpu_count} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.timestamp = attributes[:'timestamp'] if attributes[:'timestamp']

      self.cpu_time = attributes[:'cpuTime'] if attributes[:'cpuTime']

      raise 'You cannot provide both :cpuTime and :cpu_time' if attributes.key?(:'cpuTime') && attributes.key?(:'cpu_time')

      self.cpu_time = attributes[:'cpu_time'] if attributes[:'cpu_time']

      self.wait_time = attributes[:'waitTime'] if attributes[:'waitTime']

      raise 'You cannot provide both :waitTime and :wait_time' if attributes.key?(:'waitTime') && attributes.key?(:'wait_time')

      self.wait_time = attributes[:'wait_time'] if attributes[:'wait_time']

      self.user_io_time = attributes[:'userIoTime'] if attributes[:'userIoTime']

      raise 'You cannot provide both :userIoTime and :user_io_time' if attributes.key?(:'userIoTime') && attributes.key?(:'user_io_time')

      self.user_io_time = attributes[:'user_io_time'] if attributes[:'user_io_time']

      self.cpu_count = attributes[:'cpuCount'] if attributes[:'cpuCount']

      raise 'You cannot provide both :cpuCount and :cpu_count' if attributes.key?(:'cpuCount') && attributes.key?(:'cpu_count')

      self.cpu_count = attributes[:'cpu_count'] if attributes[:'cpu_count']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        timestamp == other.timestamp &&
        cpu_time == other.cpu_time &&
        wait_time == other.wait_time &&
        user_io_time == other.user_io_time &&
        cpu_count == other.cpu_count
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
      [timestamp, cpu_time, wait_time, user_io_time, cpu_count].hash
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
