# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20160918
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Information about the available capacity for a shape.
  #
  class Core::Models::CapacityReportShapeAvailability
    AVAILABILITY_STATUS_ENUM = [
      AVAILABILITY_STATUS_OUT_OF_HOST_CAPACITY = 'OUT_OF_HOST_CAPACITY'.freeze,
      AVAILABILITY_STATUS_HARDWARE_NOT_SUPPORTED = 'HARDWARE_NOT_SUPPORTED'.freeze,
      AVAILABILITY_STATUS_AVAILABLE = 'AVAILABLE'.freeze,
      AVAILABILITY_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The fault domain for the capacity report.
    #
    # If you do not specify the fault domain, the capacity report includes information about all fault domains.
    #
    # @return [String]
    attr_accessor :fault_domain

    # The shape that the capacity report was requested for.
    #
    # @return [String]
    attr_accessor :instance_shape

    # @return [OCI::Core::Models::CapacityReportInstanceShapeConfig]
    attr_accessor :instance_shape_config

    # The total number of new instances that can be created with the specified shape configuration.
    # @return [Integer]
    attr_accessor :available_count

    # A flag denoting whether capacity is available.
    # @return [String]
    attr_reader :availability_status

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'fault_domain': :'faultDomain',
        'instance_shape': :'instanceShape',
        'instance_shape_config': :'instanceShapeConfig',
        'available_count': :'availableCount',
        'availability_status': :'availabilityStatus'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'fault_domain': :'String',
        'instance_shape': :'String',
        'instance_shape_config': :'OCI::Core::Models::CapacityReportInstanceShapeConfig',
        'available_count': :'Integer',
        'availability_status': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :fault_domain The value to assign to the {#fault_domain} property
    # @option attributes [String] :instance_shape The value to assign to the {#instance_shape} property
    # @option attributes [OCI::Core::Models::CapacityReportInstanceShapeConfig] :instance_shape_config The value to assign to the {#instance_shape_config} property
    # @option attributes [Integer] :available_count The value to assign to the {#available_count} property
    # @option attributes [String] :availability_status The value to assign to the {#availability_status} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.fault_domain = attributes[:'faultDomain'] if attributes[:'faultDomain']

      raise 'You cannot provide both :faultDomain and :fault_domain' if attributes.key?(:'faultDomain') && attributes.key?(:'fault_domain')

      self.fault_domain = attributes[:'fault_domain'] if attributes[:'fault_domain']

      self.instance_shape = attributes[:'instanceShape'] if attributes[:'instanceShape']

      raise 'You cannot provide both :instanceShape and :instance_shape' if attributes.key?(:'instanceShape') && attributes.key?(:'instance_shape')

      self.instance_shape = attributes[:'instance_shape'] if attributes[:'instance_shape']

      self.instance_shape_config = attributes[:'instanceShapeConfig'] if attributes[:'instanceShapeConfig']

      raise 'You cannot provide both :instanceShapeConfig and :instance_shape_config' if attributes.key?(:'instanceShapeConfig') && attributes.key?(:'instance_shape_config')

      self.instance_shape_config = attributes[:'instance_shape_config'] if attributes[:'instance_shape_config']

      self.available_count = attributes[:'availableCount'] if attributes[:'availableCount']

      raise 'You cannot provide both :availableCount and :available_count' if attributes.key?(:'availableCount') && attributes.key?(:'available_count')

      self.available_count = attributes[:'available_count'] if attributes[:'available_count']

      self.availability_status = attributes[:'availabilityStatus'] if attributes[:'availabilityStatus']

      raise 'You cannot provide both :availabilityStatus and :availability_status' if attributes.key?(:'availabilityStatus') && attributes.key?(:'availability_status')

      self.availability_status = attributes[:'availability_status'] if attributes[:'availability_status']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] availability_status Object to be assigned
    def availability_status=(availability_status)
      # rubocop:disable Style/ConditionalAssignment
      if availability_status && !AVAILABILITY_STATUS_ENUM.include?(availability_status)
        OCI.logger.debug("Unknown value for 'availability_status' [" + availability_status + "]. Mapping to 'AVAILABILITY_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @availability_status = AVAILABILITY_STATUS_UNKNOWN_ENUM_VALUE
      else
        @availability_status = availability_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        fault_domain == other.fault_domain &&
        instance_shape == other.instance_shape &&
        instance_shape_config == other.instance_shape_config &&
        available_count == other.available_count &&
        availability_status == other.availability_status
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
      [fault_domain, instance_shape, instance_shape_config, available_count, availability_status].hash
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
