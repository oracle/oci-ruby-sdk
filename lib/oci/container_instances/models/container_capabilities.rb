# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210415
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Linux Container capabilities to configure capabilities of container.
  #
  class ContainerInstances::Models::ContainerCapabilities
    ADD_CAPABILITIES_ENUM = [
      ADD_CAPABILITIES_CAP_CHOWN = 'CAP_CHOWN'.freeze,
      ADD_CAPABILITIES_CAP_DAC_OVERRIDE = 'CAP_DAC_OVERRIDE'.freeze,
      ADD_CAPABILITIES_CAP_FSETID = 'CAP_FSETID'.freeze,
      ADD_CAPABILITIES_CAP_FOWNER = 'CAP_FOWNER'.freeze,
      ADD_CAPABILITIES_CAP_MKNOD = 'CAP_MKNOD'.freeze,
      ADD_CAPABILITIES_CAP_NET_RAW = 'CAP_NET_RAW'.freeze,
      ADD_CAPABILITIES_CAP_SETGID = 'CAP_SETGID'.freeze,
      ADD_CAPABILITIES_CAP_SETUID = 'CAP_SETUID'.freeze,
      ADD_CAPABILITIES_CAP_SETFCAP = 'CAP_SETFCAP'.freeze,
      ADD_CAPABILITIES_CAP_SETPCAP = 'CAP_SETPCAP'.freeze,
      ADD_CAPABILITIES_CAP_NET_BIND_SERVICE = 'CAP_NET_BIND_SERVICE'.freeze,
      ADD_CAPABILITIES_CAP_SYS_CHROOT = 'CAP_SYS_CHROOT'.freeze,
      ADD_CAPABILITIES_CAP_KILL = 'CAP_KILL'.freeze,
      ADD_CAPABILITIES_CAP_AUDIT_WRITE = 'CAP_AUDIT_WRITE'.freeze,
      ADD_CAPABILITIES_ALL = 'ALL'.freeze,
      ADD_CAPABILITIES_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DROP_CAPABILITIES_ENUM = [
      DROP_CAPABILITIES_CAP_CHOWN = 'CAP_CHOWN'.freeze,
      DROP_CAPABILITIES_CAP_DAC_OVERRIDE = 'CAP_DAC_OVERRIDE'.freeze,
      DROP_CAPABILITIES_CAP_FSETID = 'CAP_FSETID'.freeze,
      DROP_CAPABILITIES_CAP_FOWNER = 'CAP_FOWNER'.freeze,
      DROP_CAPABILITIES_CAP_MKNOD = 'CAP_MKNOD'.freeze,
      DROP_CAPABILITIES_CAP_NET_RAW = 'CAP_NET_RAW'.freeze,
      DROP_CAPABILITIES_CAP_SETGID = 'CAP_SETGID'.freeze,
      DROP_CAPABILITIES_CAP_SETUID = 'CAP_SETUID'.freeze,
      DROP_CAPABILITIES_CAP_SETFCAP = 'CAP_SETFCAP'.freeze,
      DROP_CAPABILITIES_CAP_SETPCAP = 'CAP_SETPCAP'.freeze,
      DROP_CAPABILITIES_CAP_NET_BIND_SERVICE = 'CAP_NET_BIND_SERVICE'.freeze,
      DROP_CAPABILITIES_CAP_SYS_CHROOT = 'CAP_SYS_CHROOT'.freeze,
      DROP_CAPABILITIES_CAP_KILL = 'CAP_KILL'.freeze,
      DROP_CAPABILITIES_CAP_AUDIT_WRITE = 'CAP_AUDIT_WRITE'.freeze,
      DROP_CAPABILITIES_ALL = 'ALL'.freeze,
      DROP_CAPABILITIES_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # A list of additional configurable container capabilities.
    #
    # @return [Array<String>]
    attr_reader :add_capabilities

    # A list of container capabilities that can be dropped.
    #
    # @return [Array<String>]
    attr_reader :drop_capabilities

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'add_capabilities': :'addCapabilities',
        'drop_capabilities': :'dropCapabilities'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'add_capabilities': :'Array<String>',
        'drop_capabilities': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<String>] :add_capabilities The value to assign to the {#add_capabilities} property
    # @option attributes [Array<String>] :drop_capabilities The value to assign to the {#drop_capabilities} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.add_capabilities = attributes[:'addCapabilities'] if attributes[:'addCapabilities']

      raise 'You cannot provide both :addCapabilities and :add_capabilities' if attributes.key?(:'addCapabilities') && attributes.key?(:'add_capabilities')

      self.add_capabilities = attributes[:'add_capabilities'] if attributes[:'add_capabilities']

      self.drop_capabilities = attributes[:'dropCapabilities'] if attributes[:'dropCapabilities']

      raise 'You cannot provide both :dropCapabilities and :drop_capabilities' if attributes.key?(:'dropCapabilities') && attributes.key?(:'drop_capabilities')

      self.drop_capabilities = attributes[:'drop_capabilities'] if attributes[:'drop_capabilities']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] add_capabilities Object to be assigned
    def add_capabilities=(add_capabilities)
      # rubocop:disable Style/ConditionalAssignment
      if add_capabilities.nil?
        @add_capabilities = nil
      else
        @add_capabilities =
          add_capabilities.collect do |item|
            if ADD_CAPABILITIES_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'add_capabilities' [#{item}]. Mapping to 'ADD_CAPABILITIES_UNKNOWN_ENUM_VALUE'") if OCI.logger
              ADD_CAPABILITIES_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] drop_capabilities Object to be assigned
    def drop_capabilities=(drop_capabilities)
      # rubocop:disable Style/ConditionalAssignment
      if drop_capabilities.nil?
        @drop_capabilities = nil
      else
        @drop_capabilities =
          drop_capabilities.collect do |item|
            if DROP_CAPABILITIES_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'drop_capabilities' [#{item}]. Mapping to 'DROP_CAPABILITIES_UNKNOWN_ENUM_VALUE'") if OCI.logger
              DROP_CAPABILITIES_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        add_capabilities == other.add_capabilities &&
        drop_capabilities == other.drop_capabilities
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
      [add_capabilities, drop_capabilities].hash
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
