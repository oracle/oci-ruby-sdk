# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module OperatorAccessControl::Models
    OPERATOR_CONTROL_ASSIGNMENT_LIFECYCLE_STATES_ENUM = [
      OPERATOR_CONTROL_ASSIGNMENT_LIFECYCLE_STATES_CREATED = 'CREATED'.freeze,
      OPERATOR_CONTROL_ASSIGNMENT_LIFECYCLE_STATES_APPLIED = 'APPLIED'.freeze,
      OPERATOR_CONTROL_ASSIGNMENT_LIFECYCLE_STATES_APPLYFAILED = 'APPLYFAILED'.freeze,
      OPERATOR_CONTROL_ASSIGNMENT_LIFECYCLE_STATES_UPDATING = 'UPDATING'.freeze,
      OPERATOR_CONTROL_ASSIGNMENT_LIFECYCLE_STATES_DELETING = 'DELETING'.freeze,
      OPERATOR_CONTROL_ASSIGNMENT_LIFECYCLE_STATES_DELETED = 'DELETED'.freeze,
      OPERATOR_CONTROL_ASSIGNMENT_LIFECYCLE_STATES_DELETIONFAILED = 'DELETIONFAILED'.freeze
    ].freeze
  end
end
