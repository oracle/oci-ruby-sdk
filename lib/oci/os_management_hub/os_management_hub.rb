# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220901

module OCI
  module OsManagementHub
    # Module containing models for requests made to, and responses received from,
    # OCI OsManagementHub services
    module Models
    end
  end
end

# Require models
require 'oci/os_management_hub/models/action_type'
require 'oci/os_management_hub/models/advisory_severity'
require 'oci/os_management_hub/models/arch_type'
require 'oci/os_management_hub/models/attach_managed_instances_to_lifecycle_stage_details'
require 'oci/os_management_hub/models/attach_managed_instances_to_managed_instance_group_details'
require 'oci/os_management_hub/models/attach_software_sources_to_managed_instance_details'
require 'oci/os_management_hub/models/attach_software_sources_to_managed_instance_group_details'
require 'oci/os_management_hub/models/availability'
require 'oci/os_management_hub/models/available_package_collection'
require 'oci/os_management_hub/models/available_package_summary'
require 'oci/os_management_hub/models/available_software_source_collection'
require 'oci/os_management_hub/models/available_software_source_summary'
require 'oci/os_management_hub/models/change_availability_of_software_sources_details'
require 'oci/os_management_hub/models/checksum_type'
require 'oci/os_management_hub/models/classification_types'
require 'oci/os_management_hub/models/create_custom_software_source_details'
require 'oci/os_management_hub/models/create_entitlement_details'
require 'oci/os_management_hub/models/create_group_profile_details'
require 'oci/os_management_hub/models/create_lifecycle_environment_details'
require 'oci/os_management_hub/models/create_lifecycle_profile_details'
require 'oci/os_management_hub/models/create_lifecycle_stage_details'
require 'oci/os_management_hub/models/create_managed_instance_group_details'
require 'oci/os_management_hub/models/create_management_station_details'
require 'oci/os_management_hub/models/create_mirror_configuration_details'
require 'oci/os_management_hub/models/create_profile_details'
require 'oci/os_management_hub/models/create_proxy_configuration_details'
require 'oci/os_management_hub/models/create_scheduled_job_details'
require 'oci/os_management_hub/models/create_software_source_details'
require 'oci/os_management_hub/models/create_software_source_profile_details'
require 'oci/os_management_hub/models/create_station_profile_details'
require 'oci/os_management_hub/models/create_versioned_custom_software_source_details'
require 'oci/os_management_hub/models/custom_software_source'
require 'oci/os_management_hub/models/custom_software_source_filter'
require 'oci/os_management_hub/models/custom_software_source_summary'
require 'oci/os_management_hub/models/detach_managed_instances_from_lifecycle_stage_details'
require 'oci/os_management_hub/models/detach_managed_instances_from_managed_instance_group_details'
require 'oci/os_management_hub/models/detach_software_sources_from_managed_instance_details'
require 'oci/os_management_hub/models/detach_software_sources_from_managed_instance_group_details'
require 'oci/os_management_hub/models/disable_module_stream_on_managed_instance_details'
require 'oci/os_management_hub/models/disable_module_stream_on_managed_instance_group_details'
require 'oci/os_management_hub/models/enable_module_stream_on_managed_instance_details'
require 'oci/os_management_hub/models/enable_module_stream_on_managed_instance_group_details'
require 'oci/os_management_hub/models/entitlement_collection'
require 'oci/os_management_hub/models/entitlement_summary'
require 'oci/os_management_hub/models/erratum'
require 'oci/os_management_hub/models/erratum_collection'
require 'oci/os_management_hub/models/erratum_summary'
require 'oci/os_management_hub/models/filter_type'
require 'oci/os_management_hub/models/group_profile'
require 'oci/os_management_hub/models/id'
require 'oci/os_management_hub/models/install_module_stream_profile_on_managed_instance_details'
require 'oci/os_management_hub/models/install_module_stream_profile_on_managed_instance_group_details'
require 'oci/os_management_hub/models/install_packages_on_managed_instance_details'
require 'oci/os_management_hub/models/install_packages_on_managed_instance_group_details'
require 'oci/os_management_hub/models/installed_package_collection'
require 'oci/os_management_hub/models/installed_package_summary'
require 'oci/os_management_hub/models/lifecycle_environment'
require 'oci/os_management_hub/models/lifecycle_environment_collection'
require 'oci/os_management_hub/models/lifecycle_environment_details'
require 'oci/os_management_hub/models/lifecycle_environment_summary'
require 'oci/os_management_hub/models/lifecycle_profile'
require 'oci/os_management_hub/models/lifecycle_stage'
require 'oci/os_management_hub/models/lifecycle_stage_collection'
require 'oci/os_management_hub/models/lifecycle_stage_details'
require 'oci/os_management_hub/models/lifecycle_stage_summary'
require 'oci/os_management_hub/models/manage_module_streams_in_scheduled_job_details'
require 'oci/os_management_hub/models/manage_module_streams_on_managed_instance_details'
require 'oci/os_management_hub/models/manage_module_streams_on_managed_instance_group_details'
require 'oci/os_management_hub/models/managed_instance'
require 'oci/os_management_hub/models/managed_instance_analytic_collection'
require 'oci/os_management_hub/models/managed_instance_analytic_summary'
require 'oci/os_management_hub/models/managed_instance_collection'
require 'oci/os_management_hub/models/managed_instance_details'
require 'oci/os_management_hub/models/managed_instance_erratum_summary'
require 'oci/os_management_hub/models/managed_instance_erratum_summary_collection'
require 'oci/os_management_hub/models/managed_instance_group'
require 'oci/os_management_hub/models/managed_instance_group_available_module_collection'
require 'oci/os_management_hub/models/managed_instance_group_available_module_summary'
require 'oci/os_management_hub/models/managed_instance_group_available_package_collection'
require 'oci/os_management_hub/models/managed_instance_group_available_package_summary'
require 'oci/os_management_hub/models/managed_instance_group_collection'
require 'oci/os_management_hub/models/managed_instance_group_details'
require 'oci/os_management_hub/models/managed_instance_group_installed_package_collection'
require 'oci/os_management_hub/models/managed_instance_group_installed_package_summary'
require 'oci/os_management_hub/models/managed_instance_group_module_collection'
require 'oci/os_management_hub/models/managed_instance_group_module_summary'
require 'oci/os_management_hub/models/managed_instance_group_summary'
require 'oci/os_management_hub/models/managed_instance_location'
require 'oci/os_management_hub/models/managed_instance_module_collection'
require 'oci/os_management_hub/models/managed_instance_module_summary'
require 'oci/os_management_hub/models/managed_instance_status'
require 'oci/os_management_hub/models/managed_instance_summary'
require 'oci/os_management_hub/models/managed_instances_details'
require 'oci/os_management_hub/models/management_station'
require 'oci/os_management_hub/models/management_station_collection'
require 'oci/os_management_hub/models/management_station_details'
require 'oci/os_management_hub/models/management_station_summary'
require 'oci/os_management_hub/models/metric_name'
require 'oci/os_management_hub/models/mirror_configuration'
require 'oci/os_management_hub/models/mirror_state'
require 'oci/os_management_hub/models/mirror_summary'
require 'oci/os_management_hub/models/mirror_sync_status'
require 'oci/os_management_hub/models/mirror_type'
require 'oci/os_management_hub/models/mirrors_collection'
require 'oci/os_management_hub/models/module_collection'
require 'oci/os_management_hub/models/module_spec_details'
require 'oci/os_management_hub/models/module_stream'
require 'oci/os_management_hub/models/module_stream_collection'
require 'oci/os_management_hub/models/module_stream_details'
require 'oci/os_management_hub/models/module_stream_details_body'
require 'oci/os_management_hub/models/module_stream_profile'
require 'oci/os_management_hub/models/module_stream_profile_collection'
require 'oci/os_management_hub/models/module_stream_profile_details'
require 'oci/os_management_hub/models/module_stream_profile_details_body'
require 'oci/os_management_hub/models/module_stream_profile_filter'
require 'oci/os_management_hub/models/module_stream_profile_status'
require 'oci/os_management_hub/models/module_stream_profile_summary'
require 'oci/os_management_hub/models/module_stream_status'
require 'oci/os_management_hub/models/module_stream_summary'
require 'oci/os_management_hub/models/module_summary'
require 'oci/os_management_hub/models/operation_status'
require 'oci/os_management_hub/models/operation_types'
require 'oci/os_management_hub/models/os_family'
require 'oci/os_management_hub/models/overall_state'
require 'oci/os_management_hub/models/package_filter'
require 'oci/os_management_hub/models/package_group'
require 'oci/os_management_hub/models/package_group_collection'
require 'oci/os_management_hub/models/package_group_filter'
require 'oci/os_management_hub/models/package_group_summary'
require 'oci/os_management_hub/models/package_name_summary'
require 'oci/os_management_hub/models/package_summary'
require 'oci/os_management_hub/models/profile'
require 'oci/os_management_hub/models/profile_collection'
require 'oci/os_management_hub/models/profile_summary'
require 'oci/os_management_hub/models/profile_type'
require 'oci/os_management_hub/models/promote_software_source_to_lifecycle_stage_details'
require 'oci/os_management_hub/models/proxy_configuration'
require 'oci/os_management_hub/models/remove_module_stream_profile_from_managed_instance_details'
require 'oci/os_management_hub/models/remove_module_stream_profile_from_managed_instance_group_details'
require 'oci/os_management_hub/models/remove_packages_from_managed_instance_details'
require 'oci/os_management_hub/models/remove_packages_from_managed_instance_group_details'
require 'oci/os_management_hub/models/schedule_types'
require 'oci/os_management_hub/models/scheduled_job'
require 'oci/os_management_hub/models/scheduled_job_collection'
require 'oci/os_management_hub/models/scheduled_job_operation'
require 'oci/os_management_hub/models/scheduled_job_summary'
require 'oci/os_management_hub/models/search_software_source_module_streams_details'
require 'oci/os_management_hub/models/search_software_source_modules_details'
require 'oci/os_management_hub/models/search_software_source_package_groups_details'
require 'oci/os_management_hub/models/software_package'
require 'oci/os_management_hub/models/software_package_collection'
require 'oci/os_management_hub/models/software_package_dependency'
require 'oci/os_management_hub/models/software_package_file'
require 'oci/os_management_hub/models/software_package_summary'
require 'oci/os_management_hub/models/software_packages_details'
require 'oci/os_management_hub/models/software_source'
require 'oci/os_management_hub/models/software_source_availability'
require 'oci/os_management_hub/models/software_source_collection'
require 'oci/os_management_hub/models/software_source_details'
require 'oci/os_management_hub/models/software_source_profile'
require 'oci/os_management_hub/models/software_source_summary'
require 'oci/os_management_hub/models/software_source_type'
require 'oci/os_management_hub/models/software_source_vendor_collection'
require 'oci/os_management_hub/models/software_source_vendor_summary'
require 'oci/os_management_hub/models/software_sources_details'
require 'oci/os_management_hub/models/sort_order'
require 'oci/os_management_hub/models/station_profile'
require 'oci/os_management_hub/models/switch_module_stream_on_managed_instance_details'
require 'oci/os_management_hub/models/synchronize_mirrors_details'
require 'oci/os_management_hub/models/target_resource_entity_type'
require 'oci/os_management_hub/models/updatable_package_collection'
require 'oci/os_management_hub/models/updatable_package_summary'
require 'oci/os_management_hub/models/update_all_packages_on_managed_instance_group_details'
require 'oci/os_management_hub/models/update_all_packages_on_managed_instances_in_compartment_details'
require 'oci/os_management_hub/models/update_custom_software_source_details'
require 'oci/os_management_hub/models/update_lifecycle_environment_details'
require 'oci/os_management_hub/models/update_lifecycle_stage_details'
require 'oci/os_management_hub/models/update_managed_instance_details'
require 'oci/os_management_hub/models/update_managed_instance_group_details'
require 'oci/os_management_hub/models/update_management_station_details'
require 'oci/os_management_hub/models/update_mirror_configuration_details'
require 'oci/os_management_hub/models/update_packages_on_managed_instance_details'
require 'oci/os_management_hub/models/update_profile_details'
require 'oci/os_management_hub/models/update_proxy_configuration_details'
require 'oci/os_management_hub/models/update_scheduled_job_details'
require 'oci/os_management_hub/models/update_software_source_details'
require 'oci/os_management_hub/models/update_types'
require 'oci/os_management_hub/models/update_vendor_software_source_details'
require 'oci/os_management_hub/models/update_work_request_details'
require 'oci/os_management_hub/models/vendor_name'
require 'oci/os_management_hub/models/vendor_software_source'
require 'oci/os_management_hub/models/vendor_software_source_summary'
require 'oci/os_management_hub/models/versioned_custom_software_source'
require 'oci/os_management_hub/models/versioned_custom_software_source_summary'
require 'oci/os_management_hub/models/work_request'
require 'oci/os_management_hub/models/work_request_details'
require 'oci/os_management_hub/models/work_request_error'
require 'oci/os_management_hub/models/work_request_error_collection'
require 'oci/os_management_hub/models/work_request_log_entry'
require 'oci/os_management_hub/models/work_request_log_entry_collection'
require 'oci/os_management_hub/models/work_request_management_station_details'
require 'oci/os_management_hub/models/work_request_operation_type'
require 'oci/os_management_hub/models/work_request_resource'
require 'oci/os_management_hub/models/work_request_resource_metadata_key'
require 'oci/os_management_hub/models/work_request_summary'
require 'oci/os_management_hub/models/work_request_summary_collection'

# Require generated clients
require 'oci/os_management_hub/lifecycle_environment_client'
require 'oci/os_management_hub/lifecycle_environment_client_composite_operations'
require 'oci/os_management_hub/managed_instance_client'
require 'oci/os_management_hub/managed_instance_client_composite_operations'
require 'oci/os_management_hub/managed_instance_group_client'
require 'oci/os_management_hub/managed_instance_group_client_composite_operations'
require 'oci/os_management_hub/management_station_client'
require 'oci/os_management_hub/management_station_client_composite_operations'
require 'oci/os_management_hub/onboarding_client'
require 'oci/os_management_hub/onboarding_client_composite_operations'
require 'oci/os_management_hub/reporting_managed_instance_client'
require 'oci/os_management_hub/scheduled_job_client'
require 'oci/os_management_hub/scheduled_job_client_composite_operations'
require 'oci/os_management_hub/software_source_client'
require 'oci/os_management_hub/software_source_client_composite_operations'
require 'oci/os_management_hub/work_request_client'

# Require service utilities
require 'oci/os_management_hub/util'