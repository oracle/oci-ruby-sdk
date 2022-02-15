# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module AiVision::Models
    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_CREATE_PROJECT = 'CREATE_PROJECT'.freeze,
      OPERATION_TYPE_UPDATE_PROJECT = 'UPDATE_PROJECT'.freeze,
      OPERATION_TYPE_DELETE_PROJECT = 'DELETE_PROJECT'.freeze,
      OPERATION_TYPE_MOVE_PROJECT = 'MOVE_PROJECT'.freeze,
      OPERATION_TYPE_CREATE_MODEL = 'CREATE_MODEL'.freeze,
      OPERATION_TYPE_UPDATE_MODEL = 'UPDATE_MODEL'.freeze,
      OPERATION_TYPE_DELETE_MODEL = 'DELETE_MODEL'.freeze,
      OPERATION_TYPE_MOVE_MODEL = 'MOVE_MODEL'.freeze
    ].freeze
  end
end
