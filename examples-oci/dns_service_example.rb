# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# This script provides a basic example of how to use the DNS service in the Ruby SDK.
# This will use credentials and settings from the DEFAULT profile at ~/.oci/config (on windows
# "C:\Users\{user}\.oci\config"), however if that file does not exist we will automatically fall back to using
# ~/.oraclebmc/config (on windows "C:\Users\{user}\.oraclebmc\config")
#
# Format:
#   dns_service_example.rb <compartmend ID> <zone name>
#
# Example run:
#   ruby examples/dns_service_example.rb 'ocid1.compartment.oc1..aaaaaaaac4xqx43texeuonfionxsx4okzfsya5evr2goe2t7v5wntztaymab' 'myexamplezone.com'

require 'oci'
require 'pp'

def get_all_zone_records(dns_client, zone_name, zone_version)
  all_records = []
  dns_client.get_zone_records(zone_name, zone_version: zone_version).each do |response|
    all_records += response.data.items
  end
  all_records
end

def get_all_domain_records(dns_client, zone_name, domain, zone_version)
  all_records = []
  dns_client.get_domain_records(zone_name, domain, zone_version: zone_version).each do |response|
    all_records += response.data.items
  end
  all_records
end

def get_all_rr_set_records(dns_client, zone_name, domain, zone_version, rtype)
  all_records = []
  dns_client.get_rr_set(zone_name, domain, rtype, zone_version: zone_version).each do |response|
    all_records += response.data.items
  end
  all_records
end

def get_zone(dns_client, zone_name)
  dns_client.get_zone(zone_name).data
end

compartment_id = ARGV[0]
zone_name = ARGV[1]
dns_client = OCI::Dns::DnsClient.new

create_response = dns_client.create_zone(
  OCI::Dns::Models::CreateZoneDetails.new(
    name: zone_name,
    zoneType: 'PRIMARY',
    compartmentId: compartment_id
  )
)
puts 'Created Zone'
puts '=' * 20
pp create_response.data

puts 'All Zones'
puts '=' * 20
dns_client.list_zones(zone_name).each do |response|
  response.data.items.each { |r| pp r }
end

# We can also provide filter conditions and sort order to the list_zones operation. Here we filter based
# on an exact name match and filter by the time the zone was created descending.
puts 'Zones with sort and filter'
puts '=' * 20
dns_client.list_zones(zone_name, name: zone_name, sort_by: 'timeCreated', sort_order: 'DESC').each do |response|
  response.data.items.each { |r| pp r }
end

# We can update records in the zone. This will overwrite any existing records. If there are items
# we wish to keep (e.g. the NS records in the zone) we need to read those out first and make
# sure they are included in the update.
#
# When updating zone records we can add records with different rtypes and also for different domains in the zone.
#
# get_zone_records is a paginated operation so we can use .each to iterate over responses from the service
original_ns_records = []
dns_client.get_zone_records(
  zone_name,
  rtype: 'NS',
  zone_version: get_zone(dns_client, zone_name).version,
  domain: zone_name
).each do |response|
  original_ns_records += response.data.items
end

puts 'Original NS Records'
puts '=' * 20
pp original_ns_records

# Here we prepare our update. This will include the NS records, plus a TXT record for the top level
# domain and an A record for a subdomain.
update_zone_record_items = original_ns_records.map do |ns|
  OCI::Dns::Models::RecordDetails.new(
    domain: ns.domain,
    ttl: ns.ttl,
    rtype: 'NS',
    recordHash: ns.record_hash,
    rdata: ns.rdata,
    rrsetVersion: ns.rrset_version,
    isProtected: true
  )
end
update_zone_record_items << OCI::Dns::Models::RecordDetails.new(
  domain: zone_name,
  ttl: 30,
  rtype: 'TXT',
  rdata: 'Some textual data'
)
update_zone_record_items << OCI::Dns::Models::RecordDetails.new(
  domain: "testsubdomain.#{zone_name}",
  ttl: 1800,
  rtype: 'A',
  rdata: '127.0.0.1'
)

dns_client.update_zone_records(
  zone_name,
  OCI::Dns::Models::UpdateZoneRecordsDetails.new(items: update_zone_record_items)
)

# When retrieving records, we can optionally specify what version of the zone we want records for. In this case,
# we explicitly want the latest version, which we can get by retrieving the zone and then interrogating its
# version. Specifying different versions is also possible.
records_after_update = get_all_zone_records(
  dns_client,
  zone_name,
  get_zone(dns_client, zone_name).version
)
puts 'Updated Zone Records'
puts '=' * 20
pp records_after_update

