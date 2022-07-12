# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DatabaseMigration::Models
    MIGRATION_DATABASE_TARGET_TYPES_UPDATE_ENUM = [
      MIGRATION_DATABASE_TARGET_TYPES_UPDATE_ADB_S_REMAP = 'ADB_S_REMAP'.freeze,
      MIGRATION_DATABASE_TARGET_TYPES_UPDATE_ADB_D_REMAP = 'ADB_D_REMAP'.freeze,
      MIGRATION_DATABASE_TARGET_TYPES_UPDATE_ADB_D_AUTOCREATE = 'ADB_D_AUTOCREATE'.freeze,
      MIGRATION_DATABASE_TARGET_TYPES_UPDATE_NON_ADB_REMAP = 'NON_ADB_REMAP'.freeze,
      MIGRATION_DATABASE_TARGET_TYPES_UPDATE_NON_ADB_AUTOCREATE = 'NON_ADB_AUTOCREATE'.freeze,
      MIGRATION_DATABASE_TARGET_TYPES_UPDATE_TARGET_DEFAULTS_REMAP = 'TARGET_DEFAULTS_REMAP'.freeze,
      MIGRATION_DATABASE_TARGET_TYPES_UPDATE_TARGET_DEFAULTS_AUTOCREATE = 'TARGET_DEFAULTS_AUTOCREATE'.freeze
    ].freeze
  end
end
