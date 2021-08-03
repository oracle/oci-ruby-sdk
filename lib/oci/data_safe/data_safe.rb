# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DataSafe
    # Module containing models for requests made to, and responses received from,
    # OCI DataSafe services
    module Models
    end
  end
end

# Require models
require 'oci/data_safe/models/activate_target_database_details'
require 'oci/data_safe/models/autonomous_database_details'
require 'oci/data_safe/models/change_data_safe_private_endpoint_compartment_details'
require 'oci/data_safe/models/change_on_prem_connector_compartment_details'
require 'oci/data_safe/models/change_target_database_compartment_details'
require 'oci/data_safe/models/connection_option'
require 'oci/data_safe/models/create_data_safe_private_endpoint_details'
require 'oci/data_safe/models/create_on_prem_connector_details'
require 'oci/data_safe/models/create_target_database_details'
require 'oci/data_safe/models/credentials'
require 'oci/data_safe/models/data_safe_configuration'
require 'oci/data_safe/models/data_safe_private_endpoint'
require 'oci/data_safe/models/data_safe_private_endpoint_summary'
require 'oci/data_safe/models/database_cloud_service_details'
require 'oci/data_safe/models/database_details'
require 'oci/data_safe/models/database_type'
require 'oci/data_safe/models/enable_data_safe_configuration_details'
require 'oci/data_safe/models/generate_on_prem_connector_configuration_details'
require 'oci/data_safe/models/infrastructure_type'
require 'oci/data_safe/models/installed_database_details'
require 'oci/data_safe/models/lifecycle_state'
require 'oci/data_safe/models/on_prem_connector'
require 'oci/data_safe/models/on_prem_connector_lifecycle_state'
require 'oci/data_safe/models/on_prem_connector_summary'
require 'oci/data_safe/models/on_premise_connector'
require 'oci/data_safe/models/private_endpoint'
require 'oci/data_safe/models/service_list'
require 'oci/data_safe/models/target_database'
require 'oci/data_safe/models/target_database_lifecycle_state'
require 'oci/data_safe/models/target_database_summary'
require 'oci/data_safe/models/tls_config'
require 'oci/data_safe/models/update_data_safe_private_endpoint_details'
require 'oci/data_safe/models/update_on_prem_connector_details'
require 'oci/data_safe/models/update_on_prem_connector_wallet_details'
require 'oci/data_safe/models/update_target_database_details'
require 'oci/data_safe/models/work_request'
require 'oci/data_safe/models/work_request_error'
require 'oci/data_safe/models/work_request_log_entry'
require 'oci/data_safe/models/work_request_resource'
require 'oci/data_safe/models/work_request_summary'

# Require generated clients
require 'oci/data_safe/data_safe_client'
require 'oci/data_safe/data_safe_client_composite_operations'

# Require service utilities
require 'oci/data_safe/util'
