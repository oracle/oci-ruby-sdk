# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module GoldenGate::Models
    LIFECYCLE_SUB_STATE_ENUM = [
      LIFECYCLE_SUB_STATE_RECOVERING = 'RECOVERING'.freeze,
      LIFECYCLE_SUB_STATE_STARTING = 'STARTING'.freeze,
      LIFECYCLE_SUB_STATE_STOPPING = 'STOPPING'.freeze,
      LIFECYCLE_SUB_STATE_MOVING = 'MOVING'.freeze,
      LIFECYCLE_SUB_STATE_UPGRADING = 'UPGRADING'.freeze,
      LIFECYCLE_SUB_STATE_RESTORING = 'RESTORING'.freeze,
      LIFECYCLE_SUB_STATE_BACKUP_IN_PROGRESS = 'BACKUP_IN_PROGRESS'.freeze
    ].freeze
  end
end
