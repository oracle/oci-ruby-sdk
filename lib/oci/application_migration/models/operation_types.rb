# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ApplicationMigration::Models
    OPERATION_TYPES_ENUM = [
      OPERATION_TYPES_CREATE_SOURCE = 'CREATE_SOURCE'.freeze,
      OPERATION_TYPES_UPDATE_SOURCE = 'UPDATE_SOURCE'.freeze,
      OPERATION_TYPES_DELETE_SOURCE = 'DELETE_SOURCE'.freeze,
      OPERATION_TYPES_CREATE_MIGRATION = 'CREATE_MIGRATION'.freeze,
      OPERATION_TYPES_UPDATE_MIGRATION = 'UPDATE_MIGRATION'.freeze,
      OPERATION_TYPES_DELETE_MIGRATION = 'DELETE_MIGRATION'.freeze,
      OPERATION_TYPES_AUTHORIZE_SOURCE = 'AUTHORIZE_SOURCE'.freeze,
      OPERATION_TYPES_DISCOVER_APPLICATION = 'DISCOVER_APPLICATION'.freeze,
      OPERATION_TYPES_MIGRATE_APPLICATION = 'MIGRATE_APPLICATION'.freeze,
      OPERATION_TYPES_CHANGE_SOURCE_COMPARTMENT = 'CHANGE_SOURCE_COMPARTMENT'.freeze,
      OPERATION_TYPES_CHANGE_MIGRATION_COMPARTMENT = 'CHANGE_MIGRATION_COMPARTMENT'.freeze
    ].freeze
  end
end
