# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module Email
    # Module containing models for requests made to, and responses received from,
    # OCI Email services
    module Models
    end
  end
end

# Require models
require 'oci/email/models/change_sender_compartment_details'
require 'oci/email/models/create_sender_details'
require 'oci/email/models/create_suppression_details'
require 'oci/email/models/sender'
require 'oci/email/models/sender_summary'
require 'oci/email/models/suppression'
require 'oci/email/models/suppression_summary'
require 'oci/email/models/update_sender_details'

# Require generated clients
require 'oci/email/email_client'
require 'oci/email/email_client_composite_operations'

# Require service utilities
require 'oci/email/util'
