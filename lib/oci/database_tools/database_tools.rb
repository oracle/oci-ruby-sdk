# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DatabaseTools
    # Module containing models for requests made to, and responses received from,
    # OCI DatabaseTools services
    module Models
    end
  end
end

# Require models
require 'oci/database_tools/models/action_type'
require 'oci/database_tools/models/change_database_tools_connection_compartment_details'
require 'oci/database_tools/models/change_database_tools_private_endpoint_compartment_details'
require 'oci/database_tools/models/connection_type'
require 'oci/database_tools/models/create_database_tools_connection_details'
require 'oci/database_tools/models/create_database_tools_connection_oracle_database_details'
require 'oci/database_tools/models/create_database_tools_private_endpoint_details'
require 'oci/database_tools/models/create_database_tools_related_resource_details'
require 'oci/database_tools/models/database_tools_allowed_network_sources'
require 'oci/database_tools/models/database_tools_connection'
require 'oci/database_tools/models/database_tools_connection_collection'
require 'oci/database_tools/models/database_tools_connection_oracle_database'
require 'oci/database_tools/models/database_tools_connection_oracle_database_summary'
require 'oci/database_tools/models/database_tools_connection_summary'
require 'oci/database_tools/models/database_tools_endpoint_service'
require 'oci/database_tools/models/database_tools_endpoint_service_collection'
require 'oci/database_tools/models/database_tools_endpoint_service_summary'
require 'oci/database_tools/models/database_tools_key_store'
require 'oci/database_tools/models/database_tools_key_store_content'
require 'oci/database_tools/models/database_tools_key_store_content_details'
require 'oci/database_tools/models/database_tools_key_store_content_secret_id'
require 'oci/database_tools/models/database_tools_key_store_content_secret_id_details'
require 'oci/database_tools/models/database_tools_key_store_content_secret_id_summary'
require 'oci/database_tools/models/database_tools_key_store_content_summary'
require 'oci/database_tools/models/database_tools_key_store_details'
require 'oci/database_tools/models/database_tools_key_store_password'
require 'oci/database_tools/models/database_tools_key_store_password_details'
require 'oci/database_tools/models/database_tools_key_store_password_secret_id'
require 'oci/database_tools/models/database_tools_key_store_password_secret_id_details'
require 'oci/database_tools/models/database_tools_key_store_password_secret_id_summary'
require 'oci/database_tools/models/database_tools_key_store_password_summary'
require 'oci/database_tools/models/database_tools_key_store_summary'
require 'oci/database_tools/models/database_tools_private_endpoint'
require 'oci/database_tools/models/database_tools_private_endpoint_collection'
require 'oci/database_tools/models/database_tools_private_endpoint_reverse_connection_configuration'
require 'oci/database_tools/models/database_tools_private_endpoint_reverse_connections_source_ip'
require 'oci/database_tools/models/database_tools_private_endpoint_summary'
require 'oci/database_tools/models/database_tools_related_resource'
require 'oci/database_tools/models/database_tools_user_password'
require 'oci/database_tools/models/database_tools_user_password_details'
require 'oci/database_tools/models/database_tools_user_password_secret_id'
require 'oci/database_tools/models/database_tools_user_password_secret_id_details'
require 'oci/database_tools/models/database_tools_user_password_secret_id_summary'
require 'oci/database_tools/models/database_tools_user_password_summary'
require 'oci/database_tools/models/database_tools_virtual_source'
require 'oci/database_tools/models/key_store_type'
require 'oci/database_tools/models/lifecycle_state'
require 'oci/database_tools/models/operation_status'
require 'oci/database_tools/models/operation_type'
require 'oci/database_tools/models/related_resource_entity_type'
require 'oci/database_tools/models/service_capability'
require 'oci/database_tools/models/sort_order'
require 'oci/database_tools/models/update_database_tools_connection_details'
require 'oci/database_tools/models/update_database_tools_connection_oracle_database_details'
require 'oci/database_tools/models/update_database_tools_private_endpoint_details'
require 'oci/database_tools/models/update_database_tools_related_resource_details'
require 'oci/database_tools/models/validate_database_tools_connection_details'
require 'oci/database_tools/models/validate_database_tools_connection_oracle_database_details'
require 'oci/database_tools/models/validate_database_tools_connection_oracle_database_result'
require 'oci/database_tools/models/validate_database_tools_connection_result'
require 'oci/database_tools/models/work_request'
require 'oci/database_tools/models/work_request_collection'
require 'oci/database_tools/models/work_request_error'
require 'oci/database_tools/models/work_request_error_collection'
require 'oci/database_tools/models/work_request_log_entry'
require 'oci/database_tools/models/work_request_log_entry_collection'
require 'oci/database_tools/models/work_request_resource'
require 'oci/database_tools/models/work_request_summary'

# Require generated clients
require 'oci/database_tools/database_tools_client'
require 'oci/database_tools/database_tools_client_composite_operations'

# Require service utilities
require 'oci/database_tools/util'
