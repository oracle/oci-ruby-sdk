# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Individual worker nodes groups details.
  class Bds::Models::ChangeShapeNodes
    # Change shape of worker nodes to the desired target shape. Both VM_STANDARD and E4 Flex shapes are allowed here.
    # @return [String]
    attr_accessor :worker

    # @return [OCI::Bds::Models::ShapeConfigDetails]
    attr_accessor :worker_shape_config

    # Change shape of compute only worker nodes to the desired target shape. Both VM_STANDARD and E4 Flex shapes are allowed here.
    # @return [String]
    attr_accessor :compute_only_worker

    # @return [OCI::Bds::Models::ShapeConfigDetails]
    attr_accessor :compute_only_worker_shape_config

    # Change shape of master nodes to the desired target shape. Both VM_STANDARD and E4 Flex shapes are allowed here.
    # @return [String]
    attr_accessor :master

    # @return [OCI::Bds::Models::ShapeConfigDetails]
    attr_accessor :master_shape_config

    # Change shape of utility nodes to the desired target shape. Both VM_STANDARD and E4 Flex shapes are allowed here.
    # @return [String]
    attr_accessor :utility

    # @return [OCI::Bds::Models::ShapeConfigDetails]
    attr_accessor :utility_shape_config

    # Change shape of the Cloud SQL node to the desired target shape. Only VM_STANDARD shapes are allowed here.
    # @return [String]
    attr_accessor :cloudsql

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'worker': :'worker',
        'worker_shape_config': :'workerShapeConfig',
        'compute_only_worker': :'computeOnlyWorker',
        'compute_only_worker_shape_config': :'computeOnlyWorkerShapeConfig',
        'master': :'master',
        'master_shape_config': :'masterShapeConfig',
        'utility': :'utility',
        'utility_shape_config': :'utilityShapeConfig',
        'cloudsql': :'cloudsql'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'worker': :'String',
        'worker_shape_config': :'OCI::Bds::Models::ShapeConfigDetails',
        'compute_only_worker': :'String',
        'compute_only_worker_shape_config': :'OCI::Bds::Models::ShapeConfigDetails',
        'master': :'String',
        'master_shape_config': :'OCI::Bds::Models::ShapeConfigDetails',
        'utility': :'String',
        'utility_shape_config': :'OCI::Bds::Models::ShapeConfigDetails',
        'cloudsql': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :worker The value to assign to the {#worker} property
    # @option attributes [OCI::Bds::Models::ShapeConfigDetails] :worker_shape_config The value to assign to the {#worker_shape_config} property
    # @option attributes [String] :compute_only_worker The value to assign to the {#compute_only_worker} property
    # @option attributes [OCI::Bds::Models::ShapeConfigDetails] :compute_only_worker_shape_config The value to assign to the {#compute_only_worker_shape_config} property
    # @option attributes [String] :master The value to assign to the {#master} property
    # @option attributes [OCI::Bds::Models::ShapeConfigDetails] :master_shape_config The value to assign to the {#master_shape_config} property
    # @option attributes [String] :utility The value to assign to the {#utility} property
    # @option attributes [OCI::Bds::Models::ShapeConfigDetails] :utility_shape_config The value to assign to the {#utility_shape_config} property
    # @option attributes [String] :cloudsql The value to assign to the {#cloudsql} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.worker = attributes[:'worker'] if attributes[:'worker']

      self.worker_shape_config = attributes[:'workerShapeConfig'] if attributes[:'workerShapeConfig']

      raise 'You cannot provide both :workerShapeConfig and :worker_shape_config' if attributes.key?(:'workerShapeConfig') && attributes.key?(:'worker_shape_config')

      self.worker_shape_config = attributes[:'worker_shape_config'] if attributes[:'worker_shape_config']

      self.compute_only_worker = attributes[:'computeOnlyWorker'] if attributes[:'computeOnlyWorker']

      raise 'You cannot provide both :computeOnlyWorker and :compute_only_worker' if attributes.key?(:'computeOnlyWorker') && attributes.key?(:'compute_only_worker')

      self.compute_only_worker = attributes[:'compute_only_worker'] if attributes[:'compute_only_worker']

      self.compute_only_worker_shape_config = attributes[:'computeOnlyWorkerShapeConfig'] if attributes[:'computeOnlyWorkerShapeConfig']

      raise 'You cannot provide both :computeOnlyWorkerShapeConfig and :compute_only_worker_shape_config' if attributes.key?(:'computeOnlyWorkerShapeConfig') && attributes.key?(:'compute_only_worker_shape_config')

      self.compute_only_worker_shape_config = attributes[:'compute_only_worker_shape_config'] if attributes[:'compute_only_worker_shape_config']

      self.master = attributes[:'master'] if attributes[:'master']

      self.master_shape_config = attributes[:'masterShapeConfig'] if attributes[:'masterShapeConfig']

      raise 'You cannot provide both :masterShapeConfig and :master_shape_config' if attributes.key?(:'masterShapeConfig') && attributes.key?(:'master_shape_config')

      self.master_shape_config = attributes[:'master_shape_config'] if attributes[:'master_shape_config']

      self.utility = attributes[:'utility'] if attributes[:'utility']

      self.utility_shape_config = attributes[:'utilityShapeConfig'] if attributes[:'utilityShapeConfig']

      raise 'You cannot provide both :utilityShapeConfig and :utility_shape_config' if attributes.key?(:'utilityShapeConfig') && attributes.key?(:'utility_shape_config')

      self.utility_shape_config = attributes[:'utility_shape_config'] if attributes[:'utility_shape_config']

      self.cloudsql = attributes[:'cloudsql'] if attributes[:'cloudsql']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        worker == other.worker &&
        worker_shape_config == other.worker_shape_config &&
        compute_only_worker == other.compute_only_worker &&
        compute_only_worker_shape_config == other.compute_only_worker_shape_config &&
        master == other.master &&
        master_shape_config == other.master_shape_config &&
        utility == other.utility &&
        utility_shape_config == other.utility_shape_config &&
        cloudsql == other.cloudsql
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
      [worker, worker_shape_config, compute_only_worker, compute_only_worker_shape_config, master, master_shape_config, utility, utility_shape_config, cloudsql].hash
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
