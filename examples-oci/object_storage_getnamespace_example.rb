# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# This script provides a basic example of how to get Object Storage namespace of a tenancy that is not their own. This
# is useful in cross-tenant Object Storage operations. Object Storage namespace can be retrieved using the
# compartment id of the target tenancy if the user has necessary permissions to access that tenancy.
#
# For example if Tenant A wants to access Tenant B's object storage namespace then Tenant A has to define
# a policy similar to following:
#
# DEFINE TENANCY TenantB AS <TenantB OCID>
# ENDORSE GROUP <TenantA user group name> TO {OBJECTSTORAGE_NAMESPACE_READ} IN TENANCY TenantB
#
# and Tenant B should add a policy similar to following:
#
# DEFINE TENANCY TenantA AS <TenantA OCID>
# DEFINE GROUP TenantAGroup AS <TenantA user group OCID>
# ADMIT GROUP TenantAGroup OF TENANCY TenantA TO {OBJECTSTORAGE_NAMESPACE_READ} IN TENANCY
#
# This example covers only GetNamespace operation across tenants. Additional permissions
# will be required to perform more Object Storage operations.
#
# The example will use credentials and settings from the DEFAULT profile at ~/.oci/config (on windows
# "C:\Users\{user}\.oci\config"), however if that file does not exist we will automatically fall back to using
# ~/.oraclebmc/config (on windows "C:\Users\{user}\.oraclebmc\config")
#
# Format:
#   object_storage_getnamespace_example.rb <compartmend ID>
#
# Example run:
#   ruby examples/object_storage_getnamespace_example.rb 'ocid1.compartment.oc1..aaaaaaaac4xqx43texeuonfionxsx4okzfsya5evr2goe2t7v5wntztaymab'

require 'oci'

compartment_id = ARGV[0]
object_storage_client = OCI::ObjectStorage::ObjectStorageClient.new

namespace = object_storage_client.get_namespace(
  compartment_id: compartment_id
).data

puts "Object storage namespace for compartment id: #{compartment_id} is #{namespace}"
