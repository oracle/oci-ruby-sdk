# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

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
