# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module FileStorage
    # Module containing models for requests made to, and responses received from,
    # OCI FileStorage services
    module Models
    end
  end
end

# Require models
require 'oci/file_storage/models/change_file_system_compartment_details'
require 'oci/file_storage/models/change_mount_target_compartment_details'
require 'oci/file_storage/models/client_options'
require 'oci/file_storage/models/create_export_details'
require 'oci/file_storage/models/create_file_system_details'
require 'oci/file_storage/models/create_mount_target_details'
require 'oci/file_storage/models/create_snapshot_details'
require 'oci/file_storage/models/export'
require 'oci/file_storage/models/export_set'
require 'oci/file_storage/models/export_set_summary'
require 'oci/file_storage/models/export_summary'
require 'oci/file_storage/models/file_system'
require 'oci/file_storage/models/file_system_summary'
require 'oci/file_storage/models/mount_target'
require 'oci/file_storage/models/mount_target_summary'
require 'oci/file_storage/models/snapshot'
require 'oci/file_storage/models/snapshot_summary'
require 'oci/file_storage/models/update_export_details'
require 'oci/file_storage/models/update_export_set_details'
require 'oci/file_storage/models/update_file_system_details'
require 'oci/file_storage/models/update_mount_target_details'
require 'oci/file_storage/models/update_snapshot_details'

# Require generated clients
require 'oci/file_storage/file_storage_client'
require 'oci/file_storage/file_storage_client_composite_operations'

# Require service utilities
require 'oci/file_storage/util'
