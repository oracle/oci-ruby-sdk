# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The custom table for Cost Analysis UI rendering.
  class UsageApi::Models::SavedCustomTable
    # **[Required]** the name of custom table.
    # @return [String]
    attr_accessor :display_name

    # row groupBy key list.
    # example:
    #   `[\"tagNamespace\", \"tagKey\", \"tagValue\", \"service\", \"skuName\", \"skuPartNumber\", \"unit\",
    #     \"compartmentName\", \"compartmentPath\", \"compartmentId\", \"platform\", \"region\", \"logicalAd\",
    #     \"resourceId\", \"tenantId\", \"tenantName\"]`
    #
    # @return [Array<String>]
    attr_accessor :row_group_by

    # column groupBy key list.
    # example:
    #   `[\"tagNamespace\", \"tagKey\", \"tagValue\", \"service\", \"skuName\", \"skuPartNumber\", \"unit\",
    #     \"compartmentName\", \"compartmentPath\", \"compartmentId\", \"platform\", \"region\", \"logicalAd\",
    #     \"resourceId\", \"tenantId\", \"tenantName\"]`
    #
    # @return [Array<String>]
    attr_accessor :column_group_by

    # GroupBy a specific tagKey. Provide tagNamespace and tagKey in tag object. Only support one tag in the list
    # example:
    #   `[{\"namespace\":\"oracle\", \"key\":\"createdBy\"]`
    #
    # @return [Array<OCI::UsageApi::Models::Tag>]
    attr_accessor :group_by_tag

    # The compartment depth level.
    # @return [Float]
    attr_accessor :compartment_depth

    # the version of custom table.
    # @return [Float]
    attr_accessor :version

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'row_group_by': :'rowGroupBy',
        'column_group_by': :'columnGroupBy',
        'group_by_tag': :'groupByTag',
        'compartment_depth': :'compartmentDepth',
        'version': :'version'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'row_group_by': :'Array<String>',
        'column_group_by': :'Array<String>',
        'group_by_tag': :'Array<OCI::UsageApi::Models::Tag>',
        'compartment_depth': :'Float',
        'version': :'Float'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Array<String>] :row_group_by The value to assign to the {#row_group_by} property
    # @option attributes [Array<String>] :column_group_by The value to assign to the {#column_group_by} property
    # @option attributes [Array<OCI::UsageApi::Models::Tag>] :group_by_tag The value to assign to the {#group_by_tag} property
    # @option attributes [Float] :compartment_depth The value to assign to the {#compartment_depth} property
    # @option attributes [Float] :version The value to assign to the {#version} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.row_group_by = attributes[:'rowGroupBy'] if attributes[:'rowGroupBy']

      raise 'You cannot provide both :rowGroupBy and :row_group_by' if attributes.key?(:'rowGroupBy') && attributes.key?(:'row_group_by')

      self.row_group_by = attributes[:'row_group_by'] if attributes[:'row_group_by']

      self.column_group_by = attributes[:'columnGroupBy'] if attributes[:'columnGroupBy']

      raise 'You cannot provide both :columnGroupBy and :column_group_by' if attributes.key?(:'columnGroupBy') && attributes.key?(:'column_group_by')

      self.column_group_by = attributes[:'column_group_by'] if attributes[:'column_group_by']

      self.group_by_tag = attributes[:'groupByTag'] if attributes[:'groupByTag']

      raise 'You cannot provide both :groupByTag and :group_by_tag' if attributes.key?(:'groupByTag') && attributes.key?(:'group_by_tag')

      self.group_by_tag = attributes[:'group_by_tag'] if attributes[:'group_by_tag']

      self.compartment_depth = attributes[:'compartmentDepth'] if attributes[:'compartmentDepth']

      raise 'You cannot provide both :compartmentDepth and :compartment_depth' if attributes.key?(:'compartmentDepth') && attributes.key?(:'compartment_depth')

      self.compartment_depth = attributes[:'compartment_depth'] if attributes[:'compartment_depth']

      self.version = attributes[:'version'] if attributes[:'version']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        row_group_by == other.row_group_by &&
        column_group_by == other.column_group_by &&
        group_by_tag == other.group_by_tag &&
        compartment_depth == other.compartment_depth &&
        version == other.version
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
      [display_name, row_group_by, column_group_by, group_by_tag, compartment_depth, version].hash
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
