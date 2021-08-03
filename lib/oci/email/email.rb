# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Email
    # Module containing models for requests made to, and responses received from,
    # OCI Email services
    module Models
    end
  end
end

# Require models
require 'oci/email/models/action_type'
require 'oci/email/models/change_email_domain_compartment_details'
require 'oci/email/models/change_sender_compartment_details'
require 'oci/email/models/create_dkim_details'
require 'oci/email/models/create_email_domain_details'
require 'oci/email/models/create_sender_details'
require 'oci/email/models/create_suppression_details'
require 'oci/email/models/dkim'
require 'oci/email/models/dkim_collection'
require 'oci/email/models/dkim_summary'
require 'oci/email/models/email_domain'
require 'oci/email/models/email_domain_collection'
require 'oci/email/models/email_domain_summary'
require 'oci/email/models/operation_status'
require 'oci/email/models/operation_type'
require 'oci/email/models/sender'
require 'oci/email/models/sender_summary'
require 'oci/email/models/sort_order'
require 'oci/email/models/suppression'
require 'oci/email/models/suppression_summary'
require 'oci/email/models/update_dkim_details'
require 'oci/email/models/update_email_domain_details'
require 'oci/email/models/update_sender_details'
require 'oci/email/models/work_request'
require 'oci/email/models/work_request_error'
require 'oci/email/models/work_request_error_collection'
require 'oci/email/models/work_request_log_entry'
require 'oci/email/models/work_request_log_entry_collection'
require 'oci/email/models/work_request_resource'
require 'oci/email/models/work_request_summary'
require 'oci/email/models/work_request_summary_collection'

# Require generated clients
require 'oci/email/email_client'
require 'oci/email/email_client_composite_operations'

# Require service utilities
require 'oci/email/util'
