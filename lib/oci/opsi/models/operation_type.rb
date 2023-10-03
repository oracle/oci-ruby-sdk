# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200630

module OCI
  module Opsi::Models
    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_ENABLE_DATABASE_INSIGHT = 'ENABLE_DATABASE_INSIGHT'.freeze,
      OPERATION_TYPE_DISABLE_DATABASE_INSIGHT = 'DISABLE_DATABASE_INSIGHT'.freeze,
      OPERATION_TYPE_UPDATE_DATABASE_INSIGHT = 'UPDATE_DATABASE_INSIGHT'.freeze,
      OPERATION_TYPE_CREATE_DATABASE_INSIGHT = 'CREATE_DATABASE_INSIGHT'.freeze,
      OPERATION_TYPE_MOVE_DATABASE_INSIGHT = 'MOVE_DATABASE_INSIGHT'.freeze,
      OPERATION_TYPE_DELETE_DATABASE_INSIGHT = 'DELETE_DATABASE_INSIGHT'.freeze,
      OPERATION_TYPE_CREATE_ENTERPRISE_MANAGER_BRIDGE = 'CREATE_ENTERPRISE_MANAGER_BRIDGE'.freeze,
      OPERATION_TYPE_UDPATE_ENTERPRISE_MANAGER_BRIDGE = 'UDPATE_ENTERPRISE_MANAGER_BRIDGE'.freeze,
      OPERATION_TYPE_MOVE_ENTERPRISE_MANAGER_BRIDGE = 'MOVE_ENTERPRISE_MANAGER_BRIDGE'.freeze,
      OPERATION_TYPE_DELETE_ENTERPRISE_MANAGER_BRIDGE = 'DELETE_ENTERPRISE_MANAGER_BRIDGE'.freeze,
      OPERATION_TYPE_ENABLE_HOST_INSIGHT = 'ENABLE_HOST_INSIGHT'.freeze,
      OPERATION_TYPE_DISABLE_HOST_INSIGHT = 'DISABLE_HOST_INSIGHT'.freeze,
      OPERATION_TYPE_UPDATE_HOST_INSIGHT = 'UPDATE_HOST_INSIGHT'.freeze,
      OPERATION_TYPE_CREATE_HOST_INSIGHT = 'CREATE_HOST_INSIGHT'.freeze,
      OPERATION_TYPE_MOVE_HOST_INSIGHT = 'MOVE_HOST_INSIGHT'.freeze,
      OPERATION_TYPE_DELETE_HOST_INSIGHT = 'DELETE_HOST_INSIGHT'.freeze,
      OPERATION_TYPE_CREATE_EXADATA_INSIGHT = 'CREATE_EXADATA_INSIGHT'.freeze,
      OPERATION_TYPE_ENABLE_EXADATA_INSIGHT = 'ENABLE_EXADATA_INSIGHT'.freeze,
      OPERATION_TYPE_DISABLE_EXADATA_INSIGHT = 'DISABLE_EXADATA_INSIGHT'.freeze,
      OPERATION_TYPE_UPDATE_EXADATA_INSIGHT = 'UPDATE_EXADATA_INSIGHT'.freeze,
      OPERATION_TYPE_MOVE_EXADATA_INSIGHT = 'MOVE_EXADATA_INSIGHT'.freeze,
      OPERATION_TYPE_DELETE_EXADATA_INSIGHT = 'DELETE_EXADATA_INSIGHT'.freeze,
      OPERATION_TYPE_ADD_EXADATA_INSIGHT_MEMBERS = 'ADD_EXADATA_INSIGHT_MEMBERS'.freeze,
      OPERATION_TYPE_EXADATA_AUTO_SYNC = 'EXADATA_AUTO_SYNC'.freeze,
      OPERATION_TYPE_UPDATE_OPSI_WAREHOUSE = 'UPDATE_OPSI_WAREHOUSE'.freeze,
      OPERATION_TYPE_CREATE_OPSI_WAREHOUSE = 'CREATE_OPSI_WAREHOUSE'.freeze,
      OPERATION_TYPE_MOVE_OPSI_WAREHOUSE = 'MOVE_OPSI_WAREHOUSE'.freeze,
      OPERATION_TYPE_DELETE_OPSI_WAREHOUSE = 'DELETE_OPSI_WAREHOUSE'.freeze,
      OPERATION_TYPE_ROTATE_OPSI_WAREHOUSE_WALLET = 'ROTATE_OPSI_WAREHOUSE_WALLET'.freeze,
      OPERATION_TYPE_UPDATE_OPSI_WAREHOUSE_USER = 'UPDATE_OPSI_WAREHOUSE_USER'.freeze,
      OPERATION_TYPE_CREATE_OPSI_WAREHOUSE_USER = 'CREATE_OPSI_WAREHOUSE_USER'.freeze,
      OPERATION_TYPE_MOVE_OPSI_WAREHOUSE_USER = 'MOVE_OPSI_WAREHOUSE_USER'.freeze,
      OPERATION_TYPE_DELETE_OPSI_WAREHOUSE_USER = 'DELETE_OPSI_WAREHOUSE_USER'.freeze,
      OPERATION_TYPE_UPDATE_AWRHUB = 'UPDATE_AWRHUB'.freeze,
      OPERATION_TYPE_CREATE_AWRHUB = 'CREATE_AWRHUB'.freeze,
      OPERATION_TYPE_MOVE_AWRHUB = 'MOVE_AWRHUB'.freeze,
      OPERATION_TYPE_DELETE_AWRHUB = 'DELETE_AWRHUB'.freeze,
      OPERATION_TYPE_UPDATE_PRIVATE_ENDPOINT = 'UPDATE_PRIVATE_ENDPOINT'.freeze,
      OPERATION_TYPE_CREATE_PRIVATE_ENDPOINT = 'CREATE_PRIVATE_ENDPOINT'.freeze,
      OPERATION_TYPE_MOVE_PRIVATE_ENDPOINT = 'MOVE_PRIVATE_ENDPOINT'.freeze,
      OPERATION_TYPE_DELETE_PRIVATE_ENDPOINT = 'DELETE_PRIVATE_ENDPOINT'.freeze,
      OPERATION_TYPE_CHANGE_PE_COMANAGED_DATABASE_INSIGHT_DETAILS = 'CHANGE_PE_COMANAGED_DATABASE_INSIGHT_DETAILS'.freeze,
      OPERATION_TYPE_UPDATE_OPSI_CONFIGURATION = 'UPDATE_OPSI_CONFIGURATION'.freeze,
      OPERATION_TYPE_CREATE_OPSI_CONFIGURATION = 'CREATE_OPSI_CONFIGURATION'.freeze,
      OPERATION_TYPE_MOVE_OPSI_CONFIGURATION = 'MOVE_OPSI_CONFIGURATION'.freeze,
      OPERATION_TYPE_DELETE_OPSI_CONFIGURATION = 'DELETE_OPSI_CONFIGURATION'.freeze,
      OPERATION_TYPE_ENABLE_ADB_ADVANCED_FEATURES = 'ENABLE_ADB_ADVANCED_FEATURES'.freeze,
      OPERATION_TYPE_DISABLE_ADB_ADVANCED_FEATURES = 'DISABLE_ADB_ADVANCED_FEATURES'.freeze,
      OPERATION_TYPE_UPDATE_ADB_ADVANCED_FEATURES = 'UPDATE_ADB_ADVANCED_FEATURES'.freeze,
      OPERATION_TYPE_CREATE_NEWS_REPORT = 'CREATE_NEWS_REPORT'.freeze,
      OPERATION_TYPE_ENABLE_NEWS_REPORT = 'ENABLE_NEWS_REPORT'.freeze,
      OPERATION_TYPE_DISABLE_NEWS_REPORT = 'DISABLE_NEWS_REPORT'.freeze,
      OPERATION_TYPE_UPDATE_NEWS_REPORT = 'UPDATE_NEWS_REPORT'.freeze,
      OPERATION_TYPE_MOVE_NEWS_REPORT = 'MOVE_NEWS_REPORT'.freeze,
      OPERATION_TYPE_DELETE_NEWS_REPORT = 'DELETE_NEWS_REPORT'.freeze
    ].freeze
  end
end
