# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module OspGateway
    # Module containing models for requests made to, and responses received from,
    # OCI OspGateway services
    module Models
    end
  end
end

# Require models
require 'oci/osp_gateway/models/address'
require 'oci/osp_gateway/models/country'
require 'oci/osp_gateway/models/credit_card_payment_detail'
require 'oci/osp_gateway/models/currency'
require 'oci/osp_gateway/models/invoice'
require 'oci/osp_gateway/models/invoice_collection'
require 'oci/osp_gateway/models/invoice_line_collection'
require 'oci/osp_gateway/models/invoice_line_summary'
require 'oci/osp_gateway/models/invoice_summary'
require 'oci/osp_gateway/models/other_payment_detail'
require 'oci/osp_gateway/models/pay_invoice_details'
require 'oci/osp_gateway/models/pay_invoice_receipt'
require 'oci/osp_gateway/models/payment_detail'
require 'oci/osp_gateway/models/paypal_payment_detail'

# Require generated clients
require 'oci/osp_gateway/invoice_service_client'

# Require service utilities
require 'oci/osp_gateway/util'
