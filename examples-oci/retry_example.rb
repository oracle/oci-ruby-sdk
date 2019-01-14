# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# This example demonstrates how to use retry_config in the Ruby SDK to configure retrying service calls at the
# client and operation level.
#
# This will use credentials and settings from the DEFAULT profile at ~/.oci/config (on windows
# "C:\Users\{user}\.oci\config"), however if that file does not exist we will automatically fall back to using
# ~/.oraclebmc/config (on windows "C:\Users\{user}\.oraclebmc\config")
#
# In order to demonstrate retries, this script will create block volumes. The script will clean up these resources
# upon completion.
#
# Format:
#   retry_example.rb <compartment ID> <availability domain>
#
# Example run:
#   ruby examples/retry_example.rb 'ocid1.compartment.oc1..aaaaaaaac4xqx43texeuonfionxsx4okzfsya5evr2goe2t7v5wntztaymab' 'xxx:PHX-AD-1'

require 'oci'
require 'pp'

compartment_id = ARGV[0]
availability_domain = ARGV[1]

# Consult our API documentation for an explanation of each setting. One thing to note is the procs which are passed
# in the should_retry_exception_proc and sleep_calc_millis_proc arguments. You are welcome to supply your own
# implementations instead of the ones offered by the SDK, as long as:
#
#   - The should_retry_exception_proc should accept a single argument of a {OCI::Retry::Internal::RetryState}
#   - The sleep_calc_millis_proc should accept two arguments. The first argument of type {OCI::Retry::RetryConfig}
#     and the second of type {OCI::Retry::Internal::RetryState}
example_retry_config = OCI::Retry::RetryConfig.new(
  base_sleep_time_millis: 1000,
  exponential_growth_factor: 2,
  should_retry_exception_proc: OCI::Retry::Functions::ShouldRetryOnError.retry_on_network_error_throttle_and_internal_server_errors, # rubocop:disable Metrics/LineLength
  sleep_calc_millis_proc: OCI::Retry::Functions::Sleep.exponential_backoff_with_full_jitter,
  max_attempts: 5,
  max_elapsed_time_millis: 300_000, # 5 minutes
  max_sleep_between_attempts_millis: 10_000
)

# When performing retries, each attempt will be logged via OCI.logger (if one is defined)
OCI.logger = Logger.new(STDOUT)

# Retries can be set at the client level by passing the retry_config keyword argument in the constructor.
# The provided config will then become the default used in all operations. This can be overridden using
# an operation-level retry_config, as demonstrated later on in this example
blockstorage_client = OCI::Core::BlockstorageClient.new(retry_config: example_retry_config)

# This call will use the retries defined at the client level
create_volume_response = blockstorage_client.create_volume(
  OCI::Core::Models::CreateVolumeDetails.new(
    compartment_id: compartment_id,
    availability_domain: availability_domain
  )
)
puts 'Created Volume'

# Here the get_volume call does not use retries as we pass an explicit nil as a parameter to the operation.
# This overrides any retry configuration set at the client level
get_volume_response = blockstorage_client.get_volume(
  create_volume_response.data.id,
  retry_config: nil
)

get_volume_response.wait_until(
  :lifecycle_state,
  OCI::Core::Models::Volume::LIFECYCLE_STATE_AVAILABLE
)
puts 'Volume Available'

# Here we have a client which does not have retries set at the client level (i.e. none of the operations retry
# by default) but we can apply retries at the operation level by passing a retry_config to the operation
blockstorage_client_without_client_level_retries = OCI::Core::BlockstorageClient.new
blockstorage_client_without_client_level_retries.delete_volume(
  get_volume_response.data.id,
  retry_config: example_retry_config
)
puts 'Volume Detailed'

puts 'Script Finished'
