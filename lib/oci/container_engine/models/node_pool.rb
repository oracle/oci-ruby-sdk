# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A pool of compute nodes attached to a cluster. Avoid entering confidential information.
  class ContainerEngine::Models::NodePool
    # The OCID of the node pool.
    # @return [String]
    attr_accessor :id

    # The OCID of the compartment in which the node pool exists.
    # @return [String]
    attr_accessor :compartment_id

    # The OCID of the cluster to which this node pool is attached.
    # @return [String]
    attr_accessor :cluster_id

    # The name of the node pool.
    # @return [String]
    attr_accessor :name

    # The version of Kubernetes running on the nodes in the node pool.
    # @return [String]
    attr_accessor :kubernetes_version

    # A list of key/value pairs to add to each underlying OCI instance in the node pool.
    # @return [Hash<String, String>]
    attr_accessor :node_metadata

    # The OCID of the image running on the nodes in the node pool.
    # @return [String]
    attr_accessor :node_image_id

    # The name of the image running on the nodes in the node pool.
    # @return [String]
    attr_accessor :node_image_name

    # The name of the node shape of the nodes in the node pool.
    # @return [String]
    attr_accessor :node_shape

    # A list of key/value pairs to add to nodes after they join the Kubernetes cluster.
    # @return [Array<OCI::ContainerEngine::Models::KeyValue>]
    attr_accessor :initial_node_labels

    # The SSH public key on each node in the node pool.
    # @return [String]
    attr_accessor :ssh_public_key

    # The number of nodes in each subnet.
    # @return [Integer]
    attr_accessor :quantity_per_subnet

    # The OCIDs of the subnets in which to place nodes for this node pool.
    # @return [Array<String>]
    attr_accessor :subnet_ids

    # The nodes in the node pool.
    # @return [Array<OCI::ContainerEngine::Models::Node>]
    attr_accessor :nodes

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'cluster_id': :'clusterId',
        'name': :'name',
        'kubernetes_version': :'kubernetesVersion',
        'node_metadata': :'nodeMetadata',
        'node_image_id': :'nodeImageId',
        'node_image_name': :'nodeImageName',
        'node_shape': :'nodeShape',
        'initial_node_labels': :'initialNodeLabels',
        'ssh_public_key': :'sshPublicKey',
        'quantity_per_subnet': :'quantityPerSubnet',
        'subnet_ids': :'subnetIds',
        'nodes': :'nodes'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'cluster_id': :'String',
        'name': :'String',
        'kubernetes_version': :'String',
        'node_metadata': :'Hash<String, String>',
        'node_image_id': :'String',
        'node_image_name': :'String',
        'node_shape': :'String',
        'initial_node_labels': :'Array<OCI::ContainerEngine::Models::KeyValue>',
        'ssh_public_key': :'String',
        'quantity_per_subnet': :'Integer',
        'subnet_ids': :'Array<String>',
        'nodes': :'Array<OCI::ContainerEngine::Models::Node>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :cluster_id The value to assign to the {#cluster_id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :kubernetes_version The value to assign to the {#kubernetes_version} property
    # @option attributes [Hash<String, String>] :node_metadata The value to assign to the {#node_metadata} property
    # @option attributes [String] :node_image_id The value to assign to the {#node_image_id} property
    # @option attributes [String] :node_image_name The value to assign to the {#node_image_name} property
    # @option attributes [String] :node_shape The value to assign to the {#node_shape} property
    # @option attributes [Array<OCI::ContainerEngine::Models::KeyValue>] :initial_node_labels The value to assign to the {#initial_node_labels} property
    # @option attributes [String] :ssh_public_key The value to assign to the {#ssh_public_key} property
    # @option attributes [Integer] :quantity_per_subnet The value to assign to the {#quantity_per_subnet} property
    # @option attributes [Array<String>] :subnet_ids The value to assign to the {#subnet_ids} property
    # @option attributes [Array<OCI::ContainerEngine::Models::Node>] :nodes The value to assign to the {#nodes} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.cluster_id = attributes[:'clusterId'] if attributes[:'clusterId']

      raise 'You cannot provide both :clusterId and :cluster_id' if attributes.key?(:'clusterId') && attributes.key?(:'cluster_id')

      self.cluster_id = attributes[:'cluster_id'] if attributes[:'cluster_id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.kubernetes_version = attributes[:'kubernetesVersion'] if attributes[:'kubernetesVersion']

      raise 'You cannot provide both :kubernetesVersion and :kubernetes_version' if attributes.key?(:'kubernetesVersion') && attributes.key?(:'kubernetes_version')

      self.kubernetes_version = attributes[:'kubernetes_version'] if attributes[:'kubernetes_version']

      self.node_metadata = attributes[:'nodeMetadata'] if attributes[:'nodeMetadata']

      raise 'You cannot provide both :nodeMetadata and :node_metadata' if attributes.key?(:'nodeMetadata') && attributes.key?(:'node_metadata')

      self.node_metadata = attributes[:'node_metadata'] if attributes[:'node_metadata']

      self.node_image_id = attributes[:'nodeImageId'] if attributes[:'nodeImageId']

      raise 'You cannot provide both :nodeImageId and :node_image_id' if attributes.key?(:'nodeImageId') && attributes.key?(:'node_image_id')

      self.node_image_id = attributes[:'node_image_id'] if attributes[:'node_image_id']

      self.node_image_name = attributes[:'nodeImageName'] if attributes[:'nodeImageName']

      raise 'You cannot provide both :nodeImageName and :node_image_name' if attributes.key?(:'nodeImageName') && attributes.key?(:'node_image_name')

      self.node_image_name = attributes[:'node_image_name'] if attributes[:'node_image_name']

      self.node_shape = attributes[:'nodeShape'] if attributes[:'nodeShape']

      raise 'You cannot provide both :nodeShape and :node_shape' if attributes.key?(:'nodeShape') && attributes.key?(:'node_shape')

      self.node_shape = attributes[:'node_shape'] if attributes[:'node_shape']

      self.initial_node_labels = attributes[:'initialNodeLabels'] if attributes[:'initialNodeLabels']

      raise 'You cannot provide both :initialNodeLabels and :initial_node_labels' if attributes.key?(:'initialNodeLabels') && attributes.key?(:'initial_node_labels')

      self.initial_node_labels = attributes[:'initial_node_labels'] if attributes[:'initial_node_labels']

      self.ssh_public_key = attributes[:'sshPublicKey'] if attributes[:'sshPublicKey']

      raise 'You cannot provide both :sshPublicKey and :ssh_public_key' if attributes.key?(:'sshPublicKey') && attributes.key?(:'ssh_public_key')

      self.ssh_public_key = attributes[:'ssh_public_key'] if attributes[:'ssh_public_key']

      self.quantity_per_subnet = attributes[:'quantityPerSubnet'] if attributes[:'quantityPerSubnet']

      raise 'You cannot provide both :quantityPerSubnet and :quantity_per_subnet' if attributes.key?(:'quantityPerSubnet') && attributes.key?(:'quantity_per_subnet')

      self.quantity_per_subnet = attributes[:'quantity_per_subnet'] if attributes[:'quantity_per_subnet']

      self.subnet_ids = attributes[:'subnetIds'] if attributes[:'subnetIds']

      raise 'You cannot provide both :subnetIds and :subnet_ids' if attributes.key?(:'subnetIds') && attributes.key?(:'subnet_ids')

      self.subnet_ids = attributes[:'subnet_ids'] if attributes[:'subnet_ids']

      self.nodes = attributes[:'nodes'] if attributes[:'nodes']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        compartment_id == other.compartment_id &&
        cluster_id == other.cluster_id &&
        name == other.name &&
        kubernetes_version == other.kubernetes_version &&
        node_metadata == other.node_metadata &&
        node_image_id == other.node_image_id &&
        node_image_name == other.node_image_name &&
        node_shape == other.node_shape &&
        initial_node_labels == other.initial_node_labels &&
        ssh_public_key == other.ssh_public_key &&
        quantity_per_subnet == other.quantity_per_subnet &&
        subnet_ids == other.subnet_ids &&
        nodes == other.nodes
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
      [id, compartment_id, cluster_id, name, kubernetes_version, node_metadata, node_image_id, node_image_name, node_shape, initial_node_labels, ssh_public_key, quantity_per_subnet, subnet_ids, nodes].hash
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
