# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Jms
    # Module containing models for requests made to, and responses received from,
    # OCI Jms services
    module Models
    end
  end
end

# Require models
require 'oci/jms/models/action_type'
require 'oci/jms/models/application_sort_by'
require 'oci/jms/models/application_usage'
require 'oci/jms/models/application_usage_collection'
require 'oci/jms/models/change_fleet_compartment_details'
require 'oci/jms/models/create_fleet_details'
require 'oci/jms/models/fleet'
require 'oci/jms/models/fleet_agent_configuration'
require 'oci/jms/models/fleet_agent_os_configuration'
require 'oci/jms/models/fleet_collection'
require 'oci/jms/models/fleet_summary'
require 'oci/jms/models/installation_sort_by'
require 'oci/jms/models/installation_usage'
require 'oci/jms/models/installation_usage_collection'
require 'oci/jms/models/jre_security_status'
require 'oci/jms/models/jre_sort_by'
require 'oci/jms/models/jre_usage'
require 'oci/jms/models/jre_usage_collection'
require 'oci/jms/models/lifecycle_state'
require 'oci/jms/models/managed_instance_sort_by'
require 'oci/jms/models/managed_instance_type'
require 'oci/jms/models/managed_instance_usage'
require 'oci/jms/models/managed_instance_usage_collection'
require 'oci/jms/models/operating_system'
require 'oci/jms/models/operation_status'
require 'oci/jms/models/operation_type'
require 'oci/jms/models/os_family'
require 'oci/jms/models/resource_inventory'
require 'oci/jms/models/sort_by'
require 'oci/jms/models/sort_order'
require 'oci/jms/models/summarize_application_usage_fields'
require 'oci/jms/models/summarize_installation_usage_fields'
require 'oci/jms/models/summarize_jre_usage_fields'
require 'oci/jms/models/summarize_managed_instance_usage_fields'
require 'oci/jms/models/update_fleet_agent_configuration_details'
require 'oci/jms/models/update_fleet_details'
require 'oci/jms/models/work_request'
require 'oci/jms/models/work_request_collection'
require 'oci/jms/models/work_request_error'
require 'oci/jms/models/work_request_error_collection'
require 'oci/jms/models/work_request_log_entry'
require 'oci/jms/models/work_request_log_entry_collection'
require 'oci/jms/models/work_request_resource'

# Require generated clients
require 'oci/jms/java_management_service_client'
require 'oci/jms/java_management_service_client_composite_operations'

# Require service utilities
require 'oci/jms/util'
