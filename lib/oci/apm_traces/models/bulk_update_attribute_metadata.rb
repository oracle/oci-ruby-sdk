# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200630
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Metadata about the bulk attribute update operation.  The bulk attribute update operation is atomic and binary.  If the processing of any of the attributes
  # in the bulk attribute update request results in a processing or validation error, then none of the attributes updated.
  #
  class ApmTraces::Models::BulkUpdateAttributeMetadata
    OPERATION_STATUS_ENUM = [
      OPERATION_STATUS_SUCCESS = 'SUCCESS'.freeze,
      OPERATION_STATUS_EMPTY_ATTRIBUTE_LIST = 'EMPTY_ATTRIBUTE_LIST'.freeze,
      OPERATION_STATUS_INVALID_BULK_REQUEST = 'INVALID_BULK_REQUEST'.freeze,
      OPERATION_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_UPDATE_ATTRIBUTE_PROPERTIES = 'UPDATE_ATTRIBUTE_PROPERTIES'.freeze,
      OPERATION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Operation status of the bulk update attribute operation.
    # SUCCESS - The bulk attribute update request has succeeded and all the attributes in the request have been updated.
    # The following are error statuses for the bulk update attributes operation.
    # EMPTY_ATTRIBUTE_LIST - The bulk update attributes request object was empty and did not contain any attributes for which properties had to be updated.
    # INVALID_BULK_REQUEST - The bulk request contains invalid attribute(s), or attribute(s) that resulted in a validation error, or an attribute that resulted
    # in a processing error.
    #
    # @return [String]
    attr_reader :operation_status

    # **[Required]** Type of operation.
    #
    # @return [String]
    attr_reader :operation_type

    # **[Required]** Total number attributes (both string and numeric) in TRACES namespace for which properties were updated.
    #
    # @return [Integer]
    attr_accessor :attributes_updated

    # Total number attributes (both string and numeric) in SYNTHETIC namespace for which properties were updated.
    #
    # @return [Integer]
    attr_accessor :synthetic_attributes_updated

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'operation_status': :'operationStatus',
        'operation_type': :'operationType',
        'attributes_updated': :'attributesUpdated',
        'synthetic_attributes_updated': :'syntheticAttributesUpdated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'operation_status': :'String',
        'operation_type': :'String',
        'attributes_updated': :'Integer',
        'synthetic_attributes_updated': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :operation_status The value to assign to the {#operation_status} property
    # @option attributes [String] :operation_type The value to assign to the {#operation_type} property
    # @option attributes [Integer] :attributes_updated The value to assign to the {#attributes_updated} property
    # @option attributes [Integer] :synthetic_attributes_updated The value to assign to the {#synthetic_attributes_updated} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.operation_status = attributes[:'operationStatus'] if attributes[:'operationStatus']

      raise 'You cannot provide both :operationStatus and :operation_status' if attributes.key?(:'operationStatus') && attributes.key?(:'operation_status')

      self.operation_status = attributes[:'operation_status'] if attributes[:'operation_status']

      self.operation_type = attributes[:'operationType'] if attributes[:'operationType']

      raise 'You cannot provide both :operationType and :operation_type' if attributes.key?(:'operationType') && attributes.key?(:'operation_type')

      self.operation_type = attributes[:'operation_type'] if attributes[:'operation_type']

      self.attributes_updated = attributes[:'attributesUpdated'] if attributes[:'attributesUpdated']

      raise 'You cannot provide both :attributesUpdated and :attributes_updated' if attributes.key?(:'attributesUpdated') && attributes.key?(:'attributes_updated')

      self.attributes_updated = attributes[:'attributes_updated'] if attributes[:'attributes_updated']

      self.synthetic_attributes_updated = attributes[:'syntheticAttributesUpdated'] if attributes[:'syntheticAttributesUpdated']

      raise 'You cannot provide both :syntheticAttributesUpdated and :synthetic_attributes_updated' if attributes.key?(:'syntheticAttributesUpdated') && attributes.key?(:'synthetic_attributes_updated')

      self.synthetic_attributes_updated = attributes[:'synthetic_attributes_updated'] if attributes[:'synthetic_attributes_updated']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] operation_status Object to be assigned
    def operation_status=(operation_status)
      # rubocop:disable Style/ConditionalAssignment
      if operation_status && !OPERATION_STATUS_ENUM.include?(operation_status)
        OCI.logger.debug("Unknown value for 'operation_status' [" + operation_status + "]. Mapping to 'OPERATION_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @operation_status = OPERATION_STATUS_UNKNOWN_ENUM_VALUE
      else
        @operation_status = operation_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] operation_type Object to be assigned
    def operation_type=(operation_type)
      # rubocop:disable Style/ConditionalAssignment
      if operation_type && !OPERATION_TYPE_ENUM.include?(operation_type)
        OCI.logger.debug("Unknown value for 'operation_type' [" + operation_type + "]. Mapping to 'OPERATION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @operation_type = OPERATION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @operation_type = operation_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        operation_status == other.operation_status &&
        operation_type == other.operation_type &&
        attributes_updated == other.attributes_updated &&
        synthetic_attributes_updated == other.synthetic_attributes_updated
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
      [operation_status, operation_type, attributes_updated, synthetic_attributes_updated].hash
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
