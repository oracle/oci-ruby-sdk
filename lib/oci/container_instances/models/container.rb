# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210415
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A single container on a container instance.
  #
  # If you delete a container, the record remains visible for a short period
  # of time before being permanently removed.
  #
  class ContainerInstances::Models::Container
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

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the container.
    # @return [String]
    attr_accessor :id

    # **[Required]** A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The OCID of the compartment that contains the container.
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

    # **[Required]** The availability domain where the container instance that hosts the container runs.
    # @return [String]
    attr_accessor :availability_domain

    # The fault domain of the container instance that hosts the container runs.
    # @return [String]
    attr_accessor :fault_domain

    # **[Required]** The current state of the container.
    # @return [String]
    attr_reader :lifecycle_state

    # A message that describes the current state of the container in more detail. Can be used to provide
    # actionable information.
    #
    # @return [String]
    attr_accessor :lifecycle_details

    # The exit code of the container process when it stopped running.
    # @return [Integer]
    attr_accessor :exit_code

    # The time when the container last deleted (terminated), in the format defined by [RFC 3339](https://tools.ietf.org/rfc/rfc3339).
    # @return [DateTime]
    attr_accessor :time_terminated

    # **[Required]** The time the container was created, in the format defined by [RFC 3339](https://tools.ietf.org/rfc/rfc3339).
    # @return [DateTime]
    attr_accessor :time_created

    # The time the container was updated, in the format defined by [RFC 3339](https://tools.ietf.org/rfc/rfc3339).
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the container instance that the container is running on.
    # @return [String]
    attr_accessor :container_instance_id

    # **[Required]** The container image information. Currently only supports public Docker registry.
    #
    # You can provide either the image name (containerImage), image name with version (containerImagev1), or complete Docker image URL
    # `docker.io/library/containerImage:latest`.
    #
    # If you do not provide a registry, the registry defaults to public Docker hub `docker.io/library`.
    # The registry used for the container image must be reachable over the VNIC of the container instance.
    #
    # @return [String]
    attr_accessor :image_url

    # This command overrides ENTRYPOINT process of the container.
    # If you do not specify this command, the existing ENTRYPOINT process defined in the image is the default.
    #
    # @return [Array<String>]
    attr_accessor :command

    # A list of string arguments for the ENTRYPOINT process of the container.
    #
    # Many containers use an ENTRYPOINT process pointing to a shell
    # `/bin/bash`. For those containers, you can use the argument list to specify the main command in the container process.
    #
    # @return [Array<String>]
    attr_accessor :arguments

    # The working directory within the container's filesystem for
    # the container process. If not specified, the default
    # working directory from the image is used.
    #
    # @return [String]
    attr_accessor :working_directory

    # A map of additional environment variables to set in the environment of the
    # ENTRYPOINT process of the container. These variables are in addition to any variables already defined
    # in the container's image.
    #
    # @return [Hash<String, String>]
    attr_accessor :environment_variables

    # List of the volume mounts.
    #
    # @return [Array<OCI::ContainerInstances::Models::VolumeMount>]
    attr_accessor :volume_mounts

    # List of container health checks
    # @return [Array<OCI::ContainerInstances::Models::ContainerHealthCheck>]
    attr_accessor :health_checks

    # Determines if the container will have access to the container instance resource principal.
    #
    # This method utilizes resource principal version 2.2. For more information on how to use the exposed resource principal elements, see
    # https://docs.oracle.com/en-us/iaas/Content/API/Concepts/sdk_authentication_methods.htm#sdk_authentication_methods_resource_principal.
    #
    # @return [BOOLEAN]
    attr_accessor :is_resource_principal_disabled

    # @return [OCI::ContainerInstances::Models::ContainerResourceConfig]
    attr_accessor :resource_config

    # The number of container restart attempts. Depending on the restart policy, a restart might be attempted after a health check failure or a container exit.
    # @return [Integer]
    attr_accessor :container_restart_attempt_count

    # @return [OCI::ContainerInstances::Models::SecurityContext]
    attr_accessor :security_context

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
        'exit_code': :'exitCode',
        'time_terminated': :'timeTerminated',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'container_instance_id': :'containerInstanceId',
        'image_url': :'imageUrl',
        'command': :'command',
        'arguments': :'arguments',
        'working_directory': :'workingDirectory',
        'environment_variables': :'environmentVariables',
        'volume_mounts': :'volumeMounts',
        'health_checks': :'healthChecks',
        'is_resource_principal_disabled': :'isResourcePrincipalDisabled',
        'resource_config': :'resourceConfig',
        'container_restart_attempt_count': :'containerRestartAttemptCount',
        'security_context': :'securityContext'
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
        'exit_code': :'Integer',
        'time_terminated': :'DateTime',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'container_instance_id': :'String',
        'image_url': :'String',
        'command': :'Array<String>',
        'arguments': :'Array<String>',
        'working_directory': :'String',
        'environment_variables': :'Hash<String, String>',
        'volume_mounts': :'Array<OCI::ContainerInstances::Models::VolumeMount>',
        'health_checks': :'Array<OCI::ContainerInstances::Models::ContainerHealthCheck>',
        'is_resource_principal_disabled': :'BOOLEAN',
        'resource_config': :'OCI::ContainerInstances::Models::ContainerResourceConfig',
        'container_restart_attempt_count': :'Integer',
        'security_context': :'OCI::ContainerInstances::Models::SecurityContext'
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
    # @option attributes [Integer] :exit_code The value to assign to the {#exit_code} property
    # @option attributes [DateTime] :time_terminated The value to assign to the {#time_terminated} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :container_instance_id The value to assign to the {#container_instance_id} property
    # @option attributes [String] :image_url The value to assign to the {#image_url} property
    # @option attributes [Array<String>] :command The value to assign to the {#command} property
    # @option attributes [Array<String>] :arguments The value to assign to the {#arguments} property
    # @option attributes [String] :working_directory The value to assign to the {#working_directory} property
    # @option attributes [Hash<String, String>] :environment_variables The value to assign to the {#environment_variables} property
    # @option attributes [Array<OCI::ContainerInstances::Models::VolumeMount>] :volume_mounts The value to assign to the {#volume_mounts} property
    # @option attributes [Array<OCI::ContainerInstances::Models::ContainerHealthCheck>] :health_checks The value to assign to the {#health_checks} property
    # @option attributes [BOOLEAN] :is_resource_principal_disabled The value to assign to the {#is_resource_principal_disabled} property
    # @option attributes [OCI::ContainerInstances::Models::ContainerResourceConfig] :resource_config The value to assign to the {#resource_config} property
    # @option attributes [Integer] :container_restart_attempt_count The value to assign to the {#container_restart_attempt_count} property
    # @option attributes [OCI::ContainerInstances::Models::SecurityContext] :security_context The value to assign to the {#security_context} property
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

      self.exit_code = attributes[:'exitCode'] if attributes[:'exitCode']

      raise 'You cannot provide both :exitCode and :exit_code' if attributes.key?(:'exitCode') && attributes.key?(:'exit_code')

      self.exit_code = attributes[:'exit_code'] if attributes[:'exit_code']

      self.time_terminated = attributes[:'timeTerminated'] if attributes[:'timeTerminated']

      raise 'You cannot provide both :timeTerminated and :time_terminated' if attributes.key?(:'timeTerminated') && attributes.key?(:'time_terminated')

      self.time_terminated = attributes[:'time_terminated'] if attributes[:'time_terminated']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.container_instance_id = attributes[:'containerInstanceId'] if attributes[:'containerInstanceId']

      raise 'You cannot provide both :containerInstanceId and :container_instance_id' if attributes.key?(:'containerInstanceId') && attributes.key?(:'container_instance_id')

      self.container_instance_id = attributes[:'container_instance_id'] if attributes[:'container_instance_id']

      self.image_url = attributes[:'imageUrl'] if attributes[:'imageUrl']

      raise 'You cannot provide both :imageUrl and :image_url' if attributes.key?(:'imageUrl') && attributes.key?(:'image_url')

      self.image_url = attributes[:'image_url'] if attributes[:'image_url']

      self.command = attributes[:'command'] if attributes[:'command']

      self.arguments = attributes[:'arguments'] if attributes[:'arguments']

      self.working_directory = attributes[:'workingDirectory'] if attributes[:'workingDirectory']

      raise 'You cannot provide both :workingDirectory and :working_directory' if attributes.key?(:'workingDirectory') && attributes.key?(:'working_directory')

      self.working_directory = attributes[:'working_directory'] if attributes[:'working_directory']

      self.environment_variables = attributes[:'environmentVariables'] if attributes[:'environmentVariables']

      raise 'You cannot provide both :environmentVariables and :environment_variables' if attributes.key?(:'environmentVariables') && attributes.key?(:'environment_variables')

      self.environment_variables = attributes[:'environment_variables'] if attributes[:'environment_variables']

      self.volume_mounts = attributes[:'volumeMounts'] if attributes[:'volumeMounts']

      raise 'You cannot provide both :volumeMounts and :volume_mounts' if attributes.key?(:'volumeMounts') && attributes.key?(:'volume_mounts')

      self.volume_mounts = attributes[:'volume_mounts'] if attributes[:'volume_mounts']

      self.health_checks = attributes[:'healthChecks'] if attributes[:'healthChecks']

      raise 'You cannot provide both :healthChecks and :health_checks' if attributes.key?(:'healthChecks') && attributes.key?(:'health_checks')

      self.health_checks = attributes[:'health_checks'] if attributes[:'health_checks']

      self.is_resource_principal_disabled = attributes[:'isResourcePrincipalDisabled'] unless attributes[:'isResourcePrincipalDisabled'].nil?

      raise 'You cannot provide both :isResourcePrincipalDisabled and :is_resource_principal_disabled' if attributes.key?(:'isResourcePrincipalDisabled') && attributes.key?(:'is_resource_principal_disabled')

      self.is_resource_principal_disabled = attributes[:'is_resource_principal_disabled'] unless attributes[:'is_resource_principal_disabled'].nil?

      self.resource_config = attributes[:'resourceConfig'] if attributes[:'resourceConfig']

      raise 'You cannot provide both :resourceConfig and :resource_config' if attributes.key?(:'resourceConfig') && attributes.key?(:'resource_config')

      self.resource_config = attributes[:'resource_config'] if attributes[:'resource_config']

      self.container_restart_attempt_count = attributes[:'containerRestartAttemptCount'] if attributes[:'containerRestartAttemptCount']

      raise 'You cannot provide both :containerRestartAttemptCount and :container_restart_attempt_count' if attributes.key?(:'containerRestartAttemptCount') && attributes.key?(:'container_restart_attempt_count')

      self.container_restart_attempt_count = attributes[:'container_restart_attempt_count'] if attributes[:'container_restart_attempt_count']

      self.security_context = attributes[:'securityContext'] if attributes[:'securityContext']

      raise 'You cannot provide both :securityContext and :security_context' if attributes.key?(:'securityContext') && attributes.key?(:'security_context')

      self.security_context = attributes[:'security_context'] if attributes[:'security_context']
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
        exit_code == other.exit_code &&
        time_terminated == other.time_terminated &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        container_instance_id == other.container_instance_id &&
        image_url == other.image_url &&
        command == other.command &&
        arguments == other.arguments &&
        working_directory == other.working_directory &&
        environment_variables == other.environment_variables &&
        volume_mounts == other.volume_mounts &&
        health_checks == other.health_checks &&
        is_resource_principal_disabled == other.is_resource_principal_disabled &&
        resource_config == other.resource_config &&
        container_restart_attempt_count == other.container_restart_attempt_count &&
        security_context == other.security_context
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
      [id, display_name, compartment_id, freeform_tags, defined_tags, system_tags, availability_domain, fault_domain, lifecycle_state, lifecycle_details, exit_code, time_terminated, time_created, time_updated, container_instance_id, image_url, command, arguments, working_directory, environment_variables, volume_mounts, health_checks, is_resource_principal_disabled, resource_config, container_restart_attempt_count, security_context].hash
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
