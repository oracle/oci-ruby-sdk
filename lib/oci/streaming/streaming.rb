# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module Streaming
    # Module containing models for requests made to, and responses received from,
    # OCI Streaming services
    module Models
    end
  end
end

# Require models
require 'oci/streaming/models/archiver'
require 'oci/streaming/models/archiver_error'
require 'oci/streaming/models/archiver_lifecycle_state'
require 'oci/streaming/models/archiver_start_position'
require 'oci/streaming/models/change_stream_compartment_details'
require 'oci/streaming/models/create_archiver_details'
require 'oci/streaming/models/create_cursor_details'
require 'oci/streaming/models/create_group_cursor_details'
require 'oci/streaming/models/create_stream_details'
require 'oci/streaming/models/cursor'
require 'oci/streaming/models/group'
require 'oci/streaming/models/message'
require 'oci/streaming/models/partition_reservation'
require 'oci/streaming/models/put_messages_details'
require 'oci/streaming/models/put_messages_details_entry'
require 'oci/streaming/models/put_messages_result'
require 'oci/streaming/models/put_messages_result_entry'
require 'oci/streaming/models/stream'
require 'oci/streaming/models/stream_summary'
require 'oci/streaming/models/update_archiver_details'
require 'oci/streaming/models/update_group_details'
require 'oci/streaming/models/update_stream_details'

# Require generated clients
require 'oci/streaming/stream_client'
require 'oci/streaming/stream_admin_client'
require 'oci/streaming/stream_admin_client_composite_operations'

# Require service utilities
require 'oci/streaming/util'
