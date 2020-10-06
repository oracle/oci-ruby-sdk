# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A Single Entity Type Definition
  class LogAnalytics::Models::OutOfBoxEntityTypeDetails
    CLOUD_TYPE_ENUM = [
      CLOUD_TYPE_CLOUD = 'CLOUD'.freeze,
      CLOUD_TYPE_NON_CLOUD = 'NON_CLOUD'.freeze
    ].freeze

    # **[Required]** Log analytics entity type name.
    #
    # @return [String]
    attr_accessor :name

    # **[Required]** Internal name for the log analytics entity type.
    #
    # @return [String]
    attr_accessor :internal_name

    # **[Required]** Log analytics entity type category. Category will be used for grouping and filtering.
    #
    # @return [String]
    attr_accessor :category

    # **[Required]** Log analytics entity type group. Supported values: ClOUD, NON_CLOUD.
    #
    # @return [String]
    attr_reader :cloud_type

    # A Single Entity Type Property Definition
    # @return [Array<OCI::LogAnalytics::Models::EntityTypeProperty>]
    attr_accessor :properties

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'internal_name': :'internalName',
        'category': :'category',
        'cloud_type': :'cloudType',
        'properties': :'properties'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'internal_name': :'String',
        'category': :'String',
        'cloud_type': :'String',
        'properties': :'Array<OCI::LogAnalytics::Models::EntityTypeProperty>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :internal_name The value to assign to the {#internal_name} property
    # @option attributes [String] :category The value to assign to the {#category} property
    # @option attributes [String] :cloud_type The value to assign to the {#cloud_type} property
    # @option attributes [Array<OCI::LogAnalytics::Models::EntityTypeProperty>] :properties The value to assign to the {#properties} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.internal_name = attributes[:'internalName'] if attributes[:'internalName']

      raise 'You cannot provide both :internalName and :internal_name' if attributes.key?(:'internalName') && attributes.key?(:'internal_name')

      self.internal_name = attributes[:'internal_name'] if attributes[:'internal_name']

      self.category = attributes[:'category'] if attributes[:'category']

      self.cloud_type = attributes[:'cloudType'] if attributes[:'cloudType']
      self.cloud_type = "NON_CLOUD" if cloud_type.nil? && !attributes.key?(:'cloudType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :cloudType and :cloud_type' if attributes.key?(:'cloudType') && attributes.key?(:'cloud_type')

      self.cloud_type = attributes[:'cloud_type'] if attributes[:'cloud_type']
      self.cloud_type = "NON_CLOUD" if cloud_type.nil? && !attributes.key?(:'cloudType') && !attributes.key?(:'cloud_type') # rubocop:disable Style/StringLiterals

      self.properties = attributes[:'properties'] if attributes[:'properties']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] cloud_type Object to be assigned
    def cloud_type=(cloud_type)
      raise "Invalid value for 'cloud_type': this must be one of the values in CLOUD_TYPE_ENUM." if cloud_type && !CLOUD_TYPE_ENUM.include?(cloud_type)

      @cloud_type = cloud_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        internal_name == other.internal_name &&
        category == other.category &&
        cloud_type == other.cloud_type &&
        properties == other.properties
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
      [name, internal_name, category, cloud_type, properties].hash
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
