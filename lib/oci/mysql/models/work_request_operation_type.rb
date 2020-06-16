# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Mysql::Models
    WORK_REQUEST_OPERATION_TYPE_ENUM = [
      WORK_REQUEST_OPERATION_TYPE_CREATE_DBSYSTEM = 'CREATE_DBSYSTEM'.freeze,
      WORK_REQUEST_OPERATION_TYPE_UPDATE_DBSYSTEM = 'UPDATE_DBSYSTEM'.freeze,
      WORK_REQUEST_OPERATION_TYPE_DELETE_DBSYSTEM = 'DELETE_DBSYSTEM'.freeze,
      WORK_REQUEST_OPERATION_TYPE_START_DBSYSTEM = 'START_DBSYSTEM'.freeze,
      WORK_REQUEST_OPERATION_TYPE_STOP_DBSYSTEM = 'STOP_DBSYSTEM'.freeze,
      WORK_REQUEST_OPERATION_TYPE_RESTART_DBSYSTEM = 'RESTART_DBSYSTEM'.freeze
    ].freeze
  end
end
