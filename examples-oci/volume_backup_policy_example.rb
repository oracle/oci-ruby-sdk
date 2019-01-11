# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# This example demonstrates how to list and apply backup policies to an existing volume. Note that in order to list and
# apply backup policies you will need the appropriate level of access. See the section "Required IAM Policy" on this page:
# https://docs.cloud.oracle.com/Content/Block/Tasks/schedulingvolumebackups.htm for more information.
#
# This will use credentials and settings from the DEFAULT profile at ~/.oci/config (on windows
# "C:\Users\{user}\.oci\config"), however if that file does not exist we will automatically fall back to using
# ~/.oraclebmc/config (on windows "C:\Users\{user}\.oraclebmc\config")
#
# This example takes a single argument, which is the OCID of the volume which we'll apply the policy to.
#
# You can also specify a backup policy at volume create time by providing a backup policy ID. For example:
#
# result = block_storage.create_volume(
#     OCI::Core::Models::CreateVolumeDetails.new(
#         displayName: 'my_volume_with_a_policy',
#         sizeInGBs: 50,
#         availabilityDomain: availability_domain,
#         compartmentId: compartment_id,
#         backupPolicyId: volume_backup_policy.id
#     )
# )
#
# Format:
#   volume_backup_policy_example.rb <volume OCID>
#
# Example run:
#   ruby volume_backup_policy_example.rb 'ocid1...'

require 'oci'
require 'pp'

volume_id = ARGV[0]
block_storage_client = OCI::Core::BlockstorageClient.new

# Backup policies are a paginated call, so we can use the functions in the oci.pagination module to get all available policies
volume_backup_policies = []
block_storage_client.list_volume_backup_policies.each do |response|
  volume_backup_policies += response.data
end
puts 'Available policies'
puts '=' * 20
pp volume_backup_policies

# We can retrieve a specific policy
volume_backup_policy = block_storage_client.get_volume_backup_policy(volume_backup_policies[0].id).data
puts 'Selected policy'
puts '=' * 20
pp volume_backup_policy

# We can assign a policy to a volume
create_response = block_storage_client.create_volume_backup_policy_assignment(
  OCI::Core::Models::CreateVolumeBackupPolicyAssignmentDetails.new(
    assetId: volume_id,
    policyId: volume_backup_policy.id
  )
)
puts 'Assigned policy to volume'
puts '=' * 20
pp create_response.data

# We can interrogate whether an asset (a volume in this case) has a policy applied
get_policy_asset_assignment = block_storage_client.get_volume_backup_policy_asset_assignment(volume_id)
puts 'Policy asset assignment'
puts '=' * 20
pp get_policy_asset_assignment.data

# We can remove a policy from an asset using the ID of the record which represents the assignment of the policy to the asset
block_storage_client.delete_volume_backup_policy_assignment(get_policy_asset_assignment.data[0].id)
puts 'Removed policy'

# And now the asset reports it has no policies on it
get_policy_asset_assignment = block_storage_client.get_volume_backup_policy_asset_assignment(volume_id)
puts 'Policy asset assignment'
puts '=' * 20
pp get_policy_asset_assignment.data
