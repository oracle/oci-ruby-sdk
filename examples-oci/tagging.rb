# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# This script provides an example on how to use tagging in the Ruby SDK to manage tags and tag namespaces, as
# well as how to apply freeform and defined tags to a resource.
#
# This will use credentials and settings from the DEFAULT profile at ~/.oci/config (on windows
# "C:\Users\{user}\.oci\config"), however if that file does not exist we will automatically fall back to using
# ~/.oraclebmc/config (on windows "C:\Users\{user}\.oraclebmc\config")
#
# Format:
#   tagging.rb <compartmend ID> <tag namespace name> <tag1 name> <tag2 name>
#
# Example run:
#   ruby examples/tagging.rb 'ocid1.compartment.oc1..aaaaaaaac4xqx43texeuonfionxsx4okzfsya5evr2goe2t7v5wntztaymab' 'my_namespace' 'my_tag1' 'my_tag2'

require 'oci'
require 'pp'

compartment_id = ARGV[0]
tag_namespace_name = ARGV[1]
tag_one_name = ARGV[2]
tag_two_name = ARGV[3]

def create_or_activate_namespace(identity_client, compartment_id, tag_namespace_name)
  # List all the tags namespaces and find a match (tag namespaces must be unique in the tenancy). The .each
  # here will automatically fetch responses/data from the service when needed (until there is nothing
  # more to fetch)
  tag_namespace = nil
  identity_client.list_tag_namespaces(compartment_id).each do |list_namespace_response|
    tag_namespace = list_namespace_response.data.find { |ns| ns.name == tag_namespace_name }
    break unless tag_namespace.nil?
  end

  # If we found the namespace, make sure it's active. Otherwise, create a new namespace
  if tag_namespace
    puts "Found tag namespace #{tag_namespace_name}. Ensuring that the namespace is active"
    update_namespace_details = OCI::Identity::Models::UpdateTagNamespaceDetails.new
    update_namespace_details.is_retired = false

    update_namespace_response = identity_client.update_tag_namespace(
      tag_namespace.id,
      update_namespace_details
    )

    update_namespace_response.data
  else
    puts "Could not find tag namespace #{tag_namespace_name}. Creating namespace"
    create_namespace_response = identity_client.create_tag_namespace(
      OCI::Identity::Models::CreateTagNamespaceDetails.new(
        compartment_id: compartment_id,
        name: tag_namespace_name,
        description: 'Ruby SDK example script tag namespace'
      )
    )

    create_namespace_response.data
  end
end

def create_or_activate_tag(identity_client, tag_namespace_id, tag_name)
  # List all the tags and try and find a match (tag names must be unique in the namespace). The .each
  # here will automatically fetch responses/data from the service when needed (until there is nothing
  # more to fetch)
  tag = nil
  identity_client.list_tags(tag_namespace_id).each do |list_tag_response|
    tag = list_tag_response.data.find { |t| t.name == tag_name }
    break unless tag.nil?
  end

  # If we found the tag, make sure it's active. Otherwise, create a new tag
  if tag
    puts "Found tag #{tag_name}. Ensuring that the tag is active"
    update_tag_details = OCI::Identity::Models::UpdateTagDetails.new
    update_tag_details.is_retired = false

    update_tag_response = identity_client.update_tag(
      tag_namespace_id,
      tag_name,
      update_tag_details
    )

    update_tag_response.data
  else
    puts "Could not find tag #{tag_name}. Creating tag"
    create_tag_response = identity_client.create_tag(
      tag_namespace_id,
      OCI::Identity::Models::CreateTagDetails.new(
        name: tag_name,
        description: 'Ruby SDK example script tag'
      )
    )

    create_tag_response.data
  end
end

identity_client = OCI::Identity::IdentityClient.new
virtual_network_client = OCI::Core::VirtualNetworkClient.new

tag_namespace = create_or_activate_namespace(identity_client, compartment_id, tag_namespace_name)
pp tag_namespace
puts '********************************************'

tag_one = create_or_activate_tag(identity_client, tag_namespace.id, tag_one_name)
pp tag_one
puts '********************************************'

tag_two = create_or_activate_tag(identity_client, tag_namespace.id, tag_two_name)
pp tag_two
puts '********************************************'

vcn_id = nil

