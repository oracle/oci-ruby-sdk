# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Analytics::Models
    WORK_REQUEST_OPERATION_TYPE_ENUM = [
      WORK_REQUEST_OPERATION_TYPE_CREATE_ANALYTICS_INSTANCE = 'CREATE_ANALYTICS_INSTANCE'.freeze,
      WORK_REQUEST_OPERATION_TYPE_DELETE_ANALYTICS_INSTANCE = 'DELETE_ANALYTICS_INSTANCE'.freeze,
      WORK_REQUEST_OPERATION_TYPE_START_ANALYTICS_INSTANCE = 'START_ANALYTICS_INSTANCE'.freeze,
      WORK_REQUEST_OPERATION_TYPE_STOP_ANALYTICS_INSTANCE = 'STOP_ANALYTICS_INSTANCE'.freeze,
      WORK_REQUEST_OPERATION_TYPE_SCALE_ANALYTICS_INSTANCE = 'SCALE_ANALYTICS_INSTANCE'.freeze,
      WORK_REQUEST_OPERATION_TYPE_CHANGE_ANALYTICS_INSTANCE_COMPARTMENT = 'CHANGE_ANALYTICS_INSTANCE_COMPARTMENT'.freeze
    ].freeze
  end
end
