# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20190101

module OCI
  module DataScience
    # Module containing models for requests made to, and responses received from,
    # OCI DataScience services
    module Models
    end
  end
end

# Require models
require 'oci/data_science/models/artifact_export_details'
require 'oci/data_science/models/artifact_export_details_object_storage'
require 'oci/data_science/models/artifact_import_details'
require 'oci/data_science/models/artifact_import_details_object_storage'
require 'oci/data_science/models/artifact_source_type'
require 'oci/data_science/models/auto_scaling_policy'
require 'oci/data_science/models/auto_scaling_policy_details'
require 'oci/data_science/models/category_log_details'
require 'oci/data_science/models/change_data_science_private_endpoint_compartment_details'
require 'oci/data_science/models/change_job_compartment_details'
require 'oci/data_science/models/change_job_run_compartment_details'
require 'oci/data_science/models/change_model_compartment_details'
require 'oci/data_science/models/change_model_deployment_compartment_details'
require 'oci/data_science/models/change_model_version_set_compartment_details'
require 'oci/data_science/models/change_notebook_session_compartment_details'
require 'oci/data_science/models/change_pipeline_compartment_details'
require 'oci/data_science/models/change_pipeline_run_compartment_details'
require 'oci/data_science/models/change_project_compartment_details'
require 'oci/data_science/models/create_data_science_private_endpoint_details'
require 'oci/data_science/models/create_job_details'
require 'oci/data_science/models/create_job_run_details'
require 'oci/data_science/models/create_model_deployment_details'
require 'oci/data_science/models/create_model_details'
require 'oci/data_science/models/create_model_provenance_details'
require 'oci/data_science/models/create_model_version_set_details'
require 'oci/data_science/models/create_notebook_session_details'
require 'oci/data_science/models/create_pipeline_details'
require 'oci/data_science/models/create_pipeline_run_details'
require 'oci/data_science/models/create_project_details'
require 'oci/data_science/models/custom_expression_query_scaling_configuration'
require 'oci/data_science/models/custom_metric_expression_rule'
require 'oci/data_science/models/data_science_private_endpoint'
require 'oci/data_science/models/data_science_private_endpoint_lifecycle_state'
require 'oci/data_science/models/data_science_private_endpoint_summary'
require 'oci/data_science/models/data_science_resource_type'
require 'oci/data_science/models/default_job_configuration_details'
require 'oci/data_science/models/default_model_deployment_environment_configuration_details'
require 'oci/data_science/models/export_model_artifact_details'
require 'oci/data_science/models/fast_launch_job_config_summary'
require 'oci/data_science/models/file_storage_mount_configuration_details'
require 'oci/data_science/models/fixed_size_scaling_policy'
require 'oci/data_science/models/import_model_artifact_details'
require 'oci/data_science/models/instance_configuration'
require 'oci/data_science/models/instance_pool_model_deployment_system_data'
require 'oci/data_science/models/job'
require 'oci/data_science/models/job_configuration_details'
require 'oci/data_science/models/job_environment_configuration_details'
require 'oci/data_science/models/job_infrastructure_configuration_details'
require 'oci/data_science/models/job_lifecycle_state'
require 'oci/data_science/models/job_log_configuration_details'
require 'oci/data_science/models/job_run'
require 'oci/data_science/models/job_run_lifecycle_state'
require 'oci/data_science/models/job_run_log_details'
require 'oci/data_science/models/job_run_summary'
require 'oci/data_science/models/job_shape_config_details'
require 'oci/data_science/models/job_shape_summary'
require 'oci/data_science/models/job_summary'
require 'oci/data_science/models/log_details'
require 'oci/data_science/models/managed_egress_standalone_job_infrastructure_configuration_details'
require 'oci/data_science/models/metadata'
require 'oci/data_science/models/metric_expression_rule'
require 'oci/data_science/models/model'
require 'oci/data_science/models/model_configuration_details'
require 'oci/data_science/models/model_deployment'
require 'oci/data_science/models/model_deployment_configuration_details'
require 'oci/data_science/models/model_deployment_environment_configuration_details'
require 'oci/data_science/models/model_deployment_environment_configuration_type'
require 'oci/data_science/models/model_deployment_instance_shape_config_details'
require 'oci/data_science/models/model_deployment_lifecycle_state'
require 'oci/data_science/models/model_deployment_shape_series'
require 'oci/data_science/models/model_deployment_shape_summary'
require 'oci/data_science/models/model_deployment_summary'
require 'oci/data_science/models/model_deployment_system_data'
require 'oci/data_science/models/model_deployment_type'
require 'oci/data_science/models/model_lifecycle_state'
require 'oci/data_science/models/model_provenance'
require 'oci/data_science/models/model_summary'
require 'oci/data_science/models/model_version_set'
require 'oci/data_science/models/model_version_set_lifecycle_state'
require 'oci/data_science/models/model_version_set_summary'
require 'oci/data_science/models/notebook_session'
require 'oci/data_science/models/notebook_session_config_details'
require 'oci/data_science/models/notebook_session_configuration_details'
require 'oci/data_science/models/notebook_session_git_config_details'
require 'oci/data_science/models/notebook_session_git_repo_config_details'
require 'oci/data_science/models/notebook_session_lifecycle_state'
require 'oci/data_science/models/notebook_session_runtime_config_details'
require 'oci/data_science/models/notebook_session_shape_config_details'
require 'oci/data_science/models/notebook_session_shape_series'
require 'oci/data_science/models/notebook_session_shape_summary'
require 'oci/data_science/models/notebook_session_summary'
require 'oci/data_science/models/object_storage_mount_configuration_details'
require 'oci/data_science/models/ocir_container_job_environment_configuration_details'
require 'oci/data_science/models/ocir_model_deployment_environment_configuration_details'
require 'oci/data_science/models/pipeline'
require 'oci/data_science/models/pipeline_configuration_details'
require 'oci/data_science/models/pipeline_custom_script_step_details'
require 'oci/data_science/models/pipeline_custom_script_step_run'
require 'oci/data_science/models/pipeline_custom_script_step_update_details'
require 'oci/data_science/models/pipeline_default_configuration_details'
require 'oci/data_science/models/pipeline_infrastructure_configuration_details'
require 'oci/data_science/models/pipeline_lifecycle_state'
require 'oci/data_science/models/pipeline_log_configuration_details'
require 'oci/data_science/models/pipeline_ml_job_step_details'
require 'oci/data_science/models/pipeline_ml_job_step_run'
require 'oci/data_science/models/pipeline_ml_job_step_update_details'
require 'oci/data_science/models/pipeline_run'
require 'oci/data_science/models/pipeline_run_lifecycle_state'
require 'oci/data_science/models/pipeline_run_log_details'
require 'oci/data_science/models/pipeline_run_summary'
require 'oci/data_science/models/pipeline_shape_config_details'
require 'oci/data_science/models/pipeline_step_configuration_details'
require 'oci/data_science/models/pipeline_step_details'
require 'oci/data_science/models/pipeline_step_override_details'
require 'oci/data_science/models/pipeline_step_run'
require 'oci/data_science/models/pipeline_step_update_details'
require 'oci/data_science/models/pipeline_summary'
require 'oci/data_science/models/predefined_expression_threshold_scaling_configuration'
require 'oci/data_science/models/predefined_metric_expression_rule'
require 'oci/data_science/models/project'
require 'oci/data_science/models/project_lifecycle_state'
require 'oci/data_science/models/project_summary'
require 'oci/data_science/models/scaling_configuration'
require 'oci/data_science/models/scaling_policy'
require 'oci/data_science/models/single_model_deployment_configuration_details'
require 'oci/data_science/models/standalone_job_infrastructure_configuration_details'
require 'oci/data_science/models/storage_mount_configuration_details'
require 'oci/data_science/models/threshold_based_auto_scaling_policy_details'
require 'oci/data_science/models/update_category_log_details'
require 'oci/data_science/models/update_data_science_private_endpoint_details'
require 'oci/data_science/models/update_default_model_deployment_environment_configuration_details'
require 'oci/data_science/models/update_job_details'
require 'oci/data_science/models/update_job_run_details'
require 'oci/data_science/models/update_model_configuration_details'
require 'oci/data_science/models/update_model_deployment_configuration_details'
require 'oci/data_science/models/update_model_deployment_details'
require 'oci/data_science/models/update_model_deployment_environment_configuration_details'
require 'oci/data_science/models/update_model_details'
require 'oci/data_science/models/update_model_provenance_details'
require 'oci/data_science/models/update_model_version_set_details'
require 'oci/data_science/models/update_notebook_session_details'
require 'oci/data_science/models/update_ocir_model_deployment_environment_configuration_details'
require 'oci/data_science/models/update_pipeline_details'
require 'oci/data_science/models/update_pipeline_run_details'
require 'oci/data_science/models/update_project_details'
require 'oci/data_science/models/update_single_model_deployment_configuration_details'
require 'oci/data_science/models/work_request'
require 'oci/data_science/models/work_request_error'
require 'oci/data_science/models/work_request_log_entry'
require 'oci/data_science/models/work_request_operation_type'
require 'oci/data_science/models/work_request_resource'
require 'oci/data_science/models/work_request_status'
require 'oci/data_science/models/work_request_summary'

# Require generated clients
require 'oci/data_science/data_science_client'
require 'oci/data_science/data_science_client_composite_operations'

# Require service utilities
require 'oci/data_science/util'
