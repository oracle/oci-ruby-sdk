# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module AppmgmtControl
    # Module containing models for requests made to, and responses received from,
    # OCI AppmgmtControl services
    module Models
    end
  end
end

# Require models
require 'oci/appmgmt_control/models/action_type'
require 'oci/appmgmt_control/models/monitored_instance'
require 'oci/appmgmt_control/models/monitored_instance_collection'
require 'oci/appmgmt_control/models/monitored_instance_summary'
require 'oci/appmgmt_control/models/operation_status'
require 'oci/appmgmt_control/models/operation_type'
require 'oci/appmgmt_control/models/sort_order'
require 'oci/appmgmt_control/models/work_request'
require 'oci/appmgmt_control/models/work_request_error'
require 'oci/appmgmt_control/models/work_request_error_collection'
require 'oci/appmgmt_control/models/work_request_log_entry'
require 'oci/appmgmt_control/models/work_request_log_entry_collection'
require 'oci/appmgmt_control/models/work_request_resource'
require 'oci/appmgmt_control/models/work_request_summary'
require 'oci/appmgmt_control/models/work_request_summary_collection'

# Require generated clients
require 'oci/appmgmt_control/appmgmt_control_client'
require 'oci/appmgmt_control/appmgmt_control_client_composite_operations'

# Require service utilities
require 'oci/appmgmt_control/util'