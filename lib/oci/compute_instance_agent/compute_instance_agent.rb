# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ComputeInstanceAgent
    # Module containing models for requests made to, and responses received from,
    # OCI ComputeInstanceAgent services
    module Models
    end
  end
end

# Require models
require 'oci/compute_instance_agent/models/create_instance_agent_command_details'
require 'oci/compute_instance_agent/models/instance_agent_command'
require 'oci/compute_instance_agent/models/instance_agent_command_content'
require 'oci/compute_instance_agent/models/instance_agent_command_content_info'
require 'oci/compute_instance_agent/models/instance_agent_command_execution'
require 'oci/compute_instance_agent/models/instance_agent_command_execution_output_content'
require 'oci/compute_instance_agent/models/instance_agent_command_execution_output_via_object_storage_tuple_details'
require 'oci/compute_instance_agent/models/instance_agent_command_execution_output_via_object_storage_uri_details'
require 'oci/compute_instance_agent/models/instance_agent_command_execution_output_via_text_details'
require 'oci/compute_instance_agent/models/instance_agent_command_execution_summary'
require 'oci/compute_instance_agent/models/instance_agent_command_output_details'
require 'oci/compute_instance_agent/models/instance_agent_command_output_via_object_storage_tuple_details'
require 'oci/compute_instance_agent/models/instance_agent_command_output_via_object_storage_uri_details'
require 'oci/compute_instance_agent/models/instance_agent_command_output_via_text_details'
require 'oci/compute_instance_agent/models/instance_agent_command_source_details'
require 'oci/compute_instance_agent/models/instance_agent_command_source_via_object_storage_tuple_details'
require 'oci/compute_instance_agent/models/instance_agent_command_source_via_object_storage_uri_details'
require 'oci/compute_instance_agent/models/instance_agent_command_source_via_text_details'
require 'oci/compute_instance_agent/models/instance_agent_command_summary'
require 'oci/compute_instance_agent/models/instance_agent_command_target'

# Require generated clients
require 'oci/compute_instance_agent/compute_instance_agent_client'

# Require service utilities
require 'oci/compute_instance_agent/util'
