# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module ObjectStorage
    module Transfer
      # A bag of configuration properties that can be used to configure {OCI::ObjectStorage::Transfer::UploadManager}
      class UploadManagerConfig
        # Whether to allow multipart uploads or not. Defaults to true
        # @return [Boolean]
        attr_accessor :allow_multipart

        # For multipart uploads, whether we can upload parts in parallel. Defaults to true
        # @return [Boolean]
        attr_accessor :allow_parallel_multipart_uploads

        # How many parts we can upload in parallel. Defaults to 3. If this is set to 1, this is the
        # equivalent of not allowing parts to be uploaded in parallel.
        # @return [Integer]
        attr_accessor :parallel_process_count

        # The size, in bytes, which a file (or IO-like object) needs to exceed before we attempt a multipart upload.
        # Defaults to 128 MiB (128 * 1024 * 1024 bytes)
        # @return [Integer]
        attr_accessor :multipart_upload_threshold

        # The size, in bytes, of each part of a multipart upload. This applies when we are uploading files from disk
        # and defaults to 128 MiB
        # @return [Integer]
        attr_accessor :multipart_part_size

        # The size, in bytes, of each part of a multipart upload when we are reading from stdin or a non-file IO-like
        # source (e.g. a StringIO). Defaults to 10 MiB
        # @return [Integer]
        attr_accessor :non_file_io_multipart_part_size

        # Creates a new UploadManagerConfig.
        #
        # @param [Boolean] allow_multipart Whether to allow multipart uploads or not. Defaults to true
        # @param [Boolean] allow_parallel_multipart_uploads For multipart uploads, whether we can upload parts in parallel. Defaults to true
        # @param [Integer] parallel_process_count How many parts we can upload in parallel. Defaults to 3
        # @param [Integer] multipart_upload_threshold The size, in bytes, which a file (or IO-like object) needs to exceed before we attempt a multipart upload. Defaults to 128 MiB
        # @param [Integer] multipart_part_size The size, in bytes, of each part of a multipart upload. This applies when we are uploading files from disk and defaults to 128 MiB
        # @param [Integer] non_file_io_multipart_part_size The size, in bytes, of each part of a multipart upload when we are reading from stdin or a non-file IO-like source (e.g. a StringIO). Defaults to 10 MiB
        def initialize(allow_multipart: true,
                       allow_parallel_multipart_uploads: true,
                       parallel_process_count: OCI::ObjectStorage::Transfer::Multipart::DEFAULT_PARALLEL_PROCESS_COUNT,
                       multipart_upload_threshold: OCI::ObjectStorage::Transfer::MULTIPART_UPLOAD_THRESHOLD,
                       multipart_part_size: OCI::ObjectStorage::Transfer::MULTIPART_PART_SIZE,
                       non_file_io_multipart_part_size: OCI::ObjectStorage::Transfer::NON_FILE_IO_MULTIPART_PART_SIZE)
          @allow_multipart = allow_multipart
          @allow_parallel_multipart_uploads = allow_parallel_multipart_uploads
          @parallel_process_count = parallel_process_count
          @multipart_upload_threshold = multipart_upload_threshold
          @multipart_part_size = multipart_part_size
          @non_file_io_multipart_part_size = non_file_io_multipart_part_size
        end
      end
    end
  end
end
