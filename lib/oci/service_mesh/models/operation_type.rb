# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ServiceMesh::Models
    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_CREATE_MESH = 'CREATE_MESH'.freeze,
      OPERATION_TYPE_UPDATE_MESH = 'UPDATE_MESH'.freeze,
      OPERATION_TYPE_DELETE_MESH = 'DELETE_MESH'.freeze,
      OPERATION_TYPE_MOVE_MESH = 'MOVE_MESH'.freeze,
      OPERATION_TYPE_CREATE_ACCESS_POLICY = 'CREATE_ACCESS_POLICY'.freeze,
      OPERATION_TYPE_UPDATE_ACCESS_POLICY = 'UPDATE_ACCESS_POLICY'.freeze,
      OPERATION_TYPE_DELETE_ACCESS_POLICY = 'DELETE_ACCESS_POLICY'.freeze,
      OPERATION_TYPE_MOVE_ACCESS_POLICY = 'MOVE_ACCESS_POLICY'.freeze,
      OPERATION_TYPE_CREATE_VIRTUAL_SERVICE = 'CREATE_VIRTUAL_SERVICE'.freeze,
      OPERATION_TYPE_UPDATE_VIRTUAL_SERVICE = 'UPDATE_VIRTUAL_SERVICE'.freeze,
      OPERATION_TYPE_DELETE_VIRTUAL_SERVICE = 'DELETE_VIRTUAL_SERVICE'.freeze,
      OPERATION_TYPE_MOVE_VIRTUAL_SERVICE = 'MOVE_VIRTUAL_SERVICE'.freeze,
      OPERATION_TYPE_CREATE_VIRTUAL_SERVICE_ROUTE_TABLE = 'CREATE_VIRTUAL_SERVICE_ROUTE_TABLE'.freeze,
      OPERATION_TYPE_UPDATE_VIRTUAL_SERVICE_ROUTE_TABLE = 'UPDATE_VIRTUAL_SERVICE_ROUTE_TABLE'.freeze,
      OPERATION_TYPE_DELETE_VIRTUAL_SERVICE_ROUTE_TABLE = 'DELETE_VIRTUAL_SERVICE_ROUTE_TABLE'.freeze,
      OPERATION_TYPE_MOVE_VIRTUAL_SERVICE_ROUTE_TABLE = 'MOVE_VIRTUAL_SERVICE_ROUTE_TABLE'.freeze,
      OPERATION_TYPE_CREATE_VIRTUAL_DEPLOYMENT = 'CREATE_VIRTUAL_DEPLOYMENT'.freeze,
      OPERATION_TYPE_UPDATE_VIRTUAL_DEPLOYMENT = 'UPDATE_VIRTUAL_DEPLOYMENT'.freeze,
      OPERATION_TYPE_DELETE_VIRTUAL_DEPLOYMENT = 'DELETE_VIRTUAL_DEPLOYMENT'.freeze,
      OPERATION_TYPE_MOVE_VIRTUAL_DEPLOYMENT = 'MOVE_VIRTUAL_DEPLOYMENT'.freeze,
      OPERATION_TYPE_CREATE_INGRESS_GATEWAY = 'CREATE_INGRESS_GATEWAY'.freeze,
      OPERATION_TYPE_UPDATE_INGRESS_GATEWAY = 'UPDATE_INGRESS_GATEWAY'.freeze,
      OPERATION_TYPE_DELETE_INGRESS_GATEWAY = 'DELETE_INGRESS_GATEWAY'.freeze,
      OPERATION_TYPE_MOVE_INGRESS_GATEWAY = 'MOVE_INGRESS_GATEWAY'.freeze,
      OPERATION_TYPE_CREATE_INGRESS_GATEWAY_ROUTE_TABLE = 'CREATE_INGRESS_GATEWAY_ROUTE_TABLE'.freeze,
      OPERATION_TYPE_UPDATE_INGRESS_GATEWAY_ROUTE_TABLE = 'UPDATE_INGRESS_GATEWAY_ROUTE_TABLE'.freeze,
      OPERATION_TYPE_DELETE_INGRESS_GATEWAY_ROUTE_TABLE = 'DELETE_INGRESS_GATEWAY_ROUTE_TABLE'.freeze,
      OPERATION_TYPE_MOVE_INGRESS_GATEWAY_ROUTE_TABLE = 'MOVE_INGRESS_GATEWAY_ROUTE_TABLE'.freeze
    ].freeze
  end
end