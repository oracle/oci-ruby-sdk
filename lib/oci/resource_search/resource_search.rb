# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module ResourceSearch
    # Module containing models for requests made to, and responses received from,
    # OCI ResourceSearch services
    module Models
    end
  end
end

# Require models
require 'oci/resource_search/models/free_text_search_details'
require 'oci/resource_search/models/queryable_field_description'
require 'oci/resource_search/models/resource_summary'
require 'oci/resource_search/models/resource_summary_collection'
require 'oci/resource_search/models/resource_type'
require 'oci/resource_search/models/search_context'
require 'oci/resource_search/models/search_details'
require 'oci/resource_search/models/structured_search_details'

# Require generated clients
require 'oci/resource_search/resource_search_client'

# Require service utilities
require 'oci/resource_search/util'
