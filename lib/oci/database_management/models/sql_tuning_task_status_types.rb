# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DatabaseManagement::Models
    SQL_TUNING_TASK_STATUS_TYPES_ENUM = [
      SQL_TUNING_TASK_STATUS_TYPES_COMPLETED = 'COMPLETED'.freeze,
      SQL_TUNING_TASK_STATUS_TYPES_INITIAL = 'INITIAL'.freeze,
      SQL_TUNING_TASK_STATUS_TYPES_EXECUTING = 'EXECUTING'.freeze,
      SQL_TUNING_TASK_STATUS_TYPES_INTERRUPTED = 'INTERRUPTED'.freeze,
      SQL_TUNING_TASK_STATUS_TYPES_ERROR = 'ERROR'.freeze
    ].freeze
  end
end
