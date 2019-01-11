# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module Database
    # Module containing models for requests made to, and responses received from,
    # OCI Database services
    module Models
    end
  end
end

# Require models
require 'oci/database/models/autonomous_data_warehouse'
require 'oci/database/models/autonomous_data_warehouse_backup'
require 'oci/database/models/autonomous_data_warehouse_backup_summary'
require 'oci/database/models/autonomous_data_warehouse_connection_strings'
require 'oci/database/models/autonomous_data_warehouse_summary'
require 'oci/database/models/autonomous_database'
require 'oci/database/models/autonomous_database_backup'
require 'oci/database/models/autonomous_database_backup_summary'
require 'oci/database/models/autonomous_database_connection_strings'
require 'oci/database/models/autonomous_database_summary'
require 'oci/database/models/backup'
require 'oci/database/models/backup_summary'
require 'oci/database/models/complete_external_backup_job_details'
require 'oci/database/models/create_autonomous_data_warehouse_backup_details'
require 'oci/database/models/create_autonomous_data_warehouse_details'
require 'oci/database/models/create_autonomous_database_backup_details'
require 'oci/database/models/create_autonomous_database_details'
require 'oci/database/models/create_backup_details'
require 'oci/database/models/create_data_guard_association_details'
require 'oci/database/models/create_data_guard_association_to_existing_db_system_details'
require 'oci/database/models/create_data_guard_association_with_new_db_system_details'
require 'oci/database/models/create_database_details'
require 'oci/database/models/create_database_from_backup_details'
require 'oci/database/models/create_db_home_details'
require 'oci/database/models/create_db_home_from_backup_details'
require 'oci/database/models/create_db_home_with_db_system_id_base'
require 'oci/database/models/create_db_home_with_db_system_id_details'
require 'oci/database/models/create_db_home_with_db_system_id_from_backup_details'
require 'oci/database/models/create_external_backup_job_details'
require 'oci/database/models/data_guard_association'
require 'oci/database/models/data_guard_association_summary'
require 'oci/database/models/database'
require 'oci/database/models/database_summary'
require 'oci/database/models/db_backup_config'
require 'oci/database/models/db_home'
require 'oci/database/models/db_home_summary'
require 'oci/database/models/db_node'
require 'oci/database/models/db_node_summary'
require 'oci/database/models/db_system'
require 'oci/database/models/db_system_shape_summary'
require 'oci/database/models/db_system_summary'
require 'oci/database/models/db_version_summary'
require 'oci/database/models/external_backup_job'
require 'oci/database/models/failover_data_guard_association_details'
require 'oci/database/models/generate_autonomous_data_warehouse_wallet_details'
require 'oci/database/models/generate_autonomous_database_wallet_details'
require 'oci/database/models/launch_db_system_base'
require 'oci/database/models/launch_db_system_details'
require 'oci/database/models/launch_db_system_from_backup_details'
require 'oci/database/models/patch'
require 'oci/database/models/patch_details'
require 'oci/database/models/patch_history_entry'
require 'oci/database/models/patch_history_entry_summary'
require 'oci/database/models/patch_summary'
require 'oci/database/models/reinstate_data_guard_association_details'
require 'oci/database/models/restore_autonomous_data_warehouse_details'
require 'oci/database/models/restore_autonomous_database_details'
require 'oci/database/models/restore_database_details'
require 'oci/database/models/switchover_data_guard_association_details'
require 'oci/database/models/update_autonomous_data_warehouse_details'
require 'oci/database/models/update_autonomous_database_details'
require 'oci/database/models/update_database_details'
require 'oci/database/models/update_db_home_details'
require 'oci/database/models/update_db_system_details'

# Require generated clients
require 'oci/database/database_client'
require 'oci/database/database_client_composite_operations'

# Require service utilities
require 'oci/database/util'
