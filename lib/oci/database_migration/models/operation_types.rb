# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DatabaseMigration::Models
    OPERATION_TYPES_ENUM = [
      OPERATION_TYPES_CREATE_AGENT = 'CREATE_AGENT'.freeze,
      OPERATION_TYPES_DELETE_AGENT = 'DELETE_AGENT'.freeze,
      OPERATION_TYPES_CREATE_MIGRATION = 'CREATE_MIGRATION'.freeze,
      OPERATION_TYPES_CLONE_MIGRATION = 'CLONE_MIGRATION'.freeze,
      OPERATION_TYPES_DELETE_MIGRATION = 'DELETE_MIGRATION'.freeze,
      OPERATION_TYPES_UPDATE_MIGRATION = 'UPDATE_MIGRATION'.freeze,
      OPERATION_TYPES_START_MIGRATION = 'START_MIGRATION'.freeze,
      OPERATION_TYPES_VALIDATE_MIGRATION = 'VALIDATE_MIGRATION'.freeze,
      OPERATION_TYPES_CREATE_CONNECTION = 'CREATE_CONNECTION'.freeze,
      OPERATION_TYPES_DELETE_CONNECTION = 'DELETE_CONNECTION'.freeze,
      OPERATION_TYPES_UPDATE_CONNECTION = 'UPDATE_CONNECTION'.freeze
    ].freeze
  end
end
