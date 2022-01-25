# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DatabaseManagement::Models
    DEPLOYMENT_TYPE_ENUM = [
      DEPLOYMENT_TYPE_ONPREMISE = 'ONPREMISE'.freeze,
      DEPLOYMENT_TYPE_BM = 'BM'.freeze,
      DEPLOYMENT_TYPE_VM = 'VM'.freeze,
      DEPLOYMENT_TYPE_EXADATA = 'EXADATA'.freeze,
      DEPLOYMENT_TYPE_EXADATA_CC = 'EXADATA_CC'.freeze,
      DEPLOYMENT_TYPE_AUTONOMOUS = 'AUTONOMOUS'.freeze
    ].freeze
  end
end
