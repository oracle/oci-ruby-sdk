# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# This script provides a basic example of how to use composite operations in the Ruby SDK. Composite operations provide
# convenience methods for operations which would otherwise need to be chained together.  For example, instead of performing an action
# on a resource and then using a waiter to wait for the resource to enter a given state, you can call a single method in
# a composite operation class to accomplish the same functionality.
#
# This example will use VCNs, subnets and load balancers to demonstrate composite operation functionality.
#
# This will use credentials and settings from the DEFAULT profile at ~/.oci/config (on windows
# "C:\Users\{user}\.oci\config"), however if that file does not exist we will automatically fall back to using
# ~/.oraclebmc/config (on windows "C:\Users\{user}\.oraclebmc\config")
#
# This script accepts three arguments:
#   - The first argument is the compartment where we'll create the load balancer and related resources
#   - The second argument is the first availability domain where we'll create a subnet
#   - The third argument is a second (different) availability domain where we'll create a subnet
#
# Format:
#   composite_operations_example.rb <compartmend ID> <first AD> <second AD>
#
# Example run:
#   ruby examples/composite_operations_example.rb 'ocid1.compartment.oc1..aaaaaaaac4xqx43texeuonfionxsx4okzfsya5evr2goe2t7v5wntztaymab' 'xxx:PHX-AD-1' 'xxx:PHX-AD-2'

require 'oci'
require 'pp'

def create_vcn_and_subnets(virtual_network_client_composite_operations, compartment_id, first_ad, second_ad)
  # Here we use a composite operation to create a VCN and wait for it to enter the given state. Note that the
  # states are passed as an array so it is possible to wait on multiple states. The waiter will complete
  # (and the method will return) once the resource enters ANY of the provided states.
  get_vcn_response = virtual_network_client_composite_operations.create_vcn_and_wait_for_state(
    OCI::Core::Models::CreateVcnDetails.new(
      cidr_block: '10.0.0.0/16',
      display_name: 'ruby_sdk_test_lb_vcn',
      compartment_id: compartment_id
    ),
    [OCI::Core::Models::Vcn::LIFECYCLE_STATE_AVAILABLE]
  )

  vcn = get_vcn_response.data
  puts 'Created VCN'

  get_subnet_response = virtual_network_client_composite_operations.create_subnet_and_wait_for_state(
    OCI::Core::Models::CreateSubnetDetails.new(
      compartment_id: compartment_id,
      availability_domain: first_ad,
      display_name: 'ruby_sdk_test_lb_subnet1',
      vcn_id: vcn.id,
      cidr_block: '10.0.0.0/24'
    ),
    [OCI::Core::Models::Subnet::LIFECYCLE_STATE_AVAILABLE]
  )
  subnet_one = get_subnet_response.data
  puts 'Created Subnet 1'

  get_subnet_response = virtual_network_client_composite_operations.create_subnet_and_wait_for_state(
    OCI::Core::Models::CreateSubnetDetails.new(
      compartment_id: compartment_id,
      availability_domain: second_ad,
      display_name: 'ruby_sdk_test_lb_subnet2',
      vcn_id: vcn.id,
      cidr_block: '10.0.1.0/24'
    ),
    [OCI::Core::Models::Subnet::LIFECYCLE_STATE_AVAILABLE]
  )
  subnet_two = get_subnet_response.data
  puts 'Created Subnet 2'

  { vcn: vcn, subnets: [subnet_one, subnet_two] }
end

def delete_vcn_and_subnets(virtual_network_client_composite_operations, vcn_and_subnets)
  vcn = vcn_and_subnets[:vcn]
  subnet_one = vcn_and_subnets[:subnets][0]
  subnet_two = vcn_and_subnets[:subnets][1]

  virtual_network_client_composite_operations.delete_subnet_and_wait_for_state(
    subnet_one.id,
    [OCI::Core::Models::Subnet::LIFECYCLE_STATE_TERMINATED]
  )
  puts 'Deleted Subnet 1'

  virtual_network_client_composite_operations.delete_subnet_and_wait_for_state(
    subnet_two.id,
    [OCI::Core::Models::Subnet::LIFECYCLE_STATE_TERMINATED]
  )
  puts 'Deleted Subnet 2'

  virtual_network_client_composite_operations.delete_vcn_and_wait_for_state(
    vcn.id,
    [OCI::Core::Models::Vcn::LIFECYCLE_STATE_TERMINATED]
  )
  puts 'Deleted VCN'
end

# Create a client using the default configuration and profile
virtual_network_client = OCI::Core::VirtualNetworkClient.new

# A composite operation class can take an explicit client
virtual_network_client_composite_operations = OCI::Core::VirtualNetworkClientCompositeOperations.new(virtual_network_client)

# If a composite operation class is not passed a client, it will create one. The client created will use
# the default configuration and profile
load_balancer_client_composite_operations = OCI::LoadBalancer::LoadBalancerClientCompositeOperations.new

compartment_id = ARGV[0]
first_ad = ARGV[1]
second_ad = ARGV[2]

vcn_and_subnets = create_vcn_and_subnets(virtual_network_client_composite_operations, compartment_id, first_ad, second_ad)
subnets = vcn_and_subnets[:subnets]

# Load Balancer operations return work requests so when using composite operations we have to wait for the state of the
# work request (e.g. for it to succeed) rather than the state of the load balancer. However, as a convenience, when the
# composite operation completes we'll return information on the load balancer (if possible) rather than the work
# request
get_load_balancer_response = load_balancer_client_composite_operations.create_load_balancer_and_wait_for_state(
  OCI::LoadBalancer::Models::CreateLoadBalancerDetails.new(
    compartment_id: compartment_id,
    display_name: 'RubySdkCompositeOpsExample',
    shape_name: '100Mbps',
    subnet_ids: subnets.map(&:id)
  ),
  [OCI::LoadBalancer::Models::WorkRequest::LIFECYCLE_STATE_SUCCEEDED]
)
puts 'Created Load Balancer'

# Deleting a load balancer also returns a work request, so in this composite oepration we have to wait on the
# state of the work request rather than the state of the load balancer
load_balancer_client_composite_operations.delete_load_balancer_and_wait_for_state(
  get_load_balancer_response.data.id,
  [OCI::LoadBalancer::Models::WorkRequest::LIFECYCLE_STATE_SUCCEEDED]
)

delete_vcn_and_subnets(virtual_network_client_composite_operations, vcn_and_subnets)

puts 'Script completed'
