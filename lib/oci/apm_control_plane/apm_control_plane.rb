# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ApmControlPlane
    # Module containing models for requests made to, and responses received from,
    # OCI ApmControlPlane services
    module Models
    end
  end
end

# Require models
require 'oci/apm_control_plane/models/action_types'
require 'oci/apm_control_plane/models/apm_domain'
require 'oci/apm_control_plane/models/apm_domain_summary'
require 'oci/apm_control_plane/models/base_domain_details'
require 'oci/apm_control_plane/models/base_key_details'
require 'oci/apm_control_plane/models/change_apm_domain_compartment_details'
require 'oci/apm_control_plane/models/create_apm_domain_details'
require 'oci/apm_control_plane/models/data_key'
require 'oci/apm_control_plane/models/data_key_summary'
require 'oci/apm_control_plane/models/data_key_types'
require 'oci/apm_control_plane/models/generate_data_key_details'
require 'oci/apm_control_plane/models/lifecycle_states'
require 'oci/apm_control_plane/models/operation_status'
require 'oci/apm_control_plane/models/operation_types'
require 'oci/apm_control_plane/models/remove_data_key_details'
require 'oci/apm_control_plane/models/sort_orders'
require 'oci/apm_control_plane/models/update_apm_domain_details'
require 'oci/apm_control_plane/models/work_request'
require 'oci/apm_control_plane/models/work_request_error'
require 'oci/apm_control_plane/models/work_request_log_entry'
require 'oci/apm_control_plane/models/work_request_resource'

# Require generated clients
require 'oci/apm_control_plane/apm_domain_client'
require 'oci/apm_control_plane/apm_domain_client_composite_operations'

# Require service utilities
require 'oci/apm_control_plane/util'
