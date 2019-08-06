# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module Healthchecks
    # Module containing models for requests made to, and responses received from,
    # OCI Healthchecks services
    module Models
    end
  end
end

# Require models
require 'oci/healthchecks/models/change_http_monitor_compartment_details'
require 'oci/healthchecks/models/change_ping_monitor_compartment_details'
require 'oci/healthchecks/models/connection'
require 'oci/healthchecks/models/create_http_monitor_details'
require 'oci/healthchecks/models/create_on_demand_http_probe_details'
require 'oci/healthchecks/models/create_on_demand_ping_probe_details'
require 'oci/healthchecks/models/create_ping_monitor_details'
require 'oci/healthchecks/models/dns'
require 'oci/healthchecks/models/geolocation'
require 'oci/healthchecks/models/health_checks_vantage_point_summary'
require 'oci/healthchecks/models/http_monitor'
require 'oci/healthchecks/models/http_monitor_summary'
require 'oci/healthchecks/models/http_probe'
require 'oci/healthchecks/models/http_probe_method'
require 'oci/healthchecks/models/http_probe_protocol'
require 'oci/healthchecks/models/http_probe_result_summary'
require 'oci/healthchecks/models/ping_monitor'
require 'oci/healthchecks/models/ping_monitor_summary'
require 'oci/healthchecks/models/ping_probe'
require 'oci/healthchecks/models/ping_probe_protocol'
require 'oci/healthchecks/models/ping_probe_result_summary'
require 'oci/healthchecks/models/routing'
require 'oci/healthchecks/models/tcp_connection'
require 'oci/healthchecks/models/update_http_monitor_details'
require 'oci/healthchecks/models/update_ping_monitor_details'

# Require generated clients
require 'oci/healthchecks/health_checks_client'

# Require service utilities
require 'oci/healthchecks/util'
