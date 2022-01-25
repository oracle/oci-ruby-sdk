# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Marketplace::Models
    PRICING_STRATEGY_ENUM_ENUM = [
      PRICING_STRATEGY_ENUM_PER_OCPU_LINEAR = 'PER_OCPU_LINEAR'.freeze,
      PRICING_STRATEGY_ENUM_PER_OCPU_MIN_BILLING = 'PER_OCPU_MIN_BILLING'.freeze,
      PRICING_STRATEGY_ENUM_PER_INSTANCE = 'PER_INSTANCE'.freeze,
      PRICING_STRATEGY_ENUM_PER_INSTANCE_MONTHLY_INCLUSIVE = 'PER_INSTANCE_MONTHLY_INCLUSIVE'.freeze
    ].freeze
  end
end
