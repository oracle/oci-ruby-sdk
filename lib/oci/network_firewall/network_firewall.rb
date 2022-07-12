# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module NetworkFirewall
    # Module containing models for requests made to, and responses received from,
    # OCI NetworkFirewall services
    module Models
    end
  end
end

# Require models
require 'oci/network_firewall/models/action_type'
require 'oci/network_firewall/models/application'
require 'oci/network_firewall/models/change_network_firewall_compartment_details'
require 'oci/network_firewall/models/change_network_firewall_policy_compartment_details'
require 'oci/network_firewall/models/create_network_firewall_details'
require 'oci/network_firewall/models/create_network_firewall_policy_details'
require 'oci/network_firewall/models/decryption_profile'
require 'oci/network_firewall/models/decryption_rule'
require 'oci/network_firewall/models/decryption_rule_match_criteria'
require 'oci/network_firewall/models/icmp6_application'
require 'oci/network_firewall/models/icmp_application'
require 'oci/network_firewall/models/lifecycle_state'
require 'oci/network_firewall/models/mapped_secret'
require 'oci/network_firewall/models/network_firewall'
require 'oci/network_firewall/models/network_firewall_collection'
require 'oci/network_firewall/models/network_firewall_policy'
require 'oci/network_firewall/models/network_firewall_policy_summary'
require 'oci/network_firewall/models/network_firewall_policy_summary_collection'
require 'oci/network_firewall/models/network_firewall_summary'
require 'oci/network_firewall/models/operation_status'
require 'oci/network_firewall/models/operation_type'
require 'oci/network_firewall/models/security_rule'
require 'oci/network_firewall/models/security_rule_match_criteria'
require 'oci/network_firewall/models/simple_url_pattern'
require 'oci/network_firewall/models/sort_order'
require 'oci/network_firewall/models/ssl_forward_proxy_profile'
require 'oci/network_firewall/models/ssl_inbound_inspection_profile'
require 'oci/network_firewall/models/tcp_application'
require 'oci/network_firewall/models/udp_application'
require 'oci/network_firewall/models/update_network_firewall_details'
require 'oci/network_firewall/models/update_network_firewall_policy_details'
require 'oci/network_firewall/models/url_pattern'
require 'oci/network_firewall/models/vault_mapped_secret'
require 'oci/network_firewall/models/work_request'
require 'oci/network_firewall/models/work_request_error'
require 'oci/network_firewall/models/work_request_error_collection'
require 'oci/network_firewall/models/work_request_log_entry'
require 'oci/network_firewall/models/work_request_log_entry_collection'
require 'oci/network_firewall/models/work_request_resource'
require 'oci/network_firewall/models/work_request_resource_metadata_key'
require 'oci/network_firewall/models/work_request_summary'
require 'oci/network_firewall/models/work_request_summary_collection'

# Require generated clients
require 'oci/network_firewall/network_firewall_client'
require 'oci/network_firewall/network_firewall_client_composite_operations'

# Require service utilities
require 'oci/network_firewall/util'
