# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# This script provides a basic example of how to use the File Storage service in the Ruby SDK.
#
# This will use credentials and settings from the DEFAULT profile at ~/.oci/config (on windows
# "C:\Users\{user}\.oci\config"), however if that file does not exist we will automatically fall back to using
# ~/.oraclebmc/config (on windows "C:\Users\{user}\.oraclebmc\config")
#
# The script will demonstrate:
#
#     * Creating a new file system
#     * Creating a mount target via which the file system can be accessed. The mount target and file system must
#       be in the same availability domain in order to export the file system from the mount target
#     * Creating an export so that we can mount the file system (see
#       https://docs.cloud.oracle.com/Content/File/Tasks/mountingfilesystems.htm for more information)
#     * Creating a snapshot of the file system
#
# In order to demonstrate functionality for mount targets and export sets, this script will also create a VCN
# and subnet. These will be deleted at the end of the script.
#
#
# Format:
#   file_storage_service_example.rb <compartment ID> <availability domain>
#
# Example run:
#   ruby examples/file_storage_service_example.rb 'ocid1.compartment.oc1..aaaaaaaac4xqx43texeuonfionxsx4okzfsya5evr2goe2t7v5wntztaymab' 'xxx:PHX-AD-1'

require 'oci'
require 'pp'
require 'securerandom'

def create_vcn_and_subnet(virtual_network, compartment_id, availability_domain)
  vcn_name = 'ruby_sdk_fs_example_vcn'
  cidr_block = '10.0.0.0/16'
  vcn_dns_label = 'rubysdkfs'

  result = virtual_network.create_vcn(
    OCI::Core::Models::CreateVcnDetails.new(
      cidrBlock: cidr_block,
      displayName: vcn_name,
      compartmentId: compartment_id,
      dnsLabel: vcn_dns_label
    )
  )
  get_vcn_response = virtual_network.get_vcn(result.data.id).wait_until(
    :lifecycle_state,
    OCI::Core::Models::Vcn::LIFECYCLE_STATE_AVAILABLE
  )
  vcn = get_vcn_response.data

  subnet_name = 'ruby_sdk_fs_example_subnet'
  subnet_dns_label = 'rbfssub'
  result = virtual_network.create_subnet(
    OCI::Core::Models::CreateSubnetDetails.new(
      compartmentId: compartment_id,
      availabilityDomain: availability_domain,
      displayName: subnet_name,
      vcnId: vcn.id,
      cidrBlock: cidr_block,
      dnsLabel: subnet_dns_label
    )
  )
  get_subnet_response = virtual_network.get_subnet(result.data.id).wait_until(
    :lifecycle_state,
    OCI::Core::Models::Subnet::LIFECYCLE_STATE_AVAILABLE
  )
  subnet = get_subnet_response.data

  { vcn: vcn, subnet: subnet }
end

def delete_vcn_and_subnet(virtual_network, vcn_and_subnet)
  vcn = vcn_and_subnet[:vcn]
  subnet = vcn_and_subnet[:subnet]

  # Sometimes we can't delete the subnet straight after a mount target has been deleted as network resources
  # still need to clear. If we get a conflict, try a few times before bailing out.
  5.times do |attempt|
    begin
      virtual_network.delete_subnet(subnet.id)
      virtual_network.get_subnet(subnet.id).wait_until(
        :lifecycle_state,
        OCI::Core::Models::Subnet::LIFECYCLE_STATE_TERMINATED,
        succeed_on_not_found: true
      )
      break
    rescue OCI::Errors::ServiceError => e
      raise unless e.status_code == 409 && attempt < 4

      sleep(5)
    end
  end

  virtual_network.delete_vcn(vcn.id)
  virtual_network.get_vcn(vcn.id).wait_until(
    :lifecycle_state,
    OCI::Core::Models::Vcn::LIFECYCLE_STATE_TERMINATED,
    succeed_on_not_found: true
  )
end

compartment_id = ARGV[0]
availability_domain = ARGV[1]

