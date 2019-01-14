# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# Given 2 instances and an internet gateway, this script will create a load balancer
# that can be used to verify traffic to those instances. This is example code only - there
# are many hard-coded assumptions.
#
# Usage: ruby examples/load_balancer_setup.rb <LB name> <compartment OCID> <Internet Gateway OCID> <Intance 1 OCID> <Intance 2 OCID> [<LB Subnet CIDR 1> <LB Subnet CIDR 2>]
#
# If the OCIDs are all in environment variables, an example run might be:
#  ruby examples/load_balancer_setup.rb MyLB1 $CID $IGID $IID1 $IID2
#
# You can setup the prerequisites for this example through the console by creating a VCN and selecting
# the "Create Virtual Could Network Plus Related Resources" option, then launch 2 instances in that VCN.
# You can test the results by starting a web server on each instance with different content, and
# then visiting the public load balancer IP address that's output at the completion of this script.
#
# Note:
# - The LB subnets will be added to the same VCN that contains the instances. The CIDR blocks for these
#   subnets may optionally be specified.
# - The LB will use the first 2 ADs that appear in the list_availability_domains call.

require 'oci'

args = ARGV.dup
name = args[0]
compartment = args[1]
internet_gateway_id = args[2] # example: "ocid1.internetgateway.oc1.phx.aaaaaaaavjuho7ml7z2vuwfy2jlauglggp5lhpvjkn4telv32njze4ur4abc"
instance1_id = args[3] # example: "ocid1.instance.oc1.phx.abyhqljrbqbbhdfu7jegwicybjy2id7c7m2bhruevs2yb5n7iui4cas34abc"
instance2_id = args[4]

# Optionally specy CIDR blocks for the LB subnets. Note that these subnets will
# be added to the same VCN as the instances.
if args.length > 8
  lb_subnet_a_cidr = args[7]
  lb_subnet_b_cidr = args[8]
else
  lb_subnet_a_cidr = '10.0.4.0/24'
  lb_subnet_b_cidr = '10.0.5.0/24'
end

PORT = 80
LB_PROTOCOL = 'HTTP'.freeze
LB_SHAPE_NAME = '100Mbps'.freeze
SECURITY_RULE_PROTOCOL = '6'.freeze # TCP
BACKEND_SET_POLICY = 'ROUND_ROBIN'.freeze

def create_security_list_for_lb(vcn_client, compartment, vcn_id)
  request = OCI::Core::Models::CreateSecurityListDetails.new
  request.display_name = 'lb_security_list'
  request.compartment_id = compartment
  request.egress_security_rules = []
  request.ingress_security_rules = []
  request.vcn_id = vcn_id
  response = vcn_client.create_security_list(request)
  security_list_id = response.data.id
  vcn_client.get_security_list(security_list_id) \
            .wait_until(:lifecycle_state,
                        OCI::Core::Models::RouteTable::LIFECYCLE_STATE_AVAILABLE)
  puts "Created security list \"#{response.data.display_name}\" (#{security_list_id})"
  security_list_id
end

def create_route_table_for_lb(vcn_client, compartment, vcn_id, internet_gateway_id)
  route_rule = OCI::Core::Models::RouteRule.new
  route_rule.cidr_block = '0.0.0.0/0'
  route_rule.network_entity_id = internet_gateway_id

  request = OCI::Core::Models::CreateRouteTableDetails.new
  request.display_name = 'lb_route_table'
  request.compartment_id = compartment
  request.route_rules = [route_rule]
  request.vcn_id = vcn_id
  response = vcn_client.create_route_table(request)
  route_table_id = response.data.id
  vcn_client.get_route_table(route_table_id) \
            .wait_until(:lifecycle_state,
                        OCI::Core::Models::RouteTable::LIFECYCLE_STATE_AVAILABLE)
  puts "Created route table \"#{response.data.display_name}\" (#{route_table_id})"
  route_table_id
end

def create_subnet_for_lb(vcn_client,
                         compartment,
                         vcn_id,
                         availability_domain,
                         cidr_block,
                         name_postfix,
                         route_table_id,
                         security_list_id)
  request = OCI::Core::Models::CreateSubnetDetails.new
  request.cidr_block = cidr_block
  request.availability_domain = availability_domain
  request.display_name = 'lb_subnet_' + name_postfix
  request.compartment_id = compartment
  request.route_table_id = route_table_id
  request.security_list_ids = [security_list_id]
  request.vcn_id = vcn_id
  response = vcn_client.create_subnet(request)
  subnet_id = response.data.id
  vcn_client.get_subnet(subnet_id) \
            .wait_until(:lifecycle_state,
                        OCI::Core::Models::Subnet::LIFECYCLE_STATE_AVAILABLE)
  puts "Created subnet \"#{response.data.display_name}\" (#{subnet_id})"
  subnet_id
end

