# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

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
