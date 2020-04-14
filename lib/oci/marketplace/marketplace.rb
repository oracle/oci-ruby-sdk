# Copyright (c) 2016, 2020, Oracle and/or its affiliates. All rights reserved.

module OCI
  module Marketplace
    # Module containing models for requests made to, and responses received from,
    # OCI Marketplace services
    module Models
    end
  end
end

# Require models
require 'oci/marketplace/models/accepted_agreement'
require 'oci/marketplace/models/accepted_agreement_summary'
require 'oci/marketplace/models/agreement'
require 'oci/marketplace/models/agreement_summary'
require 'oci/marketplace/models/category_summary'
require 'oci/marketplace/models/create_accepted_agreement_details'
require 'oci/marketplace/models/documentation_link'
require 'oci/marketplace/models/error_entity'
require 'oci/marketplace/models/image_listing_package'
require 'oci/marketplace/models/item'
require 'oci/marketplace/models/link'
require 'oci/marketplace/models/link_enum'
require 'oci/marketplace/models/listing'
require 'oci/marketplace/models/listing_package'
require 'oci/marketplace/models/listing_package_summary'
require 'oci/marketplace/models/listing_summary'
require 'oci/marketplace/models/named_link'
require 'oci/marketplace/models/orchestration_listing_package'
require 'oci/marketplace/models/orchestration_variable'
require 'oci/marketplace/models/orchestration_variable_type_enum'
require 'oci/marketplace/models/package_type_enum'
require 'oci/marketplace/models/pricing_currency_enum'
require 'oci/marketplace/models/pricing_model'
require 'oci/marketplace/models/pricing_strategy_enum'
require 'oci/marketplace/models/pricing_type_enum'
require 'oci/marketplace/models/publisher'
require 'oci/marketplace/models/publisher_summary'
require 'oci/marketplace/models/region'
require 'oci/marketplace/models/screenshot'
require 'oci/marketplace/models/support_contact'
require 'oci/marketplace/models/update_accepted_agreement_details'
require 'oci/marketplace/models/upload_data'

# Require generated clients
require 'oci/marketplace/marketplace_client'

# Require service utilities
require 'oci/marketplace/util'