def create_load_balancer(lb_client, compartment, name, lb_subnet1_id, lb_subnet2_id)
  request = OCI::LoadBalancer::Models::CreateLoadBalancerDetails.new
  request.compartment_id = compartment
  request.display_name = name
  request.shape_name = LB_SHAPE_NAME
  request.listeners = {}
  request.backend_sets = {}
  request.subnet_ids = [lb_subnet1_id, lb_subnet2_id]

  response = lb_client.create_load_balancer(request)
  work_request = OCI::LoadBalancer::Util.wait_on_work_request(
    lb_client,
    response.headers['opc-work-request-id'],
    max_wait_seconds: 1200
  )

  lb_id = work_request.load_balancer_id
  puts "Created load balancer \"#{request.display_name}\" (#{lb_id})"
  lb_id
end

def create_backend_set(lb_client, lb_id, bes_name)
  health_checker = OCI::LoadBalancer::Models::HealthCheckerDetails.new
  health_checker.protocol = LB_PROTOCOL
  health_checker.url_path = '/'
  health_checker.port = PORT

  request = OCI::LoadBalancer::Models::CreateBackendSetDetails.new
  request.name = bes_name
  request.policy = BACKEND_SET_POLICY
  request.backends = []
  request.health_checker = health_checker

  response = lb_client.create_backend_set(request, lb_id)
  OCI::LoadBalancer::Util.wait_on_work_request(
    lb_client,
    response.headers['opc-work-request-id']
  )
  puts "Created backend set \"#{request.name}\"."
  request.name
end

def get_vnic(compute_client, vcn_client, compartment, instance_id)
  # Assume that there is only a single VNIC.
  vnic_attachment = compute_client.list_vnic_attachments(
    compartment,
    instance_id: instance_id
  ).data[0]

  vcn_client.get_vnic(vnic_attachment.vnic_id).data
end

def get_subnet(compute_client, vcn_client, compartment, instance_id)
  # Assume that there is only a single VNIC.
  vnic_attachment = compute_client.list_vnic_attachments(
    compartment,
    instance_id: instance_id
  ).data[0]

  vcn_client.get_subnet(vnic_attachment.subnet_id).data
end

def create_backend(lb_client, lb_id, bes_name, instance_private_ip_address)
  puts "Creating backend for private IP address #{instance_private_ip_address}."

  request = OCI::LoadBalancer::Models::CreateBackendDetails.new
  request.ip_address = instance_private_ip_address
  request.port = PORT
  request.weight = 50
  request.backup = false
  request.drain = false
  request.offline = false

  response = lb_client.create_backend(request, lb_id, bes_name)
  be_name = "#{request.ip_address}:#{request.port}"

  OCI::LoadBalancer::Util.wait_on_work_request(
    lb_client,
    response.headers['opc-work-request-id']
  )
  puts "Created backend \"#{be_name}\"."

  be_name
end

# Add additional security list rules.
# A rule will not be added if an exact duplicate of that rule already existins in the list.
# Note that this does not check for rules that are supersets of the rule being added, and
# it does not remove duplicates that already exist in the security list.
def append_security_list_rules(vcn_client, security_list_id, egress_rules: nil, ingress_rules: nil)
  security_list_response = vcn_client.get_security_list(security_list_id)
  request = OCI::Core::Models::UpdateSecurityListDetails.new

  if egress_rules
    egress_rules.each do |rule|
      unless security_list_response.data.egress_security_rules.include? rule
        security_list_response.data.egress_security_rules.push(rule)
      end
    end
  end

  if ingress_rules
    ingress_rules.each do |rule|
      unless security_list_response.data.ingress_security_rules.include? rule
        security_list_response.data.ingress_security_rules.push(rule)
      end
    end
  end

  request.egress_security_rules = security_list_response.data.egress_security_rules
  request.ingress_security_rules = security_list_response.data.ingress_security_rules

  vcn_client.update_security_list(security_list_id, request)
end

# Ensure that subnet for the new backend can communicate with both LB subnets.
# A more generalized version of this method would need to check whether the backend subnet
# is the same as either of the LB subnets.
def add_security_rules_for_backend(vcn_client,
                                   load_balancer,
                                   instance_subnet,
                                   instance_security_list_id,
                                   lb_security_lists)
  range = OCI::Core::Models::PortRange.new
  range.min = PORT
  range.max = PORT

  options = OCI::Core::Models::TcpOptions.new
  options.destination_port_range = range

  egress_rule = OCI::Core::Models::EgressSecurityRule.new
  egress_rule.destination = instance_subnet.cidr_block
  egress_rule.protocol = SECURITY_RULE_PROTOCOL
  egress_rule.tcp_options = options

  lb_security_lists.each do |lb_security_list|
    append_security_list_rules(vcn_client, lb_security_list, egress_rules: [egress_rule])
  end

  ingress_rules = []

  load_balancer.subnet_ids.each do |lb_subnet_id|
    lb_subnet = vcn_client.get_subnet(lb_subnet_id).data
    ingress_rule = OCI::Core::Models::IngressSecurityRule.new
    ingress_rule.source = lb_subnet.cidr_block
    ingress_rule.protocol = SECURITY_RULE_PROTOCOL
    ingress_rule.tcp_options = options

    ingress_rules.push(ingress_rule)
  end

  append_security_list_rules(vcn_client, instance_security_list_id, ingress_rules: ingress_rules)
