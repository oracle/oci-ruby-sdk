# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

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
require 'oci/marketplace/models/architecture_type'
require 'oci/marketplace/models/category_summary'
require 'oci/marketplace/models/change_publication_compartment_details'
require 'oci/marketplace/models/create_accepted_agreement_details'
require 'oci/marketplace/models/create_image_publication_package'
require 'oci/marketplace/models/create_publication_details'
require 'oci/marketplace/models/create_publication_package'
require 'oci/marketplace/models/documentation_link'
require 'oci/marketplace/models/error_entity'
require 'oci/marketplace/models/eula'
require 'oci/marketplace/models/eula_type_enum'
require 'oci/marketplace/models/free_text_search_details'
require 'oci/marketplace/models/image_listing_package'
require 'oci/marketplace/models/image_publication_package'
require 'oci/marketplace/models/ineligibility_reason_enum'
require 'oci/marketplace/models/international_market_price'
require 'oci/marketplace/models/item'
require 'oci/marketplace/models/launch_eligibility'
require 'oci/marketplace/models/link'
require 'oci/marketplace/models/link_enum'
require 'oci/marketplace/models/listing'
require 'oci/marketplace/models/listing_package'
require 'oci/marketplace/models/listing_package_summary'
require 'oci/marketplace/models/listing_summary'
require 'oci/marketplace/models/listing_type'
require 'oci/marketplace/models/matching_context_type_enum'
require 'oci/marketplace/models/named_link'
require 'oci/marketplace/models/operating_system'
require 'oci/marketplace/models/orchestration_listing_package'
require 'oci/marketplace/models/orchestration_publication_package'
require 'oci/marketplace/models/orchestration_variable'
require 'oci/marketplace/models/orchestration_variable_type_enum'
require 'oci/marketplace/models/package_type_enum'
require 'oci/marketplace/models/pricing_currency_enum'
require 'oci/marketplace/models/pricing_model'
require 'oci/marketplace/models/pricing_strategy_enum'
require 'oci/marketplace/models/pricing_type_enum'
require 'oci/marketplace/models/publication'
require 'oci/marketplace/models/publication_package'
require 'oci/marketplace/models/publication_package_summary'
require 'oci/marketplace/models/publication_summary'
require 'oci/marketplace/models/publisher'
require 'oci/marketplace/models/publisher_summary'
require 'oci/marketplace/models/region'
require 'oci/marketplace/models/report_collection'
require 'oci/marketplace/models/report_summary'
require 'oci/marketplace/models/report_type_collection'
require 'oci/marketplace/models/report_type_summary'
require 'oci/marketplace/models/screenshot'
require 'oci/marketplace/models/search_details_type_enum'
require 'oci/marketplace/models/search_listings_details'
require 'oci/marketplace/models/structured_search_details'
require 'oci/marketplace/models/support_contact'
require 'oci/marketplace/models/tax_summary'
require 'oci/marketplace/models/text_based_eula'
require 'oci/marketplace/models/third_party_paid_listing_eligibility'
require 'oci/marketplace/models/update_accepted_agreement_details'
require 'oci/marketplace/models/update_publication_details'
require 'oci/marketplace/models/upload_data'

# Require generated clients
require 'oci/marketplace/account_client'
require 'oci/marketplace/marketplace_client'
require 'oci/marketplace/marketplace_client_composite_operations'

# Require service utilities
require 'oci/marketplace/util'
