# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20190111
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of a resource under a service.
  #
  class Usage::Models::ResourceSummary
    USAGE_DATA_TYPE_ENUM = [
      USAGE_DATA_TYPE_INTERVAL = 'INTERVAL'.freeze,
      USAGE_DATA_TYPE_POINT_DATA = 'POINT_DATA'.freeze,
      USAGE_DATA_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Units to be used for daily aggregated data.
    # @return [String]
    attr_accessor :daily_unit_display_name

    # Units to be used for hourly aggregated data.
    # @return [String]
    attr_accessor :hourly_unit_display_name

    # Default units to use when unspecified.
    # @return [String]
    attr_accessor :raw_unit_display_name

    # Usage data type of the resource.
    # @return [String]
    attr_reader :usage_data_type

    # Name of the resource.
    # @return [String]
    attr_accessor :name

    # Name of the service.
    # @return [String]
    attr_accessor :servicename

    # Description of the resource.
    # @return [String]
    attr_accessor :description

    # Instance type for the resource.
    # @return [String]
    attr_accessor :instance_type

    # Indicates if the SKU was purchased
    # @return [BOOLEAN]
    attr_accessor :is_purchased

    # The details of any child resources.
    # @return [Array<String>]
    attr_accessor :child_resources

    # The details of resource Skus.
    # @return [Array<OCI::Usage::Models::SkuProducts>]
    attr_accessor :skus

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'daily_unit_display_name': :'dailyUnitDisplayName',
        'hourly_unit_display_name': :'hourlyUnitDisplayName',
        'raw_unit_display_name': :'rawUnitDisplayName',
        'usage_data_type': :'usageDataType',
        'name': :'name',
        'servicename': :'servicename',
        'description': :'description',
        'instance_type': :'instanceType',
        'is_purchased': :'isPurchased',
        'child_resources': :'childResources',
        'skus': :'skus'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'daily_unit_display_name': :'String',
        'hourly_unit_display_name': :'String',
        'raw_unit_display_name': :'String',
        'usage_data_type': :'String',
        'name': :'String',
        'servicename': :'String',
        'description': :'String',
        'instance_type': :'String',
        'is_purchased': :'BOOLEAN',
        'child_resources': :'Array<String>',
        'skus': :'Array<OCI::Usage::Models::SkuProducts>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :daily_unit_display_name The value to assign to the {#daily_unit_display_name} property
    # @option attributes [String] :hourly_unit_display_name The value to assign to the {#hourly_unit_display_name} property
    # @option attributes [String] :raw_unit_display_name The value to assign to the {#raw_unit_display_name} property
    # @option attributes [String] :usage_data_type The value to assign to the {#usage_data_type} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :servicename The value to assign to the {#servicename} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :instance_type The value to assign to the {#instance_type} property
    # @option attributes [BOOLEAN] :is_purchased The value to assign to the {#is_purchased} property
    # @option attributes [Array<String>] :child_resources The value to assign to the {#child_resources} property
    # @option attributes [Array<OCI::Usage::Models::SkuProducts>] :skus The value to assign to the {#skus} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.daily_unit_display_name = attributes[:'dailyUnitDisplayName'] if attributes[:'dailyUnitDisplayName']

      raise 'You cannot provide both :dailyUnitDisplayName and :daily_unit_display_name' if attributes.key?(:'dailyUnitDisplayName') && attributes.key?(:'daily_unit_display_name')

      self.daily_unit_display_name = attributes[:'daily_unit_display_name'] if attributes[:'daily_unit_display_name']

      self.hourly_unit_display_name = attributes[:'hourlyUnitDisplayName'] if attributes[:'hourlyUnitDisplayName']

      raise 'You cannot provide both :hourlyUnitDisplayName and :hourly_unit_display_name' if attributes.key?(:'hourlyUnitDisplayName') && attributes.key?(:'hourly_unit_display_name')

      self.hourly_unit_display_name = attributes[:'hourly_unit_display_name'] if attributes[:'hourly_unit_display_name']

      self.raw_unit_display_name = attributes[:'rawUnitDisplayName'] if attributes[:'rawUnitDisplayName']

      raise 'You cannot provide both :rawUnitDisplayName and :raw_unit_display_name' if attributes.key?(:'rawUnitDisplayName') && attributes.key?(:'raw_unit_display_name')

      self.raw_unit_display_name = attributes[:'raw_unit_display_name'] if attributes[:'raw_unit_display_name']

      self.usage_data_type = attributes[:'usageDataType'] if attributes[:'usageDataType']

      raise 'You cannot provide both :usageDataType and :usage_data_type' if attributes.key?(:'usageDataType') && attributes.key?(:'usage_data_type')

      self.usage_data_type = attributes[:'usage_data_type'] if attributes[:'usage_data_type']

      self.name = attributes[:'name'] if attributes[:'name']

      self.servicename = attributes[:'servicename'] if attributes[:'servicename']

      self.description = attributes[:'description'] if attributes[:'description']

      self.instance_type = attributes[:'instanceType'] if attributes[:'instanceType']

      raise 'You cannot provide both :instanceType and :instance_type' if attributes.key?(:'instanceType') && attributes.key?(:'instance_type')

      self.instance_type = attributes[:'instance_type'] if attributes[:'instance_type']

      self.is_purchased = attributes[:'isPurchased'] unless attributes[:'isPurchased'].nil?
      self.is_purchased = false if is_purchased.nil? && !attributes.key?(:'isPurchased') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isPurchased and :is_purchased' if attributes.key?(:'isPurchased') && attributes.key?(:'is_purchased')

      self.is_purchased = attributes[:'is_purchased'] unless attributes[:'is_purchased'].nil?
      self.is_purchased = false if is_purchased.nil? && !attributes.key?(:'isPurchased') && !attributes.key?(:'is_purchased') # rubocop:disable Style/StringLiterals

      self.child_resources = attributes[:'childResources'] if attributes[:'childResources']

      raise 'You cannot provide both :childResources and :child_resources' if attributes.key?(:'childResources') && attributes.key?(:'child_resources')

      self.child_resources = attributes[:'child_resources'] if attributes[:'child_resources']

      self.skus = attributes[:'skus'] if attributes[:'skus']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] usage_data_type Object to be assigned
    def usage_data_type=(usage_data_type)
      # rubocop:disable Style/ConditionalAssignment
      if usage_data_type && !USAGE_DATA_TYPE_ENUM.include?(usage_data_type)
        OCI.logger.debug("Unknown value for 'usage_data_type' [" + usage_data_type + "]. Mapping to 'USAGE_DATA_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @usage_data_type = USAGE_DATA_TYPE_UNKNOWN_ENUM_VALUE
      else
        @usage_data_type = usage_data_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        daily_unit_display_name == other.daily_unit_display_name &&
        hourly_unit_display_name == other.hourly_unit_display_name &&
        raw_unit_display_name == other.raw_unit_display_name &&
        usage_data_type == other.usage_data_type &&
        name == other.name &&
        servicename == other.servicename &&
        description == other.description &&
        instance_type == other.instance_type &&
        is_purchased == other.is_purchased &&
        child_resources == other.child_resources &&
        skus == other.skus
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
      [daily_unit_display_name, hourly_unit_display_name, raw_unit_display_name, usage_data_type, name, servicename, description, instance_type, is_purchased, child_resources, skus].hash
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
