# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

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
    INITIAL_SKU_ENUM = [
      INITIAL_SKU_HOUR = 'HOUR'.freeze,
      INITIAL_SKU_MONTH = 'MONTH'.freeze,
      INITIAL_SKU_ONE_YEAR = 'ONE_YEAR'.freeze,
      INITIAL_SKU_THREE_YEARS = 'THREE_YEARS'.freeze,
      INITIAL_SKU_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
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

    # **[Required]** The availability domain the ESXi hosts are running in. For Multi-AD SDDC, it is `multi-AD`.
    #
    # Example: `Uocm:PHX-AD-1`, `multi-AD`
    #
    # @return [String]
    attr_accessor :compute_availability_domain

    # **[Required]** A descriptive name for the SDDC. It must be unique, start with a letter, and contain only letters, digits,
    # whitespaces, dashes and underscores.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # A prefix used in the name of each ESXi host and Compute instance in the SDDC.
    # If this isn't set, the SDDC's `displayName` is used as the prefix.
    #
    # For example, if the value is `MySDDC`, the ESXi hosts are named `MySDDC-1`,
    # `MySDDC-2`, and so on.
    #
    # @return [String]
    attr_accessor :instance_display_name_prefix

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

    # The billing option selected during SDDC creation.
    # {#list_supported_skus list_supported_skus}.
    #
    # @return [String]
    attr_reader :initial_sku

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

    # The SDDC includes an administrator username and initial password for vCenter. Make sure
    # to change this initial vCenter password to a different value.
    #
    # @return [String]
    attr_accessor :vcenter_initial_password

    # The SDDC includes an administrator username and initial password for NSX Manager. Make sure
    # to change this initial NSX Manager password to a different value.
    #
    # @return [String]
    attr_accessor :nsx_manager_initial_password

    # The SDDC includes an administrator username and initial password for vCenter. You can
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

    # The CIDR block for the IP addresses that VMware VMs in the SDDC use to run application
    # workloads.
    #
    # @return [String]
    attr_accessor :workload_network_cidr

    # The VMware NSX overlay workload segment to host your application. Connect to workload
    # portgroup in vCenter to access this overlay segment.
    #
    # @return [String]
    attr_accessor :nsx_overlay_segment_name

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the `PrivateIp` object that is
    # the virtual IP (VIP) for the NSX Edge Uplink. Use this OCID as the route target for
    # route table rules when setting up connectivity between the SDDC and other networks.
    # For information about `PrivateIp` objects, see the Core Services API.
    #
    # @return [String]
    attr_accessor :nsx_edge_uplink_ip_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the management subnet used
    # to provision the SDDC.
    #
    # @return [String]
    attr_accessor :provisioning_subnet_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VLAN used by the SDDC
    # for the vSphere component of the VMware environment.
    #
    # This attribute is not guaranteed to reflect the vSphere VLAN
    # currently used by the ESXi hosts in the SDDC. The purpose
    # of this attribute is to show the vSphere VLAN that the Oracle
    # Cloud VMware Solution will use for any new ESXi hosts that you *add to this
    # SDDC in the future* with {#create_esxi_host create_esxi_host}.
    #
    # Therefore, if you change the existing ESXi hosts in the SDDC to use a different VLAN
    # for the vSphere component of the VMware environment, you
    # should use {#update_sddc update_sddc} to update the SDDC's
    # `vsphereVlanId` with that new VLAN's OCID.
    #
    # @return [String]
    attr_accessor :vsphere_vlan_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VLAN used by the SDDC
    # for the vMotion component of the VMware environment.
    #
    # This attribute is not guaranteed to reflect the vMotion VLAN
    # currently used by the ESXi hosts in the SDDC. The purpose
    # of this attribute is to show the vMotion VLAN that the Oracle
    # Cloud VMware Solution will use for any new ESXi hosts that you *add to this
    # SDDC in the future* with {#create_esxi_host create_esxi_host}.
    #
    # Therefore, if you change the existing ESXi hosts in the SDDC to use a different VLAN
    # for the vMotion component of the VMware environment, you
    # should use {#update_sddc update_sddc} to update the SDDC's
    # `vmotionVlanId` with that new VLAN's OCID.
    #
    # @return [String]
    attr_accessor :vmotion_vlan_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VLAN used by the SDDC
    # for the vSAN component of the VMware environment.
    #
    # This attribute is not guaranteed to reflect the vSAN VLAN
    # currently used by the ESXi hosts in the SDDC. The purpose
    # of this attribute is to show the vSAN VLAN that the Oracle
    # Cloud VMware Solution will use for any new ESXi hosts that you *add to this
    # SDDC in the future* with {#create_esxi_host create_esxi_host}.
    #
    # Therefore, if you change the existing ESXi hosts in the SDDC to use a different VLAN
    # for the vSAN component of the VMware environment, you
    # should use {#update_sddc update_sddc} to update the SDDC's
    # `vsanVlanId` with that new VLAN's OCID.
    #
    # @return [String]
    attr_accessor :vsan_vlan_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VLAN used by the SDDC
    # for the NSX VTEP component of the VMware environment.
    #
    # This attribute is not guaranteed to reflect the NSX VTEP VLAN
    # currently used by the ESXi hosts in the SDDC. The purpose
    # of this attribute is to show the NSX VTEP VLAN that the Oracle
    # Cloud VMware Solution will use for any new ESXi hosts that you *add to this
    # SDDC in the future* with {#create_esxi_host create_esxi_host}.
    #
    # Therefore, if you change the existing ESXi hosts in the SDDC to use a different VLAN
    # for the NSX VTEP component of the VMware environment, you
    # should use {#update_sddc update_sddc} to update the SDDC's
    # `nsxVTepVlanId` with that new VLAN's OCID.
    #
    # @return [String]
    attr_accessor :nsx_v_tep_vlan_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VLAN used by the SDDC
    # for the NSX Edge VTEP component of the VMware environment.
    #
    # This attribute is not guaranteed to reflect the NSX Edge VTEP VLAN
    # currently used by the ESXi hosts in the SDDC. The purpose
    # of this attribute is to show the NSX Edge VTEP VLAN that the Oracle
    # Cloud VMware Solution will use for any new ESXi hosts that you *add to this
    # SDDC in the future* with {#create_esxi_host create_esxi_host}.
    #
    # Therefore, if you change the existing ESXi hosts in the SDDC to use a different VLAN
    # for the NSX Edge VTEP component of the VMware environment, you
    # should use {#update_sddc update_sddc} to update the SDDC's
    # `nsxEdgeVTepVlanId` with that new VLAN's OCID.
    #
    # @return [String]
    attr_accessor :nsx_edge_v_tep_vlan_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VLAN used by the SDDC
    # for the NSX Edge Uplink 1 component of the VMware environment.
    #
    # This attribute is not guaranteed to reflect the NSX Edge Uplink 1 VLAN
    # currently used by the ESXi hosts in the SDDC. The purpose
    # of this attribute is to show the NSX Edge Uplink 1 VLAN that the Oracle
    # Cloud VMware Solution will use for any new ESXi hosts that you *add to this
    # SDDC in the future* with {#create_esxi_host create_esxi_host}.
    #
    # Therefore, if you change the existing ESXi hosts in the SDDC to use a different VLAN
    # for the NSX Edge Uplink 1 component of the VMware environment, you
    # should use {#update_sddc update_sddc} to update the SDDC's
    # `nsxEdgeUplink1VlanId` with that new VLAN's OCID.
    #
    # @return [String]
    attr_accessor :nsx_edge_uplink1_vlan_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VLAN used by the SDDC
    # for the NSX Edge Uplink 2 component of the VMware environment.
    #
    # This attribute is not guaranteed to reflect the NSX Edge Uplink 2 VLAN
    # currently used by the ESXi hosts in the SDDC. The purpose
    # of this attribute is to show the NSX Edge Uplink 2 VLAN that the Oracle
    # Cloud VMware Solution will use for any new ESXi hosts that you *add to this
    # SDDC in the future* with {#create_esxi_host create_esxi_host}.
    #
    # Therefore, if you change the existing ESXi hosts in the SDDC to use a different VLAN
    # for the NSX Edge Uplink 2 component of the VMware environment, you
    # should use {#update_sddc update_sddc} to update the SDDC's
    # `nsxEdgeUplink2VlanId` with that new VLAN's OCID.
    #
    # @return [String]
    attr_accessor :nsx_edge_uplink2_vlan_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VLAN used by the SDDC
    # for the vSphere Replication component of the VMware environment.
    #
    # @return [String]
    attr_accessor :replication_vlan_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VLAN used by the SDDC
    # for the Provisioning component of the VMware environment.
    #
    # @return [String]
    attr_accessor :provisioning_vlan_id

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

    # The SDDC includes an administrator username and initial password for HCX Manager. Make sure
    # to change this initial HCX Manager password to a different value.
    #
    # @return [String]
    attr_accessor :hcx_initial_password

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VLAN used by the SDDC
    # for the HCX component of the VMware environment.
    #
    # This attribute is not guaranteed to reflect the HCX VLAN
    # currently used by the ESXi hosts in the SDDC. The purpose
    # of this attribute is to show the HCX VLAN that the Oracle
    # Cloud VMware Solution will use for any new ESXi hosts that you *add to this
    # SDDC in the future* with {#create_esxi_host create_esxi_host}.
    #
    # Therefore, if you change the existing ESXi hosts in the SDDC to use a different VLAN
    # for the HCX component of the VMware environment, you
    # should use {#update_sddc update_sddc} to update the SDDC's
    # `hcxVlanId` with that new VLAN's OCID.
    #
    # @return [String]
    attr_accessor :hcx_vlan_id

    # Indicates whether HCX is enabled for this SDDC.
    # @return [BOOLEAN]
    attr_accessor :is_hcx_enabled

    # The activation keys to use on the on-premises HCX Enterprise appliances you site pair with HCX Manager in your VMware Solution.
    # The number of keys provided depends on the HCX license type. HCX Advanced provides 3 activation keys.
    # HCX Enterprise provides 10 activation keys.
    #
    # @return [String]
    attr_accessor :hcx_on_prem_key

    # Indicates whether HCX Enterprise is enabled for this SDDC.
    # @return [BOOLEAN]
    attr_accessor :is_hcx_enterprise_enabled

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

    # **[Required]** The initial compute shape of the SDDC's ESXi hosts.
    # {#list_supported_host_shapes list_supported_host_shapes}.
    #
    # @return [String]
    attr_accessor :initial_host_shape_name

    # The initial OCPU count of the SDDC's ESXi hosts.
    #
    # @return [Float]
    attr_accessor :initial_host_ocpu_count

    # Indicates whether shielded instance is enabled at the SDDC level.
    #
    # @return [BOOLEAN]
    attr_accessor :is_shielded_instance_enabled

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Capacity Reservation.
    #
    # @return [String]
    attr_accessor :capacity_reservation_id

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
        'instance_display_name_prefix': :'instanceDisplayNamePrefix',
        'vmware_software_version': :'vmwareSoftwareVersion',
        'compartment_id': :'compartmentId',
        'esxi_hosts_count': :'esxiHostsCount',
        'initial_sku': :'initialSku',
        'vcenter_fqdn': :'vcenterFqdn',
        'nsx_manager_fqdn': :'nsxManagerFqdn',
        'vcenter_private_ip_id': :'vcenterPrivateIpId',
        'nsx_manager_private_ip_id': :'nsxManagerPrivateIpId',
        'vcenter_initial_password': :'vcenterInitialPassword',
        'nsx_manager_initial_password': :'nsxManagerInitialPassword',
        'vcenter_username': :'vcenterUsername',
        'nsx_manager_username': :'nsxManagerUsername',
        'ssh_authorized_keys': :'sshAuthorizedKeys',
        'workload_network_cidr': :'workloadNetworkCidr',
        'nsx_overlay_segment_name': :'nsxOverlaySegmentName',
        'nsx_edge_uplink_ip_id': :'nsxEdgeUplinkIpId',
        'provisioning_subnet_id': :'provisioningSubnetId',
        'vsphere_vlan_id': :'vsphereVlanId',
        'vmotion_vlan_id': :'vmotionVlanId',
        'vsan_vlan_id': :'vsanVlanId',
        'nsx_v_tep_vlan_id': :'nsxVTepVlanId',
        'nsx_edge_v_tep_vlan_id': :'nsxEdgeVTepVlanId',
        'nsx_edge_uplink1_vlan_id': :'nsxEdgeUplink1VlanId',
        'nsx_edge_uplink2_vlan_id': :'nsxEdgeUplink2VlanId',
        'replication_vlan_id': :'replicationVlanId',
        'provisioning_vlan_id': :'provisioningVlanId',
        'hcx_private_ip_id': :'hcxPrivateIpId',
        'hcx_fqdn': :'hcxFqdn',
        'hcx_initial_password': :'hcxInitialPassword',
        'hcx_vlan_id': :'hcxVlanId',
        'is_hcx_enabled': :'isHcxEnabled',
        'hcx_on_prem_key': :'hcxOnPremKey',
        'is_hcx_enterprise_enabled': :'isHcxEnterpriseEnabled',
        'is_hcx_pending_downgrade': :'isHcxPendingDowngrade',
        'hcx_on_prem_licenses': :'hcxOnPremLicenses',
        'time_hcx_billing_cycle_end': :'timeHcxBillingCycleEnd',
        'time_hcx_license_status_updated': :'timeHcxLicenseStatusUpdated',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'initial_host_shape_name': :'initialHostShapeName',
        'initial_host_ocpu_count': :'initialHostOcpuCount',
        'is_shielded_instance_enabled': :'isShieldedInstanceEnabled',
        'capacity_reservation_id': :'capacityReservationId',
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
        'instance_display_name_prefix': :'String',
        'vmware_software_version': :'String',
        'compartment_id': :'String',
        'esxi_hosts_count': :'Integer',
        'initial_sku': :'String',
        'vcenter_fqdn': :'String',
        'nsx_manager_fqdn': :'String',
        'vcenter_private_ip_id': :'String',
        'nsx_manager_private_ip_id': :'String',
        'vcenter_initial_password': :'String',
        'nsx_manager_initial_password': :'String',
        'vcenter_username': :'String',
        'nsx_manager_username': :'String',
        'ssh_authorized_keys': :'String',
        'workload_network_cidr': :'String',
        'nsx_overlay_segment_name': :'String',
        'nsx_edge_uplink_ip_id': :'String',
        'provisioning_subnet_id': :'String',
        'vsphere_vlan_id': :'String',
        'vmotion_vlan_id': :'String',
        'vsan_vlan_id': :'String',
        'nsx_v_tep_vlan_id': :'String',
        'nsx_edge_v_tep_vlan_id': :'String',
        'nsx_edge_uplink1_vlan_id': :'String',
        'nsx_edge_uplink2_vlan_id': :'String',
        'replication_vlan_id': :'String',
        'provisioning_vlan_id': :'String',
        'hcx_private_ip_id': :'String',
        'hcx_fqdn': :'String',
        'hcx_initial_password': :'String',
        'hcx_vlan_id': :'String',
        'is_hcx_enabled': :'BOOLEAN',
        'hcx_on_prem_key': :'String',
        'is_hcx_enterprise_enabled': :'BOOLEAN',
        'is_hcx_pending_downgrade': :'BOOLEAN',
        'hcx_on_prem_licenses': :'Array<OCI::Ocvp::Models::HcxLicenseSummary>',
        'time_hcx_billing_cycle_end': :'DateTime',
        'time_hcx_license_status_updated': :'DateTime',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'initial_host_shape_name': :'String',
        'initial_host_ocpu_count': :'Float',
        'is_shielded_instance_enabled': :'BOOLEAN',
        'capacity_reservation_id': :'String',
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
    # @option attributes [String] :instance_display_name_prefix The value to assign to the {#instance_display_name_prefix} property
    # @option attributes [String] :vmware_software_version The value to assign to the {#vmware_software_version} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Integer] :esxi_hosts_count The value to assign to the {#esxi_hosts_count} property
    # @option attributes [String] :initial_sku The value to assign to the {#initial_sku} property
    # @option attributes [String] :vcenter_fqdn The value to assign to the {#vcenter_fqdn} property
    # @option attributes [String] :nsx_manager_fqdn The value to assign to the {#nsx_manager_fqdn} property
    # @option attributes [String] :vcenter_private_ip_id The value to assign to the {#vcenter_private_ip_id} property
    # @option attributes [String] :nsx_manager_private_ip_id The value to assign to the {#nsx_manager_private_ip_id} property
    # @option attributes [String] :vcenter_initial_password The value to assign to the {#vcenter_initial_password} property
    # @option attributes [String] :nsx_manager_initial_password The value to assign to the {#nsx_manager_initial_password} property
    # @option attributes [String] :vcenter_username The value to assign to the {#vcenter_username} property
    # @option attributes [String] :nsx_manager_username The value to assign to the {#nsx_manager_username} property
    # @option attributes [String] :ssh_authorized_keys The value to assign to the {#ssh_authorized_keys} property
    # @option attributes [String] :workload_network_cidr The value to assign to the {#workload_network_cidr} property
    # @option attributes [String] :nsx_overlay_segment_name The value to assign to the {#nsx_overlay_segment_name} property
    # @option attributes [String] :nsx_edge_uplink_ip_id The value to assign to the {#nsx_edge_uplink_ip_id} property
    # @option attributes [String] :provisioning_subnet_id The value to assign to the {#provisioning_subnet_id} property
    # @option attributes [String] :vsphere_vlan_id The value to assign to the {#vsphere_vlan_id} property
    # @option attributes [String] :vmotion_vlan_id The value to assign to the {#vmotion_vlan_id} property
    # @option attributes [String] :vsan_vlan_id The value to assign to the {#vsan_vlan_id} property
    # @option attributes [String] :nsx_v_tep_vlan_id The value to assign to the {#nsx_v_tep_vlan_id} property
    # @option attributes [String] :nsx_edge_v_tep_vlan_id The value to assign to the {#nsx_edge_v_tep_vlan_id} property
    # @option attributes [String] :nsx_edge_uplink1_vlan_id The value to assign to the {#nsx_edge_uplink1_vlan_id} property
    # @option attributes [String] :nsx_edge_uplink2_vlan_id The value to assign to the {#nsx_edge_uplink2_vlan_id} property
    # @option attributes [String] :replication_vlan_id The value to assign to the {#replication_vlan_id} property
    # @option attributes [String] :provisioning_vlan_id The value to assign to the {#provisioning_vlan_id} property
    # @option attributes [String] :hcx_private_ip_id The value to assign to the {#hcx_private_ip_id} property
    # @option attributes [String] :hcx_fqdn The value to assign to the {#hcx_fqdn} property
    # @option attributes [String] :hcx_initial_password The value to assign to the {#hcx_initial_password} property
    # @option attributes [String] :hcx_vlan_id The value to assign to the {#hcx_vlan_id} property
    # @option attributes [BOOLEAN] :is_hcx_enabled The value to assign to the {#is_hcx_enabled} property
    # @option attributes [String] :hcx_on_prem_key The value to assign to the {#hcx_on_prem_key} property
    # @option attributes [BOOLEAN] :is_hcx_enterprise_enabled The value to assign to the {#is_hcx_enterprise_enabled} property
    # @option attributes [BOOLEAN] :is_hcx_pending_downgrade The value to assign to the {#is_hcx_pending_downgrade} property
    # @option attributes [Array<OCI::Ocvp::Models::HcxLicenseSummary>] :hcx_on_prem_licenses The value to assign to the {#hcx_on_prem_licenses} property
    # @option attributes [DateTime] :time_hcx_billing_cycle_end The value to assign to the {#time_hcx_billing_cycle_end} property
    # @option attributes [DateTime] :time_hcx_license_status_updated The value to assign to the {#time_hcx_license_status_updated} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :initial_host_shape_name The value to assign to the {#initial_host_shape_name} property
    # @option attributes [Float] :initial_host_ocpu_count The value to assign to the {#initial_host_ocpu_count} property
    # @option attributes [BOOLEAN] :is_shielded_instance_enabled The value to assign to the {#is_shielded_instance_enabled} property
    # @option attributes [String] :capacity_reservation_id The value to assign to the {#capacity_reservation_id} property
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

      self.instance_display_name_prefix = attributes[:'instanceDisplayNamePrefix'] if attributes[:'instanceDisplayNamePrefix']

      raise 'You cannot provide both :instanceDisplayNamePrefix and :instance_display_name_prefix' if attributes.key?(:'instanceDisplayNamePrefix') && attributes.key?(:'instance_display_name_prefix')

      self.instance_display_name_prefix = attributes[:'instance_display_name_prefix'] if attributes[:'instance_display_name_prefix']

      self.vmware_software_version = attributes[:'vmwareSoftwareVersion'] if attributes[:'vmwareSoftwareVersion']

      raise 'You cannot provide both :vmwareSoftwareVersion and :vmware_software_version' if attributes.key?(:'vmwareSoftwareVersion') && attributes.key?(:'vmware_software_version')

      self.vmware_software_version = attributes[:'vmware_software_version'] if attributes[:'vmware_software_version']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.esxi_hosts_count = attributes[:'esxiHostsCount'] if attributes[:'esxiHostsCount']

      raise 'You cannot provide both :esxiHostsCount and :esxi_hosts_count' if attributes.key?(:'esxiHostsCount') && attributes.key?(:'esxi_hosts_count')

      self.esxi_hosts_count = attributes[:'esxi_hosts_count'] if attributes[:'esxi_hosts_count']

      self.initial_sku = attributes[:'initialSku'] if attributes[:'initialSku']
      self.initial_sku = "MONTH" if initial_sku.nil? && !attributes.key?(:'initialSku') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :initialSku and :initial_sku' if attributes.key?(:'initialSku') && attributes.key?(:'initial_sku')

      self.initial_sku = attributes[:'initial_sku'] if attributes[:'initial_sku']
      self.initial_sku = "MONTH" if initial_sku.nil? && !attributes.key?(:'initialSku') && !attributes.key?(:'initial_sku') # rubocop:disable Style/StringLiterals

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

      self.vcenter_initial_password = attributes[:'vcenterInitialPassword'] if attributes[:'vcenterInitialPassword']

      raise 'You cannot provide both :vcenterInitialPassword and :vcenter_initial_password' if attributes.key?(:'vcenterInitialPassword') && attributes.key?(:'vcenter_initial_password')

      self.vcenter_initial_password = attributes[:'vcenter_initial_password'] if attributes[:'vcenter_initial_password']

      self.nsx_manager_initial_password = attributes[:'nsxManagerInitialPassword'] if attributes[:'nsxManagerInitialPassword']

      raise 'You cannot provide both :nsxManagerInitialPassword and :nsx_manager_initial_password' if attributes.key?(:'nsxManagerInitialPassword') && attributes.key?(:'nsx_manager_initial_password')

      self.nsx_manager_initial_password = attributes[:'nsx_manager_initial_password'] if attributes[:'nsx_manager_initial_password']

      self.vcenter_username = attributes[:'vcenterUsername'] if attributes[:'vcenterUsername']

      raise 'You cannot provide both :vcenterUsername and :vcenter_username' if attributes.key?(:'vcenterUsername') && attributes.key?(:'vcenter_username')

      self.vcenter_username = attributes[:'vcenter_username'] if attributes[:'vcenter_username']

      self.nsx_manager_username = attributes[:'nsxManagerUsername'] if attributes[:'nsxManagerUsername']

      raise 'You cannot provide both :nsxManagerUsername and :nsx_manager_username' if attributes.key?(:'nsxManagerUsername') && attributes.key?(:'nsx_manager_username')

      self.nsx_manager_username = attributes[:'nsx_manager_username'] if attributes[:'nsx_manager_username']

      self.ssh_authorized_keys = attributes[:'sshAuthorizedKeys'] if attributes[:'sshAuthorizedKeys']

      raise 'You cannot provide both :sshAuthorizedKeys and :ssh_authorized_keys' if attributes.key?(:'sshAuthorizedKeys') && attributes.key?(:'ssh_authorized_keys')

      self.ssh_authorized_keys = attributes[:'ssh_authorized_keys'] if attributes[:'ssh_authorized_keys']

      self.workload_network_cidr = attributes[:'workloadNetworkCidr'] if attributes[:'workloadNetworkCidr']

      raise 'You cannot provide both :workloadNetworkCidr and :workload_network_cidr' if attributes.key?(:'workloadNetworkCidr') && attributes.key?(:'workload_network_cidr')

      self.workload_network_cidr = attributes[:'workload_network_cidr'] if attributes[:'workload_network_cidr']

      self.nsx_overlay_segment_name = attributes[:'nsxOverlaySegmentName'] if attributes[:'nsxOverlaySegmentName']

      raise 'You cannot provide both :nsxOverlaySegmentName and :nsx_overlay_segment_name' if attributes.key?(:'nsxOverlaySegmentName') && attributes.key?(:'nsx_overlay_segment_name')

      self.nsx_overlay_segment_name = attributes[:'nsx_overlay_segment_name'] if attributes[:'nsx_overlay_segment_name']

      self.nsx_edge_uplink_ip_id = attributes[:'nsxEdgeUplinkIpId'] if attributes[:'nsxEdgeUplinkIpId']

      raise 'You cannot provide both :nsxEdgeUplinkIpId and :nsx_edge_uplink_ip_id' if attributes.key?(:'nsxEdgeUplinkIpId') && attributes.key?(:'nsx_edge_uplink_ip_id')

      self.nsx_edge_uplink_ip_id = attributes[:'nsx_edge_uplink_ip_id'] if attributes[:'nsx_edge_uplink_ip_id']

      self.provisioning_subnet_id = attributes[:'provisioningSubnetId'] if attributes[:'provisioningSubnetId']

      raise 'You cannot provide both :provisioningSubnetId and :provisioning_subnet_id' if attributes.key?(:'provisioningSubnetId') && attributes.key?(:'provisioning_subnet_id')

      self.provisioning_subnet_id = attributes[:'provisioning_subnet_id'] if attributes[:'provisioning_subnet_id']

      self.vsphere_vlan_id = attributes[:'vsphereVlanId'] if attributes[:'vsphereVlanId']

      raise 'You cannot provide both :vsphereVlanId and :vsphere_vlan_id' if attributes.key?(:'vsphereVlanId') && attributes.key?(:'vsphere_vlan_id')

      self.vsphere_vlan_id = attributes[:'vsphere_vlan_id'] if attributes[:'vsphere_vlan_id']

      self.vmotion_vlan_id = attributes[:'vmotionVlanId'] if attributes[:'vmotionVlanId']

      raise 'You cannot provide both :vmotionVlanId and :vmotion_vlan_id' if attributes.key?(:'vmotionVlanId') && attributes.key?(:'vmotion_vlan_id')

      self.vmotion_vlan_id = attributes[:'vmotion_vlan_id'] if attributes[:'vmotion_vlan_id']

      self.vsan_vlan_id = attributes[:'vsanVlanId'] if attributes[:'vsanVlanId']

      raise 'You cannot provide both :vsanVlanId and :vsan_vlan_id' if attributes.key?(:'vsanVlanId') && attributes.key?(:'vsan_vlan_id')

      self.vsan_vlan_id = attributes[:'vsan_vlan_id'] if attributes[:'vsan_vlan_id']

      self.nsx_v_tep_vlan_id = attributes[:'nsxVTepVlanId'] if attributes[:'nsxVTepVlanId']

      raise 'You cannot provide both :nsxVTepVlanId and :nsx_v_tep_vlan_id' if attributes.key?(:'nsxVTepVlanId') && attributes.key?(:'nsx_v_tep_vlan_id')

      self.nsx_v_tep_vlan_id = attributes[:'nsx_v_tep_vlan_id'] if attributes[:'nsx_v_tep_vlan_id']

      self.nsx_edge_v_tep_vlan_id = attributes[:'nsxEdgeVTepVlanId'] if attributes[:'nsxEdgeVTepVlanId']

      raise 'You cannot provide both :nsxEdgeVTepVlanId and :nsx_edge_v_tep_vlan_id' if attributes.key?(:'nsxEdgeVTepVlanId') && attributes.key?(:'nsx_edge_v_tep_vlan_id')

      self.nsx_edge_v_tep_vlan_id = attributes[:'nsx_edge_v_tep_vlan_id'] if attributes[:'nsx_edge_v_tep_vlan_id']

      self.nsx_edge_uplink1_vlan_id = attributes[:'nsxEdgeUplink1VlanId'] if attributes[:'nsxEdgeUplink1VlanId']

      raise 'You cannot provide both :nsxEdgeUplink1VlanId and :nsx_edge_uplink1_vlan_id' if attributes.key?(:'nsxEdgeUplink1VlanId') && attributes.key?(:'nsx_edge_uplink1_vlan_id')

      self.nsx_edge_uplink1_vlan_id = attributes[:'nsx_edge_uplink1_vlan_id'] if attributes[:'nsx_edge_uplink1_vlan_id']

      self.nsx_edge_uplink2_vlan_id = attributes[:'nsxEdgeUplink2VlanId'] if attributes[:'nsxEdgeUplink2VlanId']

      raise 'You cannot provide both :nsxEdgeUplink2VlanId and :nsx_edge_uplink2_vlan_id' if attributes.key?(:'nsxEdgeUplink2VlanId') && attributes.key?(:'nsx_edge_uplink2_vlan_id')

      self.nsx_edge_uplink2_vlan_id = attributes[:'nsx_edge_uplink2_vlan_id'] if attributes[:'nsx_edge_uplink2_vlan_id']

      self.replication_vlan_id = attributes[:'replicationVlanId'] if attributes[:'replicationVlanId']

      raise 'You cannot provide both :replicationVlanId and :replication_vlan_id' if attributes.key?(:'replicationVlanId') && attributes.key?(:'replication_vlan_id')

      self.replication_vlan_id = attributes[:'replication_vlan_id'] if attributes[:'replication_vlan_id']

      self.provisioning_vlan_id = attributes[:'provisioningVlanId'] if attributes[:'provisioningVlanId']

      raise 'You cannot provide both :provisioningVlanId and :provisioning_vlan_id' if attributes.key?(:'provisioningVlanId') && attributes.key?(:'provisioning_vlan_id')

      self.provisioning_vlan_id = attributes[:'provisioning_vlan_id'] if attributes[:'provisioning_vlan_id']

      self.hcx_private_ip_id = attributes[:'hcxPrivateIpId'] if attributes[:'hcxPrivateIpId']

      raise 'You cannot provide both :hcxPrivateIpId and :hcx_private_ip_id' if attributes.key?(:'hcxPrivateIpId') && attributes.key?(:'hcx_private_ip_id')

      self.hcx_private_ip_id = attributes[:'hcx_private_ip_id'] if attributes[:'hcx_private_ip_id']

      self.hcx_fqdn = attributes[:'hcxFqdn'] if attributes[:'hcxFqdn']

      raise 'You cannot provide both :hcxFqdn and :hcx_fqdn' if attributes.key?(:'hcxFqdn') && attributes.key?(:'hcx_fqdn')

      self.hcx_fqdn = attributes[:'hcx_fqdn'] if attributes[:'hcx_fqdn']

      self.hcx_initial_password = attributes[:'hcxInitialPassword'] if attributes[:'hcxInitialPassword']

      raise 'You cannot provide both :hcxInitialPassword and :hcx_initial_password' if attributes.key?(:'hcxInitialPassword') && attributes.key?(:'hcx_initial_password')

      self.hcx_initial_password = attributes[:'hcx_initial_password'] if attributes[:'hcx_initial_password']

      self.hcx_vlan_id = attributes[:'hcxVlanId'] if attributes[:'hcxVlanId']

      raise 'You cannot provide both :hcxVlanId and :hcx_vlan_id' if attributes.key?(:'hcxVlanId') && attributes.key?(:'hcx_vlan_id')

      self.hcx_vlan_id = attributes[:'hcx_vlan_id'] if attributes[:'hcx_vlan_id']

      self.is_hcx_enabled = attributes[:'isHcxEnabled'] unless attributes[:'isHcxEnabled'].nil?

      raise 'You cannot provide both :isHcxEnabled and :is_hcx_enabled' if attributes.key?(:'isHcxEnabled') && attributes.key?(:'is_hcx_enabled')

      self.is_hcx_enabled = attributes[:'is_hcx_enabled'] unless attributes[:'is_hcx_enabled'].nil?

      self.hcx_on_prem_key = attributes[:'hcxOnPremKey'] if attributes[:'hcxOnPremKey']

      raise 'You cannot provide both :hcxOnPremKey and :hcx_on_prem_key' if attributes.key?(:'hcxOnPremKey') && attributes.key?(:'hcx_on_prem_key')

      self.hcx_on_prem_key = attributes[:'hcx_on_prem_key'] if attributes[:'hcx_on_prem_key']

      self.is_hcx_enterprise_enabled = attributes[:'isHcxEnterpriseEnabled'] unless attributes[:'isHcxEnterpriseEnabled'].nil?
      self.is_hcx_enterprise_enabled = false if is_hcx_enterprise_enabled.nil? && !attributes.key?(:'isHcxEnterpriseEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isHcxEnterpriseEnabled and :is_hcx_enterprise_enabled' if attributes.key?(:'isHcxEnterpriseEnabled') && attributes.key?(:'is_hcx_enterprise_enabled')

      self.is_hcx_enterprise_enabled = attributes[:'is_hcx_enterprise_enabled'] unless attributes[:'is_hcx_enterprise_enabled'].nil?
      self.is_hcx_enterprise_enabled = false if is_hcx_enterprise_enabled.nil? && !attributes.key?(:'isHcxEnterpriseEnabled') && !attributes.key?(:'is_hcx_enterprise_enabled') # rubocop:disable Style/StringLiterals

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

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.initial_host_shape_name = attributes[:'initialHostShapeName'] if attributes[:'initialHostShapeName']

      raise 'You cannot provide both :initialHostShapeName and :initial_host_shape_name' if attributes.key?(:'initialHostShapeName') && attributes.key?(:'initial_host_shape_name')

      self.initial_host_shape_name = attributes[:'initial_host_shape_name'] if attributes[:'initial_host_shape_name']

      self.initial_host_ocpu_count = attributes[:'initialHostOcpuCount'] if attributes[:'initialHostOcpuCount']

      raise 'You cannot provide both :initialHostOcpuCount and :initial_host_ocpu_count' if attributes.key?(:'initialHostOcpuCount') && attributes.key?(:'initial_host_ocpu_count')

      self.initial_host_ocpu_count = attributes[:'initial_host_ocpu_count'] if attributes[:'initial_host_ocpu_count']

      self.is_shielded_instance_enabled = attributes[:'isShieldedInstanceEnabled'] unless attributes[:'isShieldedInstanceEnabled'].nil?
      self.is_shielded_instance_enabled = false if is_shielded_instance_enabled.nil? && !attributes.key?(:'isShieldedInstanceEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isShieldedInstanceEnabled and :is_shielded_instance_enabled' if attributes.key?(:'isShieldedInstanceEnabled') && attributes.key?(:'is_shielded_instance_enabled')

      self.is_shielded_instance_enabled = attributes[:'is_shielded_instance_enabled'] unless attributes[:'is_shielded_instance_enabled'].nil?
      self.is_shielded_instance_enabled = false if is_shielded_instance_enabled.nil? && !attributes.key?(:'isShieldedInstanceEnabled') && !attributes.key?(:'is_shielded_instance_enabled') # rubocop:disable Style/StringLiterals

      self.capacity_reservation_id = attributes[:'capacityReservationId'] if attributes[:'capacityReservationId']

      raise 'You cannot provide both :capacityReservationId and :capacity_reservation_id' if attributes.key?(:'capacityReservationId') && attributes.key?(:'capacity_reservation_id')

      self.capacity_reservation_id = attributes[:'capacity_reservation_id'] if attributes[:'capacity_reservation_id']

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
    # @param [Object] initial_sku Object to be assigned
    def initial_sku=(initial_sku)
      # rubocop:disable Style/ConditionalAssignment
      if initial_sku && !INITIAL_SKU_ENUM.include?(initial_sku)
        OCI.logger.debug("Unknown value for 'initial_sku' [" + initial_sku + "]. Mapping to 'INITIAL_SKU_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @initial_sku = INITIAL_SKU_UNKNOWN_ENUM_VALUE
      else
        @initial_sku = initial_sku
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
        compute_availability_domain == other.compute_availability_domain &&
        display_name == other.display_name &&
        instance_display_name_prefix == other.instance_display_name_prefix &&
        vmware_software_version == other.vmware_software_version &&
        compartment_id == other.compartment_id &&
        esxi_hosts_count == other.esxi_hosts_count &&
        initial_sku == other.initial_sku &&
        vcenter_fqdn == other.vcenter_fqdn &&
        nsx_manager_fqdn == other.nsx_manager_fqdn &&
        vcenter_private_ip_id == other.vcenter_private_ip_id &&
        nsx_manager_private_ip_id == other.nsx_manager_private_ip_id &&
        vcenter_initial_password == other.vcenter_initial_password &&
        nsx_manager_initial_password == other.nsx_manager_initial_password &&
        vcenter_username == other.vcenter_username &&
        nsx_manager_username == other.nsx_manager_username &&
        ssh_authorized_keys == other.ssh_authorized_keys &&
        workload_network_cidr == other.workload_network_cidr &&
        nsx_overlay_segment_name == other.nsx_overlay_segment_name &&
        nsx_edge_uplink_ip_id == other.nsx_edge_uplink_ip_id &&
        provisioning_subnet_id == other.provisioning_subnet_id &&
        vsphere_vlan_id == other.vsphere_vlan_id &&
        vmotion_vlan_id == other.vmotion_vlan_id &&
        vsan_vlan_id == other.vsan_vlan_id &&
        nsx_v_tep_vlan_id == other.nsx_v_tep_vlan_id &&
        nsx_edge_v_tep_vlan_id == other.nsx_edge_v_tep_vlan_id &&
        nsx_edge_uplink1_vlan_id == other.nsx_edge_uplink1_vlan_id &&
        nsx_edge_uplink2_vlan_id == other.nsx_edge_uplink2_vlan_id &&
        replication_vlan_id == other.replication_vlan_id &&
        provisioning_vlan_id == other.provisioning_vlan_id &&
        hcx_private_ip_id == other.hcx_private_ip_id &&
        hcx_fqdn == other.hcx_fqdn &&
        hcx_initial_password == other.hcx_initial_password &&
        hcx_vlan_id == other.hcx_vlan_id &&
        is_hcx_enabled == other.is_hcx_enabled &&
        hcx_on_prem_key == other.hcx_on_prem_key &&
        is_hcx_enterprise_enabled == other.is_hcx_enterprise_enabled &&
        is_hcx_pending_downgrade == other.is_hcx_pending_downgrade &&
        hcx_on_prem_licenses == other.hcx_on_prem_licenses &&
        time_hcx_billing_cycle_end == other.time_hcx_billing_cycle_end &&
        time_hcx_license_status_updated == other.time_hcx_license_status_updated &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        initial_host_shape_name == other.initial_host_shape_name &&
        initial_host_ocpu_count == other.initial_host_ocpu_count &&
        is_shielded_instance_enabled == other.is_shielded_instance_enabled &&
        capacity_reservation_id == other.capacity_reservation_id &&
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
      [id, compute_availability_domain, display_name, instance_display_name_prefix, vmware_software_version, compartment_id, esxi_hosts_count, initial_sku, vcenter_fqdn, nsx_manager_fqdn, vcenter_private_ip_id, nsx_manager_private_ip_id, vcenter_initial_password, nsx_manager_initial_password, vcenter_username, nsx_manager_username, ssh_authorized_keys, workload_network_cidr, nsx_overlay_segment_name, nsx_edge_uplink_ip_id, provisioning_subnet_id, vsphere_vlan_id, vmotion_vlan_id, vsan_vlan_id, nsx_v_tep_vlan_id, nsx_edge_v_tep_vlan_id, nsx_edge_uplink1_vlan_id, nsx_edge_uplink2_vlan_id, replication_vlan_id, provisioning_vlan_id, hcx_private_ip_id, hcx_fqdn, hcx_initial_password, hcx_vlan_id, is_hcx_enabled, hcx_on_prem_key, is_hcx_enterprise_enabled, is_hcx_pending_downgrade, hcx_on_prem_licenses, time_hcx_billing_cycle_end, time_hcx_license_status_updated, time_created, time_updated, lifecycle_state, initial_host_shape_name, initial_host_ocpu_count, is_shielded_instance_enabled, capacity_reservation_id, freeform_tags, defined_tags].hash
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
