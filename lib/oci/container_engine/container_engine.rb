# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

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
require 'oci/container_engine/models/cluster'
require 'oci/container_engine/models/cluster_create_options'
require 'oci/container_engine/models/cluster_endpoints'
require 'oci/container_engine/models/cluster_lifecycle_state'
require 'oci/container_engine/models/cluster_metadata'
require 'oci/container_engine/models/cluster_options'
require 'oci/container_engine/models/cluster_summary'
require 'oci/container_engine/models/create_cluster_details'
require 'oci/container_engine/models/create_cluster_kubeconfig_content_details'
require 'oci/container_engine/models/create_node_pool_details'
require 'oci/container_engine/models/key_value'
require 'oci/container_engine/models/kubernetes_network_config'
require 'oci/container_engine/models/node'
require 'oci/container_engine/models/node_error'
require 'oci/container_engine/models/node_pool'
require 'oci/container_engine/models/node_pool_options'
require 'oci/container_engine/models/node_pool_summary'
require 'oci/container_engine/models/sort_order'
require 'oci/container_engine/models/update_cluster_details'
require 'oci/container_engine/models/update_node_pool_details'
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
