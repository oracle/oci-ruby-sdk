# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module ResourceManager
    # Module containing models for requests made to, and responses received from,
    # OCI ResourceManager services
    module Models
    end
  end
end

# Require models
require 'oci/resource_manager/models/apply_job_plan_resolution'
require 'oci/resource_manager/models/change_stack_compartment_details'
require 'oci/resource_manager/models/config_source'
require 'oci/resource_manager/models/create_config_source_details'
require 'oci/resource_manager/models/create_job_details'
require 'oci/resource_manager/models/create_stack_details'
require 'oci/resource_manager/models/create_zip_upload_config_source_details'
require 'oci/resource_manager/models/failure_details'
require 'oci/resource_manager/models/job'
require 'oci/resource_manager/models/job_summary'
require 'oci/resource_manager/models/log_entry'
require 'oci/resource_manager/models/stack'
require 'oci/resource_manager/models/stack_summary'
require 'oci/resource_manager/models/update_config_source_details'
require 'oci/resource_manager/models/update_job_details'
require 'oci/resource_manager/models/update_stack_details'
require 'oci/resource_manager/models/update_zip_upload_config_source_details'
require 'oci/resource_manager/models/work_request'
require 'oci/resource_manager/models/work_request_error'
require 'oci/resource_manager/models/work_request_log_entry'
require 'oci/resource_manager/models/work_request_resource'
require 'oci/resource_manager/models/work_request_summary'
require 'oci/resource_manager/models/zip_upload_config_source'

# Require generated clients
require 'oci/resource_manager/resource_manager_client'
require 'oci/resource_manager/resource_manager_client_composite_operations'

# Require service utilities
require 'oci/resource_manager/util'
