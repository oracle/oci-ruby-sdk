# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DataCatalog::Models
    JOB_EXECUTION_STATE_ENUM = [
      JOB_EXECUTION_STATE_CREATED = 'CREATED'.freeze,
      JOB_EXECUTION_STATE_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      JOB_EXECUTION_STATE_INACTIVE = 'INACTIVE'.freeze,
      JOB_EXECUTION_STATE_FAILED = 'FAILED'.freeze,
      JOB_EXECUTION_STATE_SUCCEEDED = 'SUCCEEDED'.freeze,
      JOB_EXECUTION_STATE_CANCELED = 'CANCELED'.freeze,
      JOB_EXECUTION_STATE_SUCCEEDED_WITH_WARNINGS = 'SUCCEEDED_WITH_WARNINGS'.freeze
    ].freeze
  end
end
