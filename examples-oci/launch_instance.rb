# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# Creates all of the resources necessary to launch an instance, launches an instance, and ensures that it reaches
# a running state. This example also demonstrates providing user_data when launching an instance (see the metadata entry
# at https://docs.cloud.oracle.com/api/#/en/iaas/20160918/datatypes/LaunchInstanceDetails for
# more information).
#
# This example will use credentials and settings from the DEFAULT profile at ~/.oci/config (on windows
# "C:\Users\{user}\.oci\config"), however if that file does not exist we will automatically fall back to using
# ~/.oraclebmc/config (on windows "C:\Users\{user}\.oraclebmc\config")
#
# Format: launch_instance.rb <instance name> <compartment OCID> <availability domain ID> <CIDR block> <full path to a public key file> <full path to a user_data file>
#
# Example run:
#   ruby examples/launch_instance.rb 'my_instance5' 'ocid1.compartment.oc1..aaaaaaaac4xqx43texeuonfionxsx4okzfsya5evr2goe2t7v5wntztaymab' 'kIdk:PHX-AD-1' '10.0.0.0/16' '~/.ssh/id_rsa.pub' 'examples/launch-instance/user_data.sh'

require 'oci'

name = ARGV[0] # Example: 'my_instance'
compartment_id = ARGV[1] # Example: 'ocid1.compartment.oc1..aaaaaaaac4xqx43texeuonfionxsx4okzfsya5evr2goe2t7v5wntztaym4q'
availability_domain = ARGV[2] # Example: 'kIdk:PHX-AD-1'
cidr_block = ARGV[3] # Example: '10.0.0.0/16'
ssh_key_file = ARGV[4] # Example: ~/.ssh/id_rsa.pub
user_data_file = ARGV[5] # Example: examples/launch-instance/user_data.sh. An sample file is provided under examples/

# user_data needs to be provided as a Base64-encoded string. Instead of having to do this encoding manually, you
# can use a convenience method in the SDK for this purpose
user_data = OCI::Core::Util.file_content_as_launch_instance_user_data(user_data_file)

ssh_key = File.open(File.expand_path(ssh_key_file), 'rb').read
image_id = 'ocid1.image.oc1.phx.aaaaaaaa4wdx32cwjdjdasqyzatmvlxbef4673rs5y7cowvc3g3o7iwhmhfa' # ol7.1-base-0.0.1
shape = 'VM.Standard1.1'

compute_client = OCI::Core::ComputeClient.new
vcn_client = OCI::Core::VirtualNetworkClient.new

def create_vcn(vcn_client, name, cidr_block, compartment_id)
  puts 'Creating VCN...'
  request = OCI::Core::Models::CreateVcnDetails.new
  request.cidr_block = cidr_block
  request.display_name = 'vcn_for_' + name
  request.compartment_id = compartment_id
  response = vcn_client.create_vcn(request)

  vcn = response.data
  vcn_client.get_vcn(vcn.id) \
            .wait_until(:lifecycle_state,
                        OCI::Core::Models::Vcn::LIFECYCLE_STATE_AVAILABLE,
                        max_wait_seconds: 180)
  puts "Created VCN '#{vcn.display_name}' [#{vcn.id}]"
  vcn
end

def create_internet_gateway(vcn_client, name, compartment_id, vcn)
  puts 'Creating Internet Gateway...'
  request = OCI::Core::Models::CreateInternetGatewayDetails.new
  request.display_name = 'ig_for_' + name
  request.compartment_id = compartment_id
  request.is_enabled = true
  request.vcn_id = vcn.id
  response = vcn_client.create_internet_gateway(request)

  internet_gateway = response.data
  vcn_client.get_internet_gateway(internet_gateway.id) \
            .wait_until(:lifecycle_state,
                        OCI::Core::Models::InternetGateway::LIFECYCLE_STATE_AVAILABLE,
                        max_wait_seconds: 180)
  puts "Created Internet Gateway '#{internet_gateway.display_name}' [#{internet_gateway.id}]"
  internet_gateway
end

def update_route_table(vcn_client, internet_gateway, vcn)
  puts 'Updating route table...'
  route_rule = OCI::Core::Models::RouteRule.new
  route_rule.cidr_block = '0.0.0.0/0'
  route_rule.network_entity_id = internet_gateway.id

  request = OCI::Core::Models::UpdateRouteTableDetails.new
  request.route_rules = [route_rule]
  vcn_client.update_route_table(vcn.default_route_table_id, request)

  vcn_client.get_route_table(vcn.default_route_table_id) \
            .wait_until(:lifecycle_state,
                        OCI::Core::Models::RouteTable::LIFECYCLE_STATE_AVAILABLE,
                        max_wait_seconds: 180)
  puts "Updated route table '#{vcn.default_route_table_id}'"
end

def create_subnet(vcn_client, name, vcn, cidr_block, availability_domain, compartment_id)
  puts 'Creating subnet...'
  request = OCI::Core::Models::CreateSubnetDetails.new
  request.cidr_block = cidr_block
  request.availability_domain = availability_domain
  request.display_name = 'subnet_for_' + name
  request.compartment_id = compartment_id
  request.route_table_id = vcn.default_route_table_id
  request.vcn_id = vcn.id
  response = vcn_client.create_subnet(request)

  subnet = response.data
  vcn_client.get_subnet(subnet.id) \
            .wait_until(:lifecycle_state,
                        OCI::Core::Models::Subnet::LIFECYCLE_STATE_AVAILABLE,
                        max_wait_seconds: 180)
  puts "Created subnet '#{vcn.display_name}' [#{vcn.id}]"
  subnet
end

def launch_instance(compute_client,
                    name,
                    subnet,
                    availability_domain,
                    compartment_id,
                    image_id,
                    shape,
                    ssh_key,
                    user_data)
  puts 'Launching instance...'
  request = OCI::Core::Models::LaunchInstanceDetails.new
  request.availability_domain = availability_domain
  request.compartment_id = compartment_id
  request.display_name = name
  request.image_id = image_id
  request.shape = shape
  request.subnet_id = subnet.id
  request.metadata = { 'ssh_authorized_keys' => ssh_key, 'user_data' => user_data }
  launch_instance_response = compute_client.launch_instance(request)
  instance = launch_instance_response.data

  puts "Launched instance '#{instance.display_name}' [#{instance.id}]"
  print 'Waiting to reach running state.'
  $stdout.flush

  compute_client.get_instance(instance.id)
                .wait_until(:lifecycle_state,
                            OCI::Core::Models::Instance::LIFECYCLE_STATE_RUNNING) do |resp|

    lifecycle_state = resp.data.lifecycle_state
    if [OCI::Core::Models::Instance::LIFECYCLE_STATE_TERMINATED,
        OCI::Core::Models::Instance::LIFECYCLE_STATE_TERMINATING].include?(lifecycle_state)
      puts 'Instance failed to provision.'

      # :stop_fail can be used to throw a WaiterFailedError exception.
      # :stop_succeed will stop the waiter silently.
      throw :stop_succeed
    end

    print '.'
    $stdout.flush
  end

  puts ''
  puts "Instance '#{instance.display_name}' is now running."
end

vcn = create_vcn(vcn_client, name, cidr_block, compartment_id)
internet_gateway = create_internet_gateway(vcn_client, name, compartment_id, vcn)
update_route_table(vcn_client, internet_gateway, vcn)
subnet = create_subnet(vcn_client, name, vcn, cidr_block, availability_domain, compartment_id)

launch_instance(compute_client,
                name,
                subnet,
                availability_domain,
                compartment_id,
                image_id,
                shape,
                ssh_key,
                user_data)
