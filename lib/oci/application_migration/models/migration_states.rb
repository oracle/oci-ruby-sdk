# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ApplicationMigration::Models
    MIGRATION_STATES_ENUM = [
      MIGRATION_STATES_DISCOVERING_APPLICATION = 'DISCOVERING_APPLICATION'.freeze,
      MIGRATION_STATES_DISCOVERY_FAILED = 'DISCOVERY_FAILED'.freeze,
      MIGRATION_STATES_MISSING_CONFIG_VALUES = 'MISSING_CONFIG_VALUES'.freeze,
      MIGRATION_STATES_READY = 'READY'.freeze,
      MIGRATION_STATES_MIGRATING = 'MIGRATING'.freeze,
      MIGRATION_STATES_MIGRATION_FAILED = 'MIGRATION_FAILED'.freeze,
      MIGRATION_STATES_MIGRATION_SUCCEEDED = 'MIGRATION_SUCCEEDED'.freeze
    ].freeze
  end
end
