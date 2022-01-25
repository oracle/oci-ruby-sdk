# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module OsManagement::Models
    CONTENT_AVAILABILITY_ENUM = [
      CONTENT_AVAILABILITY_NOT_AVAILABLE = 'NOT_AVAILABLE'.freeze,
      CONTENT_AVAILABILITY_AVAILABLE_ON_INSTANCE = 'AVAILABLE_ON_INSTANCE'.freeze,
      CONTENT_AVAILABILITY_AVAILABLE_ON_SERVICE = 'AVAILABLE_ON_SERVICE'.freeze,
      CONTENT_AVAILABILITY_AVAILABLE_ON_INSTANCE_AND_SERVICE = 'AVAILABLE_ON_INSTANCE_AND_SERVICE'.freeze,
      CONTENT_AVAILABILITY_AVAILABLE_ON_INSTANCE_UPLOAD_IN_PROGRESS = 'AVAILABLE_ON_INSTANCE_UPLOAD_IN_PROGRESS'.freeze
    ].freeze
  end
end
