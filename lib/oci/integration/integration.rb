# Copyright (c) 2016, 2020, Oracle and/or its affiliates. All rights reserved.

module OCI
  module Integration
    # Module containing models for requests made to, and responses received from,
    # OCI Integration services
    module Models
    end
  end
end

# Require models
require 'oci/integration/models/change_integration_instance_compartment_details'
require 'oci/integration/models/create_integration_instance_details'
require 'oci/integration/models/integration_instance'
require 'oci/integration/models/integration_instance_summary'
require 'oci/integration/models/update_integration_instance_details'
require 'oci/integration/models/work_request'
require 'oci/integration/models/work_request_error'
require 'oci/integration/models/work_request_log_entry'
require 'oci/integration/models/work_request_resource'
require 'oci/integration/models/work_request_summary'

# Require generated clients
require 'oci/integration/integration_instance_client'
require 'oci/integration/integration_instance_client_composite_operations'

# Require service utilities
require 'oci/integration/util'
