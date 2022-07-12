# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module NetworkFirewall::Models
    OPERATION_STATUS_ENUM = [
      OPERATION_STATUS_ACCEPTED = 'ACCEPTED'.freeze,
      OPERATION_STATUS_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      OPERATION_STATUS_WAITING = 'WAITING'.freeze,
      OPERATION_STATUS_FAILED = 'FAILED'.freeze,
      OPERATION_STATUS_SUCCEEDED = 'SUCCEEDED'.freeze,
      OPERATION_STATUS_CANCELING = 'CANCELING'.freeze,
      OPERATION_STATUS_CANCELED = 'CANCELED'.freeze
    ].freeze
  end
end
