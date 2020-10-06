# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Sch
    # Module containing models for requests made to, and responses received from,
    # OCI Sch services
    module Models
    end
  end
end

# Require models
require 'oci/sch/models/action_type'
require 'oci/sch/models/change_service_connector_compartment_details'
require 'oci/sch/models/create_service_connector_details'
require 'oci/sch/models/functions_target_details'
require 'oci/sch/models/lifecycle_state'
require 'oci/sch/models/log_rule_task_details'
require 'oci/sch/models/log_source'
require 'oci/sch/models/logging_source_details'
require 'oci/sch/models/monitoring_target_details'
require 'oci/sch/models/notifications_target_details'
require 'oci/sch/models/object_storage_target_details'
require 'oci/sch/models/operation_status'
require 'oci/sch/models/operation_type'
require 'oci/sch/models/service_connector'
require 'oci/sch/models/service_connector_collection'
require 'oci/sch/models/service_connector_summary'
require 'oci/sch/models/sort_order'
require 'oci/sch/models/source_details'
require 'oci/sch/models/streaming_target_details'
require 'oci/sch/models/target_details'
require 'oci/sch/models/task_details'
require 'oci/sch/models/update_service_connector_details'
require 'oci/sch/models/work_request'
require 'oci/sch/models/work_request_collection'
require 'oci/sch/models/work_request_error'
require 'oci/sch/models/work_request_error_collection'
require 'oci/sch/models/work_request_log_entry'
require 'oci/sch/models/work_request_log_entry_collection'
require 'oci/sch/models/work_request_resource'

# Require generated clients
require 'oci/sch/service_connector_client'
require 'oci/sch/service_connector_client_composite_operations'

# Require service utilities
require 'oci/sch/util'
