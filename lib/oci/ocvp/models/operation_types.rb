# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Ocvp::Models
    OPERATION_TYPES_ENUM = [
      OPERATION_TYPES_CREATE_SDDC = 'CREATE_SDDC'.freeze,
      OPERATION_TYPES_DELETE_SDDC = 'DELETE_SDDC'.freeze,
      OPERATION_TYPES_CREATE_ESXI_HOST = 'CREATE_ESXI_HOST'.freeze,
      OPERATION_TYPES_DELETE_ESXI_HOST = 'DELETE_ESXI_HOST'.freeze,
      OPERATION_TYPES_UPGRADE_HCX = 'UPGRADE_HCX'.freeze,
      OPERATION_TYPES_DOWNGRADE_HCX = 'DOWNGRADE_HCX'.freeze,
      OPERATION_TYPES_CANCEL_DOWNGRADE_HCX = 'CANCEL_DOWNGRADE_HCX'.freeze,
      OPERATION_TYPES_REFRESH_HCX_LICENSE_STATUS = 'REFRESH_HCX_LICENSE_STATUS'.freeze
    ].freeze
  end
end
