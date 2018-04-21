# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

module OCI
  module ObjectStorage
    # Module containing models for requests made to, and responses received from,
    # OCI ObjectStorage services
    module Models
    end
  end
end

# Require models
require 'oci/object_storage/models/bucket'
require 'oci/object_storage/models/bucket_summary'
require 'oci/object_storage/models/commit_multipart_upload_details'
require 'oci/object_storage/models/commit_multipart_upload_part_details'
require 'oci/object_storage/models/create_bucket_details'
require 'oci/object_storage/models/create_multipart_upload_details'
require 'oci/object_storage/models/create_preauthenticated_request_details'
require 'oci/object_storage/models/list_objects'
require 'oci/object_storage/models/multipart_upload'
require 'oci/object_storage/models/multipart_upload_part_summary'
require 'oci/object_storage/models/namespace_metadata'
require 'oci/object_storage/models/object_summary'
require 'oci/object_storage/models/preauthenticated_request'
require 'oci/object_storage/models/preauthenticated_request_summary'
require 'oci/object_storage/models/rename_object_details'
require 'oci/object_storage/models/restore_objects_details'
require 'oci/object_storage/models/update_bucket_details'
require 'oci/object_storage/models/update_namespace_metadata_details'

# Require generated clients
require 'oci/object_storage/object_storage_client'

# Require service utilities
require 'oci/object_storage/util'
