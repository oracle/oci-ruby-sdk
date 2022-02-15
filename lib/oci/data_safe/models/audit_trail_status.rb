# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DataSafe::Models
    AUDIT_TRAIL_STATUS_ENUM = [
      AUDIT_TRAIL_STATUS_STARTING = 'STARTING'.freeze,
      AUDIT_TRAIL_STATUS_COLLECTING = 'COLLECTING'.freeze,
      AUDIT_TRAIL_STATUS_RECOVERING = 'RECOVERING'.freeze,
      AUDIT_TRAIL_STATUS_IDLE = 'IDLE'.freeze,
      AUDIT_TRAIL_STATUS_STOPPING = 'STOPPING'.freeze,
      AUDIT_TRAIL_STATUS_STOPPED = 'STOPPED'.freeze,
      AUDIT_TRAIL_STATUS_RESUMING = 'RESUMING'.freeze,
      AUDIT_TRAIL_STATUS_RETRYING = 'RETRYING'.freeze
    ].freeze
  end
end