file_storage_client = OCI::FileStorage::FileStorageClient.new
virtual_network_client = OCI::Core::VirtualNetworkClient.new

# Here we create a file system. We recommend using a retry token on these requests
# so that if you receive a timeout or server error and need to retry the request you won't run the risk of
# creating multiple resources.
#
# Gives us a 32 length string by default. In production code, you may want to have a different way to generate the
# retry tokens. Retry tokens should uniquely identify the request
create_file_storage_retry_token = SecureRandom.hex
create_response = file_storage_client.create_file_system(
  OCI::FileStorage::Models::CreateFileSystemDetails.new(
    availabilityDomain: availability_domain,
    compartmentId: compartment_id,
    displayName: 'ruby_sdk_example_fs'
  ),
  opc_retry_token: create_file_storage_retry_token
)

puts 'Created File System'
puts '=' * 20
pp create_response.data
puts

# A file system has a lifecycle state, we should wait until it is active. Note that wait_until returns a response, so
# to access the model object we use the .data attribute.
get_file_system_response =
  file_storage_client.get_file_system(create_response.data.id)
                     .wait_until(
                       :lifecycle_state,
                       OCI::FileStorage::Models::FileSystem::LIFECYCLE_STATE_ACTIVE
                     )
file_system = get_file_system_response.data

puts 'File System after waiting'
puts '=' * 20
pp file_system
puts

# If we try and send through the same request to create the file system with the same retry token then this will not create a
# new resource. Instead, the create response will contain the same resource which has already been created
create_response = file_storage_client.create_file_system(
  OCI::FileStorage::Models::CreateFileSystemDetails.new(
    availabilityDomain: availability_domain,
    compartmentId: compartment_id,
    displayName: 'ruby_sdk_example_fs'
  ),
  opc_retry_token: create_file_storage_retry_token
)

puts 'Created File System with same request and retry token'
puts '=' * 20
pp create_response.data
puts "Same resource returned? #{file_system.id == create_response.data.id}"
puts

# We can update the display name of the file system.
update_response = file_storage_client.update_file_system(
  file_system.id,
  OCI::FileStorage::Models::UpdateFileSystemDetails.new(displayName: 'updated_rb_sdk_example_fs')
)
puts 'Updated File System'
puts '=' * 20
print update_response.data
puts

# Listing file systems is a paginated operation, so we can use .each to iterate over responses.
puts 'Listing File Systems'
puts '=' * 20
file_storage_client.list_file_systems(compartment_id, availability_domain).each do |response|
  response.data.each { |r| pp r }
end
puts

# To create a mount target, first we need a VCN and subnet
vcn_and_subnet = create_vcn_and_subnet(virtual_network_client, compartment_id, availability_domain)
mount_target_name = 'rbsdk_example_mt'
subnet = vcn_and_subnet[:subnet]

# We recommend using a retry token on these requests so that if you receive a timeout or server error
# and need to retry the request you won't run the risk of creating multiple resources.
#
# Some other items to note about mount target creation:
#   - This creates a mount target WITHOUT specifying a hostname. This means that the mount target will only be accessible
#     via its private IP address. A hostname can be specified by using the "hostname" attribute of CreateMountTargetDetails
#   - A private IP address can be specified by using the "ip_address" attribute of CreateMountTargetDetails. If no explicit
#     private IP address is specified then one will be selected from the available pool of free private IPs in the subnet. If
#     a private IP address is specified, then it must not already be used
create_mount_target_retry_token = SecureRandom.hex
create_response = file_storage_client.create_mount_target(
  OCI::FileStorage::Models::CreateMountTargetDetails.new(
    availabilityDomain: subnet.availability_domain,
    subnetId: subnet.id,
    compartmentId: compartment_id,
    displayName: mount_target_name
  ),
  opc_retry_token: create_mount_target_retry_token
)