# In addition to updates, we can use the patch operation to add and remove records from the zone without
# having to send through the complete list of records each time. In this example, we'll remove the existing
# TXT record and add a new one in.
txt_record = records_after_update.find { |r| r.rtype == 'TXT' }

patch_add_remove_txt_record = [
  OCI::Dns::Models::RecordOperation.new(
    domain: zone_name,
    record_hash: txt_record.record_hash,
    rtype: 'TXT',
    rdata: txt_record.rdata,
    operation: 'REMOVE'
  ),
  OCI::Dns::Models::RecordOperation.new(
    domain: zone_name,
    rtype: 'TXT',
    ttl: 45,
    rdata: 'Patch new text data',
    operation: 'ADD'
  )
]

dns_client.patch_zone_records(
  zone_name,
  OCI::Dns::Models::PatchZoneRecordsDetails.new(items: patch_add_remove_txt_record)
)

records_after_patch = get_all_zone_records(
  dns_client,
  zone_name,
  get_zone(dns_client, zone_name).version
)
puts 'Patched Zone Records'
puts '=' * 20
pp records_after_patch

# As part of patch operations, we can also specify preconditions (REQUIRE - data must be present, and
# PROHIBIT - data must not be present) that must be met for the operation to succeed

failing_patch_operation = [
  OCI::Dns::Models::RecordOperation.new( # This will fail as nothing matches this criteria
    domain: "testsubdomain1.#{zone_name}",
    rtype: 'A',
    rrsetVersion: '1234567',
    operation: 'REQUIRE'
  ),
  OCI::Dns::Models::RecordOperation.new(
    domain: "testsubdomain1.#{zone_name}",
    rtype: 'A',
    ttl: 1800,
    rdata: '127.0.0.2',
    operation: 'ADD'
  )
]

begin
  dns_client.patch_zone_records(
    zone_name,
    OCI::Dns::Models::PatchZoneRecordsDetails.new(items: failing_patch_operation)
  )
rescue OCI::Errors::ServiceError => e
  puts "Patch with bad precondition failed with status: #{e.status_code}"
end

# This operation will succeed since we're asking that something matching the criteria doesn't exist (PROHIBIT). Note
# also that the TTL will be applied to all other A records in the domain (i.e. our existing A record will have its
# TTL changed to 2100).
successful_patch_operation = [
  OCI::Dns::Models::RecordOperation.new(
    domain: "testsubdomain1.#{zone_name}",
    rtype: 'A',
    rrsetVersion: '1234567',
    operation: 'PROHIBIT'
  ),
  OCI::Dns::Models::RecordOperation.new(
    domain: "testsubdomain1.#{zone_name}",
    rtype: 'A',
    ttl: 1800,
    rdata: '127.0.0.2',
    operation: 'ADD'
  )
]

dns_client.patch_zone_records(
  zone_name,
  OCI::Dns::Models::PatchZoneRecordsDetails.new(items: successful_patch_operation)
)

records_after_patch = get_all_zone_records(
  dns_client,
  zone_name,
  get_zone(dns_client, zone_name).version
)
puts 'Patched Zone Records With Precondition'
puts '=' * 20
pp records_after_patch

# We can also do update and patch operations at the domain level. This can handle records with different rtypes
# but they must all be in the same domain

subdomain = "testsubdomain2.#{zone_name}"
all_domain_records = get_all_domain_records(dns_client, zone_name, subdomain, get_zone(dns_client, zone_name).version)

# Initially the domain should not have any records
puts 'Original Domain Records'
puts '=' * 20
pp all_domain_records

update_domain_records = [
  OCI::Dns::Models::RecordDetails.new(
    domain: subdomain,
    ttl: 30,
    rtype: 'TXT',
    rdata: 'Subdomain text'
  ),
  OCI::Dns::Models::RecordDetails.new(
    domain: subdomain,
    ttl: 900,
    rtype: 'A',
    rdata: '127.0.0.7'
  )
]

dns_client.update_domain_records(
  zone_name,
  subdomain,
  OCI::Dns::Models::UpdateDomainRecordsDetails.new(items: update_domain_records)
)

all_domain_records = get_all_domain_records(dns_client, zone_name, subdomain, get_zone(dns_client, zone_name).version)
puts 'Domain Records After Update'
puts '=' * 20
pp all_domain_records

a_record = all_domain_records.find { |r| r.rtype == 'A' }
txt_record = all_domain_records.find { |r| r.rtype == 'TXT' }

