# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of DVP Stack.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class ApmSynthetics::Models::DvpStackDetails
    DVP_STACK_TYPE_ENUM = [
      DVP_STACK_TYPE_ORACLE_RM_STACK = 'ORACLE_RM_STACK'.freeze,
      DVP_STACK_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Type of stack.
    # @return [String]
    attr_reader :dvp_stack_type

    # **[Required]** Version of DVP.
    # @return [String]
    attr_accessor :dvp_version

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'dvp_stack_type': :'dvpStackType',
        'dvp_version': :'dvpVersion'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'dvp_stack_type': :'String',
        'dvp_version': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'dvpStackType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::ApmSynthetics::Models::OracleRMStack' if type == 'ORACLE_RM_STACK'

      # TODO: Log a warning when the subtype is not found.
      'OCI::ApmSynthetics::Models::DvpStackDetails'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :dvp_stack_type The value to assign to the {#dvp_stack_type} property
    # @option attributes [String] :dvp_version The value to assign to the {#dvp_version} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.dvp_stack_type = attributes[:'dvpStackType'] if attributes[:'dvpStackType']

      raise 'You cannot provide both :dvpStackType and :dvp_stack_type' if attributes.key?(:'dvpStackType') && attributes.key?(:'dvp_stack_type')

      self.dvp_stack_type = attributes[:'dvp_stack_type'] if attributes[:'dvp_stack_type']

      self.dvp_version = attributes[:'dvpVersion'] if attributes[:'dvpVersion']

      raise 'You cannot provide both :dvpVersion and :dvp_version' if attributes.key?(:'dvpVersion') && attributes.key?(:'dvp_version')

      self.dvp_version = attributes[:'dvp_version'] if attributes[:'dvp_version']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] dvp_stack_type Object to be assigned
    def dvp_stack_type=(dvp_stack_type)
      # rubocop:disable Style/ConditionalAssignment
      if dvp_stack_type && !DVP_STACK_TYPE_ENUM.include?(dvp_stack_type)
        OCI.logger.debug("Unknown value for 'dvp_stack_type' [" + dvp_stack_type + "]. Mapping to 'DVP_STACK_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @dvp_stack_type = DVP_STACK_TYPE_UNKNOWN_ENUM_VALUE
      else
        @dvp_stack_type = dvp_stack_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        dvp_stack_type == other.dvp_stack_type &&
        dvp_version == other.dvp_version
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
      [dvp_stack_type, dvp_version].hash
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
