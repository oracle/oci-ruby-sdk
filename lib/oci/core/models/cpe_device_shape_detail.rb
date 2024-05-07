# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20160918
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The detailed information about a particular CPE device type. Compare with
  # {CpeDeviceShapeSummary}.
  #
  class Core::Models::CpeDeviceShapeDetail
    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the CPE device shape.
    # This value uniquely identifies the type of CPE device.
    #
    # @return [String]
    attr_accessor :cpe_device_shape_id

    # @return [OCI::Core::Models::CpeDeviceInfo]
    attr_accessor :cpe_device_info

    # For certain CPE devices types, the customer can provide answers to
    # questions that are specific to the device type. This attribute contains
    # a list of those questions. The Networking service merges the answers with
    # other information and renders a set of CPE configuration content. To
    # provide the answers, use
    # {#update_tunnel_cpe_device_config update_tunnel_cpe_device_config}.
    #
    # @return [Array<OCI::Core::Models::CpeDeviceConfigQuestion>]
    attr_accessor :parameters

    # A template of CPE device configuration information that will be merged with the customer's
    # answers to the questions to render the final CPE device configuration content. Also see:
    #
    #   * {#get_cpe_device_config_content get_cpe_device_config_content}
    #   * {#get_ipsec_cpe_device_config_content get_ipsec_cpe_device_config_content}
    #   * {#get_tunnel_cpe_device_config_content get_tunnel_cpe_device_config_content}
    #
    # @return [String]
    attr_accessor :template

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'cpe_device_shape_id': :'cpeDeviceShapeId',
        'cpe_device_info': :'cpeDeviceInfo',
        'parameters': :'parameters',
        'template': :'template'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'cpe_device_shape_id': :'String',
        'cpe_device_info': :'OCI::Core::Models::CpeDeviceInfo',
        'parameters': :'Array<OCI::Core::Models::CpeDeviceConfigQuestion>',
        'template': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :cpe_device_shape_id The value to assign to the {#cpe_device_shape_id} property
    # @option attributes [OCI::Core::Models::CpeDeviceInfo] :cpe_device_info The value to assign to the {#cpe_device_info} property
    # @option attributes [Array<OCI::Core::Models::CpeDeviceConfigQuestion>] :parameters The value to assign to the {#parameters} property
    # @option attributes [String] :template The value to assign to the {#template} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.cpe_device_shape_id = attributes[:'cpeDeviceShapeId'] if attributes[:'cpeDeviceShapeId']

      raise 'You cannot provide both :cpeDeviceShapeId and :cpe_device_shape_id' if attributes.key?(:'cpeDeviceShapeId') && attributes.key?(:'cpe_device_shape_id')

      self.cpe_device_shape_id = attributes[:'cpe_device_shape_id'] if attributes[:'cpe_device_shape_id']

      self.cpe_device_info = attributes[:'cpeDeviceInfo'] if attributes[:'cpeDeviceInfo']

      raise 'You cannot provide both :cpeDeviceInfo and :cpe_device_info' if attributes.key?(:'cpeDeviceInfo') && attributes.key?(:'cpe_device_info')

      self.cpe_device_info = attributes[:'cpe_device_info'] if attributes[:'cpe_device_info']

      self.parameters = attributes[:'parameters'] if attributes[:'parameters']

      self.template = attributes[:'template'] if attributes[:'template']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        cpe_device_shape_id == other.cpe_device_shape_id &&
        cpe_device_info == other.cpe_device_info &&
        parameters == other.parameters &&
        template == other.template
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
      [cpe_device_shape_id, cpe_device_info, parameters, template].hash
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
