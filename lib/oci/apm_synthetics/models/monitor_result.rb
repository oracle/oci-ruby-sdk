# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The monitor result for a specific execution.
  class ApmSynthetics::Models::MonitorResult
    # Type of result.
    # Example: HAR, Screenshot, Log or Network.
    #
    # @return [String]
    attr_accessor :result_type

    # **[Required]** Type of result content.
    # Example: Zip or Raw file.
    #
    # @return [String]
    attr_accessor :result_content_type

    # Monitor result data set.
    # @return [Array<OCI::ApmSynthetics::Models::MonitorResultData>]
    attr_accessor :result_data_set

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the monitor.
    # @return [String]
    attr_accessor :monitor_id

    # The name of the vantage point.
    # @return [String]
    attr_accessor :vantage_point

    # The specific point of time when the result of an execution is collected.
    # @return [String]
    attr_accessor :execution_time

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'result_type': :'resultType',
        'result_content_type': :'resultContentType',
        'result_data_set': :'resultDataSet',
        'monitor_id': :'monitorId',
        'vantage_point': :'vantagePoint',
        'execution_time': :'executionTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'result_type': :'String',
        'result_content_type': :'String',
        'result_data_set': :'Array<OCI::ApmSynthetics::Models::MonitorResultData>',
        'monitor_id': :'String',
        'vantage_point': :'String',
        'execution_time': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :result_type The value to assign to the {#result_type} property
    # @option attributes [String] :result_content_type The value to assign to the {#result_content_type} property
    # @option attributes [Array<OCI::ApmSynthetics::Models::MonitorResultData>] :result_data_set The value to assign to the {#result_data_set} property
    # @option attributes [String] :monitor_id The value to assign to the {#monitor_id} property
    # @option attributes [String] :vantage_point The value to assign to the {#vantage_point} property
    # @option attributes [String] :execution_time The value to assign to the {#execution_time} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.result_type = attributes[:'resultType'] if attributes[:'resultType']

      raise 'You cannot provide both :resultType and :result_type' if attributes.key?(:'resultType') && attributes.key?(:'result_type')

      self.result_type = attributes[:'result_type'] if attributes[:'result_type']

      self.result_content_type = attributes[:'resultContentType'] if attributes[:'resultContentType']

      raise 'You cannot provide both :resultContentType and :result_content_type' if attributes.key?(:'resultContentType') && attributes.key?(:'result_content_type')

      self.result_content_type = attributes[:'result_content_type'] if attributes[:'result_content_type']

      self.result_data_set = attributes[:'resultDataSet'] if attributes[:'resultDataSet']

      raise 'You cannot provide both :resultDataSet and :result_data_set' if attributes.key?(:'resultDataSet') && attributes.key?(:'result_data_set')

      self.result_data_set = attributes[:'result_data_set'] if attributes[:'result_data_set']

      self.monitor_id = attributes[:'monitorId'] if attributes[:'monitorId']

      raise 'You cannot provide both :monitorId and :monitor_id' if attributes.key?(:'monitorId') && attributes.key?(:'monitor_id')

      self.monitor_id = attributes[:'monitor_id'] if attributes[:'monitor_id']

      self.vantage_point = attributes[:'vantagePoint'] if attributes[:'vantagePoint']

      raise 'You cannot provide both :vantagePoint and :vantage_point' if attributes.key?(:'vantagePoint') && attributes.key?(:'vantage_point')

      self.vantage_point = attributes[:'vantage_point'] if attributes[:'vantage_point']

      self.execution_time = attributes[:'executionTime'] if attributes[:'executionTime']

      raise 'You cannot provide both :executionTime and :execution_time' if attributes.key?(:'executionTime') && attributes.key?(:'execution_time')

      self.execution_time = attributes[:'execution_time'] if attributes[:'execution_time']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        result_type == other.result_type &&
        result_content_type == other.result_content_type &&
        result_data_set == other.result_data_set &&
        monitor_id == other.monitor_id &&
        vantage_point == other.vantage_point &&
        execution_time == other.execution_time
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
      [result_type, result_content_type, result_data_set, monitor_id, vantage_point, execution_time].hash
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
