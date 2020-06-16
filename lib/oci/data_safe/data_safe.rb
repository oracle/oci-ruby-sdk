# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DataSafe
    # Module containing models for requests made to, and responses received from,
    # OCI DataSafe services
    module Models
    end
  end
end

# Require models
require 'oci/data_safe/models/change_data_safe_private_endpoint_compartment_details'
require 'oci/data_safe/models/create_data_safe_private_endpoint_details'
require 'oci/data_safe/models/data_safe_configuration'
require 'oci/data_safe/models/data_safe_private_endpoint'
require 'oci/data_safe/models/data_safe_private_endpoint_summary'
require 'oci/data_safe/models/enable_data_safe_configuration_details'
require 'oci/data_safe/models/lifecycle_state'
require 'oci/data_safe/models/service_list'
require 'oci/data_safe/models/update_data_safe_private_endpoint_details'
require 'oci/data_safe/models/work_request'
require 'oci/data_safe/models/work_request_error'
require 'oci/data_safe/models/work_request_log_entry'
require 'oci/data_safe/models/work_request_resource'
require 'oci/data_safe/models/work_request_summary'

# Require generated clients
require 'oci/data_safe/data_safe_client'
require 'oci/data_safe/data_safe_client_composite_operations'

# Require service utilities
require 'oci/data_safe/util'
