# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ContainerEngine::Models
    WORK_REQUEST_OPERATION_TYPE_ENUM = [
      WORK_REQUEST_OPERATION_TYPE_CLUSTER_CREATE = 'CLUSTER_CREATE'.freeze,
      WORK_REQUEST_OPERATION_TYPE_CLUSTER_UPDATE = 'CLUSTER_UPDATE'.freeze,
      WORK_REQUEST_OPERATION_TYPE_CLUSTER_DELETE = 'CLUSTER_DELETE'.freeze,
      WORK_REQUEST_OPERATION_TYPE_NODEPOOL_CREATE = 'NODEPOOL_CREATE'.freeze,
      WORK_REQUEST_OPERATION_TYPE_NODEPOOL_UPDATE = 'NODEPOOL_UPDATE'.freeze,
      WORK_REQUEST_OPERATION_TYPE_NODEPOOL_DELETE = 'NODEPOOL_DELETE'.freeze,
      WORK_REQUEST_OPERATION_TYPE_NODEPOOL_RECONCILE = 'NODEPOOL_RECONCILE'.freeze,
      WORK_REQUEST_OPERATION_TYPE_WORKREQUEST_CANCEL = 'WORKREQUEST_CANCEL'.freeze
    ].freeze
  end
end
