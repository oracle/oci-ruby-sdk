# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DataScience::Models
    JOB_RUN_LIFECYCLE_STATE_ENUM = [
      JOB_RUN_LIFECYCLE_STATE_ACCEPTED = 'ACCEPTED'.freeze,
      JOB_RUN_LIFECYCLE_STATE_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      JOB_RUN_LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      JOB_RUN_LIFECYCLE_STATE_SUCCEEDED = 'SUCCEEDED'.freeze,
      JOB_RUN_LIFECYCLE_STATE_CANCELING = 'CANCELING'.freeze,
      JOB_RUN_LIFECYCLE_STATE_CANCELED = 'CANCELED'.freeze,
      JOB_RUN_LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      JOB_RUN_LIFECYCLE_STATE_NEEDS_ATTENTION = 'NEEDS_ATTENTION'.freeze
    ].freeze
  end
end