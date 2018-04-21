# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

# This example takes the OCID for an instance as the only argument and prints
# a list of the public IP addresses for that instance.
# Example run:
#   ruby examples/get_instance_public_ip.rb ocid1.instance.oc1.phx.abyhqljteu5k5piu4ifnyzah22qtz3gksqbuh4au54p2xwv7xbii5hgmwtmc
#
# This will use credentials and settings from the DEFAULT profile at ~/.oci/config (on windows
# "C:\Users\{user}\.oci\config"), however if that file does not exist we will automatically fall back to using
# ~/.oraclebmc/config (on windows "C:\Users\{user}\.oraclebmc\config")

require 'oci'

instance_id = ARGV[0]
compute_client = OCI::Core::ComputeClient.new
vcn_client = OCI::Core::VirtualNetworkClient.new

begin
  instance = compute_client.get_instance(instance_id).data
rescue OCI::Errors::ServiceError => error
  raise unless error.status_code == 404
  puts "Instance not found. OCID: #{instance_id}"
end

if instance
  public_ip_addresses = []

  compute_client.list_vnic_attachments(instance.compartment_id,
                                       instance_id: instance_id).each do |response|
    response.data.each do |vnic_attachment|
      public_ip = vcn_client.get_vnic(vnic_attachment.vnic_id).data.public_ip
      public_ip_addresses.push(public_ip) if public_ip
    end
  end

  puts "Public IP Addresses for Instance #{instance.display_name} [#{instance_id}]:"
  puts public_ip_addresses
end
