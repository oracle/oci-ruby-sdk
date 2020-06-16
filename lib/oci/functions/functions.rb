# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Functions
    # Module containing models for requests made to, and responses received from,
    # OCI Functions services
    module Models
    end
  end
end

# Require models
require 'oci/functions/models/application'
require 'oci/functions/models/application_summary'
require 'oci/functions/models/change_application_compartment_details'
require 'oci/functions/models/create_application_details'
require 'oci/functions/models/create_function_details'
require 'oci/functions/models/function'
require 'oci/functions/models/function_summary'
require 'oci/functions/models/update_application_details'
require 'oci/functions/models/update_function_details'

# Require generated clients
require 'oci/functions/functions_invoke_client'
require 'oci/functions/functions_management_client'
require 'oci/functions/functions_management_client_composite_operations'

# Require service utilities
require 'oci/functions/util'
