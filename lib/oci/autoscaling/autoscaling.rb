# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Autoscaling
    # Module containing models for requests made to, and responses received from,
    # OCI Autoscaling services
    module Models
    end
  end
end

# Require models
require 'oci/autoscaling/models/action'
require 'oci/autoscaling/models/auto_scaling_configuration'
require 'oci/autoscaling/models/auto_scaling_configuration_summary'
require 'oci/autoscaling/models/auto_scaling_policy'
require 'oci/autoscaling/models/auto_scaling_policy_summary'
require 'oci/autoscaling/models/capacity'
require 'oci/autoscaling/models/change_auto_scaling_compartment_details'
require 'oci/autoscaling/models/condition'
require 'oci/autoscaling/models/create_auto_scaling_configuration_details'
require 'oci/autoscaling/models/create_auto_scaling_policy_details'
require 'oci/autoscaling/models/create_condition_details'
require 'oci/autoscaling/models/create_scheduled_policy_details'
require 'oci/autoscaling/models/create_threshold_policy_details'
require 'oci/autoscaling/models/cron_execution_schedule'
require 'oci/autoscaling/models/execution_schedule'
require 'oci/autoscaling/models/instance_pool_resource'
require 'oci/autoscaling/models/metric'
require 'oci/autoscaling/models/resource'
require 'oci/autoscaling/models/resource_action'
require 'oci/autoscaling/models/resource_power_action'
require 'oci/autoscaling/models/scheduled_policy'
require 'oci/autoscaling/models/threshold'
require 'oci/autoscaling/models/threshold_policy'
require 'oci/autoscaling/models/update_auto_scaling_configuration_details'
require 'oci/autoscaling/models/update_auto_scaling_policy_details'
require 'oci/autoscaling/models/update_condition_details'
require 'oci/autoscaling/models/update_scheduled_policy_details'
require 'oci/autoscaling/models/update_threshold_policy_details'

# Require generated clients
require 'oci/autoscaling/auto_scaling_client'

# Require service utilities
require 'oci/autoscaling/util'
