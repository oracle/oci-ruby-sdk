# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Bds::Models
    OPERATION_TYPES_ENUM = [
      OPERATION_TYPES_CREATE_BDS = 'CREATE_BDS'.freeze,
      OPERATION_TYPES_UPDATE_BDS = 'UPDATE_BDS'.freeze,
      OPERATION_TYPES_DELETE_BDS = 'DELETE_BDS'.freeze,
      OPERATION_TYPES_ADD_BLOCK_STORAGE = 'ADD_BLOCK_STORAGE'.freeze,
      OPERATION_TYPES_ADD_WORKER_NODES = 'ADD_WORKER_NODES'.freeze,
      OPERATION_TYPES_ADD_CLOUD_SQL = 'ADD_CLOUD_SQL'.freeze,
      OPERATION_TYPES_REMOVE_CLOUD_SQL = 'REMOVE_CLOUD_SQL'.freeze,
      OPERATION_TYPES_CHANGE_COMPARTMENT_FOR_BDS = 'CHANGE_COMPARTMENT_FOR_BDS'.freeze,
      OPERATION_TYPES_CHANGE_SHAPE = 'CHANGE_SHAPE'.freeze,
      OPERATION_TYPES_UPDATE_INFRA = 'UPDATE_INFRA'.freeze,
      OPERATION_TYPES_RESTART_NODE = 'RESTART_NODE'.freeze,
      OPERATION_TYPES_AUTOSCALE_CONFIG = 'AUTOSCALE_CONFIG'.freeze,
      OPERATION_TYPES_AUTOSCALE_RUN = 'AUTOSCALE_RUN'.freeze
    ].freeze
  end
end
