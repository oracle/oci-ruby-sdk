# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DataFlow
    # Module containing models for requests made to, and responses received from,
    # OCI DataFlow services
    module Models
    end
  end
end

# Require models
require 'oci/data_flow/models/application'
require 'oci/data_flow/models/application_language'
require 'oci/data_flow/models/application_lifecycle_state'
require 'oci/data_flow/models/application_parameter'
require 'oci/data_flow/models/application_summary'
require 'oci/data_flow/models/change_application_compartment_details'
require 'oci/data_flow/models/change_run_compartment_details'
require 'oci/data_flow/models/create_application_details'
require 'oci/data_flow/models/create_run_details'
require 'oci/data_flow/models/run'
require 'oci/data_flow/models/run_lifecycle_state'
require 'oci/data_flow/models/run_log_summary'
require 'oci/data_flow/models/run_summary'
require 'oci/data_flow/models/update_application_details'
require 'oci/data_flow/models/update_run_details'

# Require generated clients
require 'oci/data_flow/data_flow_client'
require 'oci/data_flow/data_flow_client_composite_operations'

# Require service utilities
require 'oci/data_flow/util'
