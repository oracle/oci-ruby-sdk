# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module LogAnalytics::Models
    STORAGE_OPERATION_TYPE_ENUM = [
      STORAGE_OPERATION_TYPE_OFFBOARD_TENANCY = 'OFFBOARD_TENANCY'.freeze,
      STORAGE_OPERATION_TYPE_PURGE_STORAGE_DATA = 'PURGE_STORAGE_DATA'.freeze,
      STORAGE_OPERATION_TYPE_RECALL_ARCHIVED_STORAGE_DATA = 'RECALL_ARCHIVED_STORAGE_DATA'.freeze,
      STORAGE_OPERATION_TYPE_RELEASE_RECALLED_STORAGE_DATA = 'RELEASE_RECALLED_STORAGE_DATA'.freeze,
      STORAGE_OPERATION_TYPE_ARCHIVE_STORAGE_DATA = 'ARCHIVE_STORAGE_DATA'.freeze,
      STORAGE_OPERATION_TYPE_CLEANUP_ARCHIVAL_STORAGE_DATA = 'CLEANUP_ARCHIVAL_STORAGE_DATA'.freeze
    ].freeze
  end
end
