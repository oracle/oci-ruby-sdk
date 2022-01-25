# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ApmTraces
    # Module containing models for requests made to, and responses received from,
    # OCI ApmTraces services
    module Models
    end
  end
end

# Require models
require 'oci/apm_traces/models/query_details'
require 'oci/apm_traces/models/query_result_metadata_summary'
require 'oci/apm_traces/models/query_result_response'
require 'oci/apm_traces/models/query_result_row'
require 'oci/apm_traces/models/query_result_row_type_summary'
require 'oci/apm_traces/models/query_results_grouped_by_summary'
require 'oci/apm_traces/models/query_results_ordered_by_summary'
require 'oci/apm_traces/models/quick_pick_summary'
require 'oci/apm_traces/models/span'
require 'oci/apm_traces/models/span_log'
require 'oci/apm_traces/models/span_log_collection'
require 'oci/apm_traces/models/tag'
require 'oci/apm_traces/models/trace'
require 'oci/apm_traces/models/trace_service_summary'
require 'oci/apm_traces/models/trace_span_summary'

# Require generated clients
require 'oci/apm_traces/query_client'
require 'oci/apm_traces/trace_client'

# Require service utilities
require 'oci/apm_traces/util'
