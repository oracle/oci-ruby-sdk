# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20230301

module OCI
  module GloballyDistributedDatabase::Models
    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_CREATE_SHARDED_DATABASE = 'CREATE_SHARDED_DATABASE'.freeze,
      OPERATION_TYPE_DELETE_SHARDED_DATABASE = 'DELETE_SHARDED_DATABASE'.freeze,
      OPERATION_TYPE_UPDATE_SHARDED_DATABASE = 'UPDATE_SHARDED_DATABASE'.freeze,
      OPERATION_TYPE_CONFIGURE_SHARDED_DATABASE_GSMS = 'CONFIGURE_SHARDED_DATABASE_GSMS'.freeze,
      OPERATION_TYPE_START_SHARDED_DATABASE = 'START_SHARDED_DATABASE'.freeze,
      OPERATION_TYPE_STOP_SHARDED_DATABASE = 'STOP_SHARDED_DATABASE'.freeze,
      OPERATION_TYPE_VALIDATE_NETWORK = 'VALIDATE_NETWORK'.freeze,
      OPERATION_TYPE_CHANGE_SHARDED_DB_COMPARTMENT = 'CHANGE_SHARDED_DB_COMPARTMENT'.freeze,
      OPERATION_TYPE_CREATE_PRIVATE_ENDPOINT = 'CREATE_PRIVATE_ENDPOINT'.freeze,
      OPERATION_TYPE_UPDATE_PRIVATE_ENDPOINT = 'UPDATE_PRIVATE_ENDPOINT'.freeze,
      OPERATION_TYPE_DELETE_PRIVATE_ENDPOINT = 'DELETE_PRIVATE_ENDPOINT'.freeze,
      OPERATION_TYPE_CHANGE_PRIVATE_ENDPOINT_COMPARTMENT = 'CHANGE_PRIVATE_ENDPOINT_COMPARTMENT'.freeze,
      OPERATION_TYPE_INSERT_SHARDS = 'INSERT_SHARDS'.freeze,
      OPERATION_TYPE_REMOVE_SHARDS = 'REMOVE_SHARDS'.freeze,
      OPERATION_TYPE_MERGE_CATALOG_SHARDS = 'MERGE_CATALOG_SHARDS'.freeze,
      OPERATION_TYPE_UPLOAD_SIGNED_CERT_AND_GENERATE_WALLET = 'UPLOAD_SIGNED_CERT_AND_GENERATE_WALLET'.freeze,
      OPERATION_TYPE_GENERATE_GSM_CERT_SIGNING_REQ = 'GENERATE_GSM_CERT_SIGNING_REQ'.freeze,
      OPERATION_TYPE_CONFIGURE_SHARDING = 'CONFIGURE_SHARDING'.freeze
    ].freeze
  end
end