end

# Create a new backend for the given instance_id, and setup security rules to allow it to communicate
# with both LB subnets.
def create_and_configure_backend(lb_client,
                                 compute_client,
                                 vcn_client,
                                 compartment,
                                 lb_id,
                                 bes_name,
                                 instance_id,
                                 instance_subnet,
                                 lb_security_list_id)
  instance_vnic = get_vnic(compute_client, vcn_client, compartment, instance_id)
  create_backend(lb_client, lb_id, bes_name, instance_vnic.private_ip)

  # Just use the first security list.
  instance_security_list_id = instance_subnet.security_list_ids[0]
  load_balancer = lb_client.get_load_balancer(lb_id).data
  add_security_rules_for_backend(
    vcn_client,
    load_balancer,
    instance_subnet,
    instance_security_list_id,
    [lb_security_list_id]
  )
end

def create_listener(lb_client, lb_id, bes_name)
  request = OCI::LoadBalancer::Models::CreateListenerDetails.new
  request.name = 'listener_1'
  request.port = PORT
  request.protocol = LB_PROTOCOL
  request.default_backend_set_name = bes_name

  response = lb_client.create_listener(request, lb_id)
  OCI::LoadBalancer::Util.wait_on_work_request(
    lb_client,
    response.headers['opc-work-request-id']
  )
  puts "Created listener \"#{request.name}\"."
  request.name
end

# Allow traffic from all IPs to the listener on port 80
def enable_traffic_to_listener(vcn_client, lb_security_list_id)
  range = OCI::Core::Models::PortRange.new
  range.min = PORT
  range.max = PORT

  options = OCI::Core::Models::TcpOptions.new
  options.destination_port_range = range

  ingress_rule = OCI::Core::Models::IngressSecurityRule.new
  ingress_rule.source = '0.0.0.0/0'
  ingress_rule.protocol = SECURITY_RULE_PROTOCOL
  ingress_rule.tcp_options = options

  append_security_list_rules(vcn_client, lb_security_list_id, ingress_rules: [ingress_rule])
  puts 'Added ingress security rules to allow traffic to the listener.'
end

identity_client = OCI::Identity::IdentityClient.new
vcn_client = OCI::Core::VirtualNetworkClient.new
compute_client = OCI::Core::ComputeClient.new

compartment_name = identity_client.get_compartment(compartment).data.name
puts "Creating LB \"#{name}\" in compartment \"#{compartment_name}\" (#{compartment})."

availability_domains = identity_client.list_availability_domains(compartment).data
# Just use the first 2 ADs returned.
lb_subnet_a_ad = availability_domains[0].name
lb_subnet_b_ad = availability_domains[1].name

puts "Using Availability Domains: #{lb_subnet_a_ad} and #{lb_subnet_b_ad}"

instance_subnet1 = get_subnet(compute_client, vcn_client, compartment, instance1_id)
instance_subnet2 = get_subnet(compute_client, vcn_client, compartment, instance2_id)
vcn_id = instance_subnet1.vcn_id

# VCN setup for LB
lb_security_list_id = create_security_list_for_lb(vcn_client, compartment, vcn_id)
lb_route_table_id = create_route_table_for_lb(vcn_client, compartment, vcn_id, internet_gateway_id)
lb_subnet1_id = create_subnet_for_lb(
  vcn_client,
  compartment,
  vcn_id,
  lb_subnet_a_ad,
  lb_subnet_a_cidr,
  'adA',
  lb_route_table_id,
  lb_security_list_id
)
lb_subnet2_id = create_subnet_for_lb(
  vcn_client,
  compartment,
  vcn_id,
  lb_subnet_b_ad,
  lb_subnet_b_cidr,
  'adB',
  lb_route_table_id,
  lb_security_list_id
)

# Allow some time for new subnets to propogate.
sleep(3)

# Create LB and backend set
bes_name = 'backend_set'
lb_client = OCI::LoadBalancer::LoadBalancerClient.new
lb_id = create_load_balancer(lb_client, compartment, name, lb_subnet1_id, lb_subnet2_id)
create_backend_set(lb_client, lb_id, bes_name)

# Add backends and configure security rules
create_and_configure_backend(
  lb_client,
  compute_client,
  vcn_client,
  compartment,
  lb_id,
  bes_name,
  instance1_id,
  instance_subnet1,
  lb_security_list_id
)
create_and_configure_backend(
  lb_client,
  compute_client,
  vcn_client,
  compartment,
  lb_id,
  bes_name,
  instance2_id,
  instance_subnet2,
  lb_security_list_id
)

# Create and configure listener
create_listener(lb_client, lb_id, bes_name)
enable_traffic_to_listener(vcn_client, lb_security_list_id)

load_balancer = lb_client.get_load_balancer(lb_id).data
puts "Success! IP addresses for the LB #{name}:"
load_balancer.ip_addresses.each do |address|
  puts address.ip_address
end
