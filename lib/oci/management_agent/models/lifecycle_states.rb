# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ManagementAgent::Models
    LIFECYCLE_STATES_ENUM = [
      LIFECYCLE_STATES_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATES_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATES_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATES_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATES_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATES_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATES_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATES_FAILED = 'FAILED'.freeze
    ].freeze
  end
end
