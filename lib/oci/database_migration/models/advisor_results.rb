# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DatabaseMigration::Models
    ADVISOR_RESULTS_ENUM = [
      ADVISOR_RESULTS_FATAL = 'FATAL'.freeze,
      ADVISOR_RESULTS_BLOCKER = 'BLOCKER'.freeze,
      ADVISOR_RESULTS_WARNING = 'WARNING'.freeze,
      ADVISOR_RESULTS_INFORMATIONAL = 'INFORMATIONAL'.freeze,
      ADVISOR_RESULTS_PASS = 'PASS'.freeze
    ].freeze
  end
end
