# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module Dns
    # Module containing models for requests made to, and responses received from,
    # OCI Dns services
    module Models
    end
  end
end

# Require models
require 'oci/dns/models/change_steering_policy_compartment_details'
require 'oci/dns/models/change_zone_compartment_details'
require 'oci/dns/models/create_steering_policy_attachment_details'
require 'oci/dns/models/create_steering_policy_details'
require 'oci/dns/models/create_zone_details'
require 'oci/dns/models/external_master'
require 'oci/dns/models/nameserver'
require 'oci/dns/models/patch_domain_records_details'
require 'oci/dns/models/patch_rr_set_details'
require 'oci/dns/models/patch_zone_records_details'
require 'oci/dns/models/rr_set'
require 'oci/dns/models/record'
require 'oci/dns/models/record_collection'
require 'oci/dns/models/record_details'
require 'oci/dns/models/record_operation'
require 'oci/dns/models/sort_order'
require 'oci/dns/models/steering_policy'
require 'oci/dns/models/steering_policy_answer'
require 'oci/dns/models/steering_policy_attachment'
require 'oci/dns/models/steering_policy_attachment_summary'
require 'oci/dns/models/steering_policy_filter_answer_data'
require 'oci/dns/models/steering_policy_filter_rule'
require 'oci/dns/models/steering_policy_filter_rule_case'
require 'oci/dns/models/steering_policy_health_rule'
require 'oci/dns/models/steering_policy_health_rule_case'
require 'oci/dns/models/steering_policy_limit_rule'
require 'oci/dns/models/steering_policy_limit_rule_case'
require 'oci/dns/models/steering_policy_priority_answer_data'
require 'oci/dns/models/steering_policy_priority_rule'
require 'oci/dns/models/steering_policy_priority_rule_case'
require 'oci/dns/models/steering_policy_rule'
require 'oci/dns/models/steering_policy_summary'
require 'oci/dns/models/steering_policy_weighted_answer_data'
require 'oci/dns/models/steering_policy_weighted_rule'
require 'oci/dns/models/steering_policy_weighted_rule_case'
require 'oci/dns/models/tsig'
require 'oci/dns/models/update_domain_records_details'
require 'oci/dns/models/update_rr_set_details'
require 'oci/dns/models/update_steering_policy_attachment_details'
require 'oci/dns/models/update_steering_policy_details'
require 'oci/dns/models/update_zone_details'
require 'oci/dns/models/update_zone_records_details'
require 'oci/dns/models/zone'
require 'oci/dns/models/zone_summary'

# Require generated clients
require 'oci/dns/dns_client'
require 'oci/dns/dns_client_composite_operations'

# Require service utilities
require 'oci/dns/util'
