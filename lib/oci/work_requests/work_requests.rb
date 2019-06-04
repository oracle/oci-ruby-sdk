# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module WorkRequests
    # Module containing models for requests made to, and responses received from,
    # OCI WorkRequests services
    module Models
    end
  end
end

# Require models
require 'oci/work_requests/models/work_request'
require 'oci/work_requests/models/work_request_error'
require 'oci/work_requests/models/work_request_log_entry'
require 'oci/work_requests/models/work_request_resource'
require 'oci/work_requests/models/work_request_summary'

# Require generated clients
require 'oci/work_requests/work_request_client'

# Require service utilities
require 'oci/work_requests/util'
