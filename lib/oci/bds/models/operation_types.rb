# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
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
      OPERATION_TYPES_REMOVE_NODE = 'REMOVE_NODE'.freeze,
      OPERATION_TYPES_CREATE_AUTOSCALE_CONFIG = 'CREATE_AUTOSCALE_CONFIG'.freeze,
      OPERATION_TYPES_UPDATE_AUTOSCALE_CONFIG = 'UPDATE_AUTOSCALE_CONFIG'.freeze,
      OPERATION_TYPES_DELETE_AUTOSCALE_CONFIG = 'DELETE_AUTOSCALE_CONFIG'.freeze,
      OPERATION_TYPES_AUTOSCALE_CONFIG = 'AUTOSCALE_CONFIG'.freeze,
      OPERATION_TYPES_AUTOSCALE_RUN = 'AUTOSCALE_RUN'.freeze,
      OPERATION_TYPES_CREATE_API_KEY = 'CREATE_API_KEY'.freeze,
      OPERATION_TYPES_DELETE_API_KEY = 'DELETE_API_KEY'.freeze,
      OPERATION_TYPES_TEST_OBJECT_STORE_CONNECTION = 'TEST_OBJECT_STORE_CONNECTION'.freeze,
      OPERATION_TYPES_CREATE_METASTORE_CONFIG = 'CREATE_METASTORE_CONFIG'.freeze,
      OPERATION_TYPES_DELETE_METASTORE_CONFIG = 'DELETE_METASTORE_CONFIG'.freeze,
      OPERATION_TYPES_UPDATE_METASTORE_CONFIG = 'UPDATE_METASTORE_CONFIG'.freeze,
      OPERATION_TYPES_ACTIVATE_METASTORE_CONFIG = 'ACTIVATE_METASTORE_CONFIG'.freeze,
      OPERATION_TYPES_TEST_METASTORE_CONFIG = 'TEST_METASTORE_CONFIG'.freeze,
      OPERATION_TYPES_PATCH_BDS = 'PATCH_BDS'.freeze,
      OPERATION_TYPES_PATCH_ODH = 'PATCH_ODH'.freeze
    ].freeze
  end
end
