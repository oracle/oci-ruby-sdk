# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# This script demonstrates how to use the UploadManager to upload objects to Object Storage. We'll see how
# the UploadManager can be used to upload objects in multiple parts, as well as doing a single-part upload
# (uploading the entire object at once).
#
# This will use credentials and settings from the DEFAULT profile at ~/.oci/config (on windows
# "C:\Users\{user}\.oci\config"), however if that file does not exist we will automatically fall back to using
# ~/.oraclebmc/config (on windows "C:\Users\{user}\.oraclebmc\config")
#
# Format:
#   upload_manager.rb <bucket name>
#
# Example run:
#   ruby upload_manager.rb 'upload_manager_test_bucket'

require 'fileutils'
require 'oci'
require 'pp'

# Create a dummy file of 5 MiB for our use later
File.open('upload_manager_example.txt', 'wb') { |file| file.write('a' * 5 * OCI::ObjectStorage::Transfer::MEBIBYTE) }

object_storage_client = OCI::ObjectStorage::ObjectStorageClient.new

namespace = object_storage_client.get_namespace.data
bucket_name = ARGV[0]

# The most basic UploadManager - we supply the client used to talk to Object Storage but use the default configuration.
# Under this default configuration, we'll only upload objects with a size of 128 MiB (128 * 1024 * 1024 bytes) or more
# in multiple parts. Anything smaller will be done as a single-part upload.
upload_manager = OCI::ObjectStorage::Transfer::UploadManager.new(object_storage_client: object_storage_client)

# When uploading, we can use an IO-like object such as a StringIO if we already have the data we want to
# upload in memory. We can tell this is a single-part upload because of the opc-content-md5 in the response
# headers
puts 'Uploading single-part with a StringIO'
response = upload_manager.upload(
  namespace, bucket_name,
  'example_obj1',
  StringIO.new('I am the very model of a modern Major General')
)
puts 'Response headers:'
pp response.headers.to_hash
puts 'Retrieved data from single-part upload with StringIO: ' \
  + object_storage_client.get_object(namespace, bucket_name, 'example_obj1').data.to_s

puts '------------------------------------------'

# When uploading, we can also supply a string and this will be interpreted as the path to the file to upload.
# We can also supply metadata by using the opts parameter of the upload method. Once again, we can tell this is
# a single-part upload because of the opc-content-md5 in the response headers.
#
# When getting the object back again, we can also see our metadata in the response headers
puts 'Uploading single-part from a file with metadata'
metadata = { 'key1' => 'val1', 'keyTwo' => 'value two' }
response = upload_manager.upload(
  namespace,
  bucket_name,
  'example_obj2',
  'upload_manager_example.txt',
  metadata: metadata
)
puts 'Response headers:'
pp response.headers.to_hash
File.open('single_part_from_file.txt', 'wb') do |file|
  object_storage_client.get_object(namespace, bucket_name, 'example_obj2') do |chunk|
    file.write(chunk)
  end
end
puts 'Uploaded single-part file and retrieved file match: ' \
  + FileUtils.compare_file('upload_manager_example.txt', 'single_part_from_file.txt').to_s
puts 'GetObject headers:'
pp object_storage_client.get_object(namespace, bucket_name, 'example_obj2').headers.to_hash

puts '------------------------------------------'

# Here we create a config and override some defaults so that we'll multipart upload objects over 4 MiB in size,
# and each part of the multipart upload will be 1 MiB
upload_manager_multipart_override_config = OCI::ObjectStorage::Transfer::UploadManagerConfig.new(
  multipart_upload_threshold: 4 * OCI::ObjectStorage::Transfer::MEBIBYTE,
  multipart_part_size: 1 * OCI::ObjectStorage::Transfer::MEBIBYTE,
  non_file_io_multipart_part_size: 1 * OCI::ObjectStorage::Transfer::MEBIBYTE
)
upload_manager = OCI::ObjectStorage::Transfer::UploadManager.new(
  object_storage_client: object_storage_client,
  upload_manager_config: upload_manager_multipart_override_config
)

# Here we read a file from the supplied path and upload it in multiple parts (since the file is 5 MiB in size). We can
# see that this is a multi-part upload because of the opc-multipart-md5 in the response headers
puts 'Uploading in multiple parts from a file'
response = upload_manager.upload(namespace, bucket_name, 'example_obj3', 'upload_manager_example.txt')
pp response.headers.to_hash
File.open('multi_part_from_file.txt', 'wb') do |file|
  object_storage_client.get_object(namespace, bucket_name, 'example_obj3') do |chunk|
    file.write(chunk)
  end
end
puts 'Uploaded multi-part file and retrieved file match: ' \
  + FileUtils.compare_file('upload_manager_example.txt', 'multi_part_from_file.txt').to_s

puts '------------------------------------------'

# Equally, if we already have content in memory (such as in a StringIO) and it is of sufficient size then it will
# be multipart uploaded as well, as we can see via the opc-multipart-md5 in the response headers
puts 'Uploading a StringIO in multiple parts'
multipart_upload_string_io = StringIO.new('a' * 5 * OCI::ObjectStorage::Transfer::MEBIBYTE)
response = upload_manager.upload(namespace, bucket_name, 'example_obj4', multipart_upload_string_io)
puts 'Response headers:'
pp response.headers.to_hash

puts '------------------------------------------'

# UploadManager can also resume previous partial uploads. As a naive example to demonstrate this, we'll upload
# part of our example file using the basic ObjectStorageClient operations and then use UploadManager's resume
# method to upload the rest.
#
# In a more real-world scenario, if you use UploadManager's upload() method and it doesn't complete successfully
# but some parts were uploaded, you could then call resume() with the relevant upload_id to try and finish
# the multipart upload by uploading only the remaining parts

create_multipart_upload_details = OCI::ObjectStorage::Models::CreateMultipartUploadDetails.new(object: 'example_obj5')
response = object_storage_client.create_multipart_upload(namespace, bucket_name, create_multipart_upload_details)
upload_id = response.data.upload_id
part_contents = IO.read('upload_manager_example.txt', 1 * OCI::ObjectStorage::Transfer::MEBIBYTE, 0, mode: 'rb')
object_storage_client.upload_part(namespace, bucket_name, 'example_obj5', upload_id, 1, part_contents)

puts 'Resuming an upload'
response = upload_manager.resume(upload_id, namespace, bucket_name, 'example_obj5', 'upload_manager_example.txt')
puts 'Response headers:'
pp response.headers.to_hash
