# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DatabaseMigration::Models
    DATA_PUMP_TABLE_EXISTS_ACTION_ENUM = [
      DATA_PUMP_TABLE_EXISTS_ACTION_TRUNCATE = 'TRUNCATE'.freeze,
      DATA_PUMP_TABLE_EXISTS_ACTION_REPLACE = 'REPLACE'.freeze,
      DATA_PUMP_TABLE_EXISTS_ACTION_APPEND = 'APPEND'.freeze,
      DATA_PUMP_TABLE_EXISTS_ACTION_SKIP = 'SKIP'.freeze
    ].freeze
  end
end
