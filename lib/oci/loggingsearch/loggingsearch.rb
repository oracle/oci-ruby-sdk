# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Loggingsearch
    # Module containing models for requests made to, and responses received from,
    # OCI Loggingsearch services
    module Models
    end
  end
end

# Require models
require 'oci/loggingsearch/models/field_info'
require 'oci/loggingsearch/models/search_logs_details'
require 'oci/loggingsearch/models/search_response'
require 'oci/loggingsearch/models/search_result'
require 'oci/loggingsearch/models/search_result_summary'

# Require generated clients
require 'oci/loggingsearch/log_search_client'

# Require service utilities
require 'oci/loggingsearch/util'
