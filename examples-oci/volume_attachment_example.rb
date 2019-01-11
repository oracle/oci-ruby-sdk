# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# This example demonstrates how to attach volumes to an instance using different volume attachment
# types.
#
# This will use credentials and settings from the DEFAULT profile at ~/.oci/config (on windows
# "C:\Users\{user}\.oci\config"), however if that file does not exist we will automatically fall back to using
# ~/.oraclebmc/config (on windows "C:\Users\{user}\.oraclebmc\config")
#
# The script covers:
#
#   * How to do an iSCSI volume attachment
#   * How to do a paravirtualized volume attachment
#
# This script will create all the resources it requires:
#   * 2 volumes (using the default size of 50GB)
#   * A VCN and subnet
#   * An instance to attach the volume to. This instance will be running Oracle Linux 7.4 and have a shape of
#     VM.Standard.1.1
#
# The script will clean up these resources upon completion.
#
# Format:
#   volume_attachment_example.rb <compartment ID> <availability domain>
#
# Example run:
#   ruby examples/volume_attachment_example.rb 'ocid1.compartment.oc1..aaaaaaaac4xqx43texeuonfionxsx4okzfsya5evr2goe2t7v5wntztaymab' 'xxx:PHX-AD-1'

require 'oci'
require 'pp'

