# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module StackMonitoring
    # Module containing models for requests made to, and responses received from,
    # OCI StackMonitoring services
    module Models
    end
  end
end

# Require models
require 'oci/stack_monitoring/models/action_type'
require 'oci/stack_monitoring/models/associate_monitored_resources_details'
require 'oci/stack_monitoring/models/association_resource_details'
require 'oci/stack_monitoring/models/change_monitored_resource_compartment_details'
require 'oci/stack_monitoring/models/connection_details'
require 'oci/stack_monitoring/models/create_discovery_job_details'
require 'oci/stack_monitoring/models/create_monitored_resource_details'
require 'oci/stack_monitoring/models/credential_collection'
require 'oci/stack_monitoring/models/credential_details'
require 'oci/stack_monitoring/models/credential_property'
require 'oci/stack_monitoring/models/disassociate_monitored_resources_details'
require 'oci/stack_monitoring/models/discovery_details'
require 'oci/stack_monitoring/models/discovery_job'
require 'oci/stack_monitoring/models/discovery_job_collection'
require 'oci/stack_monitoring/models/discovery_job_log_collection'
require 'oci/stack_monitoring/models/discovery_job_log_summary'
require 'oci/stack_monitoring/models/discovery_job_summary'
require 'oci/stack_monitoring/models/encrypted_credentials'
require 'oci/stack_monitoring/models/lifecycle_state'
require 'oci/stack_monitoring/models/monitored_resource'
require 'oci/stack_monitoring/models/monitored_resource_alias_credential'
require 'oci/stack_monitoring/models/monitored_resource_alias_source_credential'
require 'oci/stack_monitoring/models/monitored_resource_association'
require 'oci/stack_monitoring/models/monitored_resource_association_summary'
require 'oci/stack_monitoring/models/monitored_resource_associations_collection'
require 'oci/stack_monitoring/models/monitored_resource_collection'
require 'oci/stack_monitoring/models/monitored_resource_credential'
require 'oci/stack_monitoring/models/monitored_resource_member_summary'
require 'oci/stack_monitoring/models/monitored_resource_members_collection'
require 'oci/stack_monitoring/models/monitored_resource_property'
require 'oci/stack_monitoring/models/monitored_resource_summary'
require 'oci/stack_monitoring/models/operation_status'
require 'oci/stack_monitoring/models/operation_type'
require 'oci/stack_monitoring/models/plain_text_credentials'
require 'oci/stack_monitoring/models/pre_existing_credentials'
require 'oci/stack_monitoring/models/property_details'
require 'oci/stack_monitoring/models/resource_lifecycle_state'
require 'oci/stack_monitoring/models/search_monitored_resource_associations_details'
require 'oci/stack_monitoring/models/search_monitored_resource_members_details'
require 'oci/stack_monitoring/models/search_monitored_resources_details'
require 'oci/stack_monitoring/models/sort_order'
require 'oci/stack_monitoring/models/update_monitored_resource_details'
require 'oci/stack_monitoring/models/work_request'
require 'oci/stack_monitoring/models/work_request_error'
require 'oci/stack_monitoring/models/work_request_error_collection'
require 'oci/stack_monitoring/models/work_request_log_entry'
require 'oci/stack_monitoring/models/work_request_log_entry_collection'
require 'oci/stack_monitoring/models/work_request_resource'
require 'oci/stack_monitoring/models/work_request_summary'
require 'oci/stack_monitoring/models/work_request_summary_collection'

# Require generated clients
require 'oci/stack_monitoring/stack_monitoring_client'
require 'oci/stack_monitoring/stack_monitoring_client_composite_operations'

# Require service utilities
require 'oci/stack_monitoring/util'
