# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DatabaseMigration::Models
    DATA_PUMP_JOB_MODE_ENUM = [
      DATA_PUMP_JOB_MODE_FULL = 'FULL'.freeze,
      DATA_PUMP_JOB_MODE_SCHEMA = 'SCHEMA'.freeze,
      DATA_PUMP_JOB_MODE_TABLE = 'TABLE'.freeze,
      DATA_PUMP_JOB_MODE_TABLESPACE = 'TABLESPACE'.freeze,
      DATA_PUMP_JOB_MODE_TRANSPORTABLE = 'TRANSPORTABLE'.freeze
    ].freeze
  end
end
