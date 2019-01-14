# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# This example demonstrates how to programatically create, update, and delete a Container Engine cluster.
# As-is, it is not a fully functional for container deployments without specific configuration
# that is tailored to your use case. For more information please refer to
# {https://docs.cloud.oracle.com/Content/ContEng/Concepts/contengoverview.htm Overview of Container Engine
# for Kubernetes} documentation that is found on the Oracle Cloud Infrastructure developer portal.
#
# Format: container_engine_cluster_example.rb <compartment OCID>
#
# Example run:
#   ruby container_engine_cluster_example.rb 'ocid1.compartment.oc1..aaaaaaaac4xqx43texeuonfionxsx4okzfsya5evr2goe2t7v5wntztaymab'

require 'oci'
require 'time'

SECTION_BREAK_LENGTH = 50 # 50 characters
KUBERNETES_VERSION = 'v1.11.5'.freeze
NODE_IMAGE_NAME = 'Oracle-Linux-7.5'.freeze
NODE_SHAPE = 'VM.Standard2.1'.freeze

compartment_id = ARGV[0] # Example: 'ocid1.compartment.oc1..aaaaaaaac4xqx43texeuonfionxsx4okzfsya5evr2goe2t7v5wntztaymab'
vcn_cidr_block = '10.0.0.0/16'
cluster_lb_cidr_blocks = %w[10.0.20.0/24 10.0.21.0/24]
node_pool_cidr_blocks = %w[10.0.22.0/24 10.0.23.0/24]

def new_timestamp_suffix
  ((Time.now.to_f * 1000).to_i % 10_000)
end

def get_availability_domains(compartment_id)
  OCI::Identity::IdentityClient.new.list_availability_domains(compartment_id).data
end

# ==============
# Create Methods

def create_vcn(vcn_client_composite, compartment_id, cidr_block)
  puts '  Creating VCN...'

  response = vcn_client_composite.create_vcn_and_wait_for_state(
    OCI::Core::Models::CreateVcnDetails.new(
      cidr_block: cidr_block,
      display_name: 'VCN_ContainerEngine_' + new_timestamp_suffix.to_s,
      compartment_id: compartment_id
    ),
    [OCI::Core::Models::Vcn::LIFECYCLE_STATE_AVAILABLE]
  )

  vcn = response.data
  puts "    Created VCN '#{vcn.display_name}': #{vcn.id}"
  vcn
end

def create_subnet(vcn_client_composite, compartment_id, vcn_id, availability_domain, cidr_block)
  puts '  Creating Subnet...'

  response = vcn_client_composite.create_subnet_and_wait_for_state(
    OCI::Core::Models::CreateSubnetDetails.new(
      compartmentId: compartment_id,
      availabilityDomain: availability_domain,
      displayName: 'Subnet_ContainerEngine_' + new_timestamp_suffix.to_s,
      vcnId: vcn_id,
      cidrBlock: cidr_block
    ),
    [OCI::Core::Models::Subnet::LIFECYCLE_STATE_AVAILABLE]
  )

  subnet = response.data
  puts "    Created Subnet '#{subnet.display_name}' in AD: '#{availability_domain}': #{subnet.id}"
  subnet
end

def create_cluster(ce_client, ce_client_composite, compartment_id, vcn_id, lb_subnet_ids)
  puts '  Creating Cluster...'

  response = ce_client_composite.create_cluster_and_wait_for_state(
    OCI::ContainerEngine::Models::CreateClusterDetails.new(
      name: 'Example_Cluster_' + new_timestamp_suffix.to_s,
      compartment_id: compartment_id,
      vcn_id: vcn_id,
      kubernetes_version: KUBERNETES_VERSION,
      options: OCI::ContainerEngine::Models::ClusterCreateOptions.new(
        service_lb_subnet_ids: lb_subnet_ids
      )
    )
  )

  cluster = ce_client.get_cluster(response.data.resources[0].identifier).data
  puts "    Created Cluster '#{cluster.name}': #{cluster.id}"
  cluster
end

def create_node_pool(ce_client, ce_client_composite, compartment_id, cluster_id, node_pool_subnet_ids)
  puts '  Creating Node Pool...'

  response = ce_client_composite.create_node_pool_and_wait_for_state(
    OCI::ContainerEngine::Models::CreateNodePoolDetails.new(
      compartment_id: compartment_id,
      cluster_id: cluster_id,
      name: 'Example_Node_Pool_' + new_timestamp_suffix.to_s,
      kubernetes_version: KUBERNETES_VERSION,
      subnet_ids: node_pool_subnet_ids,
      quantity_per_subnet: 1,
      node_image_name: NODE_IMAGE_NAME,
      node_shape: NODE_SHAPE
    )
  )

  node_pool = ce_client.get_node_pool(response.data.resources[0].identifier).data
  puts "    Created Node Pool '#{node_pool.name}': #{node_pool.id}"
  node_pool
end

def create_kubeconfig(ce_client, cluster_id)
  puts '  Creating Kubeconfig...'

  response = ce_client.create_kubeconfig(cluster_id)

  kubeconfig = response.data
  puts kubeconfig
  puts "    Created Kubeconfig from cluster with id #{cluster_id}"
  kubeconfig
end

# ==============
# Update Methods

