# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210610
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Diagnosis of a resource needed by the fleet.
  class Jms::Models::FleetDiagnosisSummary
    RESOURCE_TYPE_ENUM = [
      RESOURCE_TYPE_INVENTORY_LOG = 'INVENTORY_LOG'.freeze,
      RESOURCE_TYPE_OPERATION_LOG = 'OPERATION_LOG'.freeze,
      RESOURCE_TYPE_CRYPTO_SUMMARIZED_LOG = 'CRYPTO_SUMMARIZED_LOG'.freeze,
      RESOURCE_TYPE_ANALYSIS_OSS_BUCKET = 'ANALYSIS_OSS_BUCKET'.freeze,
      RESOURCE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    RESOURCE_STATE_ENUM = [
      RESOURCE_STATE_ACTIVE = 'ACTIVE'.freeze,
      RESOURCE_STATE_INACTIVE = 'INACTIVE'.freeze,
      RESOURCE_STATE_NOT_FOUND = 'NOT_FOUND'.freeze,
      RESOURCE_STATE_OTHER = 'OTHER'.freeze,
      RESOURCE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The type of the resource needed by the fleet.
    # This is the role of a resource in the fleet. Use the OCID to determine the actual OCI
    # resource type such as log group or log.
    #
    # @return [String]
    attr_reader :resource_type

    # The OCID of the external resouce needed by the fleet.
    # @return [String]
    attr_accessor :resource_id

    # The state of the resource. The resource state is ACTIVE when it works properly for the fleet.
    # In case it would cause an issue for the fleet function, the state is INACTIVE.
    # When JMS can't locate the resource, the state is NOT_FOUND.
    # OTHER covers other cases, such as a temporarily network issue that prevents JMS from detecting the
    # resource. Check the resourceDiagnosis for details.
    #
    # @return [String]
    attr_reader :resource_state

    # The diagnosis message.
    # @return [String]
    attr_accessor :resource_diagnosis

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'resource_type': :'resourceType',
        'resource_id': :'resourceId',
        'resource_state': :'resourceState',
        'resource_diagnosis': :'resourceDiagnosis'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'resource_type': :'String',
        'resource_id': :'String',
        'resource_state': :'String',
        'resource_diagnosis': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :resource_type The value to assign to the {#resource_type} property
    # @option attributes [String] :resource_id The value to assign to the {#resource_id} property
    # @option attributes [String] :resource_state The value to assign to the {#resource_state} property
    # @option attributes [String] :resource_diagnosis The value to assign to the {#resource_diagnosis} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.resource_type = attributes[:'resourceType'] if attributes[:'resourceType']

      raise 'You cannot provide both :resourceType and :resource_type' if attributes.key?(:'resourceType') && attributes.key?(:'resource_type')

      self.resource_type = attributes[:'resource_type'] if attributes[:'resource_type']

      self.resource_id = attributes[:'resourceId'] if attributes[:'resourceId']

      raise 'You cannot provide both :resourceId and :resource_id' if attributes.key?(:'resourceId') && attributes.key?(:'resource_id')

      self.resource_id = attributes[:'resource_id'] if attributes[:'resource_id']

      self.resource_state = attributes[:'resourceState'] if attributes[:'resourceState']

      raise 'You cannot provide both :resourceState and :resource_state' if attributes.key?(:'resourceState') && attributes.key?(:'resource_state')

      self.resource_state = attributes[:'resource_state'] if attributes[:'resource_state']

      self.resource_diagnosis = attributes[:'resourceDiagnosis'] if attributes[:'resourceDiagnosis']

      raise 'You cannot provide both :resourceDiagnosis and :resource_diagnosis' if attributes.key?(:'resourceDiagnosis') && attributes.key?(:'resource_diagnosis')

      self.resource_diagnosis = attributes[:'resource_diagnosis'] if attributes[:'resource_diagnosis']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] resource_type Object to be assigned
    def resource_type=(resource_type)
      # rubocop:disable Style/ConditionalAssignment
      if resource_type && !RESOURCE_TYPE_ENUM.include?(resource_type)
        OCI.logger.debug("Unknown value for 'resource_type' [" + resource_type + "]. Mapping to 'RESOURCE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @resource_type = RESOURCE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @resource_type = resource_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] resource_state Object to be assigned
    def resource_state=(resource_state)
      # rubocop:disable Style/ConditionalAssignment
      if resource_state && !RESOURCE_STATE_ENUM.include?(resource_state)
        OCI.logger.debug("Unknown value for 'resource_state' [" + resource_state + "]. Mapping to 'RESOURCE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @resource_state = RESOURCE_STATE_UNKNOWN_ENUM_VALUE
      else
        @resource_state = resource_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        resource_type == other.resource_type &&
        resource_id == other.resource_id &&
        resource_state == other.resource_state &&
        resource_diagnosis == other.resource_diagnosis
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
      [resource_type, resource_id, resource_state, resource_diagnosis].hash
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
