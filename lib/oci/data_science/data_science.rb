# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DataScience
    # Module containing models for requests made to, and responses received from,
    # OCI DataScience services
    module Models
    end
  end
end

# Require models
require 'oci/data_science/models/change_model_compartment_details'
require 'oci/data_science/models/change_notebook_session_compartment_details'
require 'oci/data_science/models/change_project_compartment_details'
require 'oci/data_science/models/create_model_details'
require 'oci/data_science/models/create_model_provenance_details'
require 'oci/data_science/models/create_notebook_session_details'
require 'oci/data_science/models/create_project_details'
require 'oci/data_science/models/model'
require 'oci/data_science/models/model_lifecycle_state'
require 'oci/data_science/models/model_provenance'
require 'oci/data_science/models/model_summary'
require 'oci/data_science/models/notebook_session'
require 'oci/data_science/models/notebook_session_configuration_details'
require 'oci/data_science/models/notebook_session_lifecycle_state'
require 'oci/data_science/models/notebook_session_shape_summary'
require 'oci/data_science/models/notebook_session_summary'
require 'oci/data_science/models/project'
require 'oci/data_science/models/project_lifecycle_state'
require 'oci/data_science/models/project_summary'
require 'oci/data_science/models/update_model_details'
require 'oci/data_science/models/update_model_provenance_details'
require 'oci/data_science/models/update_notebook_session_details'
require 'oci/data_science/models/update_project_details'
require 'oci/data_science/models/work_request'
require 'oci/data_science/models/work_request_error'
require 'oci/data_science/models/work_request_log_entry'
require 'oci/data_science/models/work_request_operation_type'
require 'oci/data_science/models/work_request_resource'
require 'oci/data_science/models/work_request_status'
require 'oci/data_science/models/work_request_summary'

# Require generated clients
require 'oci/data_science/data_science_client'
require 'oci/data_science/data_science_client_composite_operations'

# Require service utilities
require 'oci/data_science/util'
