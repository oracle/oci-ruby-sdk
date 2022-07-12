# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Adm
    # Module containing models for requests made to, and responses received from,
    # OCI Adm services
    module Models
    end
  end
end

# Require models
require 'oci/adm/models/action_type'
require 'oci/adm/models/application_dependency'
require 'oci/adm/models/application_dependency_vulnerability_collection'
require 'oci/adm/models/application_dependency_vulnerability_summary'
require 'oci/adm/models/change_knowledge_base_compartment_details'
require 'oci/adm/models/change_vulnerability_audit_compartment_details'
require 'oci/adm/models/create_knowledge_base_details'
require 'oci/adm/models/create_vulnerability_audit_details'
require 'oci/adm/models/knowledge_base'
require 'oci/adm/models/knowledge_base_collection'
require 'oci/adm/models/knowledge_base_summary'
require 'oci/adm/models/operation_status'
require 'oci/adm/models/operation_type'
require 'oci/adm/models/sort_order'
require 'oci/adm/models/update_knowledge_base_details'
require 'oci/adm/models/update_vulnerability_audit_details'
require 'oci/adm/models/vulnerability'
require 'oci/adm/models/vulnerability_audit'
require 'oci/adm/models/vulnerability_audit_collection'
require 'oci/adm/models/vulnerability_audit_configuration'
require 'oci/adm/models/vulnerability_audit_summary'
require 'oci/adm/models/work_request'
require 'oci/adm/models/work_request_error'
require 'oci/adm/models/work_request_error_collection'
require 'oci/adm/models/work_request_log_entry'
require 'oci/adm/models/work_request_log_entry_collection'
require 'oci/adm/models/work_request_resource'
require 'oci/adm/models/work_request_resource_metadata_key'
require 'oci/adm/models/work_request_summary'
require 'oci/adm/models/work_request_summary_collection'

# Require generated clients
require 'oci/adm/application_dependency_management_client'
require 'oci/adm/application_dependency_management_client_composite_operations'

# Require service utilities
require 'oci/adm/util'
