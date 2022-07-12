# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A summary of the SDDC.
  class Ocvp::Models::SddcSummary
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment that
    # contains the SDDC.
    #
    # @return [String]
    attr_accessor :id

    # **[Required]** The availability domain that the SDDC's ESXi hosts are running in. For Multi-AD SDDC, it is `multi-AD`.
    #
    # @return [String]
    attr_accessor :compute_availability_domain

    # **[Required]** A descriptive name for the SDDC. It must be unique, start with a letter, and contain only letters, digits,
    # whitespaces, dashes and underscores.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # **[Required]** In general, this is a specific version of bundled VMware software supported by
    # Oracle Cloud VMware Solution (see
    # {#list_supported_vmware_software_versions list_supported_vmware_software_versions}).
    #
    # This attribute is not guaranteed to reflect the version of
    # software currently installed on the ESXi hosts in the SDDC. The purpose
    # of this attribute is to show the version of software that the Oracle
    # Cloud VMware Solution will install on any new ESXi hosts that you *add to this
    # SDDC in the future* with {#create_esxi_host create_esxi_host}.
    #
    # Therefore, if you upgrade the existing ESXi hosts in the SDDC to use a newer
    # version of bundled VMware software supported by the Oracle Cloud VMware Solution, you
    # should use {#update_sddc update_sddc} to update the SDDC's
    # `vmwareSoftwareVersion` with that new version.
    #
    # @return [String]
    attr_accessor :vmware_software_version

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment that
    # contains the SDDC.
    #
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The number of ESXi hosts in the SDDC.
    # @return [Integer]
    attr_accessor :esxi_hosts_count

    # HCX Fully Qualified Domain Name
    # @return [String]
    attr_accessor :hcx_fqdn

    # Indicates whether HCX is enabled.
    # @return [BOOLEAN]
    attr_accessor :is_hcx_enabled

    # FQDN for vCenter
    #
    # Example: `vcenter-my-sddc.sddc.us-phoenix-1.oraclecloud.com`
    #
    # @return [String]
    attr_accessor :vcenter_fqdn

    # FQDN for NSX Manager
    #
    # Example: `nsx-my-sddc.sddc.us-phoenix-1.oraclecloud.com`
    #
    # @return [String]
    attr_accessor :nsx_manager_fqdn

    # The date and time the SDDC was created, in the format defined by
    # [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The date and time the SDDC was updated, in the format defined by
    # [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # The current state of the SDDC.
    # @return [String]
    attr_reader :lifecycle_state

    # Indicates whether shielded instance is enabled at the SDDC level.
    #
    # @return [BOOLEAN]
    attr_accessor :is_shielded_instance_enabled

    # **[Required]** The initial compute shape of the SDDC's ESXi hosts.
    # {#list_supported_host_shapes list_supported_host_shapes}.
    #
    # @return [String]
    attr_accessor :initial_host_shape_name

    # The initial OCPU count of the SDDC's ESXi hosts.
    #
    # @return [Float]
    attr_accessor :initial_host_ocpu_count

    # **[Required]** Free-form tags for this resource. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # **[Required]** Defined tags for this resource. Each key is predefined and scoped to a
    # namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compute_availability_domain': :'computeAvailabilityDomain',
        'display_name': :'displayName',
        'vmware_software_version': :'vmwareSoftwareVersion',
        'compartment_id': :'compartmentId',
        'esxi_hosts_count': :'esxiHostsCount',
        'hcx_fqdn': :'hcxFqdn',
        'is_hcx_enabled': :'isHcxEnabled',
        'vcenter_fqdn': :'vcenterFqdn',
        'nsx_manager_fqdn': :'nsxManagerFqdn',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'is_shielded_instance_enabled': :'isShieldedInstanceEnabled',
        'initial_host_shape_name': :'initialHostShapeName',
        'initial_host_ocpu_count': :'initialHostOcpuCount',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compute_availability_domain': :'String',
        'display_name': :'String',
        'vmware_software_version': :'String',
        'compartment_id': :'String',
        'esxi_hosts_count': :'Integer',
        'hcx_fqdn': :'String',
        'is_hcx_enabled': :'BOOLEAN',
        'vcenter_fqdn': :'String',
        'nsx_manager_fqdn': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'is_shielded_instance_enabled': :'BOOLEAN',
        'initial_host_shape_name': :'String',
        'initial_host_ocpu_count': :'Float',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compute_availability_domain The value to assign to the {#compute_availability_domain} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :vmware_software_version The value to assign to the {#vmware_software_version} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Integer] :esxi_hosts_count The value to assign to the {#esxi_hosts_count} property
    # @option attributes [String] :hcx_fqdn The value to assign to the {#hcx_fqdn} property
    # @option attributes [BOOLEAN] :is_hcx_enabled The value to assign to the {#is_hcx_enabled} property
    # @option attributes [String] :vcenter_fqdn The value to assign to the {#vcenter_fqdn} property
    # @option attributes [String] :nsx_manager_fqdn The value to assign to the {#nsx_manager_fqdn} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [BOOLEAN] :is_shielded_instance_enabled The value to assign to the {#is_shielded_instance_enabled} property
    # @option attributes [String] :initial_host_shape_name The value to assign to the {#initial_host_shape_name} property
    # @option attributes [Float] :initial_host_ocpu_count The value to assign to the {#initial_host_ocpu_count} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compute_availability_domain = attributes[:'computeAvailabilityDomain'] if attributes[:'computeAvailabilityDomain']

      raise 'You cannot provide both :computeAvailabilityDomain and :compute_availability_domain' if attributes.key?(:'computeAvailabilityDomain') && attributes.key?(:'compute_availability_domain')

      self.compute_availability_domain = attributes[:'compute_availability_domain'] if attributes[:'compute_availability_domain']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.vmware_software_version = attributes[:'vmwareSoftwareVersion'] if attributes[:'vmwareSoftwareVersion']

      raise 'You cannot provide both :vmwareSoftwareVersion and :vmware_software_version' if attributes.key?(:'vmwareSoftwareVersion') && attributes.key?(:'vmware_software_version')

      self.vmware_software_version = attributes[:'vmware_software_version'] if attributes[:'vmware_software_version']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.esxi_hosts_count = attributes[:'esxiHostsCount'] if attributes[:'esxiHostsCount']

      raise 'You cannot provide both :esxiHostsCount and :esxi_hosts_count' if attributes.key?(:'esxiHostsCount') && attributes.key?(:'esxi_hosts_count')

      self.esxi_hosts_count = attributes[:'esxi_hosts_count'] if attributes[:'esxi_hosts_count']

      self.hcx_fqdn = attributes[:'hcxFqdn'] if attributes[:'hcxFqdn']

      raise 'You cannot provide both :hcxFqdn and :hcx_fqdn' if attributes.key?(:'hcxFqdn') && attributes.key?(:'hcx_fqdn')

      self.hcx_fqdn = attributes[:'hcx_fqdn'] if attributes[:'hcx_fqdn']

      self.is_hcx_enabled = attributes[:'isHcxEnabled'] unless attributes[:'isHcxEnabled'].nil?

      raise 'You cannot provide both :isHcxEnabled and :is_hcx_enabled' if attributes.key?(:'isHcxEnabled') && attributes.key?(:'is_hcx_enabled')

      self.is_hcx_enabled = attributes[:'is_hcx_enabled'] unless attributes[:'is_hcx_enabled'].nil?

      self.vcenter_fqdn = attributes[:'vcenterFqdn'] if attributes[:'vcenterFqdn']

      raise 'You cannot provide both :vcenterFqdn and :vcenter_fqdn' if attributes.key?(:'vcenterFqdn') && attributes.key?(:'vcenter_fqdn')

      self.vcenter_fqdn = attributes[:'vcenter_fqdn'] if attributes[:'vcenter_fqdn']

      self.nsx_manager_fqdn = attributes[:'nsxManagerFqdn'] if attributes[:'nsxManagerFqdn']

      raise 'You cannot provide both :nsxManagerFqdn and :nsx_manager_fqdn' if attributes.key?(:'nsxManagerFqdn') && attributes.key?(:'nsx_manager_fqdn')

      self.nsx_manager_fqdn = attributes[:'nsx_manager_fqdn'] if attributes[:'nsx_manager_fqdn']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.is_shielded_instance_enabled = attributes[:'isShieldedInstanceEnabled'] unless attributes[:'isShieldedInstanceEnabled'].nil?
      self.is_shielded_instance_enabled = false if is_shielded_instance_enabled.nil? && !attributes.key?(:'isShieldedInstanceEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isShieldedInstanceEnabled and :is_shielded_instance_enabled' if attributes.key?(:'isShieldedInstanceEnabled') && attributes.key?(:'is_shielded_instance_enabled')

      self.is_shielded_instance_enabled = attributes[:'is_shielded_instance_enabled'] unless attributes[:'is_shielded_instance_enabled'].nil?
      self.is_shielded_instance_enabled = false if is_shielded_instance_enabled.nil? && !attributes.key?(:'isShieldedInstanceEnabled') && !attributes.key?(:'is_shielded_instance_enabled') # rubocop:disable Style/StringLiterals

      self.initial_host_shape_name = attributes[:'initialHostShapeName'] if attributes[:'initialHostShapeName']

      raise 'You cannot provide both :initialHostShapeName and :initial_host_shape_name' if attributes.key?(:'initialHostShapeName') && attributes.key?(:'initial_host_shape_name')

      self.initial_host_shape_name = attributes[:'initial_host_shape_name'] if attributes[:'initial_host_shape_name']

      self.initial_host_ocpu_count = attributes[:'initialHostOcpuCount'] if attributes[:'initialHostOcpuCount']

      raise 'You cannot provide both :initialHostOcpuCount and :initial_host_ocpu_count' if attributes.key?(:'initialHostOcpuCount') && attributes.key?(:'initial_host_ocpu_count')

      self.initial_host_ocpu_count = attributes[:'initial_host_ocpu_count'] if attributes[:'initial_host_ocpu_count']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
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
        compute_availability_domain == other.compute_availability_domain &&
        display_name == other.display_name &&
        vmware_software_version == other.vmware_software_version &&
        compartment_id == other.compartment_id &&
        esxi_hosts_count == other.esxi_hosts_count &&
        hcx_fqdn == other.hcx_fqdn &&
        is_hcx_enabled == other.is_hcx_enabled &&
        vcenter_fqdn == other.vcenter_fqdn &&
        nsx_manager_fqdn == other.nsx_manager_fqdn &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        is_shielded_instance_enabled == other.is_shielded_instance_enabled &&
        initial_host_shape_name == other.initial_host_shape_name &&
        initial_host_ocpu_count == other.initial_host_ocpu_count &&
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
      [id, compute_availability_domain, display_name, vmware_software_version, compartment_id, esxi_hosts_count, hcx_fqdn, is_hcx_enabled, vcenter_fqdn, nsx_manager_fqdn, time_created, time_updated, lifecycle_state, is_shielded_instance_enabled, initial_host_shape_name, initial_host_ocpu_count, freeform_tags, defined_tags].hash
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
