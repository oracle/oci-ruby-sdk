# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details about a node.
  class Bds::Models::Node
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    NODE_TYPE_ENUM = [
      NODE_TYPE_MASTER = 'MASTER'.freeze,
      NODE_TYPE_EDGE = 'EDGE'.freeze,
      NODE_TYPE_UTILITY = 'UTILITY'.freeze,
      NODE_TYPE_WORKER = 'WORKER'.freeze,
      NODE_TYPE_COMPUTE_ONLY_WORKER = 'COMPUTE_ONLY_WORKER'.freeze,
      NODE_TYPE_BURSTING = 'BURSTING'.freeze,
      NODE_TYPE_CLOUD_SQL = 'CLOUD_SQL'.freeze,
      NODE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the underlying Oracle Cloud Infrastructure Compute instance.
    # @return [String]
    attr_accessor :instance_id

    # **[Required]** The name of the node.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The state of the node.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** Cluster node type.
    # @return [String]
    attr_reader :node_type

    # **[Required]** Shape of the node.
    # @return [String]
    attr_accessor :shape

    # The list of block volumes attached to a given node.
    # @return [Array<OCI::Bds::Models::VolumeAttachmentDetail>]
    attr_accessor :attached_block_volumes

    # **[Required]** The OCID of the subnet in which the node is to be created.
    # @return [String]
    attr_accessor :subnet_id

    # **[Required]** IP address of the node.
    # @return [String]
    attr_accessor :ip_address

    # The fully-qualified hostname (FQDN) of the node.
    # @return [String]
    attr_accessor :hostname

    # The OCID of the image from which the node was created.
    # @return [String]
    attr_accessor :image_id

    # **[Required]** The fingerprint of the SSH key used for node access.
    # @return [String]
    attr_accessor :ssh_fingerprint

    # **[Required]** The name of the availability domain in which the node is running.
    # @return [String]
    attr_accessor :availability_domain

    # **[Required]** The name of the fault domain in which the node is running.
    # @return [String]
    attr_accessor :fault_domain

    # **[Required]** The time the node was created, shown as an RFC 3339 formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_created

    # The time the cluster was updated, shown as an RFC 3339 formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_updated

    # The total number of OCPUs available to the node.
    # @return [Integer]
    attr_accessor :ocpus

    # The total amount of memory available to the node, in gigabytes.
    # @return [Integer]
    attr_accessor :memory_in_gbs

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'instance_id': :'instanceId',
        'display_name': :'displayName',
        'lifecycle_state': :'lifecycleState',
        'node_type': :'nodeType',
        'shape': :'shape',
        'attached_block_volumes': :'attachedBlockVolumes',
        'subnet_id': :'subnetId',
        'ip_address': :'ipAddress',
        'hostname': :'hostname',
        'image_id': :'imageId',
        'ssh_fingerprint': :'sshFingerprint',
        'availability_domain': :'availabilityDomain',
        'fault_domain': :'faultDomain',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'ocpus': :'ocpus',
        'memory_in_gbs': :'memoryInGBs'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'instance_id': :'String',
        'display_name': :'String',
        'lifecycle_state': :'String',
        'node_type': :'String',
        'shape': :'String',
        'attached_block_volumes': :'Array<OCI::Bds::Models::VolumeAttachmentDetail>',
        'subnet_id': :'String',
        'ip_address': :'String',
        'hostname': :'String',
        'image_id': :'String',
        'ssh_fingerprint': :'String',
        'availability_domain': :'String',
        'fault_domain': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'ocpus': :'Integer',
        'memory_in_gbs': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :instance_id The value to assign to the {#instance_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :node_type The value to assign to the {#node_type} property
    # @option attributes [String] :shape The value to assign to the {#shape} property
    # @option attributes [Array<OCI::Bds::Models::VolumeAttachmentDetail>] :attached_block_volumes The value to assign to the {#attached_block_volumes} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [String] :ip_address The value to assign to the {#ip_address} property
    # @option attributes [String] :hostname The value to assign to the {#hostname} property
    # @option attributes [String] :image_id The value to assign to the {#image_id} property
    # @option attributes [String] :ssh_fingerprint The value to assign to the {#ssh_fingerprint} property
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [String] :fault_domain The value to assign to the {#fault_domain} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [Integer] :ocpus The value to assign to the {#ocpus} property
    # @option attributes [Integer] :memory_in_gbs The value to assign to the {#memory_in_gbs} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.instance_id = attributes[:'instanceId'] if attributes[:'instanceId']

      raise 'You cannot provide both :instanceId and :instance_id' if attributes.key?(:'instanceId') && attributes.key?(:'instance_id')

      self.instance_id = attributes[:'instance_id'] if attributes[:'instance_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.node_type = attributes[:'nodeType'] if attributes[:'nodeType']

      raise 'You cannot provide both :nodeType and :node_type' if attributes.key?(:'nodeType') && attributes.key?(:'node_type')

      self.node_type = attributes[:'node_type'] if attributes[:'node_type']

      self.shape = attributes[:'shape'] if attributes[:'shape']

      self.attached_block_volumes = attributes[:'attachedBlockVolumes'] if attributes[:'attachedBlockVolumes']

      raise 'You cannot provide both :attachedBlockVolumes and :attached_block_volumes' if attributes.key?(:'attachedBlockVolumes') && attributes.key?(:'attached_block_volumes')

      self.attached_block_volumes = attributes[:'attached_block_volumes'] if attributes[:'attached_block_volumes']

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.ip_address = attributes[:'ipAddress'] if attributes[:'ipAddress']

      raise 'You cannot provide both :ipAddress and :ip_address' if attributes.key?(:'ipAddress') && attributes.key?(:'ip_address')

      self.ip_address = attributes[:'ip_address'] if attributes[:'ip_address']

      self.hostname = attributes[:'hostname'] if attributes[:'hostname']

      self.image_id = attributes[:'imageId'] if attributes[:'imageId']

      raise 'You cannot provide both :imageId and :image_id' if attributes.key?(:'imageId') && attributes.key?(:'image_id')

      self.image_id = attributes[:'image_id'] if attributes[:'image_id']

      self.ssh_fingerprint = attributes[:'sshFingerprint'] if attributes[:'sshFingerprint']

      raise 'You cannot provide both :sshFingerprint and :ssh_fingerprint' if attributes.key?(:'sshFingerprint') && attributes.key?(:'ssh_fingerprint')

      self.ssh_fingerprint = attributes[:'ssh_fingerprint'] if attributes[:'ssh_fingerprint']

      self.availability_domain = attributes[:'availabilityDomain'] if attributes[:'availabilityDomain']

      raise 'You cannot provide both :availabilityDomain and :availability_domain' if attributes.key?(:'availabilityDomain') && attributes.key?(:'availability_domain')

      self.availability_domain = attributes[:'availability_domain'] if attributes[:'availability_domain']

      self.fault_domain = attributes[:'faultDomain'] if attributes[:'faultDomain']

      raise 'You cannot provide both :faultDomain and :fault_domain' if attributes.key?(:'faultDomain') && attributes.key?(:'fault_domain')

      self.fault_domain = attributes[:'fault_domain'] if attributes[:'fault_domain']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.ocpus = attributes[:'ocpus'] if attributes[:'ocpus']

      self.memory_in_gbs = attributes[:'memoryInGBs'] if attributes[:'memoryInGBs']

      raise 'You cannot provide both :memoryInGBs and :memory_in_gbs' if attributes.key?(:'memoryInGBs') && attributes.key?(:'memory_in_gbs')

      self.memory_in_gbs = attributes[:'memory_in_gbs'] if attributes[:'memory_in_gbs']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] node_type Object to be assigned
    def node_type=(node_type)
      # rubocop:disable Style/ConditionalAssignment
      if node_type && !NODE_TYPE_ENUM.include?(node_type)
        OCI.logger.debug("Unknown value for 'node_type' [" + node_type + "]. Mapping to 'NODE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @node_type = NODE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @node_type = node_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        instance_id == other.instance_id &&
        display_name == other.display_name &&
        lifecycle_state == other.lifecycle_state &&
        node_type == other.node_type &&
        shape == other.shape &&
        attached_block_volumes == other.attached_block_volumes &&
        subnet_id == other.subnet_id &&
        ip_address == other.ip_address &&
        hostname == other.hostname &&
        image_id == other.image_id &&
        ssh_fingerprint == other.ssh_fingerprint &&
        availability_domain == other.availability_domain &&
        fault_domain == other.fault_domain &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        ocpus == other.ocpus &&
        memory_in_gbs == other.memory_in_gbs
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
      [instance_id, display_name, lifecycle_state, node_type, shape, attached_block_volumes, subnet_id, ip_address, hostname, image_id, ssh_fingerprint, availability_domain, fault_domain, time_created, time_updated, ocpus, memory_in_gbs].hash
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
