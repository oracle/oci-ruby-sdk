# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# This example takes the OCID for an instance as the only argument and prints
# a list of the public IP addresses for that instance.
# Example run:
#   ruby examples/get_instance_public_ip.rb ocid1.instance.oc1.phx.abyhqljteu5k5piu4ifnyzah22qtz3gksqbuh4au54p2xwv7xbii5hgmwtmc
#
# This will use credentials and settings from the DEFAULT profile at ~/.oci/config (on windows
# "C:\Users\{user}\.oci\config"), however if that file does not exist we will automatically fall back to using
# ~/.oraclebmc/config (on windows "C:\Users\{user}\.oraclebmc\config")

require 'oci'
require 'set'

instance_id = ARGV[0]
compute_client = OCI::Core::ComputeClient.new
vcn_client = OCI::Core::VirtualNetworkClient.new

begin
  instance = compute_client.get_instance(instance_id).data
rescue OCI::Errors::ServiceError => e
  raise unless e.status_code == 404

  puts "Instance not found. OCID: #{instance_id}"
end

if instance
  public_ip_addresses = Set.new

  compute_client.list_vnic_attachments(instance.compartment_id,
                                       instance_id: instance_id).each do |response|
    response.data.each do |vnic_attachment|
      vnic = vcn_client.get_vnic(vnic_attachment.vnic_id).data
      public_ip_addresses << vnic.public_ip if vnic.public_ip

      # Handles the scenario where public IP addresses are assigned to
      # secondary private IPs on the VNIC. First we find all private IPs
      # associated with the VNIC and for each of those try and find the
      # public IP (if any) which has been associated with the private IP
      vcn_client.list_private_ips(vnic_id: vnic.id).each do |list_private_ips_response|
        list_private_ips_response.data.each do |private_ip|
          begin
            public_ip = vcn_client.get_public_ip_by_private_ip_id(
              OCI::Core::Models::GetPublicIpByPrivateIpIdDetails.new(private_ip_id: private_ip.id)
            ).data
            public_ip_addresses << public_ip.ip_address
          rescue OCI::Errors::ServiceError => e
            # A 404 indicates that there is no public IP for the given private IP
            puts "No public IP found for private IP #{private_ip.id} (#{private_ip.ip_address})" if error.status_code == 404
            puts "Error retrieving public IP for private IP #{private_ip.id} (#{private_ip.ip_address}): #{e}" \
              if error.status_code != 404
          end
        end
      end
    end
  end

  puts "Public IP Addresses for Instance #{instance.display_name} [#{instance_id}]:"
  puts public_ip_addresses.to_a
end
