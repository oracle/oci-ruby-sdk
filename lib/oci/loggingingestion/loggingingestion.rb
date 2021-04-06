# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Loggingingestion
    # Module containing models for requests made to, and responses received from,
    # OCI Loggingingestion services
    module Models
    end
  end
end

# Require models
require 'oci/loggingingestion/models/log_entry'
require 'oci/loggingingestion/models/log_entry_batch'
require 'oci/loggingingestion/models/put_logs_details'

# Require generated clients
require 'oci/loggingingestion/logging_client'

# Require service utilities
require 'oci/loggingingestion/util'
