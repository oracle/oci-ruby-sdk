# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# Sample to demonstrate remote peering of two virtual cloud networks between two different regions within a single
# compartment.
#
# The sample relies on the correct IAM policies already being in place for a given compartment ID.
# For more information, please refer to the
# {https://docs.cloud.oracle.com/Content/Network/Tasks/remoteVCNpeering.htm Remote VCN Peering}
# documentation that is found on the Oracle Cloud Infrastructure developer portal.
#
# The order of operations and waiting for the appropriate states is important. Each VCN can be set up
# concurrently until the point where the connection is established. Deleting the connection and
# resources can not be performed concurrently until the remote peering connection has been revoked. This sample
# demonstrates the creation of resources on a single thread to more clearly demonstrate remote peering connections.
# It is also worth noting that each VCN utilizes a dynamic routing gateway. DRGs are a finite resource and may require
# contacting customer support if limits have been exceeded for a given tenancy.
#
# Format: remote_peering_connection_example.rb <compartment OCID> <CIDR Block in PHX> <CIDR Block in IAD>
#
# Example run:
#   ruby remote_peering_connection_example.rb 'ocid1.compartment.oc1..aaaaaaaac4xqx43texeuonfionxsx4okzfsya5evr2goe2t7v5wntztaymab' '10.5.0.0/16' '10.6.0.0/16'

require 'oci'
require 'time'

TIMESTAMP_SUFFIX = ((Time.now.to_f * 1000).to_i % 10_000)
MAX_WAIT_TIME_SECONDS = 600 # 10 minutes
SECTION_BREAK_LENGTH = 50 # 50 characters

compartment_id = ARGV[0] # Example: 'ocid1.compartment.oc1..aaaaaaaac4xqx43texeuonfionxsx4okzfsya5evr2goe2t7v5wntztaymab'
local_cidr_block = ARGV[1] # Example: '10.5.0.0/16'
peer_cidr_block = ARGV[2] # Example: '10.6.0.0/16'

local_vcn_client = OCI::Core::VirtualNetworkClient.new(region: OCI::Regions::REGION_US_PHOENIX_1)
peer_vcn_client = OCI::Core::VirtualNetworkClient.new(region: OCI::Regions::REGION_US_ASHBURN_1)

# ==============
# Create Methods

def create_vcn(vcn_client, region_short_name, compartment_id, cidr_block)
  puts "  Creating VCN in #{region_short_name}..."
  request = OCI::Core::Models::CreateVcnDetails.new(
    cidr_block: cidr_block,
    display_name: "VCN_#{region_short_name}_#{TIMESTAMP_SUFFIX}",
    compartment_id: compartment_id
  )
  response = vcn_client.create_vcn(request)

  vcn = vcn_client.get_vcn(response.data.id) \
                  .wait_until(:lifecycle_state,
                              OCI::Core::Models::Vcn::LIFECYCLE_STATE_AVAILABLE,
                              max_wait_seconds: MAX_WAIT_TIME_SECONDS) \
                  .data
  puts "    Created VCN '#{vcn.display_name}': #{vcn.id}"
  vcn
end

def create_drg(vcn_client, region_short_name, compartment_id)
  puts "  Creating DRG in #{region_short_name}..."
  request = OCI::Core::Models::CreateDrgDetails.new(
    compartment_id: compartment_id,
    display_name: "DRG_#{region_short_name}_#{TIMESTAMP_SUFFIX}"
  )
  response = vcn_client.create_drg(request)

  drg = vcn_client.get_drg(response.data.id) \
                  .wait_until(:lifecycle_state,
                              OCI::Core::Models::Drg::LIFECYCLE_STATE_AVAILABLE,
                              max_wait_seconds: MAX_WAIT_TIME_SECONDS) \
                  .data
  puts "    Created DRG '#{drg.display_name}': #{drg.id}"
  drg
end

