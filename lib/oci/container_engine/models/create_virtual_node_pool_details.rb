# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20180222
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The properties that define a request to create a virtual node pool.
  class ContainerEngine::Models::CreateVirtualNodePoolDetails
    # **[Required]** Compartment of the virtual node pool.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The cluster the virtual node pool is associated with. A virtual node pool can only be associated with one cluster.
    # @return [String]
    attr_accessor :cluster_id

    # **[Required]** Display name of the virtual node pool. This is a non-unique value.
    # @return [String]
    attr_accessor :display_name

    # Initial labels that will be added to the Kubernetes Virtual Node object when it registers.
    # @return [Array<OCI::ContainerEngine::Models::InitialVirtualNodeLabel>]
    attr_accessor :initial_virtual_node_labels

    # A taint is a collection of <key, value, effect>. These taints will be applied to the Virtual Nodes of this Virtual Node Pool for Kubernetes scheduling.
    # @return [Array<OCI::ContainerEngine::Models::Taint>]
    attr_accessor :taints

    # The number of Virtual Nodes that should be in the Virtual Node Pool. The placement configurations determine where these virtual nodes are placed.
    # @return [Integer]
    attr_accessor :size

    # **[Required]** The list of placement configurations which determines where Virtual Nodes will be provisioned across as it relates to the subnet and availability domains. The size attribute determines how many we evenly spread across these placement configurations
    # @return [Array<OCI::ContainerEngine::Models::PlacementConfiguration>]
    attr_accessor :placement_configurations

    # List of network security group id's applied to the Virtual Node VNIC.
    # @return [Array<String>]
    attr_accessor :nsg_ids

    # The pod configuration for pods run on virtual nodes of this virtual node pool.
    # @return [OCI::ContainerEngine::Models::PodConfiguration]
    attr_accessor :pod_configuration

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # @return [OCI::ContainerEngine::Models::VirtualNodeTags]
    attr_accessor :virtual_node_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'cluster_id': :'clusterId',
        'display_name': :'displayName',
        'initial_virtual_node_labels': :'initialVirtualNodeLabels',
        'taints': :'taints',
        'size': :'size',
        'placement_configurations': :'placementConfigurations',
        'nsg_ids': :'nsgIds',
        'pod_configuration': :'podConfiguration',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'virtual_node_tags': :'virtualNodeTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'cluster_id': :'String',
        'display_name': :'String',
        'initial_virtual_node_labels': :'Array<OCI::ContainerEngine::Models::InitialVirtualNodeLabel>',
        'taints': :'Array<OCI::ContainerEngine::Models::Taint>',
        'size': :'Integer',
        'placement_configurations': :'Array<OCI::ContainerEngine::Models::PlacementConfiguration>',
        'nsg_ids': :'Array<String>',
        'pod_configuration': :'OCI::ContainerEngine::Models::PodConfiguration',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'virtual_node_tags': :'OCI::ContainerEngine::Models::VirtualNodeTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :cluster_id The value to assign to the {#cluster_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Array<OCI::ContainerEngine::Models::InitialVirtualNodeLabel>] :initial_virtual_node_labels The value to assign to the {#initial_virtual_node_labels} property
    # @option attributes [Array<OCI::ContainerEngine::Models::Taint>] :taints The value to assign to the {#taints} property
    # @option attributes [Integer] :size The value to assign to the {#size} property
    # @option attributes [Array<OCI::ContainerEngine::Models::PlacementConfiguration>] :placement_configurations The value to assign to the {#placement_configurations} property
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {#nsg_ids} property
    # @option attributes [OCI::ContainerEngine::Models::PodConfiguration] :pod_configuration The value to assign to the {#pod_configuration} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [OCI::ContainerEngine::Models::VirtualNodeTags] :virtual_node_tags The value to assign to the {#virtual_node_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.cluster_id = attributes[:'clusterId'] if attributes[:'clusterId']

      raise 'You cannot provide both :clusterId and :cluster_id' if attributes.key?(:'clusterId') && attributes.key?(:'cluster_id')

      self.cluster_id = attributes[:'cluster_id'] if attributes[:'cluster_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.initial_virtual_node_labels = attributes[:'initialVirtualNodeLabels'] if attributes[:'initialVirtualNodeLabels']

      raise 'You cannot provide both :initialVirtualNodeLabels and :initial_virtual_node_labels' if attributes.key?(:'initialVirtualNodeLabels') && attributes.key?(:'initial_virtual_node_labels')

      self.initial_virtual_node_labels = attributes[:'initial_virtual_node_labels'] if attributes[:'initial_virtual_node_labels']

      self.taints = attributes[:'taints'] if attributes[:'taints']

      self.size = attributes[:'size'] if attributes[:'size']

      self.placement_configurations = attributes[:'placementConfigurations'] if attributes[:'placementConfigurations']

      raise 'You cannot provide both :placementConfigurations and :placement_configurations' if attributes.key?(:'placementConfigurations') && attributes.key?(:'placement_configurations')

      self.placement_configurations = attributes[:'placement_configurations'] if attributes[:'placement_configurations']

      self.nsg_ids = attributes[:'nsgIds'] if attributes[:'nsgIds']

      raise 'You cannot provide both :nsgIds and :nsg_ids' if attributes.key?(:'nsgIds') && attributes.key?(:'nsg_ids')

      self.nsg_ids = attributes[:'nsg_ids'] if attributes[:'nsg_ids']

      self.pod_configuration = attributes[:'podConfiguration'] if attributes[:'podConfiguration']

      raise 'You cannot provide both :podConfiguration and :pod_configuration' if attributes.key?(:'podConfiguration') && attributes.key?(:'pod_configuration')

      self.pod_configuration = attributes[:'pod_configuration'] if attributes[:'pod_configuration']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.virtual_node_tags = attributes[:'virtualNodeTags'] if attributes[:'virtualNodeTags']

      raise 'You cannot provide both :virtualNodeTags and :virtual_node_tags' if attributes.key?(:'virtualNodeTags') && attributes.key?(:'virtual_node_tags')

      self.virtual_node_tags = attributes[:'virtual_node_tags'] if attributes[:'virtual_node_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        cluster_id == other.cluster_id &&
        display_name == other.display_name &&
        initial_virtual_node_labels == other.initial_virtual_node_labels &&
        taints == other.taints &&
        size == other.size &&
        placement_configurations == other.placement_configurations &&
        nsg_ids == other.nsg_ids &&
        pod_configuration == other.pod_configuration &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        virtual_node_tags == other.virtual_node_tags
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
      [compartment_id, cluster_id, display_name, initial_virtual_node_labels, taints, size, placement_configurations, nsg_ids, pod_configuration, freeform_tags, defined_tags, virtual_node_tags].hash
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
