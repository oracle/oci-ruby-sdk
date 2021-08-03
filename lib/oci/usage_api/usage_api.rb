# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module UsageApi
    # Module containing models for requests made to, and responses received from,
    # OCI UsageApi services
    module Models
    end
  end
end

# Require models
require 'oci/usage_api/models/configuration'
require 'oci/usage_api/models/configuration_aggregation'
require 'oci/usage_api/models/cost_analysis_ui'
require 'oci/usage_api/models/create_custom_table_details'
require 'oci/usage_api/models/create_query_details'
require 'oci/usage_api/models/custom_table'
require 'oci/usage_api/models/custom_table_collection'
require 'oci/usage_api/models/custom_table_summary'
require 'oci/usage_api/models/dimension'
require 'oci/usage_api/models/filter'
require 'oci/usage_api/models/forecast'
require 'oci/usage_api/models/query'
require 'oci/usage_api/models/query_collection'
require 'oci/usage_api/models/query_definition'
require 'oci/usage_api/models/query_summary'
require 'oci/usage_api/models/report_query'
require 'oci/usage_api/models/request_summarized_usages_details'
require 'oci/usage_api/models/saved_custom_table'
require 'oci/usage_api/models/tag'
require 'oci/usage_api/models/update_custom_table_details'
require 'oci/usage_api/models/update_query_details'
require 'oci/usage_api/models/usage_aggregation'
require 'oci/usage_api/models/usage_summary'

# Require generated clients
require 'oci/usage_api/usageapi_client'

# Require service utilities
require 'oci/usage_api/util'
