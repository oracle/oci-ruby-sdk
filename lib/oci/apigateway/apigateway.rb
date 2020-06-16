# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Apigateway
    # Module containing models for requests made to, and responses received from,
    # OCI Apigateway services
    module Models
    end
  end
end

# Require models
require 'oci/apigateway/models/access_log_policy'
require 'oci/apigateway/models/anonymous_route_authorization_policy'
require 'oci/apigateway/models/any_of_route_authorization_policy'
require 'oci/apigateway/models/api_specification'
require 'oci/apigateway/models/api_specification_logging_policies'
require 'oci/apigateway/models/api_specification_request_policies'
require 'oci/apigateway/models/api_specification_route'
require 'oci/apigateway/models/api_specification_route_backend'
require 'oci/apigateway/models/api_specification_route_request_policies'
require 'oci/apigateway/models/authentication_only_route_authorization_policy'
require 'oci/apigateway/models/authentication_policy'
require 'oci/apigateway/models/change_deployment_compartment_details'
require 'oci/apigateway/models/change_gateway_compartment_details'
require 'oci/apigateway/models/cors_policy'
require 'oci/apigateway/models/create_deployment_details'
require 'oci/apigateway/models/create_gateway_details'
require 'oci/apigateway/models/custom_authentication_policy'
require 'oci/apigateway/models/deployment'
require 'oci/apigateway/models/deployment_collection'
require 'oci/apigateway/models/deployment_summary'
require 'oci/apigateway/models/execution_log_policy'
require 'oci/apigateway/models/gateway'
require 'oci/apigateway/models/gateway_collection'
require 'oci/apigateway/models/gateway_summary'
require 'oci/apigateway/models/http_backend'
require 'oci/apigateway/models/header_field_specification'
require 'oci/apigateway/models/json_web_key'
require 'oci/apigateway/models/json_web_token_claim'
require 'oci/apigateway/models/jwt_authentication_policy'
require 'oci/apigateway/models/oracle_function_backend'
require 'oci/apigateway/models/pem_encoded_public_key'
require 'oci/apigateway/models/public_key_set'
require 'oci/apigateway/models/rate_limiting_policy'
require 'oci/apigateway/models/remote_json_web_key_set'
require 'oci/apigateway/models/route_authorization_policy'
require 'oci/apigateway/models/static_public_key'
require 'oci/apigateway/models/static_public_key_set'
require 'oci/apigateway/models/stock_response_backend'
require 'oci/apigateway/models/update_deployment_details'
require 'oci/apigateway/models/update_gateway_details'
require 'oci/apigateway/models/work_request'
require 'oci/apigateway/models/work_request_collection'
require 'oci/apigateway/models/work_request_error'
require 'oci/apigateway/models/work_request_error_collection'
require 'oci/apigateway/models/work_request_log'
require 'oci/apigateway/models/work_request_log_collection'
require 'oci/apigateway/models/work_request_resource'
require 'oci/apigateway/models/work_request_summary'

# Require generated clients
require 'oci/apigateway/deployment_client'
require 'oci/apigateway/deployment_client_composite_operations'
require 'oci/apigateway/gateway_client'
require 'oci/apigateway/gateway_client_composite_operations'
require 'oci/apigateway/work_requests_client'

# Require service utilities
require 'oci/apigateway/util'
