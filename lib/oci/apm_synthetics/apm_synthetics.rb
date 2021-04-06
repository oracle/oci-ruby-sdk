# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ApmSynthetics
    # Module containing models for requests made to, and responses received from,
    # OCI ApmSynthetics services
    module Models
    end
  end
end

# Require models
require 'oci/apm_synthetics/models/browser_monitor_configuration'
require 'oci/apm_synthetics/models/content_types'
require 'oci/apm_synthetics/models/create_monitor_details'
require 'oci/apm_synthetics/models/create_script_details'
require 'oci/apm_synthetics/models/geo_summary'
require 'oci/apm_synthetics/models/header'
require 'oci/apm_synthetics/models/monitor'
require 'oci/apm_synthetics/models/monitor_collection'
require 'oci/apm_synthetics/models/monitor_configuration'
require 'oci/apm_synthetics/models/monitor_result'
require 'oci/apm_synthetics/models/monitor_result_data'
require 'oci/apm_synthetics/models/monitor_script_parameter'
require 'oci/apm_synthetics/models/monitor_script_parameter_info'
require 'oci/apm_synthetics/models/monitor_status'
require 'oci/apm_synthetics/models/monitor_status_count_map'
require 'oci/apm_synthetics/models/monitor_summary'
require 'oci/apm_synthetics/models/monitor_types'
require 'oci/apm_synthetics/models/o_auth_schemes'
require 'oci/apm_synthetics/models/public_vantage_point_collection'
require 'oci/apm_synthetics/models/public_vantage_point_summary'
require 'oci/apm_synthetics/models/request_authentication_details'
require 'oci/apm_synthetics/models/request_authentication_schemes'
require 'oci/apm_synthetics/models/request_methods'
require 'oci/apm_synthetics/models/request_query_param'
require 'oci/apm_synthetics/models/rest_monitor_configuration'
require 'oci/apm_synthetics/models/script'
require 'oci/apm_synthetics/models/script_collection'
require 'oci/apm_synthetics/models/script_parameter'
require 'oci/apm_synthetics/models/script_parameter_info'
require 'oci/apm_synthetics/models/script_summary'
require 'oci/apm_synthetics/models/scripted_browser_monitor_configuration'
require 'oci/apm_synthetics/models/scripted_rest_monitor_configuration'
require 'oci/apm_synthetics/models/sort_orders'
require 'oci/apm_synthetics/models/update_monitor_details'
require 'oci/apm_synthetics/models/update_script_details'
require 'oci/apm_synthetics/models/vantage_point_info'
require 'oci/apm_synthetics/models/verify_text'

# Require generated clients
require 'oci/apm_synthetics/apm_synthetic_client'

# Require service utilities
require 'oci/apm_synthetics/util'
