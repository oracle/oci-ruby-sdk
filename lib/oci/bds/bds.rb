# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Bds
    # Module containing models for requests made to, and responses received from,
    # OCI Bds services
    module Models
    end
  end
end

# Require models
require 'oci/bds/models/action_types'
require 'oci/bds/models/activate_bds_metastore_configuration_details'
require 'oci/bds/models/add_auto_scaling_configuration_details'
require 'oci/bds/models/add_block_storage_details'
require 'oci/bds/models/add_cloud_sql_details'
require 'oci/bds/models/add_worker_nodes_details'
require 'oci/bds/models/auto_scale_policy'
require 'oci/bds/models/auto_scale_policy_metric_rule'
require 'oci/bds/models/auto_scale_policy_rule'
require 'oci/bds/models/auto_scaling_configuration'
require 'oci/bds/models/auto_scaling_configuration_summary'
require 'oci/bds/models/bds_api_key'
require 'oci/bds/models/bds_api_key_summary'
require 'oci/bds/models/bds_instance'
require 'oci/bds/models/bds_instance_summary'
require 'oci/bds/models/bds_metastore_configuration'
require 'oci/bds/models/bds_metastore_configuration_summary'
require 'oci/bds/models/change_bds_instance_compartment_details'
require 'oci/bds/models/change_shape_details'
require 'oci/bds/models/change_shape_nodes'
require 'oci/bds/models/cloud_sql_details'
require 'oci/bds/models/cluster_details'
require 'oci/bds/models/create_bds_api_key_details'
require 'oci/bds/models/create_bds_instance_details'
require 'oci/bds/models/create_bds_metastore_configuration_details'
require 'oci/bds/models/create_node_details'
require 'oci/bds/models/default_error'
require 'oci/bds/models/kerberos_details'
require 'oci/bds/models/metric_threshold_rule'
require 'oci/bds/models/network_config'
require 'oci/bds/models/node'
require 'oci/bds/models/operation_status'
require 'oci/bds/models/operation_types'
require 'oci/bds/models/remove_auto_scaling_configuration_details'
require 'oci/bds/models/remove_cloud_sql_details'
require 'oci/bds/models/restart_node_details'
require 'oci/bds/models/sort_orders'
require 'oci/bds/models/test_bds_metastore_configuration_details'
require 'oci/bds/models/test_bds_object_storage_connection_details'
require 'oci/bds/models/update_auto_scaling_configuration_details'
require 'oci/bds/models/update_bds_instance_details'
require 'oci/bds/models/update_bds_metastore_configuration_details'
require 'oci/bds/models/volume_attachment_detail'
require 'oci/bds/models/work_request'
require 'oci/bds/models/work_request_error'
require 'oci/bds/models/work_request_log_entry'
require 'oci/bds/models/work_request_resource'

# Require generated clients
require 'oci/bds/bds_client'
require 'oci/bds/bds_client_composite_operations'

# Require service utilities
require 'oci/bds/util'
