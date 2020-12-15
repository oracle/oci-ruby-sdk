# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Rover
    # Module containing models for requests made to, and responses received from,
    # OCI Rover services
    module Models
    end
  end
end

# Require models
require 'oci/rover/models/change_rover_cluster_compartment_details'
require 'oci/rover/models/change_rover_entitlement_compartment_details'
require 'oci/rover/models/change_rover_node_compartment_details'
require 'oci/rover/models/create_rover_cluster_details'
require 'oci/rover/models/create_rover_entitlement_details'
require 'oci/rover/models/create_rover_node_details'
require 'oci/rover/models/enclosure_type'
require 'oci/rover/models/lifecycle_state'
require 'oci/rover/models/node_type'
require 'oci/rover/models/rover_cluster'
require 'oci/rover/models/rover_cluster_certificate'
require 'oci/rover/models/rover_cluster_collection'
require 'oci/rover/models/rover_cluster_summary'
require 'oci/rover/models/rover_entitlement'
require 'oci/rover/models/rover_entitlement_collection'
require 'oci/rover/models/rover_entitlement_summary'
require 'oci/rover/models/rover_node'
require 'oci/rover/models/rover_node_action_set_key_details'
require 'oci/rover/models/rover_node_certificate'
require 'oci/rover/models/rover_node_collection'
require 'oci/rover/models/rover_node_encryption_key'
require 'oci/rover/models/rover_node_get_rpt'
require 'oci/rover/models/rover_node_set_key'
require 'oci/rover/models/rover_node_summary'
require 'oci/rover/models/rover_workload'
require 'oci/rover/models/shipping_address'
require 'oci/rover/models/sort_orders'
require 'oci/rover/models/update_rover_cluster_details'
require 'oci/rover/models/update_rover_entitlement_details'
require 'oci/rover/models/update_rover_node_details'

# Require generated clients
require 'oci/rover/rover_cluster_client'
require 'oci/rover/rover_cluster_client_composite_operations'
require 'oci/rover/rover_entitlement_client'
require 'oci/rover/rover_entitlement_client_composite_operations'
require 'oci/rover/rover_node_client'
require 'oci/rover/rover_node_client_composite_operations'

# Require service utilities
require 'oci/rover/util'
