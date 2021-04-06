# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # SQL execution plan Performance statistics.
  class Opsi::Models::SqlPlanInsightAggregation
    # **[Required]** Plan hash value for the SQL Execution Plan
    # @return [Integer]
    attr_accessor :plan_hash

    # **[Required]** IO Time in seconds
    # @return [Float]
    attr_accessor :io_time_in_sec

    # **[Required]** CPU Time in seconds
    # @return [Float]
    attr_accessor :cpu_time_in_sec

    # **[Required]** Inefficient Wait Time in seconds
    # @return [Float]
    attr_accessor :inefficient_wait_time_in_sec

    # **[Required]** Total number of executions
    # @return [Integer]
    attr_accessor :executions_count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'plan_hash': :'planHash',
        'io_time_in_sec': :'ioTimeInSec',
        'cpu_time_in_sec': :'cpuTimeInSec',
        'inefficient_wait_time_in_sec': :'inefficientWaitTimeInSec',
        'executions_count': :'executionsCount'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'plan_hash': :'Integer',
        'io_time_in_sec': :'Float',
        'cpu_time_in_sec': :'Float',
        'inefficient_wait_time_in_sec': :'Float',
        'executions_count': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :plan_hash The value to assign to the {#plan_hash} property
    # @option attributes [Float] :io_time_in_sec The value to assign to the {#io_time_in_sec} property
    # @option attributes [Float] :cpu_time_in_sec The value to assign to the {#cpu_time_in_sec} property
    # @option attributes [Float] :inefficient_wait_time_in_sec The value to assign to the {#inefficient_wait_time_in_sec} property
    # @option attributes [Integer] :executions_count The value to assign to the {#executions_count} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.plan_hash = attributes[:'planHash'] if attributes[:'planHash']

      raise 'You cannot provide both :planHash and :plan_hash' if attributes.key?(:'planHash') && attributes.key?(:'plan_hash')

      self.plan_hash = attributes[:'plan_hash'] if attributes[:'plan_hash']

      self.io_time_in_sec = attributes[:'ioTimeInSec'] if attributes[:'ioTimeInSec']

      raise 'You cannot provide both :ioTimeInSec and :io_time_in_sec' if attributes.key?(:'ioTimeInSec') && attributes.key?(:'io_time_in_sec')

      self.io_time_in_sec = attributes[:'io_time_in_sec'] if attributes[:'io_time_in_sec']

      self.cpu_time_in_sec = attributes[:'cpuTimeInSec'] if attributes[:'cpuTimeInSec']

      raise 'You cannot provide both :cpuTimeInSec and :cpu_time_in_sec' if attributes.key?(:'cpuTimeInSec') && attributes.key?(:'cpu_time_in_sec')

      self.cpu_time_in_sec = attributes[:'cpu_time_in_sec'] if attributes[:'cpu_time_in_sec']

      self.inefficient_wait_time_in_sec = attributes[:'inefficientWaitTimeInSec'] if attributes[:'inefficientWaitTimeInSec']

      raise 'You cannot provide both :inefficientWaitTimeInSec and :inefficient_wait_time_in_sec' if attributes.key?(:'inefficientWaitTimeInSec') && attributes.key?(:'inefficient_wait_time_in_sec')

      self.inefficient_wait_time_in_sec = attributes[:'inefficient_wait_time_in_sec'] if attributes[:'inefficient_wait_time_in_sec']

      self.executions_count = attributes[:'executionsCount'] if attributes[:'executionsCount']

      raise 'You cannot provide both :executionsCount and :executions_count' if attributes.key?(:'executionsCount') && attributes.key?(:'executions_count')

      self.executions_count = attributes[:'executions_count'] if attributes[:'executions_count']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        plan_hash == other.plan_hash &&
        io_time_in_sec == other.io_time_in_sec &&
        cpu_time_in_sec == other.cpu_time_in_sec &&
        inefficient_wait_time_in_sec == other.inefficient_wait_time_in_sec &&
        executions_count == other.executions_count
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
      [plan_hash, io_time_in_sec, cpu_time_in_sec, inefficient_wait_time_in_sec, executions_count].hash
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
