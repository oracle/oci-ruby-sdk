# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # A boot disk image for launching an instance. For more information, see
  # [Overview of the Compute Service](https://docs.us-phoenix-1.oraclecloud.com/Content/Compute/Concepts/computeoverview.htm).
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
  # talk to an administrator. If you're an administrator who needs to write policies to give users access, see
  # [Getting Started with Policies](https://docs.us-phoenix-1.oraclecloud.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you
  # supply string values using the API.
  #
  class Core::Models::Image # rubocop:disable Metrics/LineLength
    LAUNCH_MODE_ENUM = [
      LAUNCH_MODE_NATIVE = 'NATIVE'.freeze,
      LAUNCH_MODE_EMULATED = 'EMULATED'.freeze,
      LAUNCH_MODE_PARAVIRTUALIZED = 'PARAVIRTUALIZED'.freeze,
      LAUNCH_MODE_CUSTOM = 'CUSTOM'.freeze,
      LAUNCH_MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_IMPORTING = 'IMPORTING'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_EXPORTING = 'EXPORTING'.freeze,
      LIFECYCLE_STATE_DISABLED = 'DISABLED'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The OCID of the image originally used to launch the instance.
    # @return [String]
    attr_accessor :base_image_id

    # **[Required]** The OCID of the compartment containing the instance you want to use as the basis for the image.
    #
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** Whether instances launched with this image can be used to create new images.
    # For example, you cannot create an image of an Oracle Database instance.
    # Example: `true`
    #
    # @return [BOOLEAN]
    attr_accessor :create_image_allowed

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # A user-friendly name for the image. It does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    # You cannot use an Oracle-provided image name as a custom image name.
    #
    # Example: `My custom Oracle Linux image`
    #
    # @return [String]
    attr_accessor :display_name

    # Free-form tags for this resource. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see
    # [Resource Tags](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # **[Required]** The OCID of the image.
    # @return [String]
    attr_accessor :id

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

    # This attribute is required.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** The image's operating system.
    #
    # Example: `Oracle Linux`
    #
    # @return [String]
    attr_accessor :operating_system

    # **[Required]** The image's operating system version.
    #
    # Example: `7.2`
    #
    # @return [String]
    attr_accessor :operating_system_version

    # Image size (1 MB = 1048576 bytes)
    #
    # Example: `47694`
    #
    # @return [Integer]
    attr_accessor :size_in_mbs

    # **[Required]** The date and time the image was created, in the format defined by RFC3339.
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'base_image_id': :'baseImageId',
        'compartment_id': :'compartmentId',
        'create_image_allowed': :'createImageAllowed',
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'freeform_tags': :'freeformTags',
        'id': :'id',
        'launch_mode': :'launchMode',
        'launch_options': :'launchOptions',
        'lifecycle_state': :'lifecycleState',
        'operating_system': :'operatingSystem',
        'operating_system_version': :'operatingSystemVersion',
        'size_in_mbs': :'sizeInMBs',
        'time_created': :'timeCreated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'base_image_id': :'String',
        'compartment_id': :'String',
        'create_image_allowed': :'BOOLEAN',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'freeform_tags': :'Hash<String, String>',
        'id': :'String',
        'launch_mode': :'String',
        'launch_options': :'OCI::Core::Models::LaunchOptions',
        'lifecycle_state': :'String',
        'operating_system': :'String',
        'operating_system_version': :'String',
        'size_in_mbs': :'Integer',
        'time_created': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :base_image_id The value to assign to the {#base_image_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [BOOLEAN] :create_image_allowed The value to assign to the {#create_image_allowed} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :launch_mode The value to assign to the {#launch_mode} property
    # @option attributes [OCI::Core::Models::LaunchOptions] :launch_options The value to assign to the {#launch_options} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :operating_system The value to assign to the {#operating_system} property
    # @option attributes [String] :operating_system_version The value to assign to the {#operating_system_version} property
    # @option attributes [Integer] :size_in_mbs The value to assign to the {#size_in_mbs} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.base_image_id = attributes[:'baseImageId'] if attributes[:'baseImageId']

      raise 'You cannot provide both :baseImageId and :base_image_id' if attributes.key?(:'baseImageId') && attributes.key?(:'base_image_id')

      self.base_image_id = attributes[:'base_image_id'] if attributes[:'base_image_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.create_image_allowed = attributes[:'createImageAllowed'] unless attributes[:'createImageAllowed'].nil?

      raise 'You cannot provide both :createImageAllowed and :create_image_allowed' if attributes.key?(:'createImageAllowed') && attributes.key?(:'create_image_allowed')

      self.create_image_allowed = attributes[:'create_image_allowed'] unless attributes[:'create_image_allowed'].nil?

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.id = attributes[:'id'] if attributes[:'id']

      self.launch_mode = attributes[:'launchMode'] if attributes[:'launchMode']

      raise 'You cannot provide both :launchMode and :launch_mode' if attributes.key?(:'launchMode') && attributes.key?(:'launch_mode')

      self.launch_mode = attributes[:'launch_mode'] if attributes[:'launch_mode']

      self.launch_options = attributes[:'launchOptions'] if attributes[:'launchOptions']

      raise 'You cannot provide both :launchOptions and :launch_options' if attributes.key?(:'launchOptions') && attributes.key?(:'launch_options')

      self.launch_options = attributes[:'launch_options'] if attributes[:'launch_options']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.operating_system = attributes[:'operatingSystem'] if attributes[:'operatingSystem']

      raise 'You cannot provide both :operatingSystem and :operating_system' if attributes.key?(:'operatingSystem') && attributes.key?(:'operating_system')

      self.operating_system = attributes[:'operating_system'] if attributes[:'operating_system']

      self.operating_system_version = attributes[:'operatingSystemVersion'] if attributes[:'operatingSystemVersion']

      raise 'You cannot provide both :operatingSystemVersion and :operating_system_version' if attributes.key?(:'operatingSystemVersion') && attributes.key?(:'operating_system_version')

      self.operating_system_version = attributes[:'operating_system_version'] if attributes[:'operating_system_version']

      self.size_in_mbs = attributes[:'sizeInMBs'] if attributes[:'sizeInMBs']

      raise 'You cannot provide both :sizeInMBs and :size_in_mbs' if attributes.key?(:'sizeInMBs') && attributes.key?(:'size_in_mbs')

      self.size_in_mbs = attributes[:'size_in_mbs'] if attributes[:'size_in_mbs']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] launch_mode Object to be assigned
    def launch_mode=(launch_mode)
      # rubocop:disable Style/ConditionalAssignment
      if launch_mode && !LAUNCH_MODE_ENUM.include?(launch_mode)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'launch_mode' [" + launch_mode + "]. Mapping to 'LAUNCH_MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
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
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
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
        base_image_id == other.base_image_id &&
        compartment_id == other.compartment_id &&
        create_image_allowed == other.create_image_allowed &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        freeform_tags == other.freeform_tags &&
        id == other.id &&
        launch_mode == other.launch_mode &&
        launch_options == other.launch_options &&
        lifecycle_state == other.lifecycle_state &&
        operating_system == other.operating_system &&
        operating_system_version == other.operating_system_version &&
        size_in_mbs == other.size_in_mbs &&
        time_created == other.time_created
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [base_image_id, compartment_id, create_image_allowed, defined_tags, display_name, freeform_tags, id, launch_mode, launch_options, lifecycle_state, operating_system, operating_system_version, size_in_mbs, time_created].hash
    end
    # rubocop:enable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines

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
# rubocop:enable Lint/UnneededCopDisableDirective
