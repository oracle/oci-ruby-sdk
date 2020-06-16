# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DataScience::Models
    WORK_REQUEST_OPERATION_TYPE_ENUM = [
      WORK_REQUEST_OPERATION_TYPE_NOTEBOOK_SESSION_CREATE = 'NOTEBOOK_SESSION_CREATE'.freeze,
      WORK_REQUEST_OPERATION_TYPE_NOTEBOOK_SESSION_DELETE = 'NOTEBOOK_SESSION_DELETE'.freeze,
      WORK_REQUEST_OPERATION_TYPE_NOTEBOOK_SESSION_ACTIVATE = 'NOTEBOOK_SESSION_ACTIVATE'.freeze,
      WORK_REQUEST_OPERATION_TYPE_NOTEBOOK_SESSION_DEACTIVATE = 'NOTEBOOK_SESSION_DEACTIVATE'.freeze,
      WORK_REQUEST_OPERATION_TYPE_PROJECT_DELETE = 'PROJECT_DELETE'.freeze,
      WORK_REQUEST_OPERATION_TYPE_WORKREQUEST_CANCEL = 'WORKREQUEST_CANCEL'.freeze
    ].freeze
  end
end
