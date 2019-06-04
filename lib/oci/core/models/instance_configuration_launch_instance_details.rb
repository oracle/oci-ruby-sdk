# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # See Instance launch details - {LaunchInstanceDetails}
  #
  class Core::Models::InstanceConfigurationLaunchInstanceDetails
    # The availability domain of the instance.
    #
    # Example: `Uocm:PHX-AD-1`
    #
    # @return [String]
    attr_accessor :availability_domain

    # The OCID of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # Details for the primary VNIC, which is automatically created and attached when
    # the instance is launched.
    #
    # @return [OCI::Core::Models::InstanceConfigurationCreateVnicDetails]
    attr_accessor :create_vnic_details

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

    # Free-form tags for this resource. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # This is an advanced option.
    #
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

    # Custom metadata key/value pairs that you provide, such as the SSH public key
    # required to connect to the instance.
    #
    # A metadata service runs on every launched instance. The service is an HTTP
    # endpoint listening on 169.254.169.254. You can use the service to:
    #
    # * Provide information to [Cloud-Init](https://cloudinit.readthedocs.org/en/latest/)
    #   to be used for various system initialization tasks.
    #
    # * Get information about the instance, including the custom metadata that you
    #   provide when you launch the instance.
    #
    #  **Providing Cloud-Init Metadata**
    #
    #  You can use the following metadata key names to provide information to
    #  Cloud-Init:
    #
    #  **\"ssh_authorized_keys\"** - Provide one or more public SSH keys to be
    #  included in the `~/.ssh/authorized_keys` file for the default user on the
    #  instance. Use a newline character to separate multiple keys. The SSH
    #  keys must be in the format necessary for the `authorized_keys` file, as shown
    #  in the example below.
    #
    #  **\"user_data\"** - Provide your own base64-encoded data to be used by
    #  Cloud-Init to run custom scripts or provide custom Cloud-Init configuration. For
    #  information about how to take advantage of user data, see the
    #  [Cloud-Init Documentation](http://cloudinit.readthedocs.org/en/latest/topics/format.html).
    #
    #  **Note:** Cloud-Init does not pull this data from the `http://169.254.169.254/opc/v1/instance/metadata/`
    #  path. When the instance launches and either of these keys are provided, the key values are formatted as
    #  OpenStack metadata and copied to the following locations, which are recognized by Cloud-Init:
    #
    #  `http://169.254.169.254/openstack/latest/meta_data.json` - This JSON blob
    #  contains, among other things, the SSH keys that you provided for
    #   **\"ssh_authorized_keys\"**.
    #
    #  `http://169.254.169.254/openstack/latest/user_data` - Contains the
    #  base64-decoded data that you provided for **\"user_data\"**.
    #
    #  **Metadata Example**
    #
    #       \"metadata\" : {
    #          \"quake_bot_level\" : \"Severe\",
    #          \"ssh_authorized_keys\" : \"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCZ06fccNTQfq+xubFlJ5ZR3kt+uzspdH9tXL+lAejSM1NXM+CFZev7MIxfEjas06y80ZBZ7DUTQO0GxJPeD8NCOb1VorF8M4xuLwrmzRtkoZzU16umt4y1W0Q4ifdp3IiiU0U8/WxczSXcUVZOLqkz5dc6oMHdMVpkimietWzGZ4LBBsH/LjEVY7E0V+a0sNchlVDIZcm7ErReBLcdTGDq0uLBiuChyl6RUkX1PNhusquTGwK7zc8OBXkRuubn5UKXhI3Ul9Nyk4XESkVWIGNKmw8mSpoJSjR8P9ZjRmcZVo8S+x4KVPMZKQEor== ryan.smith@company.com
    #          ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAzJSAtwEPoB3Jmr58IXrDGzLuDYkWAYg8AsLYlo6JZvKpjY1xednIcfEVQJm4T2DhVmdWhRrwQ8DmayVZvBkLt+zs2LdoAJEVimKwXcJFD/7wtH8Lnk17HiglbbbNXsemjDY0hea4JUE5CfvkIdZBITuMrfqSmA4n3VNoorXYdvtTMoGG8fxMub46RPtuxtqi9bG9Zqenordkg5FJt2mVNfQRqf83CWojcOkklUWq4CjyxaeLf5i9gv1fRoBo4QhiA8I6NCSppO8GnoV/6Ox6TNoh9BiifqGKC9VGYuC89RvUajRBTZSK2TK4DPfaT+2R+slPsFrwiT/oPEhhEK1S5Q== rsa-key-20160227\",
    #          \"user_data\" : \"SWYgeW91IGNhbiBzZWUgdGhpcywgdGhlbiBpdCB3b3JrZWQgbWF5YmUuCg==\"
    #       }
    #  **Getting Metadata on the Instance**
    #
    #  To get information about your instance, connect to the instance using SSH and issue any of the
    #  following GET requests:
    #
    #      curl http://169.254.169.254/opc/v1/instance/
    #      curl http://169.254.169.254/opc/v1/instance/metadata/
    #      curl http://169.254.169.254/opc/v1/instance/metadata/<any-key-name>
    #
    #  You'll get back a response that includes all the instance information; only the metadata information; or
    #  the metadata information for the specified key name, respectively.
    #
    # @return [Hash<String, String>]
    attr_accessor :metadata

    # The shape of an instance. The shape determines the number of CPUs, amount of memory,
    # and other resources allocated to the instance.
    #
    # You can enumerate all available shapes by calling {#list_shapes list_shapes}.
    #
    # @return [String]
    attr_accessor :shape

    # Details for creating an instance.
    # Use this parameter to specify whether a boot volume or an image should be used to launch a new instance.
    #
    # @return [OCI::Core::Models::InstanceConfigurationInstanceSourceDetails]
    attr_accessor :source_details

    # A fault domain is a grouping of hardware and infrastructure within an availability domain.
    # Each availability domain contains three fault domains. Fault domains let you distribute your
    # instances so that they are not on the same physical hardware within a single availability domain.
    # A hardware failure or Compute hardware maintenance that affects one fault domain does not affect
    # instances in other fault domains.
    #
    # If you do not specify the fault domain, the system selects one for you. To change the fault
    # domain for an instance, terminate it and launch a new instance in the preferred fault domain.
    #
    # To get a list of fault domains, use the
    # {#list_fault_domains list_fault_domains} operation in the
    # Identity and Access Management Service API.
    #
    # Example: `FAULT-DOMAIN-1`
    #
    # @return [String]
    attr_accessor :fault_domain

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'availability_domain': :'availabilityDomain',
        'compartment_id': :'compartmentId',
        'create_vnic_details': :'createVnicDetails',
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'extended_metadata': :'extendedMetadata',
        'freeform_tags': :'freeformTags',
        'ipxe_script': :'ipxeScript',
        'metadata': :'metadata',
        'shape': :'shape',
        'source_details': :'sourceDetails',
        'fault_domain': :'faultDomain'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'availability_domain': :'String',
        'compartment_id': :'String',
        'create_vnic_details': :'OCI::Core::Models::InstanceConfigurationCreateVnicDetails',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'extended_metadata': :'Hash<String, Object>',
        'freeform_tags': :'Hash<String, String>',
        'ipxe_script': :'String',
        'metadata': :'Hash<String, String>',
        'shape': :'String',
        'source_details': :'OCI::Core::Models::InstanceConfigurationInstanceSourceDetails',
        'fault_domain': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [OCI::Core::Models::InstanceConfigurationCreateVnicDetails] :create_vnic_details The value to assign to the {#create_vnic_details} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, Object>] :extended_metadata The value to assign to the {#extended_metadata} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [String] :ipxe_script The value to assign to the {#ipxe_script} property
    # @option attributes [Hash<String, String>] :metadata The value to assign to the {#metadata} property
    # @option attributes [String] :shape The value to assign to the {#shape} property
    # @option attributes [OCI::Core::Models::InstanceConfigurationInstanceSourceDetails] :source_details The value to assign to the {#source_details} property
    # @option attributes [String] :fault_domain The value to assign to the {#fault_domain} property
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

      self.create_vnic_details = attributes[:'createVnicDetails'] if attributes[:'createVnicDetails']

      raise 'You cannot provide both :createVnicDetails and :create_vnic_details' if attributes.key?(:'createVnicDetails') && attributes.key?(:'create_vnic_details')

      self.create_vnic_details = attributes[:'create_vnic_details'] if attributes[:'create_vnic_details']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.extended_metadata = attributes[:'extendedMetadata'] if attributes[:'extendedMetadata']

      raise 'You cannot provide both :extendedMetadata and :extended_metadata' if attributes.key?(:'extendedMetadata') && attributes.key?(:'extended_metadata')

      self.extended_metadata = attributes[:'extended_metadata'] if attributes[:'extended_metadata']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.ipxe_script = attributes[:'ipxeScript'] if attributes[:'ipxeScript']

      raise 'You cannot provide both :ipxeScript and :ipxe_script' if attributes.key?(:'ipxeScript') && attributes.key?(:'ipxe_script')

      self.ipxe_script = attributes[:'ipxe_script'] if attributes[:'ipxe_script']

      self.metadata = attributes[:'metadata'] if attributes[:'metadata']

      self.shape = attributes[:'shape'] if attributes[:'shape']

      self.source_details = attributes[:'sourceDetails'] if attributes[:'sourceDetails']

      raise 'You cannot provide both :sourceDetails and :source_details' if attributes.key?(:'sourceDetails') && attributes.key?(:'source_details')

      self.source_details = attributes[:'source_details'] if attributes[:'source_details']

      self.fault_domain = attributes[:'faultDomain'] if attributes[:'faultDomain']

      raise 'You cannot provide both :faultDomain and :fault_domain' if attributes.key?(:'faultDomain') && attributes.key?(:'fault_domain')

      self.fault_domain = attributes[:'fault_domain'] if attributes[:'fault_domain']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        availability_domain == other.availability_domain &&
        compartment_id == other.compartment_id &&
        create_vnic_details == other.create_vnic_details &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        extended_metadata == other.extended_metadata &&
        freeform_tags == other.freeform_tags &&
        ipxe_script == other.ipxe_script &&
        metadata == other.metadata &&
        shape == other.shape &&
        source_details == other.source_details &&
        fault_domain == other.fault_domain
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
      [availability_domain, compartment_id, create_vnic_details, defined_tags, display_name, extended_metadata, freeform_tags, ipxe_script, metadata, shape, source_details, fault_domain].hash
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
