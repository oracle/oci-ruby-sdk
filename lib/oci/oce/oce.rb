# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Oce
    # Module containing models for requests made to, and responses received from,
    # OCI Oce services
    module Models
    end
  end
end

# Require models
require 'oci/oce/models/change_oce_instance_compartment_details'
require 'oci/oce/models/create_oce_instance_details'
require 'oci/oce/models/identity_stripe_details'
require 'oci/oce/models/license_type'
require 'oci/oce/models/oce_instance'
require 'oci/oce/models/oce_instance_summary'
require 'oci/oce/models/update_oce_instance_details'
require 'oci/oce/models/work_request'
require 'oci/oce/models/work_request_error'
require 'oci/oce/models/work_request_log_entry'
require 'oci/oce/models/work_request_resource'
require 'oci/oce/models/workflow_monitor'
require 'oci/oce/models/workflow_step'

# Require generated clients
require 'oci/oce/oce_instance_client'
require 'oci/oce/oce_instance_client_composite_operations'

# Require service utilities
require 'oci/oce/util'
