# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200630
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Usage data per filesystem.
  class Opsi::Models::StorageUsageTrendAggregation
    # **[Required]** Name of filesystem.
    # @return [String]
    attr_accessor :file_system_name

    # **[Required]** Mount points are specialized NTFS filesystem objects.
    # @return [String]
    attr_accessor :mount_point

    # **[Required]** Size of filesystem.
    # @return [Float]
    attr_accessor :file_system_size_in_gbs

    # **[Required]** List of usage data samples for a filesystem.
    # @return [Array<OCI::Opsi::Models::StorageUsageTrend>]
    attr_accessor :usage_data

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'file_system_name': :'fileSystemName',
        'mount_point': :'mountPoint',
        'file_system_size_in_gbs': :'fileSystemSizeInGBs',
        'usage_data': :'usageData'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'file_system_name': :'String',
        'mount_point': :'String',
        'file_system_size_in_gbs': :'Float',
        'usage_data': :'Array<OCI::Opsi::Models::StorageUsageTrend>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :file_system_name The value to assign to the {#file_system_name} property
    # @option attributes [String] :mount_point The value to assign to the {#mount_point} property
    # @option attributes [Float] :file_system_size_in_gbs The value to assign to the {#file_system_size_in_gbs} property
    # @option attributes [Array<OCI::Opsi::Models::StorageUsageTrend>] :usage_data The value to assign to the {#usage_data} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.file_system_name = attributes[:'fileSystemName'] if attributes[:'fileSystemName']

      raise 'You cannot provide both :fileSystemName and :file_system_name' if attributes.key?(:'fileSystemName') && attributes.key?(:'file_system_name')

      self.file_system_name = attributes[:'file_system_name'] if attributes[:'file_system_name']

      self.mount_point = attributes[:'mountPoint'] if attributes[:'mountPoint']

      raise 'You cannot provide both :mountPoint and :mount_point' if attributes.key?(:'mountPoint') && attributes.key?(:'mount_point')

      self.mount_point = attributes[:'mount_point'] if attributes[:'mount_point']

      self.file_system_size_in_gbs = attributes[:'fileSystemSizeInGBs'] if attributes[:'fileSystemSizeInGBs']

      raise 'You cannot provide both :fileSystemSizeInGBs and :file_system_size_in_gbs' if attributes.key?(:'fileSystemSizeInGBs') && attributes.key?(:'file_system_size_in_gbs')

      self.file_system_size_in_gbs = attributes[:'file_system_size_in_gbs'] if attributes[:'file_system_size_in_gbs']

      self.usage_data = attributes[:'usageData'] if attributes[:'usageData']

      raise 'You cannot provide both :usageData and :usage_data' if attributes.key?(:'usageData') && attributes.key?(:'usage_data')

      self.usage_data = attributes[:'usage_data'] if attributes[:'usage_data']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        file_system_name == other.file_system_name &&
        mount_point == other.mount_point &&
        file_system_size_in_gbs == other.file_system_size_in_gbs &&
        usage_data == other.usage_data
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
      [file_system_name, mount_point, file_system_size_in_gbs, usage_data].hash
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
