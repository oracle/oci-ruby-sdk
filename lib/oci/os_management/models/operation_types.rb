# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module OsManagement::Models
    OPERATION_TYPES_ENUM = [
      OPERATION_TYPES_INSTALL = 'INSTALL'.freeze,
      OPERATION_TYPES_UPDATE = 'UPDATE'.freeze,
      OPERATION_TYPES_REMOVE = 'REMOVE'.freeze,
      OPERATION_TYPES_UPDATEALL = 'UPDATEALL'.freeze,
      OPERATION_TYPES_ENABLEMODULESTREAM = 'ENABLEMODULESTREAM'.freeze,
      OPERATION_TYPES_DISABLEMODULESTREAM = 'DISABLEMODULESTREAM'.freeze,
      OPERATION_TYPES_SWITCHMODULESTREAM = 'SWITCHMODULESTREAM'.freeze,
      OPERATION_TYPES_INSTALLMODULESTREAMPROFILE = 'INSTALLMODULESTREAMPROFILE'.freeze,
      OPERATION_TYPES_REMOVEMODULESTREAMPROFILE = 'REMOVEMODULESTREAMPROFILE'.freeze,
      OPERATION_TYPES_COMPOUND = 'COMPOUND'.freeze
    ].freeze
  end
end
