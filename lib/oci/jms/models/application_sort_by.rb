# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Jms::Models
    APPLICATION_SORT_BY_ENUM = [
      APPLICATION_SORT_BY_TIME_FIRST_SEEN = 'timeFirstSeen'.freeze,
      APPLICATION_SORT_BY_TIME_LAST_SEEN = 'timeLastSeen'.freeze,
      APPLICATION_SORT_BY_DISPLAY_NAME = 'displayName'.freeze,
      APPLICATION_SORT_BY_APPROXIMATE_JRE_COUNT = 'approximateJreCount'.freeze,
      APPLICATION_SORT_BY_APPROXIMATE_INSTALLATION_COUNT = 'approximateInstallationCount'.freeze,
      APPLICATION_SORT_BY_APPROXIMATE_MANAGED_INSTANCE_COUNT = 'approximateManagedInstanceCount'.freeze
    ].freeze
  end
end
