# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200501

module OCI
  module NetworkLoadBalancer::Models
    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_CREATE_NETWORK_LOAD_BALANCER = 'CREATE_NETWORK_LOAD_BALANCER'.freeze,
      OPERATION_TYPE_UPDATE_NETWORK_LOAD_BALANCER = 'UPDATE_NETWORK_LOAD_BALANCER'.freeze,
      OPERATION_TYPE_DELETE_NETWORK_LOAD_BALANCER = 'DELETE_NETWORK_LOAD_BALANCER'.freeze,
      OPERATION_TYPE_CREATE_BACKEND = 'CREATE_BACKEND'.freeze,
      OPERATION_TYPE_UPDATE_BACKEND = 'UPDATE_BACKEND'.freeze,
      OPERATION_TYPE_DELETE_BACKEND = 'DELETE_BACKEND'.freeze,
      OPERATION_TYPE_CREATE_LISTENER = 'CREATE_LISTENER'.freeze,
      OPERATION_TYPE_UPDATE_LISTENER = 'UPDATE_LISTENER'.freeze,
      OPERATION_TYPE_DELETE_LISTENER = 'DELETE_LISTENER'.freeze,
      OPERATION_TYPE_CREATE_BACKENDSET = 'CREATE_BACKENDSET'.freeze,
      OPERATION_TYPE_UPDATE_BACKENDSET = 'UPDATE_BACKENDSET'.freeze,
      OPERATION_TYPE_DELETE_BACKENDSET = 'DELETE_BACKENDSET'.freeze,
      OPERATION_TYPE_UPDATE_NSGS = 'UPDATE_NSGS'.freeze,
      OPERATION_TYPE_UPDATE_HEALTH_CHECKER = 'UPDATE_HEALTH_CHECKER'.freeze,
      OPERATION_TYPE_CHANGE_COMPARTMENT = 'CHANGE_COMPARTMENT'.freeze,
      OPERATION_TYPE_ATTACH_NLB_TO_POD = 'ATTACH_NLB_TO_POD'.freeze,
      OPERATION_TYPE_DETACH_NLB_FROM_POD = 'DETACH_NLB_FROM_POD'.freeze
    ].freeze
  end
end
