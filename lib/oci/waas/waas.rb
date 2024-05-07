# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20181116

module OCI
  module Waas
    # Module containing models for requests made to, and responses received from,
    # OCI Waas services
    module Models
    end
  end
end

# Require models
require 'oci/waas/models/access_rule'
require 'oci/waas/models/access_rule_criteria'
require 'oci/waas/models/add_http_response_header_action'
require 'oci/waas/models/address_list'
require 'oci/waas/models/address_list_summary'
require 'oci/waas/models/address_rate_limiting'
require 'oci/waas/models/block_challenge_settings'
require 'oci/waas/models/caching_rule'
require 'oci/waas/models/caching_rule_criteria'
require 'oci/waas/models/caching_rule_summary'
require 'oci/waas/models/captcha'
require 'oci/waas/models/certificate'
require 'oci/waas/models/certificate_extensions'
require 'oci/waas/models/certificate_issuer_name'
require 'oci/waas/models/certificate_public_key_info'
require 'oci/waas/models/certificate_subject_name'
require 'oci/waas/models/certificate_summary'
require 'oci/waas/models/change_address_list_compartment_details'
require 'oci/waas/models/change_certificate_compartment_details'
require 'oci/waas/models/change_custom_protection_rule_compartment_details'
require 'oci/waas/models/change_http_redirect_compartment_details'
require 'oci/waas/models/change_waas_policy_compartment_details'
require 'oci/waas/models/create_address_list_details'
require 'oci/waas/models/create_certificate_details'
require 'oci/waas/models/create_custom_protection_rule_details'
require 'oci/waas/models/create_http_redirect_details'
require 'oci/waas/models/create_waas_policy_details'
require 'oci/waas/models/custom_protection_rule'
require 'oci/waas/models/custom_protection_rule_setting'
require 'oci/waas/models/custom_protection_rule_summary'
require 'oci/waas/models/device_fingerprint_challenge'
require 'oci/waas/models/edge_subnet'
require 'oci/waas/models/extend_http_response_header_action'
require 'oci/waas/models/good_bot'
require 'oci/waas/models/header'
require 'oci/waas/models/header_manipulation_action'
require 'oci/waas/models/health_check'
require 'oci/waas/models/http_redirect'
require 'oci/waas/models/http_redirect_summary'
require 'oci/waas/models/http_redirect_target'
require 'oci/waas/models/human_interaction_challenge'
require 'oci/waas/models/ip_hash_load_balancing_method'
require 'oci/waas/models/js_challenge'
require 'oci/waas/models/lifecycle_states'
require 'oci/waas/models/load_balancing_method'
require 'oci/waas/models/origin'
require 'oci/waas/models/origin_group'
require 'oci/waas/models/origin_group_origins'
require 'oci/waas/models/policy_config'
require 'oci/waas/models/protection_rule'
require 'oci/waas/models/protection_rule_action'
require 'oci/waas/models/protection_rule_exclusion'
require 'oci/waas/models/protection_settings'
require 'oci/waas/models/purge_cache'
require 'oci/waas/models/recommendation'
require 'oci/waas/models/remove_http_response_header_action'
require 'oci/waas/models/round_robin_load_balancing_method'
require 'oci/waas/models/sticky_cookie_load_balancing_method'
require 'oci/waas/models/threat_feed'
require 'oci/waas/models/threat_feed_action'
require 'oci/waas/models/update_address_list_details'
require 'oci/waas/models/update_certificate_details'
require 'oci/waas/models/update_custom_protection_rule_details'
require 'oci/waas/models/update_http_redirect_details'
require 'oci/waas/models/update_waas_policy_details'
require 'oci/waas/models/waas_policy'
require 'oci/waas/models/waas_policy_custom_protection_rule_summary'
require 'oci/waas/models/waas_policy_summary'
require 'oci/waas/models/waf_blocked_request'
require 'oci/waas/models/waf_config'
require 'oci/waas/models/waf_config_details'
require 'oci/waas/models/waf_log'
require 'oci/waas/models/waf_meter_datum'
require 'oci/waas/models/waf_request'
require 'oci/waas/models/waf_traffic_datum'
require 'oci/waas/models/whitelist'
require 'oci/waas/models/work_request'
require 'oci/waas/models/work_request_error'
require 'oci/waas/models/work_request_log_entry'
require 'oci/waas/models/work_request_operation_types'
require 'oci/waas/models/work_request_resource'
require 'oci/waas/models/work_request_status_values'
require 'oci/waas/models/work_request_summary'

# Require generated clients
require 'oci/waas/redirect_client'
require 'oci/waas/redirect_client_composite_operations'
require 'oci/waas/waas_client'
require 'oci/waas/waas_client_composite_operations'

# Require service utilities
require 'oci/waas/util'
