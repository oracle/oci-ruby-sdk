# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ObjectStorage
    # Module containing models for requests made to, and responses received from,
    # OCI ObjectStorage services
    module Models
    end
  end
end

# Require models
require 'oci/object_storage/models/archival_state'
require 'oci/object_storage/models/bucket'
require 'oci/object_storage/models/bucket_summary'
require 'oci/object_storage/models/commit_multipart_upload_details'
require 'oci/object_storage/models/commit_multipart_upload_part_details'
require 'oci/object_storage/models/copy_object_details'
require 'oci/object_storage/models/create_bucket_details'
require 'oci/object_storage/models/create_multipart_upload_details'
require 'oci/object_storage/models/create_preauthenticated_request_details'
require 'oci/object_storage/models/create_replication_policy_details'
require 'oci/object_storage/models/create_retention_rule_details'
require 'oci/object_storage/models/duration'
require 'oci/object_storage/models/list_objects'
require 'oci/object_storage/models/multipart_upload'
require 'oci/object_storage/models/multipart_upload_part_summary'
require 'oci/object_storage/models/namespace_metadata'
require 'oci/object_storage/models/object_lifecycle_policy'
require 'oci/object_storage/models/object_lifecycle_rule'
require 'oci/object_storage/models/object_name_filter'
require 'oci/object_storage/models/object_summary'
require 'oci/object_storage/models/object_version_collection'
require 'oci/object_storage/models/object_version_summary'
require 'oci/object_storage/models/pattern_details'
require 'oci/object_storage/models/preauthenticated_request'
require 'oci/object_storage/models/preauthenticated_request_summary'
require 'oci/object_storage/models/put_object_lifecycle_policy_details'
require 'oci/object_storage/models/reencrypt_object_details'
require 'oci/object_storage/models/rename_object_details'
require 'oci/object_storage/models/replication_policy'
require 'oci/object_storage/models/replication_policy_summary'
require 'oci/object_storage/models/replication_source'
require 'oci/object_storage/models/restore_objects_details'
require 'oci/object_storage/models/retention_rule'
require 'oci/object_storage/models/retention_rule_collection'
require 'oci/object_storage/models/retention_rule_details'
require 'oci/object_storage/models/retention_rule_summary'
require 'oci/object_storage/models/sse_customer_key_details'
require 'oci/object_storage/models/storage_tier'
require 'oci/object_storage/models/update_bucket_details'
require 'oci/object_storage/models/update_namespace_metadata_details'
require 'oci/object_storage/models/update_object_storage_tier_details'
require 'oci/object_storage/models/update_retention_rule_details'
require 'oci/object_storage/models/work_request'
require 'oci/object_storage/models/work_request_error'
require 'oci/object_storage/models/work_request_log_entry'
require 'oci/object_storage/models/work_request_resource'
require 'oci/object_storage/models/work_request_resource_metadata_key'
require 'oci/object_storage/models/work_request_summary'

# Require generated clients
require 'oci/object_storage/object_storage_client'
require 'oci/object_storage/object_storage_client_composite_operations'

# Require service utilities
require 'oci/object_storage/util'
