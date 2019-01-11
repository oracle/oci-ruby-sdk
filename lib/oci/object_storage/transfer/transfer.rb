# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module ObjectStorage
    # This module contains functionality to simplifies interaction with the Object Storage service by
    # abstracting away the method used to upload objects, and will automatically break an upload into
    # multiple parts if needed (based on provided configuration).
    #
    # The main entry point to this module should be the {OCI::ObjectStorage::Transfer::UploadManager}
    # class.
    module Transfer
      MEBIBYTE = 1024 * 1024
      MULTIPART_UPLOAD_THRESHOLD = 128 * MEBIBYTE
      MULTIPART_PART_SIZE = 128 * MEBIBYTE
      NON_FILE_IO_MULTIPART_PART_SIZE = 10 * MEBIBYTE

      # This module contains functionality to handle multipart uploads to Object Storage
      module Multipart
        DEFAULT_PARALLEL_PROCESS_COUNT = 3

        # Internal helper functions and classes for multipart uploads. Not intended for public use
        module Internal
        end
      end
    end
  end
end

require 'oci/object_storage/transfer/upload_manager_config'
require 'oci/object_storage/transfer/upload_manager'
require 'oci/object_storage/transfer/multipart/multipart_object_assembler'
