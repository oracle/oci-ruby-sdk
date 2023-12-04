# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20230701
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An [Oracle Cloud VMware Solution](https://docs.cloud.oracle.com/iaas/Content/VMware/Concepts/ocvsoverview.htm) software-defined data center (SDDC) contains the resources required for a
  # functional VMware environment. Instances in an SDDC
  # (see {EsxiHost}) run in a virtual cloud network (VCN)
  # and are preconfigured with VMware and storage. Use the vCenter utility to manage
  # and deploy VMware virtual machines (VMs) in the SDDC.
  #
  # The SDDC uses a single management subnet for provisioning the SDDC. It also uses a
  # set of VLANs for various components of the VMware environment (vSphere, vMotion,
  # vSAN, and so on). See the Core Services API for information about VCN subnets and VLANs.
  #
  class Ocvp::Models::Sddc
    HCX_MODE_ENUM = [
      HCX_MODE_DISABLED = 'DISABLED'.freeze,
      HCX_MODE_ADVANCED = 'ADVANCED'.freeze,
      HCX_MODE_ENTERPRISE = 'ENTERPRISE'.freeze,
      HCX_MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the SDDC.
    #
    # @return [String]
    attr_accessor :id

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

    # In general, this is a specific version of bundled ESXi software supported by
    # Oracle Cloud VMware Solution (see
    # {#list_supported_vmware_software_versions list_supported_vmware_software_versions}).
    #
    # This attribute is not guaranteed to reflect the version of
    # software currently installed on the ESXi hosts in the SDDC. The purpose
    # of this attribute is to show the version of software that the Oracle
    # Cloud VMware Solution will install on any new ESXi hosts that you *add to this
    # SDDC in the future* with {#create_esxi_host create_esxi_host}
    # unless a different version is configured on the Cluster or ESXi host level.
    #
    # Therefore, if you upgrade the existing ESXi hosts in the SDDC to use a newer
    # version of bundled ESXi software supported by the Oracle Cloud VMware Solution, you
    # should use {#update_sddc update_sddc} to update the SDDC's
    # `vmwareSoftwareVersion` with that new version.
    #
    # @return [String]
    attr_accessor :esxi_software_version

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment that
    # contains the SDDC.
    #
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The number of Clusters in the SDDC.
    # @return [Integer]
    attr_accessor :clusters_count

    # **[Required]** The FQDN for vCenter.
    #
    # Example: `vcenter-my-sddc.sddc.us-phoenix-1.oraclecloud.com`
    #
    # @return [String]
    attr_accessor :vcenter_fqdn

    # **[Required]** The FQDN for NSX Manager.
    #
    # Example: `nsx-my-sddc.sddc.us-phoenix-1.oraclecloud.com`
    #
    # @return [String]
    attr_accessor :nsx_manager_fqdn

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the `PrivateIp` object that is
    # the virtual IP (VIP) for vCenter. For information about `PrivateIp` objects, see the
    # Core Services API.
    #
    # @return [String]
    attr_accessor :vcenter_private_ip_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the `PrivateIp` object that is
    # the virtual IP (VIP) for NSX Manager. For information about `PrivateIp` objects, see the
    # Core Services API.
    #
    # @return [String]
    attr_accessor :nsx_manager_private_ip_id

    # The SDDC includes an administrator username and password for vCenter. You can
    # change this initial username to a different value in vCenter.
    #
    # @return [String]
    attr_accessor :vcenter_username

    # The SDDC includes an administrator username and initial password for NSX Manager. You
    # can change this initial username to a different value in NSX Manager.
    #
    # @return [String]
    attr_accessor :nsx_manager_username

    # **[Required]** One or more public SSH keys to be included in the `~/.ssh/authorized_keys` file for
    # the default user on each ESXi host. Use a newline character to separate multiple keys.
    # The SSH keys must be in the format required for the `authorized_keys` file.
    #
    # This attribute is not guaranteed to reflect the public SSH keys
    # currently installed on the ESXi hosts in the SDDC. The purpose
    # of this attribute is to show the public SSH keys that Oracle
    # Cloud VMware Solution will install on any new ESXi hosts that you *add to this
    # SDDC in the future* with {#create_esxi_host create_esxi_host}.
    #
    # Therefore, if you upgrade the existing ESXi hosts in the SDDC to use different
    # SSH keys, you should use {#update_sddc update_sddc} to update
    # the SDDC's `sshAuthorizedKeys` with the new public keys.
    #
    # @return [String]
    attr_accessor :ssh_authorized_keys

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the `PrivateIp` object that is
    # the virtual IP (VIP) for the NSX Edge Uplink. Use this OCID as the route target for
    # route table rules when setting up connectivity between the SDDC and other networks.
    # For information about `PrivateIp` objects, see the Core Services API.
    #
    # @return [String]
    attr_accessor :nsx_edge_uplink_ip_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the `PrivateIp` object that is
    # the virtual IP (VIP) for HCX Manager. For information about `PrivateIp` objects, see the
    # Core Services API.
    #
    # @return [String]
    attr_accessor :hcx_private_ip_id

    # The FQDN for HCX Manager.
    #
    # Example: `hcx-my-sddc.sddc.us-phoenix-1.oraclecloud.com`
    #
    # @return [String]
    attr_accessor :hcx_fqdn

    # **[Required]** HCX configuration of the SDDC.
    #
    # @return [String]
    attr_reader :hcx_mode

    # This attribute is required.
    # @return [OCI::Ocvp::Models::InitialConfiguration]
    attr_accessor :initial_configuration

    # Indicates whether SDDC is pending downgrade from HCX Enterprise to HCX Advanced.
    # @return [BOOLEAN]
    attr_accessor :is_hcx_pending_downgrade

    # The activation licenses to use on the on-premises HCX Enterprise appliance you site pair with HCX Manager in your VMware Solution.
    #
    # @return [Array<OCI::Ocvp::Models::HcxLicenseSummary>]
    attr_accessor :hcx_on_prem_licenses

    # The date and time current HCX Enterprise billing cycle ends, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_hcx_billing_cycle_end

    # The date and time the SDDC's HCX on-premise license status was updated, in the format defined by
    # [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_hcx_license_status_updated

    # Indicates whether this SDDC is designated for only single ESXi host.
    # @return [BOOLEAN]
    attr_accessor :is_single_host_sddc

    # **[Required]** The date and time the SDDC was created, in the format defined by
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
        'display_name': :'displayName',
        'vmware_software_version': :'vmwareSoftwareVersion',
        'esxi_software_version': :'esxiSoftwareVersion',
        'compartment_id': :'compartmentId',
        'clusters_count': :'clustersCount',
        'vcenter_fqdn': :'vcenterFqdn',
        'nsx_manager_fqdn': :'nsxManagerFqdn',
        'vcenter_private_ip_id': :'vcenterPrivateIpId',
        'nsx_manager_private_ip_id': :'nsxManagerPrivateIpId',
        'vcenter_username': :'vcenterUsername',
        'nsx_manager_username': :'nsxManagerUsername',
        'ssh_authorized_keys': :'sshAuthorizedKeys',
        'nsx_edge_uplink_ip_id': :'nsxEdgeUplinkIpId',
        'hcx_private_ip_id': :'hcxPrivateIpId',
        'hcx_fqdn': :'hcxFqdn',
        'hcx_mode': :'hcxMode',
        'initial_configuration': :'initialConfiguration',
        'is_hcx_pending_downgrade': :'isHcxPendingDowngrade',
        'hcx_on_prem_licenses': :'hcxOnPremLicenses',
        'time_hcx_billing_cycle_end': :'timeHcxBillingCycleEnd',
        'time_hcx_license_status_updated': :'timeHcxLicenseStatusUpdated',
        'is_single_host_sddc': :'isSingleHostSddc',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
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
        'display_name': :'String',
        'vmware_software_version': :'String',
        'esxi_software_version': :'String',
        'compartment_id': :'String',
        'clusters_count': :'Integer',
        'vcenter_fqdn': :'String',
        'nsx_manager_fqdn': :'String',
        'vcenter_private_ip_id': :'String',
        'nsx_manager_private_ip_id': :'String',
        'vcenter_username': :'String',
        'nsx_manager_username': :'String',
        'ssh_authorized_keys': :'String',
        'nsx_edge_uplink_ip_id': :'String',
        'hcx_private_ip_id': :'String',
        'hcx_fqdn': :'String',
        'hcx_mode': :'String',
        'initial_configuration': :'OCI::Ocvp::Models::InitialConfiguration',
        'is_hcx_pending_downgrade': :'BOOLEAN',
        'hcx_on_prem_licenses': :'Array<OCI::Ocvp::Models::HcxLicenseSummary>',
        'time_hcx_billing_cycle_end': :'DateTime',
        'time_hcx_license_status_updated': :'DateTime',
        'is_single_host_sddc': :'BOOLEAN',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
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
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :vmware_software_version The value to assign to the {#vmware_software_version} property
    # @option attributes [String] :esxi_software_version The value to assign to the {#esxi_software_version} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Integer] :clusters_count The value to assign to the {#clusters_count} property
    # @option attributes [String] :vcenter_fqdn The value to assign to the {#vcenter_fqdn} property
    # @option attributes [String] :nsx_manager_fqdn The value to assign to the {#nsx_manager_fqdn} property
    # @option attributes [String] :vcenter_private_ip_id The value to assign to the {#vcenter_private_ip_id} property
    # @option attributes [String] :nsx_manager_private_ip_id The value to assign to the {#nsx_manager_private_ip_id} property
    # @option attributes [String] :vcenter_username The value to assign to the {#vcenter_username} property
    # @option attributes [String] :nsx_manager_username The value to assign to the {#nsx_manager_username} property
    # @option attributes [String] :ssh_authorized_keys The value to assign to the {#ssh_authorized_keys} property
    # @option attributes [String] :nsx_edge_uplink_ip_id The value to assign to the {#nsx_edge_uplink_ip_id} property
    # @option attributes [String] :hcx_private_ip_id The value to assign to the {#hcx_private_ip_id} property
    # @option attributes [String] :hcx_fqdn The value to assign to the {#hcx_fqdn} property
    # @option attributes [String] :hcx_mode The value to assign to the {#hcx_mode} property
    # @option attributes [OCI::Ocvp::Models::InitialConfiguration] :initial_configuration The value to assign to the {#initial_configuration} property
    # @option attributes [BOOLEAN] :is_hcx_pending_downgrade The value to assign to the {#is_hcx_pending_downgrade} property
    # @option attributes [Array<OCI::Ocvp::Models::HcxLicenseSummary>] :hcx_on_prem_licenses The value to assign to the {#hcx_on_prem_licenses} property
    # @option attributes [DateTime] :time_hcx_billing_cycle_end The value to assign to the {#time_hcx_billing_cycle_end} property
    # @option attributes [DateTime] :time_hcx_license_status_updated The value to assign to the {#time_hcx_license_status_updated} property
    # @option attributes [BOOLEAN] :is_single_host_sddc The value to assign to the {#is_single_host_sddc} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.vmware_software_version = attributes[:'vmwareSoftwareVersion'] if attributes[:'vmwareSoftwareVersion']

      raise 'You cannot provide both :vmwareSoftwareVersion and :vmware_software_version' if attributes.key?(:'vmwareSoftwareVersion') && attributes.key?(:'vmware_software_version')

      self.vmware_software_version = attributes[:'vmware_software_version'] if attributes[:'vmware_software_version']

      self.esxi_software_version = attributes[:'esxiSoftwareVersion'] if attributes[:'esxiSoftwareVersion']

      raise 'You cannot provide both :esxiSoftwareVersion and :esxi_software_version' if attributes.key?(:'esxiSoftwareVersion') && attributes.key?(:'esxi_software_version')

      self.esxi_software_version = attributes[:'esxi_software_version'] if attributes[:'esxi_software_version']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.clusters_count = attributes[:'clustersCount'] if attributes[:'clustersCount']

      raise 'You cannot provide both :clustersCount and :clusters_count' if attributes.key?(:'clustersCount') && attributes.key?(:'clusters_count')

      self.clusters_count = attributes[:'clusters_count'] if attributes[:'clusters_count']

      self.vcenter_fqdn = attributes[:'vcenterFqdn'] if attributes[:'vcenterFqdn']

      raise 'You cannot provide both :vcenterFqdn and :vcenter_fqdn' if attributes.key?(:'vcenterFqdn') && attributes.key?(:'vcenter_fqdn')

      self.vcenter_fqdn = attributes[:'vcenter_fqdn'] if attributes[:'vcenter_fqdn']

      self.nsx_manager_fqdn = attributes[:'nsxManagerFqdn'] if attributes[:'nsxManagerFqdn']

      raise 'You cannot provide both :nsxManagerFqdn and :nsx_manager_fqdn' if attributes.key?(:'nsxManagerFqdn') && attributes.key?(:'nsx_manager_fqdn')

      self.nsx_manager_fqdn = attributes[:'nsx_manager_fqdn'] if attributes[:'nsx_manager_fqdn']

      self.vcenter_private_ip_id = attributes[:'vcenterPrivateIpId'] if attributes[:'vcenterPrivateIpId']

      raise 'You cannot provide both :vcenterPrivateIpId and :vcenter_private_ip_id' if attributes.key?(:'vcenterPrivateIpId') && attributes.key?(:'vcenter_private_ip_id')

      self.vcenter_private_ip_id = attributes[:'vcenter_private_ip_id'] if attributes[:'vcenter_private_ip_id']

      self.nsx_manager_private_ip_id = attributes[:'nsxManagerPrivateIpId'] if attributes[:'nsxManagerPrivateIpId']

      raise 'You cannot provide both :nsxManagerPrivateIpId and :nsx_manager_private_ip_id' if attributes.key?(:'nsxManagerPrivateIpId') && attributes.key?(:'nsx_manager_private_ip_id')

      self.nsx_manager_private_ip_id = attributes[:'nsx_manager_private_ip_id'] if attributes[:'nsx_manager_private_ip_id']

      self.vcenter_username = attributes[:'vcenterUsername'] if attributes[:'vcenterUsername']

      raise 'You cannot provide both :vcenterUsername and :vcenter_username' if attributes.key?(:'vcenterUsername') && attributes.key?(:'vcenter_username')

      self.vcenter_username = attributes[:'vcenter_username'] if attributes[:'vcenter_username']

      self.nsx_manager_username = attributes[:'nsxManagerUsername'] if attributes[:'nsxManagerUsername']

      raise 'You cannot provide both :nsxManagerUsername and :nsx_manager_username' if attributes.key?(:'nsxManagerUsername') && attributes.key?(:'nsx_manager_username')

      self.nsx_manager_username = attributes[:'nsx_manager_username'] if attributes[:'nsx_manager_username']

      self.ssh_authorized_keys = attributes[:'sshAuthorizedKeys'] if attributes[:'sshAuthorizedKeys']

      raise 'You cannot provide both :sshAuthorizedKeys and :ssh_authorized_keys' if attributes.key?(:'sshAuthorizedKeys') && attributes.key?(:'ssh_authorized_keys')

      self.ssh_authorized_keys = attributes[:'ssh_authorized_keys'] if attributes[:'ssh_authorized_keys']

      self.nsx_edge_uplink_ip_id = attributes[:'nsxEdgeUplinkIpId'] if attributes[:'nsxEdgeUplinkIpId']

      raise 'You cannot provide both :nsxEdgeUplinkIpId and :nsx_edge_uplink_ip_id' if attributes.key?(:'nsxEdgeUplinkIpId') && attributes.key?(:'nsx_edge_uplink_ip_id')

      self.nsx_edge_uplink_ip_id = attributes[:'nsx_edge_uplink_ip_id'] if attributes[:'nsx_edge_uplink_ip_id']

      self.hcx_private_ip_id = attributes[:'hcxPrivateIpId'] if attributes[:'hcxPrivateIpId']

      raise 'You cannot provide both :hcxPrivateIpId and :hcx_private_ip_id' if attributes.key?(:'hcxPrivateIpId') && attributes.key?(:'hcx_private_ip_id')

      self.hcx_private_ip_id = attributes[:'hcx_private_ip_id'] if attributes[:'hcx_private_ip_id']

      self.hcx_fqdn = attributes[:'hcxFqdn'] if attributes[:'hcxFqdn']

      raise 'You cannot provide both :hcxFqdn and :hcx_fqdn' if attributes.key?(:'hcxFqdn') && attributes.key?(:'hcx_fqdn')

      self.hcx_fqdn = attributes[:'hcx_fqdn'] if attributes[:'hcx_fqdn']

      self.hcx_mode = attributes[:'hcxMode'] if attributes[:'hcxMode']

      raise 'You cannot provide both :hcxMode and :hcx_mode' if attributes.key?(:'hcxMode') && attributes.key?(:'hcx_mode')

      self.hcx_mode = attributes[:'hcx_mode'] if attributes[:'hcx_mode']

      self.initial_configuration = attributes[:'initialConfiguration'] if attributes[:'initialConfiguration']

      raise 'You cannot provide both :initialConfiguration and :initial_configuration' if attributes.key?(:'initialConfiguration') && attributes.key?(:'initial_configuration')

      self.initial_configuration = attributes[:'initial_configuration'] if attributes[:'initial_configuration']

      self.is_hcx_pending_downgrade = attributes[:'isHcxPendingDowngrade'] unless attributes[:'isHcxPendingDowngrade'].nil?
      self.is_hcx_pending_downgrade = false if is_hcx_pending_downgrade.nil? && !attributes.key?(:'isHcxPendingDowngrade') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isHcxPendingDowngrade and :is_hcx_pending_downgrade' if attributes.key?(:'isHcxPendingDowngrade') && attributes.key?(:'is_hcx_pending_downgrade')

      self.is_hcx_pending_downgrade = attributes[:'is_hcx_pending_downgrade'] unless attributes[:'is_hcx_pending_downgrade'].nil?
      self.is_hcx_pending_downgrade = false if is_hcx_pending_downgrade.nil? && !attributes.key?(:'isHcxPendingDowngrade') && !attributes.key?(:'is_hcx_pending_downgrade') # rubocop:disable Style/StringLiterals

      self.hcx_on_prem_licenses = attributes[:'hcxOnPremLicenses'] if attributes[:'hcxOnPremLicenses']

      raise 'You cannot provide both :hcxOnPremLicenses and :hcx_on_prem_licenses' if attributes.key?(:'hcxOnPremLicenses') && attributes.key?(:'hcx_on_prem_licenses')

      self.hcx_on_prem_licenses = attributes[:'hcx_on_prem_licenses'] if attributes[:'hcx_on_prem_licenses']

      self.time_hcx_billing_cycle_end = attributes[:'timeHcxBillingCycleEnd'] if attributes[:'timeHcxBillingCycleEnd']

      raise 'You cannot provide both :timeHcxBillingCycleEnd and :time_hcx_billing_cycle_end' if attributes.key?(:'timeHcxBillingCycleEnd') && attributes.key?(:'time_hcx_billing_cycle_end')

      self.time_hcx_billing_cycle_end = attributes[:'time_hcx_billing_cycle_end'] if attributes[:'time_hcx_billing_cycle_end']

      self.time_hcx_license_status_updated = attributes[:'timeHcxLicenseStatusUpdated'] if attributes[:'timeHcxLicenseStatusUpdated']

      raise 'You cannot provide both :timeHcxLicenseStatusUpdated and :time_hcx_license_status_updated' if attributes.key?(:'timeHcxLicenseStatusUpdated') && attributes.key?(:'time_hcx_license_status_updated')

      self.time_hcx_license_status_updated = attributes[:'time_hcx_license_status_updated'] if attributes[:'time_hcx_license_status_updated']

      self.is_single_host_sddc = attributes[:'isSingleHostSddc'] unless attributes[:'isSingleHostSddc'].nil?
      self.is_single_host_sddc = false if is_single_host_sddc.nil? && !attributes.key?(:'isSingleHostSddc') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isSingleHostSddc and :is_single_host_sddc' if attributes.key?(:'isSingleHostSddc') && attributes.key?(:'is_single_host_sddc')

      self.is_single_host_sddc = attributes[:'is_single_host_sddc'] unless attributes[:'is_single_host_sddc'].nil?
      self.is_single_host_sddc = false if is_single_host_sddc.nil? && !attributes.key?(:'isSingleHostSddc') && !attributes.key?(:'is_single_host_sddc') # rubocop:disable Style/StringLiterals

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

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
    # @param [Object] hcx_mode Object to be assigned
    def hcx_mode=(hcx_mode)
      # rubocop:disable Style/ConditionalAssignment
      if hcx_mode && !HCX_MODE_ENUM.include?(hcx_mode)
        OCI.logger.debug("Unknown value for 'hcx_mode' [" + hcx_mode + "]. Mapping to 'HCX_MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @hcx_mode = HCX_MODE_UNKNOWN_ENUM_VALUE
      else
        @hcx_mode = hcx_mode
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
        id == other.id &&
        display_name == other.display_name &&
        vmware_software_version == other.vmware_software_version &&
        esxi_software_version == other.esxi_software_version &&
        compartment_id == other.compartment_id &&
        clusters_count == other.clusters_count &&
        vcenter_fqdn == other.vcenter_fqdn &&
        nsx_manager_fqdn == other.nsx_manager_fqdn &&
        vcenter_private_ip_id == other.vcenter_private_ip_id &&
        nsx_manager_private_ip_id == other.nsx_manager_private_ip_id &&
        vcenter_username == other.vcenter_username &&
        nsx_manager_username == other.nsx_manager_username &&
        ssh_authorized_keys == other.ssh_authorized_keys &&
        nsx_edge_uplink_ip_id == other.nsx_edge_uplink_ip_id &&
        hcx_private_ip_id == other.hcx_private_ip_id &&
        hcx_fqdn == other.hcx_fqdn &&
        hcx_mode == other.hcx_mode &&
        initial_configuration == other.initial_configuration &&
        is_hcx_pending_downgrade == other.is_hcx_pending_downgrade &&
        hcx_on_prem_licenses == other.hcx_on_prem_licenses &&
        time_hcx_billing_cycle_end == other.time_hcx_billing_cycle_end &&
        time_hcx_license_status_updated == other.time_hcx_license_status_updated &&
        is_single_host_sddc == other.is_single_host_sddc &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
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
      [id, display_name, vmware_software_version, esxi_software_version, compartment_id, clusters_count, vcenter_fqdn, nsx_manager_fqdn, vcenter_private_ip_id, nsx_manager_private_ip_id, vcenter_username, nsx_manager_username, ssh_authorized_keys, nsx_edge_uplink_ip_id, hcx_private_ip_id, hcx_fqdn, hcx_mode, initial_configuration, is_hcx_pending_downgrade, hcx_on_prem_licenses, time_hcx_billing_cycle_end, time_hcx_license_status_updated, is_single_host_sddc, time_created, time_updated, lifecycle_state, freeform_tags, defined_tags].hash
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