# A mount target also has a lifecycle state, so wait until it is active. Note that wait_until returns a response, so
# to access the model object we use the .data attribute.
get_mount_target_response =
  file_storage_client.get_mount_target(create_response.data.id)
                     .wait_until(
                       :lifecycle_state,
                       OCI::FileStorage::Models::MountTarget::LIFECYCLE_STATE_ACTIVE
                     )
mount_target = get_mount_target_response.data

puts 'Created Mount Target'
puts '=' * 20
pp mount_target
puts

# If we try and send through the same request to create the mount target with the same retry token then this will not create a
# new resource. Instead, the create response will contain the same resource which has already been created
create_response = file_storage_client.create_mount_target(
  OCI::FileStorage::Models::CreateMountTargetDetails.new(
    availabilityDomain: subnet.availability_domain,
    subnetId: subnet.id,
    compartmentId: compartment_id,
    displayName: mount_target_name
  ),
  opc_retry_token: create_mount_target_retry_token
)

puts 'Created mount target with same request and retry token'
puts '=' * 20
pp create_response.data
puts "Same resource returned? #{mount_target.id == create_response.data.id}"
puts

# Note that the MountTarget contains an array of private IP OCIDs. In order to get the
# IP address of the MountTarget, we can use VirtualNetworkClient's get_private_ip function
mount_target_private_ip_id = mount_target.private_ip_ids[0]
get_private_ip_response = virtual_network_client.get_private_ip(mount_target_private_ip_id)
puts 'Mount target private IP'
puts '=' * 20
puts get_private_ip_response.data.ip_address
puts

# Listing mount targets is a paginated operation, so we can use .each to iterate over responses.
puts 'Listing Mount Targets'
puts '=' * 20
file_storage_client.list_mount_targets(compartment_id, availability_domain).each do |response|
  response.data.each { |r| pp r }
end
puts

# A mount target contains an export set, which we can use to link the mount target to the file system. We do this
# by creating an export that links the export set and the file system. Once we have an export, we can access the
# file system via the mount target and the file system can be mounted on, say, a compute instance.
#
# For more information on mounting file systems see:
# https://docs.cloud.oracle.com/Content/File/Tasks/mountingfilesystems.htm
create_export_retry_token = SecureRandom.hex
create_response = file_storage_client.create_export(
  OCI::FileStorage::Models::CreateExportDetails.new(
    exportSetId: mount_target.export_set_id,
    fileSystemId: file_system.id,
    path: '/files'
  ),
  opc_retry_token: create_export_retry_token
)

# We can list exports. This operation also takes optional filters so we can narrow this list down by file system
# or export set (mount target).
puts 'All exports by file system'
puts '=' * 20
file_storage_client.list_exports(compartment_id, file_system_id: file_system.id).each do |response|
  response.data.each { |r| pp r }
end
puts

puts 'All exports by export set'
puts '=' * 20
file_storage_client.list_exports(compartment_id, export_set_id: mount_target.export_set_id).each do |response|
  response.data.each { |r| pp r }
end
puts

# Exports have a lifecycle state, so we can wait on it to become available. Also, if we no longer need an export
# then we can delete it.
get_export_response =
  file_storage_client.get_export(create_response.data.id)
                     .wait_until(:lifecycle_state, OCI::FileStorage::Models::Export::LIFECYCLE_STATE_ACTIVE)
export = get_export_response.data

# If we try and send through the same request to create the export with the same retry token then this will not create a
# new resource. Instead, the create response will contain the same resource which has already been created
create_response = file_storage_client.create_export(
  OCI::FileStorage::Models::CreateExportDetails.new(
    exportSetId: mount_target.export_set_id,
    fileSystemId: file_system.id,
    path: '/files'
  ),
  opc_retry_token: create_export_retry_token
)
puts 'Created export with same request and retry token'
puts '=' * 20
pp create_response.data
puts "Same resource returned? #{export.id == create_response.data.id}"
puts

# We can view the information on an export set for the mount target
get_export_set_response = file_storage_client.get_export_set(mount_target.export_set_id)
puts 'Export set on mount target'
puts '=' * 20
pp get_export_set_response.data
puts

