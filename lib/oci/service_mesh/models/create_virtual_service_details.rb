# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information about the new VirtualService.
  class ServiceMesh::Models::CreateVirtualServiceDetails
    # **[Required]** The OCID of the service mesh in which this virtual service is created.
    # @return [String]
    attr_accessor :mesh_id

    # **[Required]** A user-friendly name. The name has to be unique within the same service mesh and cannot be changed after creation.
    # Avoid entering confidential information.
    #
    # Example: `My unique resource name`
    #
    # @return [String]
    attr_accessor :name

    # Description of the resource. It can be changed after creation.
    # Avoid entering confidential information.
    #
    # Example: `This is my new resource`
    #
    # @return [String]
    attr_accessor :description

    # @return [OCI::ServiceMesh::Models::DefaultVirtualServiceRoutingPolicy]
    attr_accessor :default_routing_policy

    # The DNS hostnames of the virtual service that is used by its callers.
    # Wildcard hostnames are supported in the prefix form.
    # Examples of valid hostnames are \"www.example.com\", \"*.example.com\", \"*.com\".
    # Can be omitted if the virtual service will only have TCP virtual deployments.
    #
    # @return [Array<String>]
    attr_accessor :hosts

    # @return [OCI::ServiceMesh::Models::CreateMutualTransportLayerSecurityDetails]
    attr_accessor :mtls

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    #
    # @return [String]
    attr_accessor :compartment_id

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'mesh_id': :'meshId',
        'name': :'name',
        'description': :'description',
        'default_routing_policy': :'defaultRoutingPolicy',
        'hosts': :'hosts',
        'mtls': :'mtls',
        'compartment_id': :'compartmentId',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'mesh_id': :'String',
        'name': :'String',
        'description': :'String',
        'default_routing_policy': :'OCI::ServiceMesh::Models::DefaultVirtualServiceRoutingPolicy',
        'hosts': :'Array<String>',
        'mtls': :'OCI::ServiceMesh::Models::CreateMutualTransportLayerSecurityDetails',
        'compartment_id': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :mesh_id The value to assign to the {#mesh_id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [OCI::ServiceMesh::Models::DefaultVirtualServiceRoutingPolicy] :default_routing_policy The value to assign to the {#default_routing_policy} property
    # @option attributes [Array<String>] :hosts The value to assign to the {#hosts} property
    # @option attributes [OCI::ServiceMesh::Models::CreateMutualTransportLayerSecurityDetails] :mtls The value to assign to the {#mtls} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.mesh_id = attributes[:'meshId'] if attributes[:'meshId']

      raise 'You cannot provide both :meshId and :mesh_id' if attributes.key?(:'meshId') && attributes.key?(:'mesh_id')

      self.mesh_id = attributes[:'mesh_id'] if attributes[:'mesh_id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.default_routing_policy = attributes[:'defaultRoutingPolicy'] if attributes[:'defaultRoutingPolicy']

      raise 'You cannot provide both :defaultRoutingPolicy and :default_routing_policy' if attributes.key?(:'defaultRoutingPolicy') && attributes.key?(:'default_routing_policy')

      self.default_routing_policy = attributes[:'default_routing_policy'] if attributes[:'default_routing_policy']

      self.hosts = attributes[:'hosts'] if attributes[:'hosts']

      self.mtls = attributes[:'mtls'] if attributes[:'mtls']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        mesh_id == other.mesh_id &&
        name == other.name &&
        description == other.description &&
        default_routing_policy == other.default_routing_policy &&
        hosts == other.hosts &&
        mtls == other.mtls &&
        compartment_id == other.compartment_id &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
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
      [mesh_id, name, description, default_routing_policy, hosts, mtls, compartment_id, freeform_tags, defined_tags].hash
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