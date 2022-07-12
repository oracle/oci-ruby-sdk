# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module StackMonitoring::Models
    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_CREATE_RESOURCES = 'CREATE_RESOURCES'.freeze,
      OPERATION_TYPE_UPDATE_RESOURCES = 'UPDATE_RESOURCES'.freeze,
      OPERATION_TYPE_DELETE_RESOURCES = 'DELETE_RESOURCES'.freeze,
      OPERATION_TYPE_MOVE_RESOURCES = 'MOVE_RESOURCES'.freeze,
      OPERATION_TYPE_ENABLE_EXTERNAL_DATABASE = 'ENABLE_EXTERNAL_DATABASE'.freeze,
      OPERATION_TYPE_DISABLE_EXTERNAL_DATABASE = 'DISABLE_EXTERNAL_DATABASE'.freeze,
      OPERATION_TYPE_ADD_SOURCES_TO_AGENT = 'ADD_SOURCES_TO_AGENT'.freeze
    ].freeze
  end
end
