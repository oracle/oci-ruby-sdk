# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Oda
    # Module containing models for requests made to, and responses received from,
    # OCI Oda services
    module Models
    end
  end
end

# Require models
require 'oci/oda/models/change_oda_instance_compartment_details'
require 'oci/oda/models/create_oda_instance_details'
require 'oci/oda/models/error_body'
require 'oci/oda/models/oda_instance'
require 'oci/oda/models/oda_instance_summary'
require 'oci/oda/models/update_oda_instance_details'
require 'oci/oda/models/work_request'
require 'oci/oda/models/work_request_error'
require 'oci/oda/models/work_request_log_entry'
require 'oci/oda/models/work_request_resource'
require 'oci/oda/models/work_request_summary'

# Require generated clients
require 'oci/oda/oda_client'
require 'oci/oda/oda_client_composite_operations'

# Require service utilities
require 'oci/oda/util'
