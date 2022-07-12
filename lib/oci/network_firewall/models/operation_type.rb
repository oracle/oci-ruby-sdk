# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module NetworkFirewall::Models
    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_CREATE_NETWORK_FIREWALL = 'CREATE_NETWORK_FIREWALL'.freeze,
      OPERATION_TYPE_UPDATE_NETWORK_FIREWALL = 'UPDATE_NETWORK_FIREWALL'.freeze,
      OPERATION_TYPE_DELETE_NETWORK_FIREWALL = 'DELETE_NETWORK_FIREWALL'.freeze,
      OPERATION_TYPE_MOVE_NETWORK_FIREWALL = 'MOVE_NETWORK_FIREWALL'.freeze,
      OPERATION_TYPE_CREATE_NETWORK_FIREWALL_POLICY = 'CREATE_NETWORK_FIREWALL_POLICY'.freeze,
      OPERATION_TYPE_UPDATE_NETWORK_FIREWALL_POLICY = 'UPDATE_NETWORK_FIREWALL_POLICY'.freeze,
      OPERATION_TYPE_DELETE_NETWORK_FIREWALL_POLICY = 'DELETE_NETWORK_FIREWALL_POLICY'.freeze,
      OPERATION_TYPE_MOVE_NETWORK_FIREWALL_POLICY = 'MOVE_NETWORK_FIREWALL_POLICY'.freeze
    ].freeze
  end
end
