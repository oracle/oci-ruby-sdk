# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200630
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Metadata about the bulk activation operation.  The bulk activation operation is atomic and binary.  If the processing of any of the attributes in the bulk
  # activation request results in a processing or validation error, then none of the attributes in the request are activated.  The bulk activation request succeeds
  # only when all the attributes in the bulk activation request are processed and they get a successful attributeStatus back.
  #
  class ApmTraces::Models::BulkActivationMetadata
    OPERATION_STATUS_ENUM = [
      OPERATION_STATUS_SUCCESS = 'SUCCESS'.freeze,
      OPERATION_STATUS_EMPTY_ATTRIBUTE_LIST = 'EMPTY_ATTRIBUTE_LIST'.freeze,
      OPERATION_STATUS_NUMERIC_ATTRIBUTE_LIMIT_EXCEEDED = 'NUMERIC_ATTRIBUTE_LIMIT_EXCEEDED'.freeze,
      OPERATION_STATUS_STRING_ATTRIBUTE_LIMIT_EXCEEDED = 'STRING_ATTRIBUTE_LIMIT_EXCEEDED'.freeze,
      OPERATION_STATUS_INSUFFICIENT_STRING_SPACE = 'INSUFFICIENT_STRING_SPACE'.freeze,
      OPERATION_STATUS_INSUFFICIENT_NUMERIC_SPACE = 'INSUFFICIENT_NUMERIC_SPACE'.freeze,
      OPERATION_STATUS_INVALID_BULK_REQUEST = 'INVALID_BULK_REQUEST'.freeze,
      OPERATION_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_ACTIVATE = 'ACTIVATE'.freeze,
      OPERATION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Operation status of the bulk activation operation.  The bulk  activation operation could have either a success or an error status as defined below.
    # The following is a success status for the bulk activation operation.
    # SUCCESS - The bulk activation operation has succeeded and all the attributes in the bulk activation request have been activated by this operation or activated earlier.
    # The following are error statuses for the bulk activation operation.  Note that none of the attributes (string or numeric) in the bulk request have been activated by this bulk
    # activation operation if any of the below statuses.
    # EMPTY_ATTRIBUTE_LIST - The bulk activation request object was empty and did not contain any attributes to be activated.
    # NUMERIC_ATTRIBUTE_LIMIT_EXCEEDED - The number of numeric attributes in the bulk request exceeded the maximum limit (100) of numeric attributes that could be activated in the APM Domain.
    # STRING_ATTRIBUTE_LIMIT_EXCEEDED - The number of string attributes in the bulk request exceeded the maximum limit (700) of string attributes that could be activated in the APM Domain.
    # INSUFFICIENT_STRING_SPACE - There are not enough free slots available in the APM Domain to activate the string attributes present in the bulk request.
    # INSUFFICIENT_NUMERIC_SPACE - There are not enough free slots available in the APM Domain to activate the numeric attributes present in the bulk request.
    # INVALID_BULK_REQUEST - The bulk request contains invalid attribute(s), or attribute(s) that resulted in a validation error, or an attribute that resulted
    # in a processing error.
    #
    # @return [String]
    attr_reader :operation_status

    # **[Required]** Type of operation.
    #
    # @return [String]
    attr_reader :operation_type

    # Total number of string attributes in TRACES namespace that were activated.
    #
    # @return [Integer]
    attr_accessor :string_attributes_activated

    # Total number of numeric attributes in TRACES namespace that were activated.
    #
    # @return [Integer]
    attr_accessor :numeric_attributes_activated

    # Total number of string attributes in SYNTHETIC namespace that were activated.
    #
    # @return [Integer]
    attr_accessor :synthetic_string_attributes_activated

    # Total number of numeric attributes in SYNTHETIC namespace that were activated.
    #
    # @return [Integer]
    attr_accessor :synthetic_numeric_attributes_activated

    # Total number of free slots available to activate string attributes in the TRACES namespace in the APM Domain.  Note that if a bulk request has succeeded, this
    # number reflects the total number of free slots available for activation of additional string attributes in the TRACES namespace in the APM Domain.
    #
    # @return [Integer]
    attr_accessor :available_string_attributes

    # Total number of free slots available to activate numeric attributes in the TRACES namespace in the APM Domain.  Note that if a bulk request has succeeded, this
    # number reflects the total number of free slots available for activation of additional numeric attributes in the TRACES namespace in the APM Domain.
    #
    # @return [Integer]
    attr_accessor :available_numeric_attributes

    # Total number of free slots available to activate string attributes in the SYNTHETIC namespace in the APM Domain.  Note that if a bulk request has succeeded, this
    # number reflects the total number of free synthetic slots available for activation of additional string attributes in the SYNTHETIC namespace in the APM Domain.
    #
    # @return [Integer]
    attr_accessor :available_synthetic_string_attributes

    # Total number of free slots available to activate numeric attributes in the SYNTHETIC namespace in the APM Domain.  Note that if a bulk request has succeeded, this
    # number reflects the total number of free synthetic slots available for activation of additional numeric attributes in the SYNTHETIC namespace in the APM Domain.
    #
    # @return [Integer]
    attr_accessor :available_synthetic_numeric_attributes

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'operation_status': :'operationStatus',
        'operation_type': :'operationType',
        'string_attributes_activated': :'stringAttributesActivated',
        'numeric_attributes_activated': :'numericAttributesActivated',
        'synthetic_string_attributes_activated': :'syntheticStringAttributesActivated',
        'synthetic_numeric_attributes_activated': :'syntheticNumericAttributesActivated',
        'available_string_attributes': :'availableStringAttributes',
        'available_numeric_attributes': :'availableNumericAttributes',
        'available_synthetic_string_attributes': :'availableSyntheticStringAttributes',
        'available_synthetic_numeric_attributes': :'availableSyntheticNumericAttributes'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'operation_status': :'String',
        'operation_type': :'String',
        'string_attributes_activated': :'Integer',
        'numeric_attributes_activated': :'Integer',
        'synthetic_string_attributes_activated': :'Integer',
        'synthetic_numeric_attributes_activated': :'Integer',
        'available_string_attributes': :'Integer',
        'available_numeric_attributes': :'Integer',
        'available_synthetic_string_attributes': :'Integer',
        'available_synthetic_numeric_attributes': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :operation_status The value to assign to the {#operation_status} property
    # @option attributes [String] :operation_type The value to assign to the {#operation_type} property
    # @option attributes [Integer] :string_attributes_activated The value to assign to the {#string_attributes_activated} property
    # @option attributes [Integer] :numeric_attributes_activated The value to assign to the {#numeric_attributes_activated} property
    # @option attributes [Integer] :synthetic_string_attributes_activated The value to assign to the {#synthetic_string_attributes_activated} property
    # @option attributes [Integer] :synthetic_numeric_attributes_activated The value to assign to the {#synthetic_numeric_attributes_activated} property
    # @option attributes [Integer] :available_string_attributes The value to assign to the {#available_string_attributes} property
    # @option attributes [Integer] :available_numeric_attributes The value to assign to the {#available_numeric_attributes} property
    # @option attributes [Integer] :available_synthetic_string_attributes The value to assign to the {#available_synthetic_string_attributes} property
    # @option attributes [Integer] :available_synthetic_numeric_attributes The value to assign to the {#available_synthetic_numeric_attributes} property
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

      self.string_attributes_activated = attributes[:'stringAttributesActivated'] if attributes[:'stringAttributesActivated']

      raise 'You cannot provide both :stringAttributesActivated and :string_attributes_activated' if attributes.key?(:'stringAttributesActivated') && attributes.key?(:'string_attributes_activated')

      self.string_attributes_activated = attributes[:'string_attributes_activated'] if attributes[:'string_attributes_activated']

      self.numeric_attributes_activated = attributes[:'numericAttributesActivated'] if attributes[:'numericAttributesActivated']

      raise 'You cannot provide both :numericAttributesActivated and :numeric_attributes_activated' if attributes.key?(:'numericAttributesActivated') && attributes.key?(:'numeric_attributes_activated')

      self.numeric_attributes_activated = attributes[:'numeric_attributes_activated'] if attributes[:'numeric_attributes_activated']

      self.synthetic_string_attributes_activated = attributes[:'syntheticStringAttributesActivated'] if attributes[:'syntheticStringAttributesActivated']

      raise 'You cannot provide both :syntheticStringAttributesActivated and :synthetic_string_attributes_activated' if attributes.key?(:'syntheticStringAttributesActivated') && attributes.key?(:'synthetic_string_attributes_activated')

      self.synthetic_string_attributes_activated = attributes[:'synthetic_string_attributes_activated'] if attributes[:'synthetic_string_attributes_activated']

      self.synthetic_numeric_attributes_activated = attributes[:'syntheticNumericAttributesActivated'] if attributes[:'syntheticNumericAttributesActivated']

      raise 'You cannot provide both :syntheticNumericAttributesActivated and :synthetic_numeric_attributes_activated' if attributes.key?(:'syntheticNumericAttributesActivated') && attributes.key?(:'synthetic_numeric_attributes_activated')

      self.synthetic_numeric_attributes_activated = attributes[:'synthetic_numeric_attributes_activated'] if attributes[:'synthetic_numeric_attributes_activated']

      self.available_string_attributes = attributes[:'availableStringAttributes'] if attributes[:'availableStringAttributes']

      raise 'You cannot provide both :availableStringAttributes and :available_string_attributes' if attributes.key?(:'availableStringAttributes') && attributes.key?(:'available_string_attributes')

      self.available_string_attributes = attributes[:'available_string_attributes'] if attributes[:'available_string_attributes']

      self.available_numeric_attributes = attributes[:'availableNumericAttributes'] if attributes[:'availableNumericAttributes']

      raise 'You cannot provide both :availableNumericAttributes and :available_numeric_attributes' if attributes.key?(:'availableNumericAttributes') && attributes.key?(:'available_numeric_attributes')

      self.available_numeric_attributes = attributes[:'available_numeric_attributes'] if attributes[:'available_numeric_attributes']

      self.available_synthetic_string_attributes = attributes[:'availableSyntheticStringAttributes'] if attributes[:'availableSyntheticStringAttributes']

      raise 'You cannot provide both :availableSyntheticStringAttributes and :available_synthetic_string_attributes' if attributes.key?(:'availableSyntheticStringAttributes') && attributes.key?(:'available_synthetic_string_attributes')

      self.available_synthetic_string_attributes = attributes[:'available_synthetic_string_attributes'] if attributes[:'available_synthetic_string_attributes']

      self.available_synthetic_numeric_attributes = attributes[:'availableSyntheticNumericAttributes'] if attributes[:'availableSyntheticNumericAttributes']

      raise 'You cannot provide both :availableSyntheticNumericAttributes and :available_synthetic_numeric_attributes' if attributes.key?(:'availableSyntheticNumericAttributes') && attributes.key?(:'available_synthetic_numeric_attributes')

      self.available_synthetic_numeric_attributes = attributes[:'available_synthetic_numeric_attributes'] if attributes[:'available_synthetic_numeric_attributes']
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
        string_attributes_activated == other.string_attributes_activated &&
        numeric_attributes_activated == other.numeric_attributes_activated &&
        synthetic_string_attributes_activated == other.synthetic_string_attributes_activated &&
        synthetic_numeric_attributes_activated == other.synthetic_numeric_attributes_activated &&
        available_string_attributes == other.available_string_attributes &&
        available_numeric_attributes == other.available_numeric_attributes &&
        available_synthetic_string_attributes == other.available_synthetic_string_attributes &&
        available_synthetic_numeric_attributes == other.available_synthetic_numeric_attributes
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
      [operation_status, operation_type, string_attributes_activated, numeric_attributes_activated, synthetic_string_attributes_activated, synthetic_numeric_attributes_activated, available_string_attributes, available_numeric_attributes, available_synthetic_string_attributes, available_synthetic_numeric_attributes].hash
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