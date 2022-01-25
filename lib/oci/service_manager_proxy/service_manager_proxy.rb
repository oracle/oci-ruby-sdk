# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ServiceManagerProxy
    # Module containing models for requests made to, and responses received from,
    # OCI ServiceManagerProxy services
    module Models
    end
  end
end

# Require models
require 'oci/service_manager_proxy/models/error_entity'
require 'oci/service_manager_proxy/models/service_definition'
require 'oci/service_manager_proxy/models/service_entitlement_registration_status'
require 'oci/service_manager_proxy/models/service_environment'
require 'oci/service_manager_proxy/models/service_environment_collection'
require 'oci/service_manager_proxy/models/service_environment_end_point_overview'
require 'oci/service_manager_proxy/models/service_environment_summary'

# Require generated clients
require 'oci/service_manager_proxy/service_manager_proxy_client'

# Require service utilities
require 'oci/service_manager_proxy/util'