# We can create a point-in-time snapshot of a file system. Note that the name of the snapshot is immutable and needs to be
# unique amongst all non-DELETED snapshots of a file system .We recommend using a retry token on these requests so that
# if you receive a timeout or server error and need to retry the request you won't run the risk of creating multiple resources.
create_snapshot_retry_token = SecureRandom.hex
create_response = file_storage_client.create_snapshot(
  OCI::FileStorage::Models::CreateSnapshotDetails.new(
    fileSystemId: file_system.id,
    name: 'exampleSnapshot'
  ),
  opc_retry_token: create_snapshot_retry_token
)

# Snapshots have a lifecycle state, so we can wait on it to become available
get_snapshot_response =
  file_storage_client.get_snapshot(create_response.data.id)
                     .wait_until(
                       :lifecycle_state,
                       OCI::FileStorage::Models::Snapshot::LIFECYCLE_STATE_ACTIVE
                     )
snapshot = get_snapshot_response.data
puts 'Created Snapshot'
puts '=' * 20
pp snapshot
puts

# We can list all the snapshots of a file system
puts 'All snapshots in file system'
puts '=' * 20
file_storage_client.list_snapshots(file_system.id).each do |response|
  response.data.each { |r| pp r }
end
puts

# If we try and send through the same request to create the snapshot with the same retry token then this will not create a
# new resource. Instead, the create response will contain the same resource which has already been created
create_response = file_storage_client.create_snapshot(
  OCI::FileStorage::Models::CreateSnapshotDetails.new(
    fileSystemId: file_system.id,
    name: 'exampleSnapshot'
  ),
  opc_retry_token: create_snapshot_retry_token
)
puts 'Created snapshot with same request and retry token'
puts '=' * 20
pp create_response.data
puts "Same resource returned? #{snapshot.id == create_response.data.id}"
puts

# We can delete a snapshot and wait for it to be gone. Since we have a previous get response,
# we can use it to wait_until the snapshot has been deleted. If not, we need to call
# file_storage_client.get_snapshot in order to obtain a response to wait on. It is recommended
# that this be done BEFORE the delete is issued in case the call to GET after DELETE returns
# a 404 (i.e. the resource may already be gone after the delete is issued)
#
# We set succeed_on_not_found on the waiter so that if the waiter receives a 404 back
# from the service it considers this as a successful delete.
#
# A similar pattern to this is used for exports and mount targets
file_storage_client.delete_snapshot(snapshot.id)
get_snapshot_response.wait_until(
  :lifecycle_state,
  OCI::FileStorage::Models::Snapshot::LIFECYCLE_STATE_DELETED,
  succeed_on_not_found: true
)
puts 'Deleted Snapshot'

file_storage_client.delete_export(export.id)
get_export_response.wait_until(
  :lifecycle_state,
  OCI::FileStorage::Models::Export::LIFECYCLE_STATE_DELETED,
  succeed_on_not_found: true
)
puts 'Deleted Export'

get_mount_target_response = file_storage_client.get_mount_target(mount_target.id)
file_storage_client.delete_mount_target(mount_target.id)
get_mount_target_response.wait_until(
  :lifecycle_state,
  OCI::FileStorage::Models::MountTarget::LIFECYCLE_STATE_DELETED,
  succeed_on_not_found: true
)
puts 'Deleted Mount Target'

# Delete the file system and wait for it to be gone.
file_storage_client.delete_file_system(file_system.id)
file_storage_client.get_file_system(file_system.id)
                   .wait_until(
                     :lifecycle_state,
                     OCI::FileStorage::Models::FileSystem::LIFECYCLE_STATE_DELETED,
                     succeed_on_not_found: true
                   )
puts 'Deleted File System'

delete_vcn_and_subnet(virtual_network_client, vcn_and_subnet)
puts 'Deleted VCN and Subnet'
puts 'Script Finished'