def create_drg_attachment(vcn_client, region_short_name, vcn_id, drg_id)
  puts "  Creating DRG Attachment in #{region_short_name}..."
  request = OCI::Core::Models::CreateDrgAttachmentDetails.new(
    display_name: "DrgAttachment_#{region_short_name}_#{TIMESTAMP_SUFFIX}",
    vcn_id: vcn_id,
    drg_id: drg_id
  )
  response = vcn_client.create_drg_attachment(request)

  drg_attachment = vcn_client.get_drg_attachment(response.data.id) \
                             .wait_until(:lifecycle_state,
                                         OCI::Core::Models::DrgAttachment::LIFECYCLE_STATE_ATTACHED,
                                         max_wait_seconds: MAX_WAIT_TIME_SECONDS) \
                             .data
  puts "    Created DRG Attachment '#{drg_attachment.display_name}': #{drg_attachment.id}"
  drg_attachment
end

def create_remote_peering_connection(vcn_client, region_short_name, compartment_id, drg_id)
  puts "  Creating Remote Peering Connection in #{region_short_name}..."
  request = OCI::Core::Models::CreateRemotePeeringConnectionDetails.new(
    compartment_id: compartment_id,
    display_name: "RPC_#{region_short_name}_#{TIMESTAMP_SUFFIX}",
    drg_id: drg_id
  )
  response = vcn_client.create_remote_peering_connection(request)

  remote_peering_connection = vcn_client.get_remote_peering_connection(response.data.id) \
                                        .wait_until(:lifecycle_state,
                                                    OCI::Core::Models::RemotePeeringConnection::LIFECYCLE_STATE_AVAILABLE,
                                                    max_wait_seconds: MAX_WAIT_TIME_SECONDS) \
                                        .data
  puts "    Created Remote Peering Connection '#{remote_peering_connection.display_name}': #{remote_peering_connection.id}"
  remote_peering_connection
end

# =================
# Delete Operations

def delete_remote_peering_connection(vcn_client, region_short_name, remote_peering_connection)
  puts "  Deleting Remote Peering Connection in #{region_short_name}..."
  vcn_client.delete_remote_peering_connection(remote_peering_connection.id)

  begin
    vcn_client.get_remote_peering_connection(remote_peering_connection.id) \
              .wait_until(:lifecycle_state,
                          OCI::Core::Models::RemotePeeringConnection::LIFECYCLE_STATE_TERMINATED,
                          max_wait_seconds: MAX_WAIT_TIME_SECONDS)
  rescue OCI::Errors::ServiceError => e
    raise unless e.status_code == 404
  end
  puts "    Deleted Remote Peering Connection: #{remote_peering_connection.id}"
end

def delete_drg_attachment(vcn_client, region_short_name, drg_attachment)
  puts "  Deleting DRG Attachment in #{region_short_name}..."
  vcn_client.delete_drg_attachment(drg_attachment.id)

  begin
    vcn_client.get_drg_attachment(drg_attachment.id) \
              .wait_until(:lifecycle_state,
                          OCI::Core::Models::DrgAttachment::LIFECYCLE_STATE_DETACHED,
                          max_wait_seconds: MAX_WAIT_TIME_SECONDS)
  rescue OCI::Errors::ServiceError => e
    raise e unless e.status_code == 404
  end
  puts "    Deleted DRG Attachment: #{drg_attachment.id}"
end

def delete_drg(vcn_client, region_short_name, drg)
  puts "  Deleting DRG in #{region_short_name}..."
  vcn_client.delete_drg(drg.id)

  begin
    vcn_client.get_drg(drg.id) \
              .wait_until(:lifecycle_state,
                          OCI::Core::Models::Drg::LIFECYCLE_STATE_TERMINATED,
                          max_wait_seconds: MAX_WAIT_TIME_SECONDS)
  rescue OCI::Errors::ServiceError => e
    raise e unless e.status_code == 404
  end
  puts "    Deleted DRG: #{drg.id}"
end

def delete_vcn(vcn_client, region_short_name, vcn)
  puts "  Deleting VCN in #{region_short_name}..."
  vcn_client.delete_vcn(vcn.id)

  begin
    vcn_client.get_vcn(vcn.id) \
              .wait_until(:lifecycle_state,
                          OCI::Core::Models::Vcn::LIFECYCLE_STATE_TERMINATED,
                          max_wait_seconds: MAX_WAIT_TIME_SECONDS)
  rescue OCI::Errors::ServiceError => e
    raise e unless e.status_code == 404
  end
  puts "    Deleted VCN: #{vcn.id}"
