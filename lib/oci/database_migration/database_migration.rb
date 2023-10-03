# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210929

module OCI
  module DatabaseMigration
    # Module containing models for requests made to, and responses received from,
    # OCI DatabaseMigration services
    module Models
    end
  end
end

# Require models
require 'oci/database_migration/models/adb_dedicated_auto_create_tablespace_details'
require 'oci/database_migration/models/adb_dedicated_remap_target_tablespace_details'
require 'oci/database_migration/models/adb_serverles_tablespace_details'
require 'oci/database_migration/models/admin_credentials'
require 'oci/database_migration/models/advisor_report'
require 'oci/database_migration/models/advisor_report_bucket_details'
require 'oci/database_migration/models/advisor_report_location_details'
require 'oci/database_migration/models/advisor_results'
require 'oci/database_migration/models/advisor_settings'
require 'oci/database_migration/models/agent'
require 'oci/database_migration/models/agent_collection'
require 'oci/database_migration/models/agent_image_collection'
require 'oci/database_migration/models/agent_image_summary'
require 'oci/database_migration/models/agent_summary'
require 'oci/database_migration/models/aws_s3_data_transfer_medium_details'
require 'oci/database_migration/models/aws_s3_details'
require 'oci/database_migration/models/change_agent_compartment_details'
require 'oci/database_migration/models/change_connection_compartment_details'
require 'oci/database_migration/models/change_migration_compartment_details'
require 'oci/database_migration/models/clone_migration_details'
require 'oci/database_migration/models/connect_descriptor'
require 'oci/database_migration/models/connection'
require 'oci/database_migration/models/connection_collection'
require 'oci/database_migration/models/connection_summary'
require 'oci/database_migration/models/create_adb_dedicated_auto_create_tablespace_details'
require 'oci/database_migration/models/create_adb_dedicated_remap_target_tablespace_details'
require 'oci/database_migration/models/create_adb_serverles_tablespace_details'
require 'oci/database_migration/models/create_admin_credentials'
require 'oci/database_migration/models/create_advisor_settings'
require 'oci/database_migration/models/create_aws_s3_details'
require 'oci/database_migration/models/create_connect_descriptor'
require 'oci/database_migration/models/create_connection_details'
require 'oci/database_migration/models/create_curl_transfer_details'
require 'oci/database_migration/models/create_data_pump_parameters'
require 'oci/database_migration/models/create_data_pump_settings'
require 'oci/database_migration/models/create_data_transfer_medium_details'
require 'oci/database_migration/models/create_database_link_details'
require 'oci/database_migration/models/create_directory_object'
require 'oci/database_migration/models/create_dump_transfer_details'
require 'oci/database_migration/models/create_extract'
require 'oci/database_migration/models/create_golden_gate_details'
require 'oci/database_migration/models/create_golden_gate_hub'
require 'oci/database_migration/models/create_golden_gate_service_details'
require 'oci/database_migration/models/create_golden_gate_settings'
require 'oci/database_migration/models/create_host_dump_transfer_details'
require 'oci/database_migration/models/create_migration_details'
require 'oci/database_migration/models/create_non_adb_auto_create_tablespace_details'
require 'oci/database_migration/models/create_non_adb_remap_tablespace_details'
require 'oci/database_migration/models/create_object_store_bucket'
require 'oci/database_migration/models/create_oci_cli_dump_transfer_details'
require 'oci/database_migration/models/create_private_endpoint'
require 'oci/database_migration/models/create_replicat'
require 'oci/database_migration/models/create_ssh_details'
require 'oci/database_migration/models/create_target_type_tablespace_details'
require 'oci/database_migration/models/create_vault_details'
require 'oci/database_migration/models/curl_transfer_details'
require 'oci/database_migration/models/data_pump_estimate'
require 'oci/database_migration/models/data_pump_exclude_parameters'
require 'oci/database_migration/models/data_pump_job_mode'
require 'oci/database_migration/models/data_pump_parameters'
require 'oci/database_migration/models/data_pump_settings'
require 'oci/database_migration/models/data_pump_table_exists_action'
require 'oci/database_migration/models/data_pump_tablespace_block_sizes_in_kb'
require 'oci/database_migration/models/data_transfer_medium_details'
require 'oci/database_migration/models/data_transfer_medium_details_v2'
require 'oci/database_migration/models/database_connection_types'
require 'oci/database_migration/models/database_credentials'
require 'oci/database_migration/models/database_link_details'
require 'oci/database_migration/models/database_manual_connection_sub_types'
require 'oci/database_migration/models/database_object'
require 'oci/database_migration/models/db_link_data_transfer_medium_details'
require 'oci/database_migration/models/diagnostics_result'
require 'oci/database_migration/models/directory_object'
require 'oci/database_migration/models/dump_transfer_details'
require 'oci/database_migration/models/excluded_object_summary'
require 'oci/database_migration/models/excluded_object_summary_collection'
require 'oci/database_migration/models/extract'
require 'oci/database_migration/models/extract_performance_profile'
require 'oci/database_migration/models/ggs_deployment'
require 'oci/database_migration/models/golden_gate_details'
require 'oci/database_migration/models/golden_gate_hub'
require 'oci/database_migration/models/golden_gate_service_details'
require 'oci/database_migration/models/golden_gate_settings'
require 'oci/database_migration/models/host_dump_transfer_details'
require 'oci/database_migration/models/job'
require 'oci/database_migration/models/job_collection'
require 'oci/database_migration/models/job_lifecycle_states'
require 'oci/database_migration/models/job_output_summary'
require 'oci/database_migration/models/job_output_summary_collection'
require 'oci/database_migration/models/job_phase_status'
require 'oci/database_migration/models/job_summary'
require 'oci/database_migration/models/job_types'
require 'oci/database_migration/models/lifecycle_states'
require 'oci/database_migration/models/log_location_bucket_details'
require 'oci/database_migration/models/metadata_remap'
require 'oci/database_migration/models/migration'
require 'oci/database_migration/models/migration_collection'
require 'oci/database_migration/models/migration_database_target_types'
require 'oci/database_migration/models/migration_database_target_types_update'
require 'oci/database_migration/models/migration_job_progress_resource'
require 'oci/database_migration/models/migration_job_progress_summary'
require 'oci/database_migration/models/migration_lifecycle_states'
require 'oci/database_migration/models/migration_object_collection'
require 'oci/database_migration/models/migration_object_summary'
require 'oci/database_migration/models/migration_object_type_summary'
require 'oci/database_migration/models/migration_object_type_summary_collection'
require 'oci/database_migration/models/migration_phase_collection'
require 'oci/database_migration/models/migration_phase_summary'
require 'oci/database_migration/models/migration_status'
require 'oci/database_migration/models/migration_summary'
require 'oci/database_migration/models/migration_types'
require 'oci/database_migration/models/nfs_data_transfer_medium_details'
require 'oci/database_migration/models/non_adb_auto_create_tablespace_details'
require 'oci/database_migration/models/non_adb_remap_tablespace_details'
require 'oci/database_migration/models/object_status'
require 'oci/database_migration/models/object_storage_data_transfer_medium_details'
require 'oci/database_migration/models/object_store_bucket'
require 'oci/database_migration/models/oci_cli_dump_transfer_details'
require 'oci/database_migration/models/odms_job_phases'
require 'oci/database_migration/models/odms_phase_actions'
require 'oci/database_migration/models/operation_status'
require 'oci/database_migration/models/operation_types'
require 'oci/database_migration/models/phase_extract_entry'
require 'oci/database_migration/models/phase_extract_types'
require 'oci/database_migration/models/phase_status'
require 'oci/database_migration/models/private_endpoint_details'
require 'oci/database_migration/models/reason_keywords'
require 'oci/database_migration/models/replicat'
require 'oci/database_migration/models/replicat_performance_profile'
require 'oci/database_migration/models/result_error'
require 'oci/database_migration/models/result_type'
require 'oci/database_migration/models/resume_job_details'
require 'oci/database_migration/models/sort_orders'
require 'oci/database_migration/models/ssh_details'
require 'oci/database_migration/models/start_migration_details'
require 'oci/database_migration/models/target_type_tablespace_details'
require 'oci/database_migration/models/unsupported_database_object'
require 'oci/database_migration/models/update_adb_dedicated_auto_create_tablespace_details'
require 'oci/database_migration/models/update_adb_dedicated_remap_target_tablespace_details'
require 'oci/database_migration/models/update_adb_serverles_tablespace_details'
require 'oci/database_migration/models/update_admin_credentials'
require 'oci/database_migration/models/update_advisor_settings'
require 'oci/database_migration/models/update_agent_details'
require 'oci/database_migration/models/update_aws_s3_details'
require 'oci/database_migration/models/update_connect_descriptor'
require 'oci/database_migration/models/update_connection_details'
require 'oci/database_migration/models/update_curl_transfer_details'
require 'oci/database_migration/models/update_data_pump_parameters'
require 'oci/database_migration/models/update_data_pump_settings'
require 'oci/database_migration/models/update_data_transfer_medium_details'
require 'oci/database_migration/models/update_database_link_details'
require 'oci/database_migration/models/update_directory_object'
require 'oci/database_migration/models/update_dump_transfer_details'
require 'oci/database_migration/models/update_extract'
require 'oci/database_migration/models/update_golden_gate_details'
require 'oci/database_migration/models/update_golden_gate_hub'
require 'oci/database_migration/models/update_golden_gate_service_details'
require 'oci/database_migration/models/update_golden_gate_settings'
require 'oci/database_migration/models/update_host_dump_transfer_details'
require 'oci/database_migration/models/update_job_details'
require 'oci/database_migration/models/update_migration_details'
require 'oci/database_migration/models/update_non_adb_auto_create_tablespace_details'
require 'oci/database_migration/models/update_non_adb_remap_tablespace_details'
require 'oci/database_migration/models/update_object_store_bucket'
require 'oci/database_migration/models/update_oci_cli_dump_transfer_details'
require 'oci/database_migration/models/update_private_endpoint'
require 'oci/database_migration/models/update_replicat'
require 'oci/database_migration/models/update_ssh_details'
require 'oci/database_migration/models/update_target_defaults_auto_create_tablespace_details'
require 'oci/database_migration/models/update_target_defaults_remap_tablespace_details'
require 'oci/database_migration/models/update_target_type_tablespace_details'
require 'oci/database_migration/models/update_vault_details'
require 'oci/database_migration/models/vault_details'
require 'oci/database_migration/models/work_request'
require 'oci/database_migration/models/work_request_collection'
require 'oci/database_migration/models/work_request_error'
require 'oci/database_migration/models/work_request_error_collection'
require 'oci/database_migration/models/work_request_log_entry'
require 'oci/database_migration/models/work_request_log_entry_collection'
require 'oci/database_migration/models/work_request_resource'
require 'oci/database_migration/models/work_request_summary'

# Require generated clients
require 'oci/database_migration/database_migration_client'
require 'oci/database_migration/database_migration_client_composite_operations'

# Require service utilities
require 'oci/database_migration/util'
