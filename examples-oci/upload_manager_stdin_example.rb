# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# This script demonstrates how to use the UploadManager to upload objects to Object Storage when the input
# comes from stdin, e.g. it is being piped from other application.
#
# This will use credentials and settings from the DEFAULT profile at ~/.oci/config (on windows
# "C:\Users\{user}\.oci\config"), however if that file does not exist we will automatically fall back to using
# ~/.oraclebmc/config (on windows "C:\Users\{user}\.oraclebmc\config")
#
# Format:
#   upload_manager_stdin_testing.rb <bucket name> <source type, either 'string' or 'file'> <expected, either the expected string or a path to a file with expected contents>
#
# Example runs:
#   echo "hello world" | ruby upload_manager_stdin_testing.rb 'upload_manager_test_bucket' string "hello world"
#
#   ruby upload_manager_stdin_testing.rb 'upload_manager_test_bucket' string "hello world" <<< "hello world"
#
#   cat my_example_file.txt | ruby upload_manager_stdin_testing.rb 'upload_manager_test_bucket' file my_example_file.txt

require 'English'
require 'fileutils'
require 'oci'
require 'pp'

object_storage_client = OCI::ObjectStorage::ObjectStorageClient.new

namespace = object_storage_client.get_namespace.data
bucket_name = ARGV[0]
source_type = ARGV[1]
expected = ARGV[2]

upload_manager_multipart_override_config = OCI::ObjectStorage::Transfer::UploadManagerConfig.new(
  multipart_upload_threshold: 4 * OCI::ObjectStorage::Transfer::MEBIBYTE,
  multipart_part_size: 1 * OCI::ObjectStorage::Transfer::MEBIBYTE,
  non_file_io_multipart_part_size: 1 * OCI::ObjectStorage::Transfer::MEBIBYTE
)
upload_manager = OCI::ObjectStorage::Transfer::UploadManager.new(
  object_storage_client: object_storage_client,
  upload_manager_config: upload_manager_multipart_override_config
)

begin
  response = upload_manager.upload(namespace, bucket_name, 'example_obj_stdin', $stdin)
rescue
  print $ERROR_INFO.to_s
  raise
end
puts 'Response headers:'
pp response.headers.to_hash

if source_type == 'string'
  get_response = object_storage_client.get_object(namespace, bucket_name, 'example_obj_stdin')
  puts "Data from GetObject: #{get_response.data.strip}. Matches input: #{get_response.data.strip == expected}"
elsif source_type == 'file'
  File.open('validate_object_written_from_stdin', 'wb') do |file|
    object_storage_client.get_object(namespace, bucket_name, 'example_obj_stdin') do |chunk|
      file.write(chunk)
    end
  end
  puts 'Uploaded from stdin and retrieved data match: ' \
    + FileUtils.compare_file(expected, 'validate_object_written_from_stdin').to_s
else
  raise "Unknown source type: #{source_type}"
end
