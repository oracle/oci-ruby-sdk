# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ContainerEngine
    # Module containing models for requests made to, and responses received from,
    # OCI ContainerEngine services
    module Models
    end
  end
end

# Require models
require 'oci/container_engine/models/add_on_options'
require 'oci/container_engine/models/admission_controller_options'
require 'oci/container_engine/models/cluster'
require 'oci/container_engine/models/cluster_create_options'
require 'oci/container_engine/models/cluster_endpoint_config'
require 'oci/container_engine/models/cluster_endpoints'
require 'oci/container_engine/models/cluster_lifecycle_state'
require 'oci/container_engine/models/cluster_metadata'
require 'oci/container_engine/models/cluster_migrate_to_native_vcn_details'
require 'oci/container_engine/models/cluster_migrate_to_native_vcn_status'
require 'oci/container_engine/models/cluster_options'
require 'oci/container_engine/models/cluster_summary'
require 'oci/container_engine/models/create_cluster_details'
require 'oci/container_engine/models/create_cluster_endpoint_config_details'
require 'oci/container_engine/models/create_cluster_kubeconfig_content_details'
require 'oci/container_engine/models/create_image_policy_config_details'
require 'oci/container_engine/models/create_node_pool_details'
require 'oci/container_engine/models/create_node_pool_node_config_details'
require 'oci/container_engine/models/create_node_shape_config_details'
require 'oci/container_engine/models/image_policy_config'
require 'oci/container_engine/models/key_details'
require 'oci/container_engine/models/key_value'
require 'oci/container_engine/models/kubernetes_network_config'
require 'oci/container_engine/models/node'
require 'oci/container_engine/models/node_error'
require 'oci/container_engine/models/node_pool'
require 'oci/container_engine/models/node_pool_node_config_details'
require 'oci/container_engine/models/node_pool_options'
require 'oci/container_engine/models/node_pool_placement_config_details'
require 'oci/container_engine/models/node_pool_summary'
require 'oci/container_engine/models/node_shape_config'
require 'oci/container_engine/models/node_source_details'
require 'oci/container_engine/models/node_source_option'
require 'oci/container_engine/models/node_source_type'
require 'oci/container_engine/models/node_source_via_image_details'
require 'oci/container_engine/models/node_source_via_image_option'
require 'oci/container_engine/models/persistent_volume_config_details'
require 'oci/container_engine/models/service_lb_config_details'
require 'oci/container_engine/models/sort_order'
require 'oci/container_engine/models/update_cluster_details'
require 'oci/container_engine/models/update_cluster_endpoint_config_details'
require 'oci/container_engine/models/update_cluster_options_details'
require 'oci/container_engine/models/update_image_policy_config_details'
require 'oci/container_engine/models/update_node_pool_details'
require 'oci/container_engine/models/update_node_pool_node_config_details'
require 'oci/container_engine/models/update_node_shape_config_details'
require 'oci/container_engine/models/work_request'
require 'oci/container_engine/models/work_request_error'
require 'oci/container_engine/models/work_request_log_entry'
require 'oci/container_engine/models/work_request_operation_type'
require 'oci/container_engine/models/work_request_resource'
require 'oci/container_engine/models/work_request_status'
require 'oci/container_engine/models/work_request_summary'

# Require generated clients
require 'oci/container_engine/container_engine_client'
require 'oci/container_engine/container_engine_client_composite_operations'

# Require service utilities
require 'oci/container_engine/util'
