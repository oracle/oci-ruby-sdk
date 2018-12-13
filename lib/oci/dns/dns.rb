# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

module OCI
  module Dns
    # Module containing models for requests made to, and responses received from,
    # OCI Dns services
    module Models
    end
  end
end

# Require models
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
require 'oci/dns/models/tsig'
require 'oci/dns/models/update_domain_records_details'
require 'oci/dns/models/update_rr_set_details'
require 'oci/dns/models/update_zone_details'
require 'oci/dns/models/update_zone_records_details'
require 'oci/dns/models/zone'
require 'oci/dns/models/zone_summary'

# Require generated clients
require 'oci/dns/dns_client'
require 'oci/dns/dns_client_composite_operations'

# Require service utilities
require 'oci/dns/util'
