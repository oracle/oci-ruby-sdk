# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Budget
    # Module containing models for requests made to, and responses received from,
    # OCI Budget services
    module Models
    end
  end
end

# Require models
require 'oci/budget/models/alert_rule'
require 'oci/budget/models/alert_rule_summary'
require 'oci/budget/models/alert_type'
require 'oci/budget/models/budget'
require 'oci/budget/models/budget_summary'
require 'oci/budget/models/create_alert_rule_details'
require 'oci/budget/models/create_budget_details'
require 'oci/budget/models/lifecycle_state'
require 'oci/budget/models/reset_period'
require 'oci/budget/models/sort_by'
require 'oci/budget/models/sort_order'
require 'oci/budget/models/target_type'
require 'oci/budget/models/threshold_type'
require 'oci/budget/models/update_alert_rule_details'
require 'oci/budget/models/update_budget_details'

# Require generated clients
require 'oci/budget/budget_client'
require 'oci/budget/budget_client_composite_operations'

# Require service utilities
require 'oci/budget/util'
