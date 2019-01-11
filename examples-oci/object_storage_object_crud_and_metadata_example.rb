# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# This script demonstrates using the ObjectStorageClient to upload, retrieve, delete and apply metadata to objects.
# This script expects as parameters the bucket where the object operations will be done and the name of target object.
# The bucket must exist prior to the script being run (the script will not create the bucket).
#
# For uploading objects, you should consider using the UploadManager (see the upload_manager.rb and upload_manager_stdin.rb examples) rather
# than the put_object operation directly as UploadManager automatically handles large files ("large" is a configurable value) by breaking
# them into multiple parts and uploading them in parallel. By contrast, the put_object operation will attempt to upload any provided data
# in one go.
#
# This script will use credentials and settings from the DEFAULT profile at ~/.oci/config (on windows
# "C:\Users\{user}\.oci\config"), however if that file does not exist we will automatically fall back to using
# ~/.oraclebmc/config (on windows "C:\Users\{user}\.oraclebmc\config")
#
# Format:
#   object_crud_and_metadata_example.rb <bucket name> <object name>
#
# Example run:
#   ruby object_crud_and_metadata_example.rb 'object_crud_test_bucket'

require 'fileutils'
require 'oci'
require 'pp'

# Create a dummy file of 5 MiB for our use later
object_content = 'a' * 5 * OCI::ObjectStorage::Transfer::MEBIBYTE
File.open('object_crud_example.txt', 'wb') { |file| file.write(object_content) }

object_storage_client = OCI::ObjectStorage::ObjectStorageClient.new

namespace = object_storage_client.get_namespace.data
bucket_name = ARGV[0]
object_name = ARGV[1]

# We can put an object in a bucket and supply metadata as part of the put_object call by supplying a hash to the opc_meta
# keyword argument. It is expected that the hash has string (or symbol) keys and string values
#
# The put_object operation also supports supplying other parameters such as the content type, language and encoding of the
# object. Consult the API documentation for the put_object operation for more information
metadata = { 'key1' => 'value1', 'key2' => 'value two', key3: 'value three with symbol' }
put_object_response = nil
File.open('object_crud_example.txt', 'rb') do |file|
  put_object_response = object_storage_client.put_object(
    namespace, bucket_name,
    object_name,
    file,
    opc_meta: metadata
  )
end
puts 'Put object in bucket'
puts '=' * 20
pp put_object_response.headers
2.times { puts }

# There are a few different ways to get the data for an object via a get_object call:
#
#   - Directly as a string
#   - Streaming automatically into a file given a file path
#   - Streaming automatically into an IO-like object such as a StringIO, File or TempFile
#   - Handling streaming data manually by using a block
#
# The other thing to note is that in the response to get_object, the metadata we provided when uploading the object
# is in the headers of the response

# This will get the data directly as a string
get_object_response = object_storage_client.get_object(namespace, bucket_name, object_name)
puts 'Get object directly as String data'
puts '=' * 20
pp get_object_response.headers
puts "String data and object content equal: #{get_object_response.data == object_content}"
2.times { puts }

# This will get the data into a file at the specified path by providing a file path as the value of the response_target
# keyword argument
#
# Note that when streaming the .data attribute of the get_object_response will be nil
get_object_response = object_storage_client.get_object(
  namespace,
  bucket_name,
  object_name,
  response_target: 'download_target.txt'
)
puts 'Automatically donwload object data into file by path'
puts '=' * 20
pp get_object_response.headers
puts "Downloaded file and original file match: #{FileUtils.compare_file('download_target.txt', 'object_crud_example.txt')}"
puts "get_object_response.data nil?: #{get_object_response.data.nil?}"
2.times { puts }

# We can stream data into an IO-like object such as a StringIO, File or TempFile
#
# Note that when streaming the .data attribute of the get_object_response will be nil
temp_file = Tempfile.new('ruby_sdk_object_crud_example')
temp_file.binmode # Use binary mode as in other places in the example when dealing with files we use binary mode (e.g. wb)
get_object_response = object_storage_client.get_object(
  namespace,
  bucket_name,
  object_name,
  response_target: temp_file
)
temp_file.rewind # Move back to the start of the file once everything has been read in
puts 'Automatically donwload object data into IO by object reference'
puts '=' * 20
pp get_object_response.headers
puts "Downloaded file and original file match: #{FileUtils.compare_file(temp_file.path, 'object_crud_example.txt')}"
puts "get_object_response.data nil?: #{get_object_response.data.nil?}"
2.times { puts }
temp_file.close
temp_file.unlink

# We can also pass a block to the get_object operation if we want to handle streaming ourselves
#
## Note that when streaming the .data attribute of the get_object_response will be nil
File.open('download_target_2.txt', 'wb') do |file|
  get_object_response = object_storage_client.get_object(namespace, bucket_name, object_name) do |chunk|
    file.write(chunk)
  end
end
puts 'Stream object data using a block'
puts '=' * 20
pp get_object_response.headers
puts "Downloaded file and original file match: #{FileUtils.compare_file('download_target_2.txt', 'object_crud_example.txt')}"
puts "get_object_response.data nil?: #{get_object_response.data.nil?}"
2.times { puts }

# If we want to update the metadata for an object, we need to upload the object again with revised metadata. Note that this is a
# total replacement so in this example only key1 remains
metadata = { 'key1' => 'updated' }
File.open('object_crud_example.txt', 'rb') do |file|
  object_storage_client.put_object(namespace, bucket_name, object_name, file, opc_meta: metadata)
end
puts 'Updated metadata'
puts '=' * 20
pp object_storage_client.get_object(namespace, bucket_name, object_name).headers
2.times { puts }

# We can clear metadata by doing a put_object and passing an empty hash for the opc_meta keyword argument
File.open('object_crud_example.txt', 'rb') do |file|
  object_storage_client.put_object(namespace, bucket_name, object_name, file, opc_meta: {})
end
puts 'Cleared metadata'
puts '=' * 20
pp object_storage_client.get_object(namespace, bucket_name, object_name).headers
2.times { puts }

File.delete('download_target.txt', 'download_target_2.txt', 'object_crud_example.txt')
object_storage_client.delete_object(namespace, bucket_name, object_name)
