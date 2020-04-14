# Copyright (c) 2016, 2020, Oracle and/or its affiliates. All rights reserved.

module OCI
  module Secrets
    # Module containing models for requests made to, and responses received from,
    # OCI Secrets services
    module Models
    end
  end
end

# Require models
require 'oci/secrets/models/base64_secret_bundle_content_details'
require 'oci/secrets/models/secret_bundle'
require 'oci/secrets/models/secret_bundle_content_details'
require 'oci/secrets/models/secret_bundle_version_summary'

# Require generated clients
require 'oci/secrets/secrets_client'

# Require service utilities
require 'oci/secrets/util'
