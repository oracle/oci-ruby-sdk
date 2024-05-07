# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200630
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A compute entity that can be imported into Operations Insights.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Opsi::Models::ImportableComputeEntitySummary
    ENTITY_SOURCE_ENUM = [
      ENTITY_SOURCE_MACS_MANAGED_EXTERNAL_HOST = 'MACS_MANAGED_EXTERNAL_HOST'.freeze,
      ENTITY_SOURCE_MACS_MANAGED_CLOUD_HOST = 'MACS_MANAGED_CLOUD_HOST'.freeze,
      ENTITY_SOURCE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Source of the importable agent entity.
    # @return [String]
    attr_reader :entity_source

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the Compute Instance
    # @return [String]
    attr_accessor :compute_id

    # **[Required]** The [Display Name](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm#Display) of the Compute Instance
    # @return [String]
    attr_accessor :compute_display_name

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'entity_source': :'entitySource',
        'compute_id': :'computeId',
        'compute_display_name': :'computeDisplayName',
        'compartment_id': :'compartmentId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'entity_source': :'String',
        'compute_id': :'String',
        'compute_display_name': :'String',
        'compartment_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'entitySource'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Opsi::Models::CloudImportableComputeEntitySummary' if type == 'MACS_MANAGED_CLOUD_HOST'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Opsi::Models::ImportableComputeEntitySummary'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :entity_source The value to assign to the {#entity_source} property
    # @option attributes [String] :compute_id The value to assign to the {#compute_id} property
    # @option attributes [String] :compute_display_name The value to assign to the {#compute_display_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.entity_source = attributes[:'entitySource'] if attributes[:'entitySource']

      raise 'You cannot provide both :entitySource and :entity_source' if attributes.key?(:'entitySource') && attributes.key?(:'entity_source')

      self.entity_source = attributes[:'entity_source'] if attributes[:'entity_source']

      self.compute_id = attributes[:'computeId'] if attributes[:'computeId']

      raise 'You cannot provide both :computeId and :compute_id' if attributes.key?(:'computeId') && attributes.key?(:'compute_id')

      self.compute_id = attributes[:'compute_id'] if attributes[:'compute_id']

      self.compute_display_name = attributes[:'computeDisplayName'] if attributes[:'computeDisplayName']

      raise 'You cannot provide both :computeDisplayName and :compute_display_name' if attributes.key?(:'computeDisplayName') && attributes.key?(:'compute_display_name')

      self.compute_display_name = attributes[:'compute_display_name'] if attributes[:'compute_display_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] entity_source Object to be assigned
    def entity_source=(entity_source)
      # rubocop:disable Style/ConditionalAssignment
      if entity_source && !ENTITY_SOURCE_ENUM.include?(entity_source)
        OCI.logger.debug("Unknown value for 'entity_source' [" + entity_source + "]. Mapping to 'ENTITY_SOURCE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @entity_source = ENTITY_SOURCE_UNKNOWN_ENUM_VALUE
      else
        @entity_source = entity_source
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        entity_source == other.entity_source &&
        compute_id == other.compute_id &&
        compute_display_name == other.compute_display_name &&
        compartment_id == other.compartment_id
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
      [entity_source, compute_id, compute_display_name, compartment_id].hash
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
