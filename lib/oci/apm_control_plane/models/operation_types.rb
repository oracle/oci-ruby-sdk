# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ApmControlPlane::Models
    OPERATION_TYPES_ENUM = [
      OPERATION_TYPES_CREATE_APM_DOMAIN = 'CREATE_APM_DOMAIN'.freeze,
      OPERATION_TYPES_UPDATE_APM_DOMAIN = 'UPDATE_APM_DOMAIN'.freeze,
      OPERATION_TYPES_DELETE_APM_DOMAIN = 'DELETE_APM_DOMAIN'.freeze,
      OPERATION_TYPES_GENERATE_DATA_KEYS = 'GENERATE_DATA_KEYS'.freeze,
      OPERATION_TYPES_REMOVE_DATA_KEYS = 'REMOVE_DATA_KEYS'.freeze
    ].freeze
  end
end
