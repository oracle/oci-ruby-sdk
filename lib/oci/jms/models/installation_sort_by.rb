# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Jms::Models
    INSTALLATION_SORT_BY_ENUM = [
      INSTALLATION_SORT_BY_JRE_DISTRIBUTION = 'jreDistribution'.freeze,
      INSTALLATION_SORT_BY_JRE_VENDOR = 'jreVendor'.freeze,
      INSTALLATION_SORT_BY_JRE_VERSION = 'jreVersion'.freeze,
      INSTALLATION_SORT_BY_PATH = 'path'.freeze,
      INSTALLATION_SORT_BY_TIME_FIRST_SEEN = 'timeFirstSeen'.freeze,
      INSTALLATION_SORT_BY_TIME_LAST_SEEN = 'timeLastSeen'.freeze,
      INSTALLATION_SORT_BY_APPROXIMATE_APPLICATION_COUNT = 'approximateApplicationCount'.freeze,
      INSTALLATION_SORT_BY_APPROXIMATE_MANAGED_INSTANCE_COUNT = 'approximateManagedInstanceCount'.freeze,
      INSTALLATION_SORT_BY_OS_NAME = 'osName'.freeze
    ].freeze
  end
end
