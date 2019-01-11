# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# This script provides a basic example on how to work with reserved and ephemeral public IPs in the Python SDK by:
#
#   - Creating a reserved public IP, assigning it to a private IP and unassigning it from a private IP
#   - Creating an ephemeral private IP
#
# This will use credentials and settings from the DEFAULT profile at ~/.oci/config (on windows
# "C:\Users\{user}\.oci\config"), however if that file does not exist we will automatically fall back to using
# ~/.oraclebmc/config (on windows "C:\Users\{user}\.oraclebmc\config")
#
# This script accepts three arguments:
#   - The first argument is the compartment where we'll create the public IPs and required resources for this script
#   - The second argument is the availability domain where we'll create a subnet and instance
#   - The third argument is the image ID which we'll use to launch the instance
#
# The following supporting resources will be created by this script:
#   - A VCN and subnet
#   - An instance (so we can assign public IPs to VNICs on the instance)
# These supporting resources will be deleted at the end of the script

require 'oci'
require 'pp'

def create_vcn_and_subnet(virtual_network, compartment_id, availability_domain)
  # Create a VCN
  vcn_name = 'ruby_sdk_test_vcn'
  cidr_block = '10.0.0.0/16'
  result = virtual_network.create_vcn(
    OCI::Core::Models::CreateVcnDetails.new(
      cidrBlock: cidr_block,
      displayName: vcn_name,
      compartmentId: compartment_id
    )
  )

  get_vcn_response = virtual_network.get_vcn(result.data.id).wait_until(
    :lifecycle_state,
    OCI::Core::Models::Vcn::LIFECYCLE_STATE_AVAILABLE
  )
  vcn = get_vcn_response.data
  puts 'Created VCN'

  # Create a subnet
  subnet_name = 'ruby_sdk_test_lb_subnet1'
  subnet_cidr_block1 = '10.0.0.0/24'
  result = virtual_network.create_subnet(
    OCI::Core::Models::CreateSubnetDetails.new(
      compartmentId: compartment_id,
      availabilityDomain: availability_domain,
      displayName: subnet_name,
      vcnId: vcn.id,
      cidrBlock: subnet_cidr_block1
    )
  )
  get_subnet_response = virtual_network.get_subnet(result.data.id).wait_until(
    :lifecycle_state,
    OCI::Core::Models::Subnet::LIFECYCLE_STATE_AVAILABLE
  )
  subnet = get_subnet_response.data
  puts 'Created Subnet'

  { vcn: vcn, subnet: subnet }
end

def delete_vcn_and_subnet(virtual_network, vcn_and_subnet)
  vcn = vcn_and_subnet[:vcn]
  subnet = vcn_and_subnet[:subnet]

  get_subnet_response = virtual_network.get_subnet(subnet.id)
  virtual_network.delete_subnet(subnet.id)
  get_subnet_response.wait_until(
    :lifecycle_state,
    OCI::Core::Models::Subnet::LIFECYCLE_STATE_TERMINATED,
    # For a deletion, the record may no longer be available and the waiter may encounter a 404 when trying to retrieve it.
    # This flag tells the waiter to consider 404s as successful (which is only really valid for delete/terminate since
    # the record not being there anymore can signify a successful delete/terminate)
    succeed_on_not_found: true
  )

  get_vcn_response = virtual_network.get_subnet(vcn.id)
  virtual_network.delete_vcn(vcn.id)
  get_vcn_response.wait_until(
    :lifecycle_state,
    OCI::Core::Models::Vcn::LIFECYCLE_STATE_TERMINATED,
    succeed_on_not_found: true
  )
end

def launch_instance(compute, compartment_id, subnet, image_id)
  create_instance_details = OCI::Core::Models::LaunchInstanceDetails.new
  create_instance_details.compartment_id = compartment_id
  create_instance_details.availability_domain = subnet.availability_domain
  create_instance_details.display_name = 'pub_ip_test_instance'
  create_instance_details.create_vnic_details = OCI::Core::Models::CreateVnicDetails.new(
    subnetId: subnet.id,
    # We don't assign a public IP here so that we can demonstrate public IP functionality later on
    # in the script
    assignPublicIp: false
  )
  create_instance_details.image_id = image_id
  create_instance_details.shape = 'VM.Standard1.1'

  result = compute.launch_instance(create_instance_details)
  instance_ocid = result.data.id

  get_instance_response = compute.get_instance(instance_ocid).wait_until(
    :lifecycle_state,
    OCI::Core::Models::Instance::LIFECYCLE_STATE_RUNNING
  )
  puts 'Launched instance'

  get_instance_response.data
end

def terminate_instance(compute, instance)
  get_instance_response = compute.get_instance(instance.id)
  compute.terminate_instance(instance.id)
  get_instance_response.wait_until(
    :lifecycle_state,
    OCI::Core::Models::Instance::LIFECYCLE_STATE_TERMINATED
  )
end

compartment_id = ARGV[0]
availability_domain = ARGV[1]
image_id = ARGV[2]

virtual_network = OCI::Core::VirtualNetworkClient.new
compute = OCI::Core::ComputeClient.new

vcn_and_subnet = create_vcn_and_subnet(virtual_network, compartment_id, availability_domain)
instance = launch_instance(compute, compartment_id, vcn_and_subnet[:subnet], image_id)