# We can assign freeform and defined tags at creation time. Freeform tags are a hash where the key (a string) is the tag
# name and the value (a string) is the value to assign to the tag.
#
# Defined tags are a hash where the key is the tag namespace (string) and the value is another hash. In
# this second hash, the key is the tag name (string) and the value is the tag value (currently a string value).
# The tag names have to correspond to the name of a tag within the specified namespace (and the namespace must exist).
#
# Resources where we can create/update tags will have the freeform_tags and defined_tags attributes. Consult the API
# documentation to see what these are (https://oracle-cloud-infrastructure-python-sdk.readthedocs.io/en/latest/api/index.html)
3.times do |attempt|
  # You may get a 404 if you create/reactivate a tag and try and use it straight away. If you have a delay/sleep between
  # creating the tag and then using it (or alternatively retry the 404) that may resolve the issue.
  begin
    create_vcn_response = virtual_network_client.create_vcn(
      OCI::Core::Models::CreateVcnDetails.new(
        cidr_block: '10.0.0.0/16',
        compartment_id: compartment_id,
        display_name: 'Ruby SDK tagging example VCN',
        dns_label: "vcn#{Random.rand(1_000_000)}",
        # We can also use symbols as the tag keys in the hash when creating/updating tags. However, tag keys
        # will be returned from the service as strings and these will not be symbolized in the SDK (we can see
        # this when we print out the response from creating the VCN)
        freeform_tags: { 'free' => 'form', bat: 'some extra value' },
        defined_tags: { tag_namespace_name => { tag_one_name => 'tagOneValue', tag_two_name => "tag 2's value" } }
      )
    )
    vcn_id = create_vcn_response.data.id
    virtual_network_client.get_vcn(vcn_id).wait_until(:lifecycle_state, OCI::Core::Models::Vcn::LIFECYCLE_STATE_AVAILABLE)
    puts 'Assigned tags to VCN'
    pp create_vcn_response.data
    puts '********************************************'
    break
  rescue OCI::Errors::ServiceError => e
    raise unless e.status_code == 404
    raise "Received a 404: #{e} but exhausted retries" if attempt >= 2

    puts "Retrying on 404: #{e}"
    sleep(2)
    retry
  end
end

# We can also update tags on a resource. Note that this is a total replacement for any previously set freeform or defined tags.
#
# Resources where we can create/update tags will have the freeform_tags and defined_tags attributes. Consult the API
# documentation to see what these are (https://oracle-cloud-infrastructure-python-sdk.readthedocs.io/en/latest/api/index.html)
3.times do |attempt|
  begin
    update_vcn_response = virtual_network_client.update_vcn(
      vcn_id,
      OCI::Core::Models::UpdateVcnDetails.new(
        freeform_tags: { 'total' => 'replace' },
        defined_tags: { tag_namespace_name => { tag_two_name => 'also replaced' } }
      )
    )
    puts 'Updated tags on VCN'
    pp update_vcn_response.data
    puts '********************************************'
    break
  rescue OCI::Errors::ServiceError => e
    raise unless e.status_code == 404
    raise "Received a 404: #{e} but exhausted retries" if attempt >= 2

    puts "Retrying on 404: #{e}"
    sleep(2)
    retry
  end
end

puts 'Tags can also come back from a list operation'
virtual_network_client.list_vcns(compartment_id).each do |list_vcn_response|
  found_vcn = false
  list_vcn_response.data.each do |vcn|
    next unless vcn.id == vcn_id

    pp vcn
    found_vcn = true
    break
  end
  break if found_vcn
end

# We can also totally remove tags on a resource by passing in an empty hash for those tagging parameters
update_vcn_response = virtual_network_client.update_vcn(
  vcn_id,
  OCI::Core::Models::UpdateVcnDetails.new(
    freeform_tags: {},
    defined_tags: {}
  )
)
puts 'Removed tags on VCN'
pp update_vcn_response.data
puts '********************************************'

update_namespace_response = identity_client.update_tag_namespace(
  tag_namespace.id,
  OCI::Identity::Models::UpdateTagNamespaceDetails.new(is_retired: true)
)
puts 'Retiring tag namespace'
pp update_namespace_response.data
puts '********************************************'

puts 'Retiring a namespace also retires tags in that namespace'
tags = []
identity_client.list_tags(tag_namespace.id).each do |list_tag_response|
  tags += list_tag_response.data
end
pp tags
puts '********************************************'

reactivate_namespace_details = OCI::Identity::Models::UpdateTagNamespaceDetails.new(is_retired: false)
update_namespace_response = identity_client.update_tag_namespace(tag_namespace.id, reactivate_namespace_details)
puts 'Reactivating tag namespace'
pp update_namespace_response.data
puts '********************************************'

puts 'Reactivating a namespace does not reactivate tags in the namespace ' \
  + '(note in the below output that the tags are still retired)'
puts 'Tags need to be reactivated individually'
tags = []
identity_client.list_tags(tag_namespace.id).each do |list_tag_response|
  tags += list_tag_response.data
end
pp tags
puts '********************************************'

puts "Reactivating tag #{tag_one_name}"
pp create_or_activate_tag(identity_client, tag_namespace.id, tag_one_name)
puts '********************************************'

puts "Retiring tag #{tag_one_name}"
retire_tag_details = OCI::Identity::Models::UpdateTagDetails.new(is_retired: true)
update_tag_response = identity_client.update_tag(tag_namespace.id, tag_one_name, retire_tag_details)
pp update_tag_response.data
puts '********************************************'

# Clean up by deleting the VCN and doing one last tag retirement
puts 'Cleaning up resources'
virtual_network_client.delete_vcn(vcn_id)
identity_client.update_tag_namespace(
  tag_namespace.id,
  OCI::Identity::Models::UpdateTagNamespaceDetails.new(is_retired: true)
)

puts 'Example script finished'
