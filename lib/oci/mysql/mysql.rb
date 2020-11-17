# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Mysql
    # Module containing models for requests made to, and responses received from,
    # OCI Mysql services
    module Models
    end
  end
end

# Require models
require 'oci/mysql/models/add_analytics_cluster_details'
require 'oci/mysql/models/analytics_cluster'
require 'oci/mysql/models/analytics_cluster_memory_estimate'
require 'oci/mysql/models/analytics_cluster_memory_estimate_status'
require 'oci/mysql/models/analytics_cluster_node'
require 'oci/mysql/models/analytics_cluster_schema_memory_estimate'
require 'oci/mysql/models/analytics_cluster_summary'
require 'oci/mysql/models/analytics_cluster_table_memory_estimate'
require 'oci/mysql/models/backup'
require 'oci/mysql/models/backup_policy'
require 'oci/mysql/models/backup_summary'
require 'oci/mysql/models/configuration'
require 'oci/mysql/models/configuration_summary'
require 'oci/mysql/models/configuration_variables'
require 'oci/mysql/models/create_backup_details'
require 'oci/mysql/models/create_backup_policy_details'
require 'oci/mysql/models/create_configuration_details'
require 'oci/mysql/models/create_db_system_details'
require 'oci/mysql/models/create_db_system_source_details'
require 'oci/mysql/models/create_db_system_source_from_backup_details'
require 'oci/mysql/models/create_db_system_source_import_from_url_details'
require 'oci/mysql/models/create_maintenance_details'
require 'oci/mysql/models/db_system'
require 'oci/mysql/models/db_system_endpoint'
require 'oci/mysql/models/db_system_source'
require 'oci/mysql/models/db_system_source_from_backup'
require 'oci/mysql/models/db_system_source_import_from_url'
require 'oci/mysql/models/db_system_summary'
require 'oci/mysql/models/inno_db_shutdown_mode'
require 'oci/mysql/models/maintenance_details'
require 'oci/mysql/models/restart_db_system_details'
require 'oci/mysql/models/shape_summary'
require 'oci/mysql/models/stop_db_system_details'
require 'oci/mysql/models/update_analytics_cluster_details'
require 'oci/mysql/models/update_backup_details'
require 'oci/mysql/models/update_backup_policy_details'
require 'oci/mysql/models/update_configuration_details'
require 'oci/mysql/models/update_db_system_details'
require 'oci/mysql/models/update_maintenance_details'
require 'oci/mysql/models/version'
require 'oci/mysql/models/version_summary'
require 'oci/mysql/models/work_request'
require 'oci/mysql/models/work_request_error'
require 'oci/mysql/models/work_request_log_entry'
require 'oci/mysql/models/work_request_operation_status'
require 'oci/mysql/models/work_request_operation_type'
require 'oci/mysql/models/work_request_resource'
require 'oci/mysql/models/work_request_resource_action_type'
require 'oci/mysql/models/work_request_summary'

# Require generated clients
require 'oci/mysql/db_backups_client'
require 'oci/mysql/db_backups_client_composite_operations'
require 'oci/mysql/db_system_client'
require 'oci/mysql/db_system_client_composite_operations'
require 'oci/mysql/mysqlaas_client'
require 'oci/mysql/mysqlaas_client_composite_operations'
require 'oci/mysql/work_requests_client'

# Require service utilities
require 'oci/mysql/util'
