# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Sch::Models
    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_CREATE_SERVICE_CONNECTOR = 'CREATE_SERVICE_CONNECTOR'.freeze,
      OPERATION_TYPE_UPDATE_SERVICE_CONNECTOR = 'UPDATE_SERVICE_CONNECTOR'.freeze,
      OPERATION_TYPE_DELETE_SERVICE_CONNECTOR = 'DELETE_SERVICE_CONNECTOR'.freeze,
      OPERATION_TYPE_ACTIVATE_SERVICE_CONNECTOR = 'ACTIVATE_SERVICE_CONNECTOR'.freeze,
      OPERATION_TYPE_DEACTIVATE_SERVICE_CONNECTOR = 'DEACTIVATE_SERVICE_CONNECTOR'.freeze
    ].freeze
  end
end
