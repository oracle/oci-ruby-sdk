# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Configration for a metric based vertical scale-up policy.
  class Bds::Models::MetricBasedVerticalScaleUpConfig
    # @return [OCI::Bds::Models::AutoScalePolicyMetricRule]
    attr_accessor :metric

    # For nodes with [flexible compute shapes](https://docs.cloud.oracle.com/iaas/Content/bigdata/create-cluster.htm#cluster-plan-shape), this value is the maximum number of OCPUs each node can be scaled-up to. This value is not used for nodes with fixed compute shapes.
    #
    # @return [Integer]
    attr_accessor :max_ocpus_per_node

    # For nodes with [flexible compute shapes](https://docs.cloud.oracle.com/iaas/Content/bigdata/create-cluster.htm#cluster-plan-shape), this value is the maximum memory in GBs each node can be scaled-up to. This value is not used for nodes with fixed compute shapes.
    # @return [Integer]
    attr_accessor :max_memory_per_node

    # For nodes with [flexible compute shapes](https://docs.cloud.oracle.com/iaas/Content/bigdata/create-cluster.htm#cluster-plan-shape), this value is the number of OCPUs to add to each node during a scale-up event. This value is not used for nodes with fixed compute shapes.
    # @return [Integer]
    attr_accessor :ocpu_step_size

    # For nodes with [flexible compute shapes](https://docs.cloud.oracle.com/iaas/Content/bigdata/create-cluster.htm#cluster-plan-shape), this value is the size of memory in GBs to add to each node during a scale-up event. This value is not used for nodes with fixed compute shapes.
    # @return [Integer]
    attr_accessor :memory_step_size

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'metric': :'metric',
        'max_ocpus_per_node': :'maxOcpusPerNode',
        'max_memory_per_node': :'maxMemoryPerNode',
        'ocpu_step_size': :'ocpuStepSize',
        'memory_step_size': :'memoryStepSize'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'metric': :'OCI::Bds::Models::AutoScalePolicyMetricRule',
        'max_ocpus_per_node': :'Integer',
        'max_memory_per_node': :'Integer',
        'ocpu_step_size': :'Integer',
        'memory_step_size': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::Bds::Models::AutoScalePolicyMetricRule] :metric The value to assign to the {#metric} property
    # @option attributes [Integer] :max_ocpus_per_node The value to assign to the {#max_ocpus_per_node} property
    # @option attributes [Integer] :max_memory_per_node The value to assign to the {#max_memory_per_node} property
    # @option attributes [Integer] :ocpu_step_size The value to assign to the {#ocpu_step_size} property
    # @option attributes [Integer] :memory_step_size The value to assign to the {#memory_step_size} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.metric = attributes[:'metric'] if attributes[:'metric']

      self.max_ocpus_per_node = attributes[:'maxOcpusPerNode'] if attributes[:'maxOcpusPerNode']

      raise 'You cannot provide both :maxOcpusPerNode and :max_ocpus_per_node' if attributes.key?(:'maxOcpusPerNode') && attributes.key?(:'max_ocpus_per_node')

      self.max_ocpus_per_node = attributes[:'max_ocpus_per_node'] if attributes[:'max_ocpus_per_node']

      self.max_memory_per_node = attributes[:'maxMemoryPerNode'] if attributes[:'maxMemoryPerNode']

      raise 'You cannot provide both :maxMemoryPerNode and :max_memory_per_node' if attributes.key?(:'maxMemoryPerNode') && attributes.key?(:'max_memory_per_node')

      self.max_memory_per_node = attributes[:'max_memory_per_node'] if attributes[:'max_memory_per_node']

      self.ocpu_step_size = attributes[:'ocpuStepSize'] if attributes[:'ocpuStepSize']

      raise 'You cannot provide both :ocpuStepSize and :ocpu_step_size' if attributes.key?(:'ocpuStepSize') && attributes.key?(:'ocpu_step_size')

      self.ocpu_step_size = attributes[:'ocpu_step_size'] if attributes[:'ocpu_step_size']

      self.memory_step_size = attributes[:'memoryStepSize'] if attributes[:'memoryStepSize']

      raise 'You cannot provide both :memoryStepSize and :memory_step_size' if attributes.key?(:'memoryStepSize') && attributes.key?(:'memory_step_size')

      self.memory_step_size = attributes[:'memory_step_size'] if attributes[:'memory_step_size']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        metric == other.metric &&
        max_ocpus_per_node == other.max_ocpus_per_node &&
        max_memory_per_node == other.max_memory_per_node &&
        ocpu_step_size == other.ocpu_step_size &&
        memory_step_size == other.memory_step_size
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
      [metric, max_ocpus_per_node, max_memory_per_node, ocpu_step_size, memory_step_size].hash
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
