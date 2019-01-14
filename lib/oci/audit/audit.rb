# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module Audit
    # Module containing models for requests made to, and responses received from,
    # OCI Audit services
    module Models
    end
  end
end

# Require models
require 'oci/audit/models/audit_event'
require 'oci/audit/models/configuration'
require 'oci/audit/models/update_configuration_details'

# Require generated clients
require 'oci/audit/audit_client'
require 'oci/audit/audit_client_composite_operations'

# Require service utilities
require 'oci/audit/util'
