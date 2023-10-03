# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20160918

module OCI
  module Database
    # Module containing models for requests made to, and responses received from,
    # OCI Database services
    module Models
    end
  end
end

# Require models
require 'oci/database/models/acd_avm_resource_stats'
require 'oci/database/models/activate_exadata_infrastructure_details'
require 'oci/database/models/add_virtual_machine_to_cloud_vm_cluster_details'
require 'oci/database/models/add_virtual_machine_to_vm_cluster_details'
require 'oci/database/models/app_version_summary'
require 'oci/database/models/application_vip'
require 'oci/database/models/application_vip_summary'
require 'oci/database/models/associated_database_details'
require 'oci/database/models/automated_mount_details'
require 'oci/database/models/autonomous_container_database'
require 'oci/database/models/autonomous_container_database_backup_config'
require 'oci/database/models/autonomous_container_database_dataguard_association'
require 'oci/database/models/autonomous_container_database_resource_usage'
require 'oci/database/models/autonomous_container_database_summary'
require 'oci/database/models/autonomous_container_database_version_summary'
require 'oci/database/models/autonomous_data_warehouse'
require 'oci/database/models/autonomous_data_warehouse_connection_strings'
require 'oci/database/models/autonomous_data_warehouse_summary'
require 'oci/database/models/autonomous_database'
require 'oci/database/models/autonomous_database_apex'
require 'oci/database/models/autonomous_database_backup'
require 'oci/database/models/autonomous_database_backup_config'
require 'oci/database/models/autonomous_database_backup_summary'
require 'oci/database/models/autonomous_database_character_sets'
require 'oci/database/models/autonomous_database_connection_strings'
require 'oci/database/models/autonomous_database_connection_urls'
require 'oci/database/models/autonomous_database_console_token_details'
require 'oci/database/models/autonomous_database_dataguard_association'
require 'oci/database/models/autonomous_database_key_history_entry'
require 'oci/database/models/autonomous_database_manual_refresh_details'
require 'oci/database/models/autonomous_database_standby_summary'
require 'oci/database/models/autonomous_database_summary'
require 'oci/database/models/autonomous_database_wallet'
require 'oci/database/models/autonomous_db_preview_version_summary'
require 'oci/database/models/autonomous_db_version_summary'
require 'oci/database/models/autonomous_exadata_infrastructure'
require 'oci/database/models/autonomous_exadata_infrastructure_shape_summary'
require 'oci/database/models/autonomous_exadata_infrastructure_summary'
require 'oci/database/models/autonomous_patch'
require 'oci/database/models/autonomous_patch_summary'
require 'oci/database/models/autonomous_virtual_machine'
require 'oci/database/models/autonomous_virtual_machine_summary'
require 'oci/database/models/autonomous_vm_cluster'
require 'oci/database/models/autonomous_vm_cluster_resource_details'
require 'oci/database/models/autonomous_vm_cluster_summary'
require 'oci/database/models/autonomous_vm_resource_usage'
require 'oci/database/models/avm_acd_resource_stats'
require 'oci/database/models/backup'
require 'oci/database/models/backup_destination'
require 'oci/database/models/backup_destination_details'
require 'oci/database/models/backup_destination_summary'
require 'oci/database/models/backup_summary'
require 'oci/database/models/change_autonomous_vm_cluster_compartment_details'
require 'oci/database/models/change_cloud_autonomous_vm_cluster_compartment_details'
require 'oci/database/models/change_cloud_exadata_infrastructure_compartment_details'
require 'oci/database/models/change_cloud_vm_cluster_compartment_details'
require 'oci/database/models/change_compartment_details'
require 'oci/database/models/change_dataguard_role_details'
require 'oci/database/models/change_disaster_recovery_configuration_details'
require 'oci/database/models/change_exadata_infrastructure_compartment_details'
require 'oci/database/models/change_key_store_compartment_details'
require 'oci/database/models/change_key_store_type_details'
require 'oci/database/models/change_vm_cluster_compartment_details'
require 'oci/database/models/cloud_autonomous_vm_cluster'
require 'oci/database/models/cloud_autonomous_vm_cluster_resource_details'
require 'oci/database/models/cloud_autonomous_vm_cluster_resource_usage'
require 'oci/database/models/cloud_autonomous_vm_cluster_summary'
require 'oci/database/models/cloud_database_management_config'
require 'oci/database/models/cloud_db_server_details'
require 'oci/database/models/cloud_exadata_infrastructure'
require 'oci/database/models/cloud_exadata_infrastructure_summary'
require 'oci/database/models/cloud_exadata_infrastructure_unallocated_resources'
require 'oci/database/models/cloud_vm_cluster'
require 'oci/database/models/cloud_vm_cluster_summary'
require 'oci/database/models/complete_external_backup_job_details'
require 'oci/database/models/compute_performance_summary'
require 'oci/database/models/configure_autonomous_database_vault_key_details'
require 'oci/database/models/console_connection'
require 'oci/database/models/console_connection_summary'
require 'oci/database/models/convert_to_pdb_details'
require 'oci/database/models/convert_to_pdb_target_base'
require 'oci/database/models/create_application_vip_details'
require 'oci/database/models/create_autonomous_container_database_details'
require 'oci/database/models/create_autonomous_database_backup_details'
require 'oci/database/models/create_autonomous_database_base'
require 'oci/database/models/create_autonomous_database_clone_details'
require 'oci/database/models/create_autonomous_database_details'
require 'oci/database/models/create_autonomous_database_from_backup_details'
require 'oci/database/models/create_autonomous_database_from_backup_timestamp_details'
require 'oci/database/models/create_autonomous_vm_cluster_details'
require 'oci/database/models/create_backup_destination_details'
require 'oci/database/models/create_backup_details'
require 'oci/database/models/create_cloud_autonomous_vm_cluster_details'
require 'oci/database/models/create_cloud_exadata_infrastructure_details'
require 'oci/database/models/create_cloud_vm_cluster_details'
require 'oci/database/models/create_console_connection_details'
require 'oci/database/models/create_cross_region_autonomous_database_data_guard_details'
require 'oci/database/models/create_cross_region_disaster_recovery_details'
require 'oci/database/models/create_data_guard_association_details'
require 'oci/database/models/create_data_guard_association_to_existing_db_system_details'
require 'oci/database/models/create_data_guard_association_to_existing_vm_cluster_details'
require 'oci/database/models/create_data_guard_association_with_new_db_system_details'
require 'oci/database/models/create_database_base'
require 'oci/database/models/create_database_details'
require 'oci/database/models/create_database_from_another_database_details'
require 'oci/database/models/create_database_from_backup'
require 'oci/database/models/create_database_from_backup_details'
require 'oci/database/models/create_database_from_db_system_details'
require 'oci/database/models/create_database_software_image_details'
require 'oci/database/models/create_db_home_base'
require 'oci/database/models/create_db_home_details'
require 'oci/database/models/create_db_home_from_backup_details'
require 'oci/database/models/create_db_home_from_database_details'
require 'oci/database/models/create_db_home_from_db_system_details'
require 'oci/database/models/create_db_home_with_db_system_id_details'
require 'oci/database/models/create_db_home_with_db_system_id_from_backup_details'
require 'oci/database/models/create_db_home_with_db_system_id_from_database_details'
require 'oci/database/models/create_db_home_with_vm_cluster_id_details'
require 'oci/database/models/create_db_home_with_vm_cluster_id_from_backup_details'
require 'oci/database/models/create_exadata_infrastructure_details'
require 'oci/database/models/create_external_backup_job_details'
require 'oci/database/models/create_external_container_database_details'
require 'oci/database/models/create_external_database_connector_details'
require 'oci/database/models/create_external_database_details_base'
require 'oci/database/models/create_external_macs_connector_details'
require 'oci/database/models/create_external_non_container_database_details'
require 'oci/database/models/create_external_pluggable_database_details'
require 'oci/database/models/create_key_store_details'
require 'oci/database/models/create_nfs_backup_destination_details'
require 'oci/database/models/create_new_database_details'
require 'oci/database/models/create_oneoff_patch_details'
require 'oci/database/models/create_pluggable_database_details'
require 'oci/database/models/create_recovery_appliance_backup_destination_details'
require 'oci/database/models/create_refreshable_autonomous_database_clone_details'
require 'oci/database/models/create_vm_cluster_details'
require 'oci/database/models/customer_contact'
require 'oci/database/models/data_collection_options'
require 'oci/database/models/data_guard_association'
require 'oci/database/models/data_guard_association_summary'
require 'oci/database/models/database'
require 'oci/database/models/database_connection_credentails_by_name'
require 'oci/database/models/database_connection_credentials'
require 'oci/database/models/database_connection_credentials_by_details'
require 'oci/database/models/database_connection_string'
require 'oci/database/models/database_connection_string_profile'
require 'oci/database/models/database_connection_strings'
require 'oci/database/models/database_credential_details'
require 'oci/database/models/database_management_config'
require 'oci/database/models/database_software_image'
require 'oci/database/models/database_software_image_summary'
require 'oci/database/models/database_ssl_connection_credentials'
require 'oci/database/models/database_summary'
require 'oci/database/models/database_tool'
require 'oci/database/models/database_upgrade_history_entry'
require 'oci/database/models/database_upgrade_history_entry_summary'
require 'oci/database/models/database_upgrade_source_base'
require 'oci/database/models/database_upgrade_with_database_software_image_details'
require 'oci/database/models/database_upgrade_with_db_home_details'
require 'oci/database/models/database_upgrade_with_db_version_details'
require 'oci/database/models/day_of_week'
require 'oci/database/models/db_backup_config'
require 'oci/database/models/db_home'
require 'oci/database/models/db_home_from_agent_resource_id'
require 'oci/database/models/db_home_summary'
require 'oci/database/models/db_iorm_config'
require 'oci/database/models/db_iorm_config_update_detail'
require 'oci/database/models/db_node'
require 'oci/database/models/db_node_summary'
require 'oci/database/models/db_server'
require 'oci/database/models/db_server_details'
require 'oci/database/models/db_server_history_summary'
require 'oci/database/models/db_server_patching_details'
require 'oci/database/models/db_server_summary'
require 'oci/database/models/db_system'
require 'oci/database/models/db_system_compute_performance_summary'
require 'oci/database/models/db_system_options'
require 'oci/database/models/db_system_shape_summary'
require 'oci/database/models/db_system_storage_performance_summary'
require 'oci/database/models/db_system_summary'
require 'oci/database/models/db_system_upgrade_history_entry'
require 'oci/database/models/db_system_upgrade_history_entry_summary'
require 'oci/database/models/db_version_summary'
require 'oci/database/models/deregister_autonomous_database_data_safe_details'
require 'oci/database/models/disaster_recovery_configuration'
require 'oci/database/models/disk_performance_details'
require 'oci/database/models/download_oneoff_patch'
require 'oci/database/models/dr_scan_details'
require 'oci/database/models/enable_database_management_details'
require 'oci/database/models/enable_external_container_database_database_management_details'
require 'oci/database/models/enable_external_container_database_stack_monitoring_details'
require 'oci/database/models/enable_external_database_management_details_base'
require 'oci/database/models/enable_external_database_operations_insights_details_base'
require 'oci/database/models/enable_external_database_stack_monitoring_details_base'
require 'oci/database/models/enable_external_non_container_database_database_management_details'
require 'oci/database/models/enable_external_non_container_database_operations_insights_details'
require 'oci/database/models/enable_external_non_container_database_stack_monitoring_details'
require 'oci/database/models/enable_external_pluggable_database_database_management_details'
require 'oci/database/models/enable_external_pluggable_database_operations_insights_details'
require 'oci/database/models/enable_external_pluggable_database_stack_monitoring_details'
require 'oci/database/models/enable_pluggable_database_management_details'
require 'oci/database/models/estimated_patching_time'
require 'oci/database/models/exadata_db_system_migration'
require 'oci/database/models/exadata_db_system_migration_summary'
require 'oci/database/models/exadata_infrastructure'
require 'oci/database/models/exadata_infrastructure_contact'
require 'oci/database/models/exadata_infrastructure_summary'
require 'oci/database/models/exadata_infrastructure_un_allocated_resources'
require 'oci/database/models/exadata_iorm_config'
require 'oci/database/models/exadata_iorm_config_update_details'
require 'oci/database/models/external_backup_job'
require 'oci/database/models/external_container_database'
require 'oci/database/models/external_container_database_summary'
require 'oci/database/models/external_database_base'
require 'oci/database/models/external_database_connector'
require 'oci/database/models/external_database_connector_summary'
require 'oci/database/models/external_macs_connector'
require 'oci/database/models/external_macs_connector_summary'
require 'oci/database/models/external_non_container_database'
require 'oci/database/models/external_non_container_database_summary'
require 'oci/database/models/external_pluggable_database'
require 'oci/database/models/external_pluggable_database_summary'
require 'oci/database/models/failover_data_guard_association_details'
require 'oci/database/models/flex_component_collection'
require 'oci/database/models/flex_component_summary'
require 'oci/database/models/generate_autonomous_database_wallet_details'
require 'oci/database/models/generate_recommended_network_details'
require 'oci/database/models/gi_version_summary'
require 'oci/database/models/info_for_network_gen_details'
require 'oci/database/models/infrastructure_target_version'
require 'oci/database/models/infrastructure_target_version_summary'
require 'oci/database/models/key_store'
require 'oci/database/models/key_store_associated_database_details'
require 'oci/database/models/key_store_summary'
require 'oci/database/models/key_store_type_details'
require 'oci/database/models/key_store_type_from_oracle_key_vault_details'
require 'oci/database/models/launch_autonomous_exadata_infrastructure_details'
require 'oci/database/models/launch_db_system_base'
require 'oci/database/models/launch_db_system_details'
require 'oci/database/models/launch_db_system_from_backup_details'
require 'oci/database/models/launch_db_system_from_database_details'
require 'oci/database/models/launch_db_system_from_db_system_details'
require 'oci/database/models/local_clone_pluggable_database_details'
require 'oci/database/models/long_term_back_up_schedule_details'
require 'oci/database/models/maintenance_run'
require 'oci/database/models/maintenance_run_history'
require 'oci/database/models/maintenance_run_history_summary'
require 'oci/database/models/maintenance_run_summary'
require 'oci/database/models/maintenance_window'
require 'oci/database/models/migrate_vault_key_details'
require 'oci/database/models/modify_database_management_details'
require 'oci/database/models/modify_pluggable_database_management_details'
require 'oci/database/models/month'
require 'oci/database/models/mount_type_details'
require 'oci/database/models/network_bonding_mode_details'
require 'oci/database/models/node_details'
require 'oci/database/models/ocp_us'
require 'oci/database/models/oneoff_patch'
require 'oci/database/models/oneoff_patch_summary'
require 'oci/database/models/operations_insights_config'
require 'oci/database/models/patch'
require 'oci/database/models/patch_details'
require 'oci/database/models/patch_history_entry'
require 'oci/database/models/patch_history_entry_summary'
require 'oci/database/models/patch_summary'
require 'oci/database/models/pdb_conversion_history_entry'
require 'oci/database/models/pdb_conversion_history_entry_summary'
require 'oci/database/models/pdb_conversion_to_new_database_details'
require 'oci/database/models/peer_autonomous_container_database_backup_config'
require 'oci/database/models/pluggable_database'
require 'oci/database/models/pluggable_database_connection_strings'
require 'oci/database/models/pluggable_database_management_config'
require 'oci/database/models/pluggable_database_summary'
require 'oci/database/models/refreshable_clone_collection'
require 'oci/database/models/refreshable_clone_summary'
require 'oci/database/models/register_autonomous_database_data_safe_details'
require 'oci/database/models/reinstate_data_guard_association_details'
require 'oci/database/models/remote_clone_pluggable_database_details'
require 'oci/database/models/remove_virtual_machine_from_cloud_vm_cluster_details'
require 'oci/database/models/remove_virtual_machine_from_vm_cluster_details'
require 'oci/database/models/resize_vm_cluster_network_details'
require 'oci/database/models/resource_pool_shape_collection'
require 'oci/database/models/resource_pool_shape_summary'
require 'oci/database/models/resource_pool_summary'
require 'oci/database/models/restore_autonomous_database_details'
require 'oci/database/models/restore_database_details'
require 'oci/database/models/rotate_autonomous_vm_cluster_ords_certs_details'
require 'oci/database/models/rotate_autonomous_vm_cluster_ssl_certs_details'
require 'oci/database/models/rotate_cloud_autonomous_vm_cluster_ords_certs_details'
require 'oci/database/models/rotate_cloud_autonomous_vm_cluster_ssl_certs_details'
require 'oci/database/models/scan_details'
require 'oci/database/models/scheduled_operation_details'
require 'oci/database/models/self_mount_details'
require 'oci/database/models/stack_monitoring_config'
require 'oci/database/models/storage_performance_details'
require 'oci/database/models/switchover_data_guard_association_details'
require 'oci/database/models/update'
require 'oci/database/models/update_autonomous_container_database_data_guard_association_details'
require 'oci/database/models/update_autonomous_container_database_details'
require 'oci/database/models/update_autonomous_database_backup_details'
require 'oci/database/models/update_autonomous_database_details'
require 'oci/database/models/update_autonomous_database_wallet_details'
require 'oci/database/models/update_autonomous_exadata_infrastructure_details'
require 'oci/database/models/update_autonomous_vm_cluster_details'
require 'oci/database/models/update_backup_destination_details'
require 'oci/database/models/update_cloud_autonomous_vm_cluster_details'
require 'oci/database/models/update_cloud_exadata_infrastructure_details'
require 'oci/database/models/update_cloud_vm_cluster_details'
require 'oci/database/models/update_console_connection_details'
require 'oci/database/models/update_data_guard_association_details'
require 'oci/database/models/update_database_details'
require 'oci/database/models/update_database_software_image_details'
require 'oci/database/models/update_db_home_details'
require 'oci/database/models/update_db_node_details'
require 'oci/database/models/update_db_system_details'
require 'oci/database/models/update_details'
require 'oci/database/models/update_exadata_infrastructure_details'
require 'oci/database/models/update_external_container_database_details'
require 'oci/database/models/update_external_database_connector_details'
require 'oci/database/models/update_external_database_details_base'
require 'oci/database/models/update_external_macs_connector_details'
require 'oci/database/models/update_external_non_container_database_details'
require 'oci/database/models/update_external_pluggable_database_details'
require 'oci/database/models/update_history_entry'
require 'oci/database/models/update_history_entry_summary'
require 'oci/database/models/update_key_store_details'
require 'oci/database/models/update_maintenance_run_details'
require 'oci/database/models/update_oneoff_patch_details'
require 'oci/database/models/update_pluggable_database_details'
require 'oci/database/models/update_summary'
require 'oci/database/models/update_vm_cluster_details'
require 'oci/database/models/update_vm_cluster_network_details'
require 'oci/database/models/upgrade_database_details'
require 'oci/database/models/upgrade_db_system_details'
require 'oci/database/models/vm_cluster'
require 'oci/database/models/vm_cluster_network'
require 'oci/database/models/vm_cluster_network_details'
require 'oci/database/models/vm_cluster_network_summary'
require 'oci/database/models/vm_cluster_summary'
require 'oci/database/models/vm_cluster_update'
require 'oci/database/models/vm_cluster_update_details'
require 'oci/database/models/vm_cluster_update_history_entry'
require 'oci/database/models/vm_cluster_update_history_entry_summary'
require 'oci/database/models/vm_cluster_update_summary'
require 'oci/database/models/vm_network_details'
require 'oci/database/models/workload_type'

# Require generated clients
require 'oci/database/database_client'
require 'oci/database/database_client_composite_operations'

# Require service utilities
require 'oci/database/util'
