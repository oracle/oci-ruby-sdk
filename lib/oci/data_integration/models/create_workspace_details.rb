# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information needed to create a new workspace.
  class DataIntegration::Models::CreateWorkspaceDetails
    # The OCID of the VCN the subnet is in.
    # @return [String]
    attr_accessor :vcn_id

    # The OCID of the subnet for customer connected databases.
    # @return [String]
    attr_accessor :subnet_id

    # The IP of the custom DNS.
    # @return [String]
    attr_accessor :dns_server_ip

    # The DNS zone of the custom DNS to use to resolve names.
    # @return [String]
    attr_accessor :dns_server_zone

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace. See [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace. See [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # A user defined description for the workspace.
    # @return [String]
    attr_accessor :description

    # **[Required]** A user-friendly display name for the workspace. Does not have to be unique, and can be modified. Avoid entering confidential information.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The OCID of the compartment containing the workspace.
    # @return [String]
    attr_accessor :compartment_id

    # Specifies whether the private network connection is enabled or disabled.
    # @return [BOOLEAN]
    attr_accessor :is_private_network_enabled

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'vcn_id': :'vcnId',
        'subnet_id': :'subnetId',
        'dns_server_ip': :'dnsServerIp',
        'dns_server_zone': :'dnsServerZone',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'description': :'description',
        'display_name': :'displayName',
        'compartment_id': :'compartmentId',
        'is_private_network_enabled': :'isPrivateNetworkEnabled'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'vcn_id': :'String',
        'subnet_id': :'String',
        'dns_server_ip': :'String',
        'dns_server_zone': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'description': :'String',
        'display_name': :'String',
        'compartment_id': :'String',
        'is_private_network_enabled': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :vcn_id The value to assign to the {#vcn_id} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [String] :dns_server_ip The value to assign to the {#dns_server_ip} property
    # @option attributes [String] :dns_server_zone The value to assign to the {#dns_server_zone} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [BOOLEAN] :is_private_network_enabled The value to assign to the {#is_private_network_enabled} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.vcn_id = attributes[:'vcnId'] if attributes[:'vcnId']

      raise 'You cannot provide both :vcnId and :vcn_id' if attributes.key?(:'vcnId') && attributes.key?(:'vcn_id')

      self.vcn_id = attributes[:'vcn_id'] if attributes[:'vcn_id']

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.dns_server_ip = attributes[:'dnsServerIp'] if attributes[:'dnsServerIp']

      raise 'You cannot provide both :dnsServerIp and :dns_server_ip' if attributes.key?(:'dnsServerIp') && attributes.key?(:'dns_server_ip')

      self.dns_server_ip = attributes[:'dns_server_ip'] if attributes[:'dns_server_ip']

      self.dns_server_zone = attributes[:'dnsServerZone'] if attributes[:'dnsServerZone']

      raise 'You cannot provide both :dnsServerZone and :dns_server_zone' if attributes.key?(:'dnsServerZone') && attributes.key?(:'dns_server_zone')

      self.dns_server_zone = attributes[:'dns_server_zone'] if attributes[:'dns_server_zone']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.description = attributes[:'description'] if attributes[:'description']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.is_private_network_enabled = attributes[:'isPrivateNetworkEnabled'] unless attributes[:'isPrivateNetworkEnabled'].nil?
      self.is_private_network_enabled = false if is_private_network_enabled.nil? && !attributes.key?(:'isPrivateNetworkEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isPrivateNetworkEnabled and :is_private_network_enabled' if attributes.key?(:'isPrivateNetworkEnabled') && attributes.key?(:'is_private_network_enabled')

      self.is_private_network_enabled = attributes[:'is_private_network_enabled'] unless attributes[:'is_private_network_enabled'].nil?
      self.is_private_network_enabled = false if is_private_network_enabled.nil? && !attributes.key?(:'isPrivateNetworkEnabled') && !attributes.key?(:'is_private_network_enabled') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        vcn_id == other.vcn_id &&
        subnet_id == other.subnet_id &&
        dns_server_ip == other.dns_server_ip &&
        dns_server_zone == other.dns_server_zone &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        description == other.description &&
        display_name == other.display_name &&
        compartment_id == other.compartment_id &&
        is_private_network_enabled == other.is_private_network_enabled
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
      [vcn_id, subnet_id, dns_server_ip, dns_server_zone, freeform_tags, defined_tags, description, display_name, compartment_id, is_private_network_enabled].hash
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