def create_vcn_and_subnet(virtual_network, compartment_id, availability_domain)
  vcn_name = 'ruby_sdk_vol_attach_example_vcn'
  cidr_block = '10.0.0.0/16'

  result = virtual_network.create_vcn(
    OCI::Core::Models::CreateVcnDetails.new(
      cidr_block: cidr_block,
      display_name: vcn_name,
      compartment_id: compartment_id
    )
  )
  get_vcn_response = virtual_network.get_vcn(result.data.id).wait_until(
    :lifecycle_state,
    OCI::Core::Models::Vcn::LIFECYCLE_STATE_AVAILABLE
  )
  vcn = get_vcn_response.data

  subnet_name = 'ruby_sdk_vol_attach_example_subnet'
  result = virtual_network.create_subnet(
    OCI::Core::Models::CreateSubnetDetails.new(
      compartment_id: compartment_id,
      availability_domain: availability_domain,
      display_name: subnet_name,
      vcn_id: vcn.id,
      cidr_block: cidr_block
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

  virtual_network.delete_subnet(subnet.id)
  virtual_network.get_subnet(subnet.id).wait_until(
    :lifecycle_state,
    OCI::Core::Models::Subnet::LIFECYCLE_STATE_TERMINATED,
    succeed_on_not_found: true
  )

  virtual_network.delete_vcn(vcn.id)
  virtual_network.get_vcn(vcn.id).wait_until(
    :lifecycle_state,
    OCI::Core::Models::Vcn::LIFECYCLE_STATE_TERMINATED,
    succeed_on_not_found: true
  )
end

def get_image(compute_client, compartment_id, operating_system, operating_system_version, target_shape)
  images = []
  compute_client.list_images(
    compartment_id,
    operating_system: operating_system,
    operating_system_version: operating_system_version
  ).each do |response|
    images += response.data
  end

  images.each do |image|
    compute_client.list_shapes(compartment_id, image_id: image.id).each do |response|
      response.data.each do |shape|
        return image if shape.shape == target_shape
      end
    end
  end

  raise 'No compatible image found for the target OS, version and shape'
end

def launch_instance(compute_client, compartment_id, vcn_and_subnet)
  subnet = vcn_and_subnet[:subnet]

  launch_instance_response = compute_client.launch_instance(
    OCI::Core::Models::LaunchInstanceDetails.new(
      availability_domain: subnet.availability_domain,
      compartment_id: subnet.compartment_id,
      image_id: get_image(compute_client, compartment_id, 'Oracle Linux', '7.4', 'VM.Standard1.1').id,
      shape: 'VM.Standard1.1',
      subnet_id: subnet.id,
      display_name: 'RubyVolAttachExampleInstance'
    )
  )

  get_instance_response =
    compute_client.get_instance(launch_instance_response.data.id)
                  .wait_until(:lifecycle_state, OCI::Core::Models::Instance::LIFECYCLE_STATE_RUNNING)

  get_instance_response.data
end

def terminate_instance(compute_client, instance)
  compute_client.terminate_instance(instance.id)

  compute_client.get_instance(instance.id)
                .wait_until(:lifecycle_state, OCI::Core::Models::Instance::LIFECYCLE_STATE_TERMINATED)
end

def create_volume(blockstorage_client, compartment_id, availability_domain, display_name)
  result = blockstorage_client.create_volume(
    OCI::Core::Models::CreateVolumeDetails.new(
      compartment_id: compartment_id,
      availability_domain: availability_domain,
      display_name: display_name
    )
  )
  get_volume_response =
    blockstorage_client.get_volume(result.data.id)
                       .wait_until(:lifecycle_state, OCI::Core::Models::Volume::LIFECYCLE_STATE_AVAILABLE)

  get_volume_response.data
end

def delete_volume(blockstorage_client, volume)
  blockstorage_client.delete_volume(volume.id)
  blockstorage_client.get_volume(volume.id)
                     .wait_until(:lifecycle_state, OCI::Core::Models::Volume::LIFECYCLE_STATE_TERMINATED)
end

def attach_volume(compute_client, attach_volume_details)
  result = compute_client.attach_volume(attach_volume_details)

  get_volume_attachment_response =
    compute_client.get_volume_attachment(result.data.id)
                  .wait_until(:lifecycle_state, OCI::Core::Models::VolumeAttachment::LIFECYCLE_STATE_ATTACHED)

  get_volume_attachment_response.data
end

def detach_volume(compute_client, volume_attachment)
  compute_client.detach_volume(volume_attachment.id)
  compute_client.get_volume_attachment(volume_attachment.id)
                .wait_until(:lifecycle_state, OCI::Core::Models::VolumeAttachment::LIFECYCLE_STATE_DETACHED)
end

compartment_id = ARGV[0]
availability_domain = ARGV[1]

blockstorage_client = OCI::Core::BlockstorageClient.new
compute_client = OCI::Core::ComputeClient.new
virtual_network_client = OCI::Core::VirtualNetworkClient.new

vcn_and_subnet = nil
instance = nil
volume_one = nil
volume_two = nil
begin
  vcn_and_subnet = create_vcn_and_subnet(virtual_network_client, compartment_id, availability_domain)
  puts 'Created VCN and subnet'

  instance = launch_instance(compute_client, compartment_id, vcn_and_subnet)
  puts 'Launched instance'

  volume_one = create_volume(blockstorage_client, compartment_id, availability_domain, 'VolAttachExample1')
  puts 'Created volume one'

  volume_two = create_volume(blockstorage_client, compartment_id, availability_domain, 'VolAttachExample2')
  puts 'Created volume two'

  # All volume attachments are done via the attach_volume operation on compute_client but we pass different objects to inform it what
  # type of volume attachment to do.
  #
  # These are all subclasses of OCI::Core::Models::AttachVolumeDetails
  #
  # Also, what we get returned will be subclasses of OCI::Core::Models::VolumeAttachment. Which subclass will depend on the type of
  # volume attachment that was performed
  iscsi_volume_attachment = attach_volume(
    compute_client,
    OCI::Core::Models::AttachIScsiVolumeDetails.new(
      display_name: 'iSCSIAttachment',
      volume_id: volume_one.id,
      instance_id: instance.id
    )
  )
  puts "iSCSI Volume Attachment: #{iscsi_volume_attachment}"
  puts
  puts

  paravirtualized_volume_attachment = attach_volume(
    compute_client,
    OCI::Core::Models::AttachParavirtualizedVolumeDetails.new(
      display_name: 'paravirtAttachment',
      volume_id: volume_two.id,
      instance_id: instance.id
    )
  )
  puts "Paravirtualized Volume Attachment: #{paravirtualized_volume_attachment}"
  puts
  puts

  # Listing volume attachments is a paginated operation, so we can call .each on the response to
  # iterate through all responses. We can also supply keyword argument filters - in
  # this case we are only interested in the volume attachments on our instance
  #
  # Note that each element is a different attachment_type, denoting the different types of volume attachments
  # there are.
  #
  # These are all subclasses of OCI::Core::Models::VolumeAttachment
  puts 'Listing volume attachments'
  puts '=' * 20
  compute_client.list_volume_attachments(
    compartment_id,
    instance_id: instance.id
  ).each do |response|
    response.data.each { |va| pp va }
  end
  puts
  puts

  detach_volume(compute_client, paravirtualized_volume_attachment)
  puts 'Detached paravirtualized volume attachment'
  puts

  detach_volume(compute_client, iscsi_volume_attachment)
  puts 'Detached iSCSI volume attachment'
ensure
  puts
  puts
  puts 'Cleanup'
  puts '=' * 20

  delete_volume(blockstorage_client, volume_one) unless volume_one.nil?
  puts 'Deleted volume one'

  delete_volume(blockstorage_client, volume_two) unless volume_two.nil?
  puts 'Deleted volume two'

  terminate_instance(compute_client, instance) unless instance.nil?
  puts 'Terminated instance'

  delete_vcn_and_subnet(virtual_network_client, vcn_and_subnet) unless vcn_and_subnet.nil?
  puts 'Deleted VCN and subnet'
end

puts 'Script finished'
