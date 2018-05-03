# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

module OCI
  module LoadBalancer
    # Module containing models for requests made to, and responses received from,
    # OCI LoadBalancer services
    module Models
    end
  end
end

# Require models
require 'oci/load_balancer/models/backend'
require 'oci/load_balancer/models/backend_details'
require 'oci/load_balancer/models/backend_health'
require 'oci/load_balancer/models/backend_set'
require 'oci/load_balancer/models/backend_set_details'
require 'oci/load_balancer/models/backend_set_health'
require 'oci/load_balancer/models/certificate'
require 'oci/load_balancer/models/certificate_details'
require 'oci/load_balancer/models/connection_configuration'
require 'oci/load_balancer/models/create_backend_details'
require 'oci/load_balancer/models/create_backend_set_details'
require 'oci/load_balancer/models/create_certificate_details'
require 'oci/load_balancer/models/create_hostname_details'
require 'oci/load_balancer/models/create_listener_details'
require 'oci/load_balancer/models/create_load_balancer_details'
require 'oci/load_balancer/models/create_path_route_set_details'
require 'oci/load_balancer/models/health_check_result'
require 'oci/load_balancer/models/health_checker'
require 'oci/load_balancer/models/health_checker_details'
require 'oci/load_balancer/models/hostname'
require 'oci/load_balancer/models/hostname_details'
require 'oci/load_balancer/models/ip_address'
require 'oci/load_balancer/models/listener'
require 'oci/load_balancer/models/listener_details'
require 'oci/load_balancer/models/load_balancer'
require 'oci/load_balancer/models/load_balancer_health'
require 'oci/load_balancer/models/load_balancer_health_summary'
require 'oci/load_balancer/models/load_balancer_policy'
require 'oci/load_balancer/models/load_balancer_protocol'
require 'oci/load_balancer/models/load_balancer_shape'
require 'oci/load_balancer/models/path_match_type'
require 'oci/load_balancer/models/path_route'
require 'oci/load_balancer/models/path_route_set'
require 'oci/load_balancer/models/path_route_set_details'
require 'oci/load_balancer/models/ssl_configuration'
require 'oci/load_balancer/models/ssl_configuration_details'
require 'oci/load_balancer/models/session_persistence_configuration_details'
require 'oci/load_balancer/models/update_backend_details'
require 'oci/load_balancer/models/update_backend_set_details'
require 'oci/load_balancer/models/update_health_checker_details'
require 'oci/load_balancer/models/update_hostname_details'
require 'oci/load_balancer/models/update_listener_details'
require 'oci/load_balancer/models/update_load_balancer_details'
require 'oci/load_balancer/models/update_path_route_set_details'
require 'oci/load_balancer/models/work_request'
require 'oci/load_balancer/models/work_request_error'

# Require generated clients
require 'oci/load_balancer/load_balancer_client'
require 'oci/load_balancer/load_balancer_client_composite_operations'

# Require service utilities
require 'oci/load_balancer/util'
