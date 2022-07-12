# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module VisualBuilder
    # Module containing models for requests made to, and responses received from,
    # OCI VisualBuilder services
    module Models
    end
  end
end

# Require models
require 'oci/visual_builder/models/application_summary'
require 'oci/visual_builder/models/application_summary_collection'
require 'oci/visual_builder/models/attachment_details'
require 'oci/visual_builder/models/change_vb_instance_compartment_details'
require 'oci/visual_builder/models/create_custom_endpoint_details'
require 'oci/visual_builder/models/create_vb_instance_details'
require 'oci/visual_builder/models/custom_endpoint_details'
require 'oci/visual_builder/models/idcs_info_details'
require 'oci/visual_builder/models/request_summarized_applications_details'
require 'oci/visual_builder/models/update_custom_endpoint_details'
require 'oci/visual_builder/models/update_vb_instance_details'
require 'oci/visual_builder/models/vb_instance'
require 'oci/visual_builder/models/vb_instance_summary'
require 'oci/visual_builder/models/vb_instance_summary_collection'
require 'oci/visual_builder/models/work_request'
require 'oci/visual_builder/models/work_request_error'
require 'oci/visual_builder/models/work_request_error_collection'
require 'oci/visual_builder/models/work_request_log_entry'
require 'oci/visual_builder/models/work_request_log_entry_collection'
require 'oci/visual_builder/models/work_request_resource'
require 'oci/visual_builder/models/work_request_summary'
require 'oci/visual_builder/models/work_request_summary_collection'

# Require generated clients
require 'oci/visual_builder/vb_instance_client'
require 'oci/visual_builder/vb_instance_client_composite_operations'

# Require service utilities
require 'oci/visual_builder/util'
