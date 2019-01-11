# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# This script provides a basic example of how to use archive storage in the Object Storage service. This example
# will create an archive storage bucket and demonstrate putting and restoring objects.
#
# The example will use credentials and settings from the DEFAULT profile at ~/.oci/config (on windows
# "C:\Users\{user}\.oci\config"), however if that file does not exist we will automatically fall back to using
# ~/.oraclebmc/config (on windows "C:\Users\{user}\.oraclebmc\config")
#
# Format:
#   object_storage_archive_example.rb <compartmend ID> <bucket name>
#
# Example run:
#   ruby examples/object_storage_archive_example.rb 'ocid1.compartment.oc1..aaaaaaaac4xqx43texeuonfionxsx4okzfsya5evr2goe2t7v5wntztaymab' 'example_archive_bucket'

require 'oci'
require 'pp'

compartment_id = ARGV[0]
bucket_name = ARGV[1]
object_storage_client = OCI::ObjectStorage::ObjectStorageClient.new

namespace = object_storage_client.get_namespace.data

# First create a bucket which uses the archive storage tier
create_bucket_response = object_storage_client.create_bucket(
  namespace,
  OCI::ObjectStorage::Models::CreateBucketDetails.new(
    name: bucket_name,
    compartment_id: compartment_id,
    public_access_type: OCI::ObjectStorage::Models::CreateBucketDetails::PUBLIC_ACCESS_TYPE_NO_PUBLIC_ACCESS,
    storage_tier: OCI::ObjectStorage::Models::CreateBucketDetails::STORAGE_TIER_ARCHIVE
  )
)
puts 'Created Archive Storage Bucket'
puts '=' * 20
pp create_bucket_response.data

# We use the same operation to put an object in a bucket, regardless of its storage tier. Note that the response
# does not contain a body but the headers will contain information about the object, such as its ETag and MD5
object_name = 'archive_object_test'
put_object_response = object_storage_client.put_object(namespace, bucket_name, object_name, 'Test object content')
puts 'Put object in bucket'
puts '=' * 20
pp put_object_response.headers

# If an object is archived, then we cannot do a get_object. This will throw an exception with a HTTP 409 status
# and a code of NotRestored
begin
  object_storage_client.get_object(namespace, bucket_name, object_name)
rescue OCI::Errors::ServiceError => e
  puts 'Attempt to get archived object'
  puts '=' * 20
  puts e.to_s
end

# We can, however, HEAD the object to get its current status. The response will not have a body, but the headers
# will contain information. One key header of interest is archival-state. In this case, because we have only
# put the object in the bucket, it will start out as "Archived".
#
# See https://docs.cloud.oracle.com/api/#/en/objectstorage/20160918/Object/HeadObject for
# more information on available headers
head_object_response = object_storage_client.head_object(namespace, bucket_name, object_name)
puts 'head_object for an archived object'
puts '=' * 20
puts "Archival state: #{head_object_response.headers['archival-state']}"
puts 'All headers:'
pp head_object_response.headers

# We can restore an object in archive storage (so that the GetObject will work) by using the restore_objects
# operation. In RestoreObjectsDetails, the hours field represents how long after restoration has completed that
# the object will be available for before being archived again. If no value is specified,
# this will default to 24 hours
object_storage_client.restore_objects(
  namespace,
  bucket_name,
  OCI::ObjectStorage::Models::RestoreObjectsDetails.new(object_name: object_name, hours: 72)
)

# Objects take some time to restore. During that time get_object will still throw an exception
# with a HTTP 409 status and a code of NotRestored
begin
  object_storage_client.get_object(namespace, bucket_name, object_name)
rescue OCI::Errors::ServiceError => e
  puts 'Attempt to get a restoring object'
  puts '=' * 20
  puts e.to_s
end

# We can use head_object to check/poll the status of the object. The headers of interest are archival-state
# and time-of-archival. While the object is restoring, archival-state will be "Restoring" and when
# it is "Restored" then a get_object can be done successfully.
#
# For a restored object, the time-of-archival will be when the object will be archived again.
#
# See https://docs.cloud.oracle.com/api/#/en/objectstorage/20160918/Object/HeadObject for
# more information on available headers
head_object_response = object_storage_client.head_object(namespace, bucket_name, object_name)
puts 'head_object for a restoring object'
puts '=' * 20
puts "Archival state: #{head_object_response.headers['archival-state']}"
puts 'All headers:'
pp head_object_response.headers

# Clean up
object_storage_client.delete_object(namespace, bucket_name, object_name)
puts 'Deleted object'

object_storage_client.delete_bucket(namespace, bucket_name)
puts 'Deleted bucket'
