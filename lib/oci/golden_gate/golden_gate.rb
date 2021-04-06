# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module GoldenGate
    # Module containing models for requests made to, and responses received from,
    # OCI GoldenGate services
    module Models
    end
  end
end

# Require models
require 'oci/golden_gate/models/action_type'
require 'oci/golden_gate/models/change_database_registration_compartment_details'
require 'oci/golden_gate/models/change_deployment_backup_compartment_details'
require 'oci/golden_gate/models/change_deployment_compartment_details'
require 'oci/golden_gate/models/create_database_registration_details'
require 'oci/golden_gate/models/create_deployment_backup_details'
require 'oci/golden_gate/models/create_deployment_details'
require 'oci/golden_gate/models/create_ogg_deployment_details'
require 'oci/golden_gate/models/database_registration'
require 'oci/golden_gate/models/database_registration_collection'
require 'oci/golden_gate/models/database_registration_summary'
require 'oci/golden_gate/models/default_restore_deployment_details'
require 'oci/golden_gate/models/default_start_deployment_details'
require 'oci/golden_gate/models/default_stop_deployment_details'
require 'oci/golden_gate/models/deployment'
require 'oci/golden_gate/models/deployment_backup'
require 'oci/golden_gate/models/deployment_backup_collection'
require 'oci/golden_gate/models/deployment_backup_summary'
require 'oci/golden_gate/models/deployment_backup_type'
require 'oci/golden_gate/models/deployment_collection'
require 'oci/golden_gate/models/deployment_summary'
require 'oci/golden_gate/models/deployment_type'
require 'oci/golden_gate/models/license_model'
require 'oci/golden_gate/models/lifecycle_state'
require 'oci/golden_gate/models/ogg_deployment'
require 'oci/golden_gate/models/operation_status'
require 'oci/golden_gate/models/operation_type'
require 'oci/golden_gate/models/restore_deployment_details'
require 'oci/golden_gate/models/restore_deployment_type'
require 'oci/golden_gate/models/sort_order'
require 'oci/golden_gate/models/start_deployment_details'
require 'oci/golden_gate/models/start_deployment_type'
require 'oci/golden_gate/models/stop_deployment_details'
require 'oci/golden_gate/models/stop_deployment_type'
require 'oci/golden_gate/models/update_database_registration_details'
require 'oci/golden_gate/models/update_deployment_backup_details'
require 'oci/golden_gate/models/update_deployment_details'
require 'oci/golden_gate/models/update_ogg_deployment_details'
require 'oci/golden_gate/models/upgrade_deployment_current_release_details'
require 'oci/golden_gate/models/upgrade_deployment_details'
require 'oci/golden_gate/models/upgrade_deployment_type'
require 'oci/golden_gate/models/work_request'
require 'oci/golden_gate/models/work_request_error'
require 'oci/golden_gate/models/work_request_log_entry'
require 'oci/golden_gate/models/work_request_resource'

# Require generated clients
require 'oci/golden_gate/golden_gate_client'
require 'oci/golden_gate/golden_gate_client_composite_operations'

# Require service utilities
require 'oci/golden_gate/util'
