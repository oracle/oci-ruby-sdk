# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DatabaseMigration::Models
    MIGRATION_STATUS_ENUM = [
      MIGRATION_STATUS_READY = 'READY'.freeze,
      MIGRATION_STATUS_ABORTING = 'ABORTING'.freeze,
      MIGRATION_STATUS_VALIDATING = 'VALIDATING'.freeze,
      MIGRATION_STATUS_VALIDATED = 'VALIDATED'.freeze,
      MIGRATION_STATUS_WAITING = 'WAITING'.freeze,
      MIGRATION_STATUS_MIGRATING = 'MIGRATING'.freeze,
      MIGRATION_STATUS_DONE = 'DONE'.freeze
    ].freeze
  end
end
