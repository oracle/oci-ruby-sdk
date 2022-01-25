# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Contains host resource base statistics.
  #
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Opsi::Models::HostResourceStatistics
    RESOURCE_NAME_ENUM = [
      RESOURCE_NAME_HOST_CPU_STATISTICS = 'HOST_CPU_STATISTICS'.freeze,
      RESOURCE_NAME_HOST_MEMORY_STATISTICS = 'HOST_MEMORY_STATISTICS'.freeze,
      RESOURCE_NAME_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Total amount used of the resource metric type (CPU, STORAGE).
    #
    # @return [Float]
    attr_accessor :usage

    # **[Required]** The maximum allocated amount of the resource metric type  (CPU, STORAGE).
    #
    # @return [Float]
    attr_accessor :capacity

    # **[Required]** Resource utilization in percentage.
    #
    # @return [Float]
    attr_accessor :utilization_percent

    # **[Required]** Change in resource utilization in percentage
    # @return [Float]
    attr_accessor :usage_change_percent

    # **[Required]** Name of resource for host
    # @return [String]
    attr_reader :resource_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'usage': :'usage',
        'capacity': :'capacity',
        'utilization_percent': :'utilizationPercent',
        'usage_change_percent': :'usageChangePercent',
        'resource_name': :'resourceName'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'usage': :'Float',
        'capacity': :'Float',
        'utilization_percent': :'Float',
        'usage_change_percent': :'Float',
        'resource_name': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'resourceName'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Opsi::Models::HostMemoryStatistics' if type == 'HOST_MEMORY_STATISTICS'
      return 'OCI::Opsi::Models::HostCpuStatistics' if type == 'HOST_CPU_STATISTICS'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Opsi::Models::HostResourceStatistics'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Float] :usage The value to assign to the {#usage} property
    # @option attributes [Float] :capacity The value to assign to the {#capacity} property
    # @option attributes [Float] :utilization_percent The value to assign to the {#utilization_percent} property
    # @option attributes [Float] :usage_change_percent The value to assign to the {#usage_change_percent} property
    # @option attributes [String] :resource_name The value to assign to the {#resource_name} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.usage = attributes[:'usage'] if attributes[:'usage']

      self.capacity = attributes[:'capacity'] if attributes[:'capacity']

      self.utilization_percent = attributes[:'utilizationPercent'] if attributes[:'utilizationPercent']

      raise 'You cannot provide both :utilizationPercent and :utilization_percent' if attributes.key?(:'utilizationPercent') && attributes.key?(:'utilization_percent')

      self.utilization_percent = attributes[:'utilization_percent'] if attributes[:'utilization_percent']

      self.usage_change_percent = attributes[:'usageChangePercent'] if attributes[:'usageChangePercent']

      raise 'You cannot provide both :usageChangePercent and :usage_change_percent' if attributes.key?(:'usageChangePercent') && attributes.key?(:'usage_change_percent')

      self.usage_change_percent = attributes[:'usage_change_percent'] if attributes[:'usage_change_percent']

      self.resource_name = attributes[:'resourceName'] if attributes[:'resourceName']

      raise 'You cannot provide both :resourceName and :resource_name' if attributes.key?(:'resourceName') && attributes.key?(:'resource_name')

      self.resource_name = attributes[:'resource_name'] if attributes[:'resource_name']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] resource_name Object to be assigned
    def resource_name=(resource_name)
      # rubocop:disable Style/ConditionalAssignment
      if resource_name && !RESOURCE_NAME_ENUM.include?(resource_name)
        OCI.logger.debug("Unknown value for 'resource_name' [" + resource_name + "]. Mapping to 'RESOURCE_NAME_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @resource_name = RESOURCE_NAME_UNKNOWN_ENUM_VALUE
      else
        @resource_name = resource_name
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        usage == other.usage &&
        capacity == other.capacity &&
        utilization_percent == other.utilization_percent &&
        usage_change_percent == other.usage_change_percent &&
        resource_name == other.resource_name
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
      [usage, capacity, utilization_percent, usage_change_percent, resource_name].hash
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
