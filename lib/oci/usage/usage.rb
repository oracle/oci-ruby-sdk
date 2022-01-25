# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Usage
    # Module containing models for requests made to, and responses received from,
    # OCI Usage services
    module Models
    end
  end
end

# Require models
require 'oci/usage/models/create_redeemable_user_details'
require 'oci/usage/models/monthly_reward_summary'
require 'oci/usage/models/product_collection'
require 'oci/usage/models/product_summary'
require 'oci/usage/models/redeemable_user'
require 'oci/usage/models/redeemable_user_collection'
require 'oci/usage/models/redeemable_user_summary'
require 'oci/usage/models/reward_collection'
require 'oci/usage/models/reward_details'

# Require generated clients
require 'oci/usage/rewards_client'

# Require service utilities
require 'oci/usage/util'
