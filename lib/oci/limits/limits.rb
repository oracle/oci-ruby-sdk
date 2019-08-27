# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module Limits
    # Module containing models for requests made to, and responses received from,
    # OCI Limits services
    module Models
    end
  end
end

# Require models
require 'oci/limits/models/create_quota_details'
require 'oci/limits/models/limit_definition_summary'
require 'oci/limits/models/limit_value_summary'
require 'oci/limits/models/quota'
require 'oci/limits/models/quota_summary'
require 'oci/limits/models/resource_availability'
require 'oci/limits/models/service_summary'
require 'oci/limits/models/update_quota_details'

# Require generated clients
require 'oci/limits/limits_client'
require 'oci/limits/quotas_client'
require 'oci/limits/quotas_client_composite_operations'

# Require service utilities
require 'oci/limits/util'
