# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Streaming
    # Module containing models for requests made to, and responses received from,
    # OCI Streaming services
    module Models
    end
  end
end

# Require models
require 'oci/streaming/models/change_connect_harness_compartment_details'
require 'oci/streaming/models/change_stream_compartment_details'
require 'oci/streaming/models/change_stream_pool_compartment_details'
require 'oci/streaming/models/connect_harness'
require 'oci/streaming/models/connect_harness_summary'
require 'oci/streaming/models/create_connect_harness_details'
require 'oci/streaming/models/create_cursor_details'
require 'oci/streaming/models/create_group_cursor_details'
require 'oci/streaming/models/create_stream_details'
require 'oci/streaming/models/create_stream_pool_details'
require 'oci/streaming/models/cursor'
require 'oci/streaming/models/custom_encryption_key'
require 'oci/streaming/models/custom_encryption_key_details'
require 'oci/streaming/models/group'
require 'oci/streaming/models/kafka_settings'
require 'oci/streaming/models/message'
require 'oci/streaming/models/partition_reservation'
require 'oci/streaming/models/private_endpoint_details'
require 'oci/streaming/models/private_endpoint_settings'
require 'oci/streaming/models/put_messages_details'
require 'oci/streaming/models/put_messages_details_entry'
require 'oci/streaming/models/put_messages_result'
require 'oci/streaming/models/put_messages_result_entry'
require 'oci/streaming/models/stream'
require 'oci/streaming/models/stream_pool'
require 'oci/streaming/models/stream_pool_summary'
require 'oci/streaming/models/stream_summary'
require 'oci/streaming/models/update_connect_harness_details'
require 'oci/streaming/models/update_group_details'
require 'oci/streaming/models/update_stream_details'
require 'oci/streaming/models/update_stream_pool_details'

# Require generated clients
require 'oci/streaming/stream_client'
require 'oci/streaming/stream_admin_client'
require 'oci/streaming/stream_admin_client_composite_operations'

# Require service utilities
require 'oci/streaming/util'
