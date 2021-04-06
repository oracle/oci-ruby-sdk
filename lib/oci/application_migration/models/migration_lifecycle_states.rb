# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ApplicationMigration::Models
    MIGRATION_LIFECYCLE_STATES_ENUM = [
      MIGRATION_LIFECYCLE_STATES_CREATING = 'CREATING'.freeze,
      MIGRATION_LIFECYCLE_STATES_ACTIVE = 'ACTIVE'.freeze,
      MIGRATION_LIFECYCLE_STATES_INACTIVE = 'INACTIVE'.freeze,
      MIGRATION_LIFECYCLE_STATES_UPDATING = 'UPDATING'.freeze,
      MIGRATION_LIFECYCLE_STATES_SUCCEEDED = 'SUCCEEDED'.freeze,
      MIGRATION_LIFECYCLE_STATES_DELETING = 'DELETING'.freeze,
      MIGRATION_LIFECYCLE_STATES_DELETED = 'DELETED'.freeze
    ].freeze
  end
end
