# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'create_dp_endpoint_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details to create a private endpoint.
  class DataConnectivity::Models::CreateDpEndpointFromPrivate < DataConnectivity::Models::CreateDpEndpointDetails
    STATE_ENUM = [
      STATE_ACTIVE = 'ACTIVE'.freeze,
      STATE_INACTIVE = 'INACTIVE'.freeze
    ].freeze

    # **[Required]** The endpoint ID provided by control plane.
    # @return [String]
    attr_accessor :dcms_endpoint_id

    # The ocid of private endpoint resource.
    # @return [String]
    attr_accessor :pe_id

    # The compartmentId of private endpoint resource.
    # @return [String]
    attr_accessor :compartment_id

    # The IP address of dns proxy.
    # @return [String]
    attr_accessor :dns_proxy_ip

    # The ocid of private endpoint resource.
    # @return [String]
    attr_accessor :private_endpoint_ip

    # Array of dns zones to be use during private endpoint resolution.
    # @return [Array<String>]
    attr_accessor :dns_zones

    # Specifies the private endpoint state.
    # @return [String]
    attr_reader :state

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'modelType',
        'key': :'key',
        'model_version': :'modelVersion',
        'parent_ref': :'parentRef',
        'name': :'name',
        'description': :'description',
        'object_status': :'objectStatus',
        'object_version': :'objectVersion',
        'identifier': :'identifier',
        'data_assets': :'dataAssets',
        'dcms_endpoint_id': :'dcmsEndpointId',
        'pe_id': :'peId',
        'compartment_id': :'compartmentId',
        'dns_proxy_ip': :'dnsProxyIp',
        'private_endpoint_ip': :'privateEndpointIp',
        'dns_zones': :'dnsZones',
        'state': :'state'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'String',
        'key': :'String',
        'model_version': :'String',
        'parent_ref': :'OCI::DataConnectivity::Models::ParentReference',
        'name': :'String',
        'description': :'String',
        'object_status': :'Integer',
        'object_version': :'Integer',
        'identifier': :'String',
        'data_assets': :'Array<OCI::DataConnectivity::Models::DataAsset>',
        'dcms_endpoint_id': :'String',
        'pe_id': :'String',
        'compartment_id': :'String',
        'dns_proxy_ip': :'String',
        'private_endpoint_ip': :'String',
        'dns_zones': :'Array<String>',
        'state': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {OCI::DataConnectivity::Models::CreateDpEndpointDetails#key #key} proprety
    # @option attributes [String] :model_version The value to assign to the {OCI::DataConnectivity::Models::CreateDpEndpointDetails#model_version #model_version} proprety
    # @option attributes [OCI::DataConnectivity::Models::ParentReference] :parent_ref The value to assign to the {OCI::DataConnectivity::Models::CreateDpEndpointDetails#parent_ref #parent_ref} proprety
    # @option attributes [String] :name The value to assign to the {OCI::DataConnectivity::Models::CreateDpEndpointDetails#name #name} proprety
    # @option attributes [String] :description The value to assign to the {OCI::DataConnectivity::Models::CreateDpEndpointDetails#description #description} proprety
    # @option attributes [Integer] :object_status The value to assign to the {OCI::DataConnectivity::Models::CreateDpEndpointDetails#object_status #object_status} proprety
    # @option attributes [Integer] :object_version The value to assign to the {OCI::DataConnectivity::Models::CreateDpEndpointDetails#object_version #object_version} proprety
    # @option attributes [String] :identifier The value to assign to the {OCI::DataConnectivity::Models::CreateDpEndpointDetails#identifier #identifier} proprety
    # @option attributes [Array<OCI::DataConnectivity::Models::DataAsset>] :data_assets The value to assign to the {OCI::DataConnectivity::Models::CreateDpEndpointDetails#data_assets #data_assets} proprety
    # @option attributes [String] :dcms_endpoint_id The value to assign to the {#dcms_endpoint_id} property
    # @option attributes [String] :pe_id The value to assign to the {#pe_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :dns_proxy_ip The value to assign to the {#dns_proxy_ip} property
    # @option attributes [String] :private_endpoint_ip The value to assign to the {#private_endpoint_ip} property
    # @option attributes [Array<String>] :dns_zones The value to assign to the {#dns_zones} property
    # @option attributes [String] :state The value to assign to the {#state} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['modelType'] = 'PRIVATE_END_POINT'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.dcms_endpoint_id = attributes[:'dcmsEndpointId'] if attributes[:'dcmsEndpointId']

      raise 'You cannot provide both :dcmsEndpointId and :dcms_endpoint_id' if attributes.key?(:'dcmsEndpointId') && attributes.key?(:'dcms_endpoint_id')

      self.dcms_endpoint_id = attributes[:'dcms_endpoint_id'] if attributes[:'dcms_endpoint_id']

      self.pe_id = attributes[:'peId'] if attributes[:'peId']

      raise 'You cannot provide both :peId and :pe_id' if attributes.key?(:'peId') && attributes.key?(:'pe_id')

      self.pe_id = attributes[:'pe_id'] if attributes[:'pe_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.dns_proxy_ip = attributes[:'dnsProxyIp'] if attributes[:'dnsProxyIp']

      raise 'You cannot provide both :dnsProxyIp and :dns_proxy_ip' if attributes.key?(:'dnsProxyIp') && attributes.key?(:'dns_proxy_ip')

      self.dns_proxy_ip = attributes[:'dns_proxy_ip'] if attributes[:'dns_proxy_ip']

      self.private_endpoint_ip = attributes[:'privateEndpointIp'] if attributes[:'privateEndpointIp']

      raise 'You cannot provide both :privateEndpointIp and :private_endpoint_ip' if attributes.key?(:'privateEndpointIp') && attributes.key?(:'private_endpoint_ip')

      self.private_endpoint_ip = attributes[:'private_endpoint_ip'] if attributes[:'private_endpoint_ip']

      self.dns_zones = attributes[:'dnsZones'] if attributes[:'dnsZones']

      raise 'You cannot provide both :dnsZones and :dns_zones' if attributes.key?(:'dnsZones') && attributes.key?(:'dns_zones')

      self.dns_zones = attributes[:'dns_zones'] if attributes[:'dns_zones']

      self.state = attributes[:'state'] if attributes[:'state']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] state Object to be assigned
    def state=(state)
      raise "Invalid value for 'state': this must be one of the values in STATE_ENUM." if state && !STATE_ENUM.include?(state)

      @state = state
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        model_type == other.model_type &&
        key == other.key &&
        model_version == other.model_version &&
        parent_ref == other.parent_ref &&
        name == other.name &&
        description == other.description &&
        object_status == other.object_status &&
        object_version == other.object_version &&
        identifier == other.identifier &&
        data_assets == other.data_assets &&
        dcms_endpoint_id == other.dcms_endpoint_id &&
        pe_id == other.pe_id &&
        compartment_id == other.compartment_id &&
        dns_proxy_ip == other.dns_proxy_ip &&
        private_endpoint_ip == other.private_endpoint_ip &&
        dns_zones == other.dns_zones &&
        state == other.state
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
      [model_type, key, model_version, parent_ref, name, description, object_status, object_version, identifier, data_assets, dcms_endpoint_id, pe_id, compartment_id, dns_proxy_ip, private_endpoint_ip, dns_zones, state].hash
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
