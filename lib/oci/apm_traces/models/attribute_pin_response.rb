# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200630
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Response of an individual attribute item in the bulk pin operation.
  #
  class ApmTraces::Models::AttributePinResponse
    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_PIN = 'PIN'.freeze,
      OPERATION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ATTRIBUTE_NAME_SPACE_ENUM = [
      ATTRIBUTE_NAME_SPACE_TRACES = 'TRACES'.freeze,
      ATTRIBUTE_NAME_SPACE_SYNTHETIC = 'SYNTHETIC'.freeze,
      ATTRIBUTE_NAME_SPACE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ATTRIBUTE_STATUS_ENUM = [
      ATTRIBUTE_STATUS_ATTRIBUTE_ALREADY_PINNED = 'ATTRIBUTE_ALREADY_PINNED'.freeze,
      ATTRIBUTE_STATUS_ATTRIBUTE_PINNED = 'ATTRIBUTE_PINNED'.freeze,
      ATTRIBUTE_STATUS_PIN_NOT_ALLOWED = 'PIN_NOT_ALLOWED'.freeze,
      ATTRIBUTE_STATUS_DUPLICATE_ATTRIBUTE = 'DUPLICATE_ATTRIBUTE'.freeze,
      ATTRIBUTE_STATUS_INVALID_ATTRIBUTE = 'INVALID_ATTRIBUTE'.freeze,
      ATTRIBUTE_STATUS_ATTRIBUTE_NOT_PROCESSED = 'ATTRIBUTE_NOT_PROCESSED'.freeze,
      ATTRIBUTE_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Attribute that was pinned by this bulk operation.
    #
    # @return [String]
    attr_accessor :attribute_name

    # **[Required]** Notes added to this attribute.
    #
    # @return [String]
    attr_accessor :notes

    # **[Required]** Type of operation - pin.
    #
    # @return [String]
    attr_reader :operation_type

    # **[Required]** Namespace of the attribute whose properties were updated.  The attributeNameSpace will default to TRACES if it is
    # not passed in.
    #
    # @return [String]
    attr_reader :attribute_name_space

    # **[Required]** Status of the attribute after this operation.  The attribute can have one of the following statuses after the pin operation.  The attribute
    # can have either a success status or an error status.  The status of the attribute must be correlated with the operation status property in the bulk operation metadata
    # object.  The bulk operation will be successful only when all attributes in the bulk request are processed successfully and they get a success status back.
    # The following are successful status values of individual attribute items in a bulk attribute pin operation.
    # ATTRIBUTE_PINNED - The attribute is marked pinned and associated notes have been added.
    # ATTRIBUTE_ALREADY_PINNED - The caller is trying to pin an attribute that has already been pinned.
    # DUPLICATE_ATTRIBUTE - The attribute is a duplicate of an attribute that was present in this bulk request.  Note that we deduplicate the attribute collection, process only unique attributes,
    # and call out duplicates.  A duplicate attribute in a bulk request will not prevent the processing of further attributes in the bulk operation.
    # The following values are error statuses and the bulk processing is stopped when the first error is encountered.
    # PIN_NOT_ALLOWED - The caller has asked to pin an active attribute which is not allowed.
    # INVALID_ATTRIBUTE - The attribute is invalid.
    # ATTRIBUTE_NOT_PROCESSED - The attribute was not processed, as there was another attribute in this bulk request collection that resulted in a processing error.
    #
    # @return [String]
    attr_reader :attribute_status

    # **[Required]** Time when the attribute was activated or deactivated.  Note that ingest might not have picked up the changes even if this time has elapsed.
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'attribute_name': :'attributeName',
        'notes': :'notes',
        'operation_type': :'operationType',
        'attribute_name_space': :'attributeNameSpace',
        'attribute_status': :'attributeStatus',
        'time_updated': :'timeUpdated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'attribute_name': :'String',
        'notes': :'String',
        'operation_type': :'String',
        'attribute_name_space': :'String',
        'attribute_status': :'String',
        'time_updated': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :attribute_name The value to assign to the {#attribute_name} property
    # @option attributes [String] :notes The value to assign to the {#notes} property
    # @option attributes [String] :operation_type The value to assign to the {#operation_type} property
    # @option attributes [String] :attribute_name_space The value to assign to the {#attribute_name_space} property
    # @option attributes [String] :attribute_status The value to assign to the {#attribute_status} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.attribute_name = attributes[:'attributeName'] if attributes[:'attributeName']

      raise 'You cannot provide both :attributeName and :attribute_name' if attributes.key?(:'attributeName') && attributes.key?(:'attribute_name')

      self.attribute_name = attributes[:'attribute_name'] if attributes[:'attribute_name']

      self.notes = attributes[:'notes'] if attributes[:'notes']

      self.operation_type = attributes[:'operationType'] if attributes[:'operationType']

      raise 'You cannot provide both :operationType and :operation_type' if attributes.key?(:'operationType') && attributes.key?(:'operation_type')

      self.operation_type = attributes[:'operation_type'] if attributes[:'operation_type']

      self.attribute_name_space = attributes[:'attributeNameSpace'] if attributes[:'attributeNameSpace']
      self.attribute_name_space = "TRACES" if attribute_name_space.nil? && !attributes.key?(:'attributeNameSpace') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :attributeNameSpace and :attribute_name_space' if attributes.key?(:'attributeNameSpace') && attributes.key?(:'attribute_name_space')

      self.attribute_name_space = attributes[:'attribute_name_space'] if attributes[:'attribute_name_space']
      self.attribute_name_space = "TRACES" if attribute_name_space.nil? && !attributes.key?(:'attributeNameSpace') && !attributes.key?(:'attribute_name_space') # rubocop:disable Style/StringLiterals

      self.attribute_status = attributes[:'attributeStatus'] if attributes[:'attributeStatus']

      raise 'You cannot provide both :attributeStatus and :attribute_status' if attributes.key?(:'attributeStatus') && attributes.key?(:'attribute_status')

      self.attribute_status = attributes[:'attribute_status'] if attributes[:'attribute_status']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] attribute_name_space Object to be assigned
    def attribute_name_space=(attribute_name_space)
      # rubocop:disable Style/ConditionalAssignment
      if attribute_name_space && !ATTRIBUTE_NAME_SPACE_ENUM.include?(attribute_name_space)
        OCI.logger.debug("Unknown value for 'attribute_name_space' [" + attribute_name_space + "]. Mapping to 'ATTRIBUTE_NAME_SPACE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @attribute_name_space = ATTRIBUTE_NAME_SPACE_UNKNOWN_ENUM_VALUE
      else
        @attribute_name_space = attribute_name_space
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] attribute_status Object to be assigned
    def attribute_status=(attribute_status)
      # rubocop:disable Style/ConditionalAssignment
      if attribute_status && !ATTRIBUTE_STATUS_ENUM.include?(attribute_status)
        OCI.logger.debug("Unknown value for 'attribute_status' [" + attribute_status + "]. Mapping to 'ATTRIBUTE_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @attribute_status = ATTRIBUTE_STATUS_UNKNOWN_ENUM_VALUE
      else
        @attribute_status = attribute_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        attribute_name == other.attribute_name &&
        notes == other.notes &&
        operation_type == other.operation_type &&
        attribute_name_space == other.attribute_name_space &&
        attribute_status == other.attribute_status &&
        time_updated == other.time_updated
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
      [attribute_name, notes, operation_type, attribute_name_space, attribute_status, time_updated].hash
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