end

puts 'Setting up local VCN in PHX'
puts '=' * SECTION_BREAK_LENGTH
local_vcn = create_vcn(local_vcn_client, 'PHX', compartment_id, local_cidr_block)
local_drg = create_drg(local_vcn_client, 'PHX', compartment_id)
local_drg_attachment = create_drg_attachment(local_vcn_client, 'PHX', local_vcn.id, local_drg.id)
local_remote_peering_connection = create_remote_peering_connection(local_vcn_client, 'PHX', compartment_id, local_drg.id)

puts
puts 'Setting up peer VCN in IAD'
puts '=' * SECTION_BREAK_LENGTH
peer_vcn = create_vcn(peer_vcn_client, 'IAD', compartment_id, peer_cidr_block)
peer_drg = create_drg(peer_vcn_client, 'IAD', compartment_id)
peer_drg_attachment = create_drg_attachment(peer_vcn_client, 'IAD', peer_vcn.id, peer_drg.id)
peer_remote_peering_connection = create_remote_peering_connection(peer_vcn_client, 'IAD', compartment_id, peer_drg.id)

puts
puts 'Establishing connection between PHX and IAD'
puts '=' * SECTION_BREAK_LENGTH
puts '  Creating connection...'
connection_request = OCI::Core::Models::ConnectRemotePeeringConnectionsDetails.new(
  peer_id: peer_remote_peering_connection.id, # The peer's remote peering connection ID in IAD
  peer_region_name: OCI::Regions::REGION_US_ASHBURN_1 # i.e., 'us-ashburn-1'
)
local_vcn_client.connect_remote_peering_connections(local_remote_peering_connection.id, connection_request)

# Wait until the peering status reflects as PEERED in both regions
local_vcn_client.get_remote_peering_connection(local_remote_peering_connection.id) \
                .wait_until(:peering_status,
                            OCI::Core::Models::RemotePeeringConnection::PEERING_STATUS_PEERED,
                            max_wait_seconds: MAX_WAIT_TIME_SECONDS)
peer_vcn_client.get_remote_peering_connection(peer_remote_peering_connection.id) \
               .wait_until(:peering_status,
                           OCI::Core::Models::RemotePeeringConnection::PEERING_STATUS_PEERED,
                           max_wait_seconds: MAX_WAIT_TIME_SECONDS)

puts '    Connection established'

puts
puts 'Cleaning Up'
puts '=' * SECTION_BREAK_LENGTH

# Delete the local connection to sever the remote peering connection
delete_remote_peering_connection(local_vcn_client, 'PHX', local_remote_peering_connection)

# It's important to wait for the peering status to reflect as REVOKED in both regions before
# proceeding with the clean up
peer_vcn_client.get_remote_peering_connection(peer_remote_peering_connection.id) \
               .wait_until(:peering_status,
                           OCI::Core::Models::RemotePeeringConnection::PEERING_STATUS_REVOKED,
                           max_wait_seconds: MAX_WAIT_TIME_SECONDS)
begin
  local_vcn_client.get_remote_peering_connection(local_remote_peering_connection.id) \
                  .wait_until(:peering_status,
                              OCI::Core::Models::RemotePeeringConnection::PEERING_STATUS_REVOKED,
                              max_wait_seconds: MAX_WAIT_TIME_SECONDS)
rescue OCI::Errors::ServiceError => e
  raise e unless e.status_code == 404
end

# Delete the rest of the VCN in IAD
delete_remote_peering_connection(peer_vcn_client, 'IAD', peer_remote_peering_connection)
delete_drg_attachment(peer_vcn_client, 'IAD', peer_drg_attachment)
delete_drg(peer_vcn_client, 'IAD', peer_drg)
delete_vcn(peer_vcn_client, 'IAD', peer_vcn)

# Delete the VCN in PHX
delete_drg_attachment(local_vcn_client, 'PHX', local_drg_attachment)
delete_drg(local_vcn_client, 'PHX', local_drg)
delete_vcn(local_vcn_client, 'PHX', local_vcn)

puts 'Script finished'
