# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A compute host. The image used to launch the instance determines its operating system and other
  # software. The shape specified during the launch process determines the number of CPUs and memory
  # allocated to the instance. For more information, see
  # [Overview of the Compute Service](https://docs.cloud.oracle.com/Content/Compute/Concepts/computeoverview.htm).
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
  # talk to an administrator. If you're an administrator who needs to write policies to give users access, see
  # [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you
  # supply string values using the API.
  #
  class Core::Models::Instance
    LAUNCH_MODE_ENUM = [
      LAUNCH_MODE_NATIVE = 'NATIVE'.freeze,
      LAUNCH_MODE_EMULATED = 'EMULATED'.freeze,
      LAUNCH_MODE_PARAVIRTUALIZED = 'PARAVIRTUALIZED'.freeze,
      LAUNCH_MODE_CUSTOM = 'CUSTOM'.freeze,
      LAUNCH_MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_MOVING = 'MOVING'.freeze,
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_RUNNING = 'RUNNING'.freeze,
      LIFECYCLE_STATE_STARTING = 'STARTING'.freeze,
      LIFECYCLE_STATE_STOPPING = 'STOPPING'.freeze,
      LIFECYCLE_STATE_STOPPED = 'STOPPED'.freeze,
      LIFECYCLE_STATE_CREATING_IMAGE = 'CREATING_IMAGE'.freeze,
      LIFECYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The availability domain the instance is running in.
    #
    # Example: `Uocm:PHX-AD-1`
    #
    # @return [String]
    attr_accessor :availability_domain

    # **[Required]** The OCID of the compartment that contains the instance.
    # @return [String]
    attr_accessor :compartment_id

    # The OCID of dedicated VM host.
    #
    # @return [String]
    attr_accessor :dedicated_vm_host_id

    # Defined tags for this resource. Each key is predefined and scoped to a
    # namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # A user-friendly name. Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # Example: `My bare metal instance`
    #
    # @return [String]
    attr_accessor :display_name

    # Additional metadata key/value pairs that you provide. They serve the same purpose and functionality as fields in the 'metadata' object.
    #
    # They are distinguished from 'metadata' fields in that these can be nested JSON objects (whereas 'metadata' fields are string/string maps only).
    #
    # @return [Hash<String, Object>]
    attr_accessor :extended_metadata

    # The name of the fault domain the instance is running in.
    #
    # A fault domain is a grouping of hardware and infrastructure within an availability domain.
    # Each availability domain contains three fault domains. Fault domains let you distribute your
    # instances so that they are not on the same physical hardware within a single availability domain.
    # A hardware failure or Compute hardware maintenance that affects one fault domain does not affect
    # instances in other fault domains.
    #
    # If you do not specify the fault domain, the system selects one for you. To change the fault
    # domain for an instance, terminate it and launch a new instance in the preferred fault domain.
    #
    # Example: `FAULT-DOMAIN-1`
    #
    # @return [String]
    attr_accessor :fault_domain

    # Free-form tags for this resource. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # **[Required]** The OCID of the instance.
    # @return [String]
    attr_accessor :id

    # Deprecated. Use `sourceDetails` instead.
    #
    # @return [String]
    attr_accessor :image_id

    # When a bare metal or virtual machine
    # instance boots, the iPXE firmware that runs on the instance is
    # configured to run an iPXE script to continue the boot process.
    #
    # If you want more control over the boot process, you can provide
    # your own custom iPXE script that will run when the instance boots;
    # however, you should be aware that the same iPXE script will run
    # every time an instance boots; not only after the initial
    # LaunchInstance call.
    #
    # The default iPXE script connects to the instance's local boot
    # volume over iSCSI and performs a network boot. If you use a custom iPXE
    # script and want to network-boot from the instance's local boot volume
    # over iSCSI the same way as the default iPXE script, you should use the
    # following iSCSI IP address: 169.254.0.2, and boot volume IQN:
    # iqn.2015-02.oracle.boot.
    #
    # For more information about the Bring Your Own Image feature of
    # Oracle Cloud Infrastructure, see
    # [Bring Your Own Image](https://docs.cloud.oracle.com/Content/Compute/References/bringyourownimage.htm).
    #
    # For more information about iPXE, see http://ipxe.org.
    #
    # @return [String]
    attr_accessor :ipxe_script

    # Specifies the configuration mode for launching virtual machine (VM) instances. The configuration modes are:
    # * `NATIVE` - VM instances launch with iSCSI boot and VFIO devices. The default value for Oracle-provided images.
    # * `EMULATED` - VM instances launch with emulated devices, such as the E1000 network driver and emulated SCSI disk controller.
    # * `PARAVIRTUALIZED` - VM instances launch with paravirtualized devices using virtio drivers.
    # * `CUSTOM` - VM instances launch with custom configuration settings specified in the `LaunchOptions` parameter.
    #
    # @return [String]
    attr_reader :launch_mode

    # @return [OCI::Core::Models::LaunchOptions]
    attr_accessor :launch_options

    # **[Required]** The current state of the instance.
    # @return [String]
    attr_reader :lifecycle_state

    # Custom metadata that you provide.
    # @return [Hash<String, String>]
    attr_accessor :metadata

    # **[Required]** The region that contains the availability domain the instance is running in.
    #
    # For the us-phoenix-1 and us-ashburn-1 regions, `phx` and `iad` are returned, respectively.
    # For all other regions, the full region name is returned.
    #
    # Examples: `phx`, `eu-frankfurt-1`
    #
    # @return [String]
    attr_accessor :region

    # **[Required]** The shape of the instance. The shape determines the number of CPUs and the amount of memory
    # allocated to the instance. You can enumerate all available shapes by calling
    # {#list_shapes list_shapes}.
    #
    # @return [String]
    attr_accessor :shape

    # Details for creating an instance
    # @return [OCI::Core::Models::InstanceSourceDetails]
    attr_accessor :source_details

    # **[Required]** The date and time the instance was created, in the format defined by RFC3339.
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # @return [OCI::Core::Models::InstanceAgentConfig]
    attr_accessor :agent_config

    # The date and time the instance is expected to be stopped / started,  in the format defined by RFC3339.
    # After that time if instance hasn't been rebooted, Oracle will reboot the instance within 24 hours of the due time.
    # Regardless of how the instance was stopped, the flag will be reset to empty as soon as instance reaches Stopped state.
    # Example: `2018-05-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_maintenance_reboot_due

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'availability_domain': :'availabilityDomain',
        'compartment_id': :'compartmentId',
        'dedicated_vm_host_id': :'dedicatedVmHostId',
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'extended_metadata': :'extendedMetadata',
        'fault_domain': :'faultDomain',
        'freeform_tags': :'freeformTags',
        'id': :'id',
        'image_id': :'imageId',
        'ipxe_script': :'ipxeScript',
        'launch_mode': :'launchMode',
        'launch_options': :'launchOptions',
        'lifecycle_state': :'lifecycleState',
        'metadata': :'metadata',
        'region': :'region',
        'shape': :'shape',
        'source_details': :'sourceDetails',
        'time_created': :'timeCreated',
        'agent_config': :'agentConfig',
        'time_maintenance_reboot_due': :'timeMaintenanceRebootDue'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'availability_domain': :'String',
        'compartment_id': :'String',
        'dedicated_vm_host_id': :'String',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'extended_metadata': :'Hash<String, Object>',
        'fault_domain': :'String',
        'freeform_tags': :'Hash<String, String>',
        'id': :'String',
        'image_id': :'String',
        'ipxe_script': :'String',
        'launch_mode': :'String',
        'launch_options': :'OCI::Core::Models::LaunchOptions',
        'lifecycle_state': :'String',
        'metadata': :'Hash<String, String>',
        'region': :'String',
        'shape': :'String',
        'source_details': :'OCI::Core::Models::InstanceSourceDetails',
        'time_created': :'DateTime',
        'agent_config': :'OCI::Core::Models::InstanceAgentConfig',
        'time_maintenance_reboot_due': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :dedicated_vm_host_id The value to assign to the {#dedicated_vm_host_id} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, Object>] :extended_metadata The value to assign to the {#extended_metadata} property
    # @option attributes [String] :fault_domain The value to assign to the {#fault_domain} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :image_id The value to assign to the {#image_id} property
    # @option attributes [String] :ipxe_script The value to assign to the {#ipxe_script} property
    # @option attributes [String] :launch_mode The value to assign to the {#launch_mode} property
    # @option attributes [OCI::Core::Models::LaunchOptions] :launch_options The value to assign to the {#launch_options} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Hash<String, String>] :metadata The value to assign to the {#metadata} property
    # @option attributes [String] :region The value to assign to the {#region} property
    # @option attributes [String] :shape The value to assign to the {#shape} property
    # @option attributes [OCI::Core::Models::InstanceSourceDetails] :source_details The value to assign to the {#source_details} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [OCI::Core::Models::InstanceAgentConfig] :agent_config The value to assign to the {#agent_config} property
    # @option attributes [DateTime] :time_maintenance_reboot_due The value to assign to the {#time_maintenance_reboot_due} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.availability_domain = attributes[:'availabilityDomain'] if attributes[:'availabilityDomain']

      raise 'You cannot provide both :availabilityDomain and :availability_domain' if attributes.key?(:'availabilityDomain') && attributes.key?(:'availability_domain')

      self.availability_domain = attributes[:'availability_domain'] if attributes[:'availability_domain']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.dedicated_vm_host_id = attributes[:'dedicatedVmHostId'] if attributes[:'dedicatedVmHostId']

      raise 'You cannot provide both :dedicatedVmHostId and :dedicated_vm_host_id' if attributes.key?(:'dedicatedVmHostId') && attributes.key?(:'dedicated_vm_host_id')

      self.dedicated_vm_host_id = attributes[:'dedicated_vm_host_id'] if attributes[:'dedicated_vm_host_id']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.extended_metadata = attributes[:'extendedMetadata'] if attributes[:'extendedMetadata']

      raise 'You cannot provide both :extendedMetadata and :extended_metadata' if attributes.key?(:'extendedMetadata') && attributes.key?(:'extended_metadata')

      self.extended_metadata = attributes[:'extended_metadata'] if attributes[:'extended_metadata']

      self.fault_domain = attributes[:'faultDomain'] if attributes[:'faultDomain']

      raise 'You cannot provide both :faultDomain and :fault_domain' if attributes.key?(:'faultDomain') && attributes.key?(:'fault_domain')

      self.fault_domain = attributes[:'fault_domain'] if attributes[:'fault_domain']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.id = attributes[:'id'] if attributes[:'id']

      self.image_id = attributes[:'imageId'] if attributes[:'imageId']

      raise 'You cannot provide both :imageId and :image_id' if attributes.key?(:'imageId') && attributes.key?(:'image_id')

      self.image_id = attributes[:'image_id'] if attributes[:'image_id']

      self.ipxe_script = attributes[:'ipxeScript'] if attributes[:'ipxeScript']

      raise 'You cannot provide both :ipxeScript and :ipxe_script' if attributes.key?(:'ipxeScript') && attributes.key?(:'ipxe_script')

      self.ipxe_script = attributes[:'ipxe_script'] if attributes[:'ipxe_script']

      self.launch_mode = attributes[:'launchMode'] if attributes[:'launchMode']

      raise 'You cannot provide both :launchMode and :launch_mode' if attributes.key?(:'launchMode') && attributes.key?(:'launch_mode')

      self.launch_mode = attributes[:'launch_mode'] if attributes[:'launch_mode']

      self.launch_options = attributes[:'launchOptions'] if attributes[:'launchOptions']

      raise 'You cannot provide both :launchOptions and :launch_options' if attributes.key?(:'launchOptions') && attributes.key?(:'launch_options')

      self.launch_options = attributes[:'launch_options'] if attributes[:'launch_options']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.metadata = attributes[:'metadata'] if attributes[:'metadata']

      self.region = attributes[:'region'] if attributes[:'region']

      self.shape = attributes[:'shape'] if attributes[:'shape']

      self.source_details = attributes[:'sourceDetails'] if attributes[:'sourceDetails']

      raise 'You cannot provide both :sourceDetails and :source_details' if attributes.key?(:'sourceDetails') && attributes.key?(:'source_details')

      self.source_details = attributes[:'source_details'] if attributes[:'source_details']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.agent_config = attributes[:'agentConfig'] if attributes[:'agentConfig']

      raise 'You cannot provide both :agentConfig and :agent_config' if attributes.key?(:'agentConfig') && attributes.key?(:'agent_config')

      self.agent_config = attributes[:'agent_config'] if attributes[:'agent_config']

      self.time_maintenance_reboot_due = attributes[:'timeMaintenanceRebootDue'] if attributes[:'timeMaintenanceRebootDue']

      raise 'You cannot provide both :timeMaintenanceRebootDue and :time_maintenance_reboot_due' if attributes.key?(:'timeMaintenanceRebootDue') && attributes.key?(:'time_maintenance_reboot_due')

      self.time_maintenance_reboot_due = attributes[:'time_maintenance_reboot_due'] if attributes[:'time_maintenance_reboot_due']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] launch_mode Object to be assigned
    def launch_mode=(launch_mode)
      # rubocop:disable Style/ConditionalAssignment
      if launch_mode && !LAUNCH_MODE_ENUM.include?(launch_mode)
        OCI.logger.debug("Unknown value for 'launch_mode' [" + launch_mode + "]. Mapping to 'LAUNCH_MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @launch_mode = LAUNCH_MODE_UNKNOWN_ENUM_VALUE
      else
        @launch_mode = launch_mode
      end
      # rubocop:enable Style/ConditionalAssignment
    end

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
        availability_domain == other.availability_domain &&
        compartment_id == other.compartment_id &&
        dedicated_vm_host_id == other.dedicated_vm_host_id &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        extended_metadata == other.extended_metadata &&
        fault_domain == other.fault_domain &&
        freeform_tags == other.freeform_tags &&
        id == other.id &&
        image_id == other.image_id &&
        ipxe_script == other.ipxe_script &&
        launch_mode == other.launch_mode &&
        launch_options == other.launch_options &&
        lifecycle_state == other.lifecycle_state &&
        metadata == other.metadata &&
        region == other.region &&
        shape == other.shape &&
        source_details == other.source_details &&
        time_created == other.time_created &&
        agent_config == other.agent_config &&
        time_maintenance_reboot_due == other.time_maintenance_reboot_due
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
      [availability_domain, compartment_id, dedicated_vm_host_id, defined_tags, display_name, extended_metadata, fault_domain, freeform_tags, id, image_id, ipxe_script, launch_mode, launch_options, lifecycle_state, metadata, region, shape, source_details, time_created, agent_config, time_maintenance_reboot_due].hash
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
