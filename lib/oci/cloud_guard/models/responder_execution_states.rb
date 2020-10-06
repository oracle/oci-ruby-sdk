# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module CloudGuard::Models
    RESPONDER_EXECUTION_STATES_ENUM = [
      RESPONDER_EXECUTION_STATES_STARTED = 'STARTED'.freeze,
      RESPONDER_EXECUTION_STATES_AWAITING_CONFIRMATION = 'AWAITING_CONFIRMATION'.freeze,
      RESPONDER_EXECUTION_STATES_AWAITING_INPUT = 'AWAITING_INPUT'.freeze,
      RESPONDER_EXECUTION_STATES_SUCCEEDED = 'SUCCEEDED'.freeze,
      RESPONDER_EXECUTION_STATES_FAILED = 'FAILED'.freeze,
      RESPONDER_EXECUTION_STATES_SKIPPED = 'SKIPPED'.freeze,
      RESPONDER_EXECUTION_STATES_ALL = 'ALL'.freeze
    ].freeze
  end
end