def update_cluster(ce_client, ce_client_composite, cluster_id)
  puts '  Updating Cluster...'

  ce_client_composite.update_cluster_and_wait_for_state(
    cluster_id,
    OCI::ContainerEngine::Models::UpdateClusterDetails.new(
      name: 'Example_Cluster_Up' + new_timestamp_suffix.to_s
    )
  )

  cluster = ce_client.get_cluster(cluster_id).data
  puts "    Updated Cluster '#{cluster.name}': #{cluster.id}"
  cluster
end

def update_node_pool(ce_client, ce_client_composite, node_pool_id)
  puts '  Updating Node Pool...'

  ce_client_composite.update_node_pool_and_wait_for_state(
    node_pool_id,
    OCI::ContainerEngine::Models::UpdateNodePoolDetails.new(
      name: 'Example_Node_Pool_Up' + new_timestamp_suffix.to_s
    )
  )

  node_pool = ce_client.get_node_pool(node_pool_id).data
  puts "    Updated Node Pool '#{node_pool.name}': #{node_pool.id}"
  node_pool
end

# ==============
# Delete Methods

def delete_node_pool(ce_client_composite, node_pool)
  puts "  Deleting Node Pool '#{node_pool.name}': #{node_pool.id}..."

  ce_client_composite.delete_node_pool_and_wait_for_state(node_pool.id)

  puts "    Deleted Node Pool '#{node_pool.name}': #{node_pool.id}"
end

def delete_cluster(ce_client_composite, cluster)
  puts "  Deleting Cluster '#{cluster.name}': #{cluster.id}..."

  ce_client_composite.delete_cluster_and_wait_for_state(cluster.id)

  puts "    Deleted Cluster '#{cluster.name}': #{cluster.id}"
end

def delete_subnet(vcn_client_composite, subnet)
  puts "  Deleting Subnet '#{subnet.display_name}': #{subnet.id}..."
  vcn_client_composite.delete_subnet_and_wait_for_state(
    subnet.id,
    [OCI::Core::Models::Subnet::LIFECYCLE_STATE_TERMINATED]
  )
  puts "    Deleted Subnet '#{subnet.display_name}': #{subnet.id}"
end

def delete_vcn(vcn_client_composite, vcn)
  puts "  Deleting VCN '#{vcn.display_name}': #{vcn.id}..."
  vcn_client_composite.delete_vcn_and_wait_for_state(
    vcn.id,
    [OCI::Core::Models::Vcn::LIFECYCLE_STATE_TERMINATED]
  )
  puts "    Deleted VCN '#{vcn.display_name}': #{vcn.id}"
end

vcn_client_composite = OCI::Core::VirtualNetworkClientCompositeOperations.new(
  OCI::Core::VirtualNetworkClient.new
)
ce_client = OCI::ContainerEngine::ContainerEngineClient.new
ce_client_composite = OCI::ContainerEngine::ContainerEngineClientCompositeOperations.new(ce_client)

puts 'Setting up VCN'
puts '=' * SECTION_BREAK_LENGTH
vcn = create_vcn(vcn_client_composite, compartment_id, vcn_cidr_block)

puts
puts 'Setting up Subnets for the Load Balancer'
puts '=' * SECTION_BREAK_LENGTH
availability_domains = get_availability_domains(compartment_id)
cluster_lb_subnets = []
cluster_lb_cidr_blocks.each_with_index do |cidr_block, idx|
  subnet = create_subnet(vcn_client_composite, compartment_id, vcn.id, availability_domains[idx].name, cidr_block)
  cluster_lb_subnets.push(subnet)
end
cluster_lb_subnet_ids = cluster_lb_subnets.map(&:id)

puts
puts 'Setting up Subnets for the Node Pool'
puts '=' * SECTION_BREAK_LENGTH
node_pool_subnets = []
node_pool_cidr_blocks.each_with_index do |cidr_block, idx|
  subnet = create_subnet(vcn_client_composite, compartment_id, vcn.id, availability_domains[idx].name, cidr_block)
  node_pool_subnets.push(subnet)
end
node_pool_subnet_ids = node_pool_subnets.map(&:id)

puts
puts 'Creating Cluster'
puts '=' * SECTION_BREAK_LENGTH
cluster = create_cluster(ce_client, ce_client_composite, compartment_id, vcn.id, cluster_lb_subnet_ids)

puts
puts 'Creating Node Pool'
puts '=' * SECTION_BREAK_LENGTH
node_pool = create_node_pool(ce_client, ce_client_composite, compartment_id, cluster.id, node_pool_subnet_ids)
puts 'Cluster created'

puts
puts 'Updating Cluster'
puts '=' * SECTION_BREAK_LENGTH
cluster = update_cluster(ce_client, ce_client_composite, cluster.id)

puts
puts 'Updating Node Pool'
puts '=' * SECTION_BREAK_LENGTH
node_pool = update_node_pool(ce_client, ce_client_composite, node_pool.id)

puts
puts 'Creating Kubeconfig YAML'
puts '=' * SECTION_BREAK_LENGTH
create_kubeconfig(ce_client, cluster.id)

puts
puts 'Cleaning Up'
puts '=' * SECTION_BREAK_LENGTH
delete_node_pool(ce_client_composite, node_pool)
delete_cluster(ce_client_composite, cluster)
cluster_lb_subnets.each { |subnet| delete_subnet(vcn_client_composite, subnet) }
node_pool_subnets.each { |subnet| delete_subnet(vcn_client_composite, subnet) }
delete_vcn(vcn_client_composite, vcn)
