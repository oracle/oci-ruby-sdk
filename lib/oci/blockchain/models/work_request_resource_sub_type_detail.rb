# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # SubType information for a work request resource.
  class Blockchain::Models::WorkRequestResourceSubTypeDetail
    SUB_TYPE_STATUS_ENUM = [
      SUB_TYPE_STATUS_CREATED = 'CREATED'.freeze,
      SUB_TYPE_STATUS_UPDATED = 'UPDATED'.freeze,
      SUB_TYPE_STATUS_DELETED = 'DELETED'.freeze,
      SUB_TYPE_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Subtype of the work request resource like osn or peer.
    #
    # @return [String]
    attr_accessor :sub_type

    # **[Required]** The identifier of the resource subType.
    # @return [String]
    attr_accessor :sub_type_key

    # **[Required]** Status of the resource subType, as a result of the work tracked in this work request.
    # A resource subType would be CREATED, UPDATED or DELETED, after the work request is completed.
    #
    # @return [String]
    attr_reader :sub_type_status

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'sub_type': :'subType',
        'sub_type_key': :'subTypeKey',
        'sub_type_status': :'subTypeStatus'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'sub_type': :'String',
        'sub_type_key': :'String',
        'sub_type_status': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :sub_type The value to assign to the {#sub_type} property
    # @option attributes [String] :sub_type_key The value to assign to the {#sub_type_key} property
    # @option attributes [String] :sub_type_status The value to assign to the {#sub_type_status} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.sub_type = attributes[:'subType'] if attributes[:'subType']

      raise 'You cannot provide both :subType and :sub_type' if attributes.key?(:'subType') && attributes.key?(:'sub_type')

      self.sub_type = attributes[:'sub_type'] if attributes[:'sub_type']

      self.sub_type_key = attributes[:'subTypeKey'] if attributes[:'subTypeKey']

      raise 'You cannot provide both :subTypeKey and :sub_type_key' if attributes.key?(:'subTypeKey') && attributes.key?(:'sub_type_key')

      self.sub_type_key = attributes[:'sub_type_key'] if attributes[:'sub_type_key']

      self.sub_type_status = attributes[:'subTypeStatus'] if attributes[:'subTypeStatus']

      raise 'You cannot provide both :subTypeStatus and :sub_type_status' if attributes.key?(:'subTypeStatus') && attributes.key?(:'sub_type_status')

      self.sub_type_status = attributes[:'sub_type_status'] if attributes[:'sub_type_status']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] sub_type_status Object to be assigned
    def sub_type_status=(sub_type_status)
      # rubocop:disable Style/ConditionalAssignment
      if sub_type_status && !SUB_TYPE_STATUS_ENUM.include?(sub_type_status)
        OCI.logger.debug("Unknown value for 'sub_type_status' [" + sub_type_status + "]. Mapping to 'SUB_TYPE_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @sub_type_status = SUB_TYPE_STATUS_UNKNOWN_ENUM_VALUE
      else
        @sub_type_status = sub_type_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        sub_type == other.sub_type &&
        sub_type_key == other.sub_type_key &&
        sub_type_status == other.sub_type_status
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
      [sub_type, sub_type_key, sub_type_status].hash
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
