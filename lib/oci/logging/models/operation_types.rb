# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Logging::Models
    OPERATION_TYPES_ENUM = [
      OPERATION_TYPES_CREATE_LOG = 'CREATE_LOG'.freeze,
      OPERATION_TYPES_UPDATE_LOG = 'UPDATE_LOG'.freeze,
      OPERATION_TYPES_DELETE_LOG = 'DELETE_LOG'.freeze,
      OPERATION_TYPES_MOVE_LOG = 'MOVE_LOG'.freeze,
      OPERATION_TYPES_CREATE_LOG_GROUP = 'CREATE_LOG_GROUP'.freeze,
      OPERATION_TYPES_UPDATE_LOG_GROUP = 'UPDATE_LOG_GROUP'.freeze,
      OPERATION_TYPES_DELETE_LOG_GROUP = 'DELETE_LOG_GROUP'.freeze,
      OPERATION_TYPES_MOVE_LOG_GROUP = 'MOVE_LOG_GROUP'.freeze,
      OPERATION_TYPES_CREATE_CONFIGURATION = 'CREATE_CONFIGURATION'.freeze,
      OPERATION_TYPES_UPDATE_CONFIGURATION = 'UPDATE_CONFIGURATION'.freeze,
      OPERATION_TYPES_DELETE_CONFIGURATION = 'DELETE_CONFIGURATION'.freeze,
      OPERATION_TYPES_MOVE_CONFIGURATION = 'MOVE_CONFIGURATION'.freeze
    ].freeze
  end
end
