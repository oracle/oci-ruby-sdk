# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DatabaseMigration::Models
    DATABASE_CONNECTION_TYPES_ENUM = [
      DATABASE_CONNECTION_TYPES_MANUAL = 'MANUAL'.freeze,
      DATABASE_CONNECTION_TYPES_AUTONOMOUS = 'AUTONOMOUS'.freeze,
      DATABASE_CONNECTION_TYPES_USER_MANAGED_OCI = 'USER_MANAGED_OCI'.freeze
    ].freeze
  end
end
