# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210415
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A container instance to host containers.
  #
  # If you delete a container instance, the record remains visible for a short period
  # of time before being permanently removed.
  #
  class ContainerInstances::Models::ContainerInstance
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    CONTAINER_RESTART_POLICY_ENUM = [
      CONTAINER_RESTART_POLICY_ALWAYS = 'ALWAYS'.freeze,
      CONTAINER_RESTART_POLICY_NEVER = 'NEVER'.freeze,
      CONTAINER_RESTART_POLICY_ON_FAILURE = 'ON_FAILURE'.freeze,
      CONTAINER_RESTART_POLICY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** An OCID that cannot be changed.
    # @return [String]
    attr_accessor :id

    # **[Required]** A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The OCID of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`.
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Usage of system tag keys. These predefined keys are scoped to namespaces.
    # Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`.
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # **[Required]** The availability domain to place the container instance.
    # @return [String]
    attr_accessor :availability_domain

    # The fault domain to place the container instance.
    # @return [String]
    attr_accessor :fault_domain

    # **[Required]** The current state of the container instance.
    # @return [String]
    attr_reader :lifecycle_state

    # A message that describes the current state of the container in more detail. Can be used to provide
    # actionable information.
    #
    # @return [String]
    attr_accessor :lifecycle_details

    # A volume is a directory with data that is accessible across multiple containers in a
    # container instance.
    #
    # @return [Array<OCI::ContainerInstances::Models::ContainerVolume>]
    attr_accessor :volumes

    # The number of volumes that are attached to the container instance.
    # @return [Integer]
    attr_accessor :volume_count

    # **[Required]** The containers on the container instance.
    # @return [Array<OCI::ContainerInstances::Models::ContainerInstanceContainer>]
    attr_accessor :containers

    # **[Required]** The number of containers on the container instance.
    # @return [Integer]
    attr_accessor :container_count

    # **[Required]** The time the container instance was created, in the format defined by [RFC 3339](https://tools.ietf.org/rfc/rfc3339).
    # @return [DateTime]
    attr_accessor :time_created

    # The time the container instance was updated, in the format defined by [RFC 3339](https://tools.ietf.org/rfc/rfc3339).
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** The shape of the container instance. The shape determines the number of OCPUs, amount of memory, and other resources that are allocated to a container instance.
    # @return [String]
    attr_accessor :shape

    # This attribute is required.
    # @return [OCI::ContainerInstances::Models::ContainerInstanceShapeConfig]
    attr_accessor :shape_config

    # **[Required]** The virtual networks available to the containers in the container instance.
    # @return [Array<OCI::ContainerInstances::Models::ContainerVnic>]
    attr_accessor :vnics

    # @return [OCI::ContainerInstances::Models::ContainerDnsConfig]
    attr_accessor :dns_config

    # The amount of time that processes in a container have to gracefully end when the container must be stopped. For example, when you delete a container instance. After the timeout is reached, the processes are sent a signal to be deleted.
    # @return [Integer]
    attr_accessor :graceful_shutdown_timeout_in_seconds

    # The image pulls secrets so you can access private registry to pull container images.
    # @return [Array<OCI::ContainerInstances::Models::ImagePullSecret>]
    attr_accessor :image_pull_secrets

    # **[Required]** The container restart policy is applied for all containers in container instance.
    # @return [String]
    attr_reader :container_restart_policy

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'compartment_id': :'compartmentId',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags',
        'availability_domain': :'availabilityDomain',
        'fault_domain': :'faultDomain',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'volumes': :'volumes',
        'volume_count': :'volumeCount',
        'containers': :'containers',
        'container_count': :'containerCount',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'shape': :'shape',
        'shape_config': :'shapeConfig',
        'vnics': :'vnics',
        'dns_config': :'dnsConfig',
        'graceful_shutdown_timeout_in_seconds': :'gracefulShutdownTimeoutInSeconds',
        'image_pull_secrets': :'imagePullSecrets',
        'container_restart_policy': :'containerRestartPolicy'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'display_name': :'String',
        'compartment_id': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>',
        'availability_domain': :'String',
        'fault_domain': :'String',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'volumes': :'Array<OCI::ContainerInstances::Models::ContainerVolume>',
        'volume_count': :'Integer',
        'containers': :'Array<OCI::ContainerInstances::Models::ContainerInstanceContainer>',
        'container_count': :'Integer',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'shape': :'String',
        'shape_config': :'OCI::ContainerInstances::Models::ContainerInstanceShapeConfig',
        'vnics': :'Array<OCI::ContainerInstances::Models::ContainerVnic>',
        'dns_config': :'OCI::ContainerInstances::Models::ContainerDnsConfig',
        'graceful_shutdown_timeout_in_seconds': :'Integer',
        'image_pull_secrets': :'Array<OCI::ContainerInstances::Models::ImagePullSecret>',
        'container_restart_policy': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [String] :fault_domain The value to assign to the {#fault_domain} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [Array<OCI::ContainerInstances::Models::ContainerVolume>] :volumes The value to assign to the {#volumes} property
    # @option attributes [Integer] :volume_count The value to assign to the {#volume_count} property
    # @option attributes [Array<OCI::ContainerInstances::Models::ContainerInstanceContainer>] :containers The value to assign to the {#containers} property
    # @option attributes [Integer] :container_count The value to assign to the {#container_count} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :shape The value to assign to the {#shape} property
    # @option attributes [OCI::ContainerInstances::Models::ContainerInstanceShapeConfig] :shape_config The value to assign to the {#shape_config} property
    # @option attributes [Array<OCI::ContainerInstances::Models::ContainerVnic>] :vnics The value to assign to the {#vnics} property
    # @option attributes [OCI::ContainerInstances::Models::ContainerDnsConfig] :dns_config The value to assign to the {#dns_config} property
    # @option attributes [Integer] :graceful_shutdown_timeout_in_seconds The value to assign to the {#graceful_shutdown_timeout_in_seconds} property
    # @option attributes [Array<OCI::ContainerInstances::Models::ImagePullSecret>] :image_pull_secrets The value to assign to the {#image_pull_secrets} property
    # @option attributes [String] :container_restart_policy The value to assign to the {#container_restart_policy} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']

      self.availability_domain = attributes[:'availabilityDomain'] if attributes[:'availabilityDomain']

      raise 'You cannot provide both :availabilityDomain and :availability_domain' if attributes.key?(:'availabilityDomain') && attributes.key?(:'availability_domain')

      self.availability_domain = attributes[:'availability_domain'] if attributes[:'availability_domain']

      self.fault_domain = attributes[:'faultDomain'] if attributes[:'faultDomain']

      raise 'You cannot provide both :faultDomain and :fault_domain' if attributes.key?(:'faultDomain') && attributes.key?(:'fault_domain')

      self.fault_domain = attributes[:'fault_domain'] if attributes[:'fault_domain']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.volumes = attributes[:'volumes'] if attributes[:'volumes']

      self.volume_count = attributes[:'volumeCount'] if attributes[:'volumeCount']

      raise 'You cannot provide both :volumeCount and :volume_count' if attributes.key?(:'volumeCount') && attributes.key?(:'volume_count')

      self.volume_count = attributes[:'volume_count'] if attributes[:'volume_count']

      self.containers = attributes[:'containers'] if attributes[:'containers']

      self.container_count = attributes[:'containerCount'] if attributes[:'containerCount']

      raise 'You cannot provide both :containerCount and :container_count' if attributes.key?(:'containerCount') && attributes.key?(:'container_count')

      self.container_count = attributes[:'container_count'] if attributes[:'container_count']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.shape = attributes[:'shape'] if attributes[:'shape']

      self.shape_config = attributes[:'shapeConfig'] if attributes[:'shapeConfig']

      raise 'You cannot provide both :shapeConfig and :shape_config' if attributes.key?(:'shapeConfig') && attributes.key?(:'shape_config')

      self.shape_config = attributes[:'shape_config'] if attributes[:'shape_config']

      self.vnics = attributes[:'vnics'] if attributes[:'vnics']

      self.dns_config = attributes[:'dnsConfig'] if attributes[:'dnsConfig']

      raise 'You cannot provide both :dnsConfig and :dns_config' if attributes.key?(:'dnsConfig') && attributes.key?(:'dns_config')

      self.dns_config = attributes[:'dns_config'] if attributes[:'dns_config']

      self.graceful_shutdown_timeout_in_seconds = attributes[:'gracefulShutdownTimeoutInSeconds'] if attributes[:'gracefulShutdownTimeoutInSeconds']

      raise 'You cannot provide both :gracefulShutdownTimeoutInSeconds and :graceful_shutdown_timeout_in_seconds' if attributes.key?(:'gracefulShutdownTimeoutInSeconds') && attributes.key?(:'graceful_shutdown_timeout_in_seconds')

      self.graceful_shutdown_timeout_in_seconds = attributes[:'graceful_shutdown_timeout_in_seconds'] if attributes[:'graceful_shutdown_timeout_in_seconds']

      self.image_pull_secrets = attributes[:'imagePullSecrets'] if attributes[:'imagePullSecrets']

      raise 'You cannot provide both :imagePullSecrets and :image_pull_secrets' if attributes.key?(:'imagePullSecrets') && attributes.key?(:'image_pull_secrets')

      self.image_pull_secrets = attributes[:'image_pull_secrets'] if attributes[:'image_pull_secrets']

      self.container_restart_policy = attributes[:'containerRestartPolicy'] if attributes[:'containerRestartPolicy']

      raise 'You cannot provide both :containerRestartPolicy and :container_restart_policy' if attributes.key?(:'containerRestartPolicy') && attributes.key?(:'container_restart_policy')

      self.container_restart_policy = attributes[:'container_restart_policy'] if attributes[:'container_restart_policy']
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
    # @param [Object] container_restart_policy Object to be assigned
    def container_restart_policy=(container_restart_policy)
      # rubocop:disable Style/ConditionalAssignment
      if container_restart_policy && !CONTAINER_RESTART_POLICY_ENUM.include?(container_restart_policy)
        OCI.logger.debug("Unknown value for 'container_restart_policy' [" + container_restart_policy + "]. Mapping to 'CONTAINER_RESTART_POLICY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @container_restart_policy = CONTAINER_RESTART_POLICY_UNKNOWN_ENUM_VALUE
      else
        @container_restart_policy = container_restart_policy
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        display_name == other.display_name &&
        compartment_id == other.compartment_id &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags &&
        availability_domain == other.availability_domain &&
        fault_domain == other.fault_domain &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        volumes == other.volumes &&
        volume_count == other.volume_count &&
        containers == other.containers &&
        container_count == other.container_count &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        shape == other.shape &&
        shape_config == other.shape_config &&
        vnics == other.vnics &&
        dns_config == other.dns_config &&
        graceful_shutdown_timeout_in_seconds == other.graceful_shutdown_timeout_in_seconds &&
        image_pull_secrets == other.image_pull_secrets &&
        container_restart_policy == other.container_restart_policy
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
      [id, display_name, compartment_id, freeform_tags, defined_tags, system_tags, availability_domain, fault_domain, lifecycle_state, lifecycle_details, volumes, volume_count, containers, container_count, time_created, time_updated, shape, shape_config, vnics, dns_config, graceful_shutdown_timeout_in_seconds, image_pull_secrets, container_restart_policy].hash
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