# Patch operations at the domain level function similarly to patch operations at the zone level, in that we can send through
# partial updates (additions and removals) and also specify preconditions
#
# Here we specify two preconditions (which should succeed):
#   * TXT records match the given RRSet version
#   * A records have the given TTL
#
# And if that is successful we'll update the TTL of the existing A record
domain_patch_operations = [
  OCI::Dns::Models::RecordOperation.new(
    domain: subdomain,
    rtype: 'TXT',
    rrsetVersion: txt_record.rrset_version,
    operation: 'REQUIRE'
  ),
  OCI::Dns::Models::RecordOperation.new(
    domain: subdomain,
    rtype: 'A',
    ttl: a_record.ttl,
    operation: 'REQUIRE'
  ),
  OCI::Dns::Models::RecordOperation.new(
    domain: subdomain,
    ttl: 1000,
    rtype: 'A',
    rdata: '127.0.0.7',
    operation: 'ADD'
  )
]

dns_client.patch_domain_records(
  zone_name,
  subdomain,
  OCI::Dns::Models::PatchDomainRecordsDetails.new(items: domain_patch_operations)
)

all_domain_records = get_all_domain_records(dns_client, zone_name, subdomain, get_zone(dns_client, zone_name).version)
puts 'Patched Domain Records With Precondition'
puts '=' * 20
pp all_domain_records

# We can also delete records from the domain
dns_client.delete_domain_records(zone_name, subdomain)

all_domain_records = get_all_domain_records(dns_client, zone_name, subdomain, get_zone(dns_client, zone_name).version)
puts 'Domain records after delete'
pp all_domain_records

# We can also do update and patch operations at the RRSet level.
# This is scoped to a particular domain and rtype.

subdomain = "testsubdomain3.#{zone_name}"

all_rr_set_records = get_all_rr_set_records(
  dns_client,
  zone_name,
  subdomain,
  get_zone(dns_client, zone_name).version,
  'TXT'
)

# Initially the RRSet should not have any records as we're using a "fresh" subdomain
puts 'Initial RRSet records'
puts '=' * 20
pp all_rr_set_records

update_rr_set = [
  OCI::Dns::Models::RecordDetails.new(
    domain: subdomain,
    rtype: 'TXT',
    ttl: 100, # TTL should be consistent on each RecordDetails
    rdata: 'rec1'
  ),
  OCI::Dns::Models::RecordDetails.new(
    domain: subdomain,
    rtype: 'TXT',
    ttl: 100,
    rdata: 'rec2'
  )
]

dns_client.update_rr_set(
  zone_name,
  subdomain,
  'TXT',
  OCI::Dns::Models::UpdateRRSetDetails.new(items: update_rr_set)
)

all_rr_set_records = get_all_rr_set_records(dns_client, zone_name, subdomain, get_zone(dns_client, zone_name).version, 'TXT')
puts 'RRSet records after update'
puts '=' * 20
pp all_rr_set_records

# Patch operations on RRSets function similar to elsewhere in that we can send through
# partial updates (additions and removals) and also specify preconditions.
#
# Here we specify a precondition on the TTL, and also remove one record and add another. Note that the new TTL specified
# will apply to all records

patch_rr_set_operations = [
  OCI::Dns::Models::RecordOperation.new(
    domain: subdomain,
    rtype: 'TXT',
    ttl: 101,
    operation: 'PROHIBIT'
  ),
  OCI::Dns::Models::RecordOperation.new(
    domain: subdomain,
    rtype: 'TXT',
    recordHash: all_rr_set_records[1].record_hash,
    # Currently (as of 6 Feb 2018) for a TXT record, if you want to send in rdata for an EXISTING record then it should be quoted. For example:
    #   - '"Hello" "World"' instead of 'Hello World'
    #   - '"rec3"' instead of 'rec3'
    rdata: all_rr_set_records[1].rdata,
    operation: 'REMOVE'
  ),
  OCI::Dns::Models::RecordOperation.new(
    domain: subdomain,
    rtype: 'TXT',
    ttl: 101,
    rdata: 'rec3', # For new TXT records, we don't need to quote it
    operation: 'ADD'
  )
]

dns_client.patch_rr_set(
  zone_name,
  subdomain,
  'TXT',
  OCI::Dns::Models::PatchRRSetDetails.new(items: patch_rr_set_operations)
)

all_rr_set_records = get_all_rr_set_records(dns_client, zone_name, subdomain, get_zone(dns_client, zone_name).version, 'TXT')
puts 'RRSet records after patch'
puts '=' * 20
pp all_rr_set_records

# We can also delete records from the RRSet
dns_client.delete_rr_set(zone_name, subdomain, 'TXT')

all_rr_set_records = get_all_rr_set_records(dns_client, zone_name, subdomain, get_zone(dns_client, zone_name).version, 'TXT')
puts 'RRSet records after delete'
puts '=' * 20
pp all_rr_set_records

dns_client.delete_zone(zone_name)
print('Deleted zone')
