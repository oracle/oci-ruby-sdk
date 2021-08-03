# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ManagementDashboard
    # Module containing models for requests made to, and responses received from,
    # OCI ManagementDashboard services
    module Models
    end
  end
end

# Require models
require 'oci/management_dashboard/models/change_management_dashboards_compartment_details'
require 'oci/management_dashboard/models/change_management_saved_searches_compartment_details'
require 'oci/management_dashboard/models/create_management_dashboard_details'
require 'oci/management_dashboard/models/create_management_saved_search_details'
require 'oci/management_dashboard/models/lifecycle_states'
require 'oci/management_dashboard/models/management_dashboard'
require 'oci/management_dashboard/models/management_dashboard_collection'
require 'oci/management_dashboard/models/management_dashboard_export_details'
require 'oci/management_dashboard/models/management_dashboard_for_import_export_details'
require 'oci/management_dashboard/models/management_dashboard_import_details'
require 'oci/management_dashboard/models/management_dashboard_summary'
require 'oci/management_dashboard/models/management_dashboard_tile_details'
require 'oci/management_dashboard/models/management_saved_search'
require 'oci/management_dashboard/models/management_saved_search_collection'
require 'oci/management_dashboard/models/management_saved_search_for_import_details'
require 'oci/management_dashboard/models/management_saved_search_summary'
require 'oci/management_dashboard/models/saved_search_types'
require 'oci/management_dashboard/models/sort_orders'
require 'oci/management_dashboard/models/update_management_dashboard_details'
require 'oci/management_dashboard/models/update_management_saved_search_details'

# Require generated clients
require 'oci/management_dashboard/dashx_apis_client'
require 'oci/management_dashboard/dashx_apis_client_composite_operations'

# Require service utilities
require 'oci/management_dashboard/util'
