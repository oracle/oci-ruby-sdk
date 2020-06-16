# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Cims::Models
    LIFECYCLE_DETAILS_ENUM = [
      LIFECYCLE_DETAILS_PENDING_WITH_ORACLE = 'PENDING_WITH_ORACLE'.freeze,
      LIFECYCLE_DETAILS_PENDING_WITH_CUSTOMER = 'PENDING_WITH_CUSTOMER'.freeze,
      LIFECYCLE_DETAILS_CLOSE_REQUESTED = 'CLOSE_REQUESTED'.freeze,
      LIFECYCLE_DETAILS_CLOSED = 'CLOSED'.freeze
    ].freeze
  end
end
