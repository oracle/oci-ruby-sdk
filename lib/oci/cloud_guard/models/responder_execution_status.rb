# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module CloudGuard::Models
    RESPONDER_EXECUTION_STATUS_ENUM = [
      RESPONDER_EXECUTION_STATUS_STARTED = 'STARTED'.freeze,
      RESPONDER_EXECUTION_STATUS_AWAITING_CONFIRMATION = 'AWAITING_CONFIRMATION'.freeze,
      RESPONDER_EXECUTION_STATUS_SUCCEEDED = 'SUCCEEDED'.freeze,
      RESPONDER_EXECUTION_STATUS_FAILED = 'FAILED'.freeze,
      RESPONDER_EXECUTION_STATUS_SKIPPED = 'SKIPPED'.freeze
    ].freeze
  end
end