# First we'll create a reserved public IP. This does not have to be assigned to a private IP at create time, although
# it can be by specifying a private_ip_id in CreatePublicIpDetails.
create_public_ip_response = virtual_network.create_public_ip(
  OCI::Core::Models::CreatePublicIpDetails.new(
    compartmentId: compartment_id,
    displayName: 'py_sdk_example_res_ip',
    lifetime: OCI::Core::Models::CreatePublicIpDetails::LIFETIME_RESERVED
  )
)
puts 'Created Public IP'
puts '=' * 20
pp create_public_ip_response.data

# A Public IP has a lifecycle state, so we can wait until it is available or assigned to a private IP. If we
# need to wait on multiple states, we can use the eval_proc parameter on the waiter. This parameter can take
# either a proc or a lambda.
available_or_assigned = [
  OCI::Core::Models::PublicIp::LIFECYCLE_STATE_AVAILABLE,
  OCI::Core::Models::PublicIp::LIFECYCLE_STATE_ASSIGNED
]
get_public_ip_response = virtual_network.get_public_ip(create_public_ip_response.data.id).wait_until(
  eval_proc: ->(response) { available_or_assigned.include?(response.data.lifecycle_state) }
)
public_ip = get_public_ip_response.data
puts 'Public IP after waiting'
puts '=' * 20
pp public_ip

# We can list public IPs. When doing this, we need to provide a scope - for reserved public IPs the scope is
# REGION. Since listing public IPs is a paginated operation, we can use the functionality in oci.pagination
# to get all results
all_region_scoped_public_ips = []
virtual_network.list_public_ips('REGION', compartment_id).each do |response|
  all_region_scoped_public_ips += response.data
end
puts 'All reserved public IPs'
puts '=' * 20
pp all_region_scoped_public_ips

# We'll now assign the public IP to the private IP from the instance we launched earlier. First we'll need to
# get the ID of the private IP
vnic_attachments = compute.list_vnic_attachments(compartment_id, instance_id: instance.id).data
vnic_id = vnic_attachments[0].vnic_id
private_ip_id = virtual_network.list_private_ips(vnic_id: vnic_id).data[0].id

# Now we can update the public IP to link it to the private IP. Once the update has been requested, we can
# use a waiter to wait until the public IP enters the appropriate state
virtual_network.update_public_ip(
  public_ip.id,
  OCI::Core::Models::UpdatePublicIpDetails.new(
    privateIpId: private_ip_id
  )
)
updated_public_ip = virtual_network.get_public_ip(create_public_ip_response.data.id).wait_until(
  eval_proc: ->(response) { available_or_assigned.include?(response.data.lifecycle_state) }
)
puts 'Updated public IP'
puts '=' * 20
pp updated_public_ip.data

# We can also unassign the public IP from any private IP by passing an empty string as the private_ip_id
# when doing the update. Note that the states we wait on after the update has been requested
virtual_network.update_public_ip(
  public_ip.id,
  OCI::Core::Models::UpdatePublicIpDetails.new(
    privateIpId: ''
  )
)
available_or_unassigned = [
  OCI::Core::Models::PublicIp::LIFECYCLE_STATE_AVAILABLE,
  OCI::Core::Models::PublicIp::LIFECYCLE_STATE_UNASSIGNED
]
updated_public_ip = virtual_network.get_public_ip(create_public_ip_response.data.id).wait_until(
  eval_proc: ->(response) { available_or_unassigned.include?(response.data.lifecycle_state) }
)
puts 'Updated public IP'
puts '=' * 20
pp updated_public_ip.data

# If we are done with the public IP, we can delete it
virtual_network.delete_public_ip(public_ip.id)
puts 'Deleted reserved public IP'

# We can also create an ephemeral public IP. For this type of public IP we need to assign it to a private IP
# at creation time
create_public_ip_response = virtual_network.create_public_ip(
  OCI::Core::Models::CreatePublicIpDetails.new(
    compartmentId: compartment_id,
    displayName: 'rb_sdk_example_eph_ip',
    lifetime: OCI::Core::Models::CreatePublicIpDetails::LIFETIME_EPHEMERAL,
    privateIpId: private_ip_id
  )
)
puts 'Created Public IP'
puts '=' * 20
pp create_public_ip_response.data

get_public_ip_response = virtual_network.get_public_ip(create_public_ip_response.data.id).wait_until(
  eval_proc: ->(response) { available_or_assigned.include?(response.data.lifecycle_state) }
)
public_ip = get_public_ip_response.data
puts 'Public IP after waiting'
puts '=' * 20
pp public_ip

# We can list public IPs. When doing this, we need to provide a scope - for ephemeral public IPs the scope is
# AVAILABILITY_DOMAIN. We can also provide the availability domain we want to retrieve public IPs for.
# Since listing public IPs is a paginated operation, we can use the functionality in oci.pagination
# to get all results
all_ad_scoped_public_ips = []
virtual_network.list_public_ips(
  'AVAILABILITY_DOMAIN',
  compartment_id,
  availability_domain: availability_domain
).each do |response|
  all_ad_scoped_public_ips += response.data
end
puts "All ephemeral public IPs in #{availability_domain}"
puts '=' * 20
pp all_ad_scoped_public_ips

# We can delete an ephemeral public IP, but it will also disappear when we terminate the instance
terminate_instance(compute, instance)
get_public_ip_response.wait_until(
  :lifecycle_state,
  OCI::Core::Models::PublicIp::LIFECYCLE_STATE_TERMINATED,
  succeed_on_not_found: true
)
puts 'Terminated instance - ephemeral public IP also deleted'

delete_vcn_and_subnet(virtual_network, vcn_and_subnet)
puts 'Script finished'
