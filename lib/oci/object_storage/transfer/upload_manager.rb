# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require_relative 'upload_manager_config'
require_relative 'multipart/multipart_object_assembler'

module OCI
  module ObjectStorage
    module Transfer
      # UploadManager simplifies interaction with the Object Storage service by abstracting away the method used
      # to upload objects.  Depending on the configuration parameters, UploadManager may choose to do a single
      # put_object request, or break up the upload into multiple parts and utilize multi-part uploads.
      #
      # An advantage of using multi-part uploads is the ability to retry individual failed parts, as well as being
      # able to upload parts in parallel to reduce upload time.
      class UploadManager
        # The client used to interact with the Object Storage service
        # @return [OCI::ObjectStorage::ObjectStorageClient]
        attr_accessor :object_storage_client

        # Configuration for the UploadManager
        # @return [OCI::ObjectStorage::Transfer::UploadManagerConfig]
        attr_accessor :upload_manager_config

        # Creates a new UploadManager
        #
        # @param [OCI::ObjectStorage::ObjectStorageClient] object_storage_client The client used to interact with the Object Storage service
        # @param [OCI::ObjectStorage::Transfer::UploadManagerConfig] upload_manager_config Configuration for the UploadManager. If not provided
        # then default configuration values are used
        def initialize(object_storage_client:, upload_manager_config: OCI::ObjectStorage::Transfer::UploadManagerConfig.new)
          @object_storage_client = object_storage_client
          @upload_manager_config = upload_manager_config
        end

        # Uploads an object to Object Storage. The object can be a path to a file, an IO-like object, or $stdin. Depending on
        # the configuration of the UploadManager and the object provided, it may be uploaded in multiple parts. Note that input
        # from $stdin will always be uploaded via a multipart upload.
        #
        # @param [String] namespace_name The namespace containing the bucket in which to store the object
        # @param [String] bucket_name The bucket where we'll upload the object
        # @param [String] object_name The name of the object in Object Storage
        # @param [String, IO] object_io_or_file_path Either a path to the file to upload, an IO-like object containing the data to upload or $stdin.
        #
        # @param [Hash] opts the optional parameters
        # @option opts [String] :if_match The entity tag to match
        # @option opts [String] :if_none_match The entity tag to avoid matching. The only valid value is *, which indicates that the request should fail if the object already exists.
        # @option opts [String] :opc_client_request_id The client request ID for tracing.
        # @option opts [Integer] :content_length The content length of the body. This will be ignored for multipart uploads.
        # @option opts [String] :content_type The content type of the object.  Defaults to 'application/octet-stream' if not overridden.
        # @option opts [String] :content_language The content language of the object.
        # @option opts [String] :content_encoding The content encoding of the object.
        # @option opts [String] :content_md5 The base-64 encoded MD5 hash of the body. This will be ignored for multipart uploads.
        # @option opts [Hash<String, String>] :metadata A hash of string keys to string values representing any custom metadata to be applied to the object.
        #
        # @return [Response] A Response object with data of type nil. For a multipart upload, the headers of the response will contain
        # an opc-multipart-md5 key. For scenarios where the object was uploaded in a single part, the opc-content-md5 key will be
        # present in the headers of the Response.
        #
        # @raise [OCI::Errors::MultipartUploadError] if an error occurred when performing a multipart upload. Consult the errors collection inside
        # the exception to check the underlying errors which caused the failure.
        def upload(namespace_name, bucket_name, object_name, object_io_or_file_path, opts = {})
          raise 'A namespace_name must be provided' if namespace_name.nil?
          raise 'A bucket_name must be provided' if bucket_name.nil?
          raise 'An object_name must be provided' if object_name.nil?
          raise 'An object_io_or_file_path must be provided' if object_io_or_file_path.nil?

          content_length = File.size(object_io_or_file_path) if object_io_or_file_path.is_a?(String)

          unless object_io_or_file_path.is_a?(String)
            content_length = object_io_or_file_path.size if object_io_or_file_path.respond_to?(:size)
            content_length = object_io_or_file_path.stat.size unless object_io_or_file_path.respond_to?(:size)
          end

          # $stdin is always multipart uploaded (since we can't always make a size guarantee). Otherwise, it depends on the UploadManager settings
          # and the size of the object identified by object_io_or_file_path
          return upload_multipart(namespace_name, bucket_name, object_name, object_io_or_file_path, opts) \
            if object_io_or_file_path.eql?($stdin)

          return upload_single(namespace_name, bucket_name, object_name, object_io_or_file_path, opts) \
            unless use_multipart?(content_length)

          upload_multipart(namespace_name, bucket_name, object_name, object_io_or_file_path, opts)
        end

        # Resumes a multipart upload. Note that the multipart upload part size which has been configured for this UploadManager needs to match
        # the part size of any parts which have previously been uploaded for the given multipart upload.
        #
        # @param [String] upload_id The ID of the multipart upload to resume.
        # @param [String] namespace_name The namespace containing the bucket in which to store the object
        # @param [String] bucket_name The bucket where we'll upload the object
        # @param [String] object_name The name of the object in Object Storage
        # @param [String, IO] object_io_or_file_path Either a path to the file to upload, an IO-like object containing the data to upload or $stdin.
        #
        # @param [Hash] opts the optional parameters
        # @option opts [String] :opc_client_request_id The client request ID for tracing.
        #
        # @return [Response] A Response object with data of type nil. For a multipart upload, the headers of the response will contain
        # an opc-multipart-md5 key. For scenarios where the object was uploaded in a single part, the opc-content-md5 key will be
        # present in the headers of the Response.
        #
        # @raise [OCI::Errors::MultipartUploadError] if an error occurred when performing a multipart upload. Consult the errors collection inside
        # the exception to check the underlying errors which caused the failure
        def resume(upload_id, namespace_name, bucket_name, object_name, object_io_or_file_path, opts = {})
          raise 'An upload_id must be provided' if upload_id.nil?
          raise 'A namespace_name must be provided' if namespace_name.nil?
          raise 'A bucket_name must be provided' if bucket_name.nil?
          raise 'An object_name must be provided' if object_name.nil?
          raise 'An object_io_or_file_path must be provided' if object_io_or_file_path.nil?

          assembler = OCI::ObjectStorage::Transfer::Multipart::MultipartObjectAssembler.new(
            object_storage_client: @object_storage_client,
            namespace: namespace_name,
            bucket_name: bucket_name,
            object_name: object_name,
            multipart_part_size: @upload_manager_config.multipart_part_size,
            non_file_io_multipart_part_size: @upload_manager_config.non_file_io_multipart_part_size,
            parallel_process_count: multipart_parallel_process_count,
            multipart_upload_opts: opts
          )
          assembler.io_for_transfer = object_io_or_file_path

          errors = assembler.resume(upload_id)
          raise OCI::Errors::MultipartUploadError('Errors occurred while resuming the multipart upload', errors, upload_id) \
            unless errors.empty?

          assembler.commit
        end

        # Aborts a multipart upload.
        #
        # @param [String] upload_id The ID of the multipart upload to abort.
        # @param [String] namespace_name The namespace containing the bucket in which to store the object
        # @param [String] bucket_name The bucket where we'll upload the object
        # @param [String] object_name The name of the object in Object Storage
        #
        # @param [Hash] opts the optional parameters
        # @option opts [String] :opc_client_request_id The client request ID for tracing.
        #
        # @return [Response] A Response object with data of type nil
        def abort(upload_id, namespace_name, bucket_name, object_name, opts = {})
          raise 'An upload_id must be provided' if upload_id.nil?
          raise 'A namespace_name must be provided' if namespace_name.nil?
          raise 'A bucket_name must be provided' if bucket_name.nil?
          raise 'An object_name must be provided' if object_name.nil?

          assembler = OCI::ObjectStorage::Transfer::Multipart::MultipartObjectAssembler.new(
            object_storage_client: @object_storage_client,
            namespace: namespace_name,
            bucket_name: bucket_name,
            object_name: object_name,
            multipart_upload_opts: opts
          )

          assembler.abort(upload_id)
        end

        private

        def use_multipart?(content_length)
          @upload_manager_config.allow_multipart && content_length >= @upload_manager_config.multipart_upload_threshold
        end

        def multipart_parallel_process_count
          return 1 unless @upload_manager_config.allow_parallel_multipart_uploads

          @upload_manager_config.parallel_process_count
        end

        def upload_single(namespace_name, bucket_name, object_name, object_io_or_file_path, opts = {})
          opts[:opc_meta] = opts.delete(:metadata) if opts.key?(:metadata)

          if object_io_or_file_path.is_a?(String)
            File.open(object_io_or_file_path) do |file|
              @object_storage_client.put_object(namespace_name, bucket_name, object_name, file, opts)
            end
          else
            @object_storage_client.put_object(namespace_name, bucket_name, object_name, object_io_or_file_path, opts)
          end
        end

        def upload_multipart(namespace_name, bucket_name, object_name, object_io_or_file_path, opts = {})
          assembler = OCI::ObjectStorage::Transfer::Multipart::MultipartObjectAssembler.new(
            object_storage_client: @object_storage_client,
            namespace: namespace_name,
            bucket_name: bucket_name,
            object_name: object_name,
            multipart_part_size: @upload_manager_config.multipart_part_size,
            non_file_io_multipart_part_size: @upload_manager_config.non_file_io_multipart_part_size,
            parallel_process_count: multipart_parallel_process_count,
            multipart_upload_opts: opts
          )

          upload_id = assembler.new_upload.data.upload_id
          assembler.io_for_transfer = object_io_or_file_path

          errors = assembler.upload

          # stdin is not resumable, so abort the upload if there were errors
          assembler.abort(upload_id) if !errors.empty? && object_io_or_file_path.eql?($stdin)

          unless errors.empty?
            raise OCI::Errors::MultipartUploadError.new(
              'Errors occurred while performing the multipart upload',
              errors,
              upload_id
            )
          end

          assembler.commit
        end
      end
    end
  end
end
