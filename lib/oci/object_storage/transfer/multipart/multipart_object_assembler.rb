# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'base64'
require 'openssl'
require 'tempfile'

require_relative 'internal/file_part_io_wrapper'
require_relative 'internal/stdin_part_io_wrapper'
require_relative 'internal/seekable_non_file_part_io_wrapper'
require_relative 'internal/multipart_upload_parts_collection'

module OCI
  module ObjectStorage
    module Transfer
      module Multipart
        # MultipartObjectAssembler provides a simplified interaction when uploading large
        # objects using multi-part uploads.
        #
        # An assembler can be used to begin a new upload, or resume a previous one. A new assembler
        # should be created per new upload or resumed upload to be performed. The same assembler is not
        # resubale across multiple new uploads/resumes.
        class MultipartObjectAssembler
          MD5_CALC_PART_READ_BYTES = 8 * OCI::ObjectStorage::Transfer::MEBIBYTE

          # Settings for the exponential backoff and retry (with jitter) which the assembler does
          DEFAULT_MAX_ATTEMPTS = 3
          DEFAULT_BASE_SLEEP_MILLIS = 1000
          DEFAULT_MAX_SLEEP_TIME_MILLIS = 8000
          DEFAULT_EXPONENTIAL_GROWTH_FACTOR = 2

          # The client used to interact with the Object Storage service
          # @return [OCI::ObjectStorage::ObjectStorageClient]
          attr_accessor :object_storage_client

          # The namespace containing the bucket in which to store the object
          # @return [String]
          attr_accessor :namespace

          # The bucket where we'll upload the object
          # @return [String]
          attr_accessor :bucket_name

          # The name of the object in Object Storage
          # @return [String]
          attr_accessor :object_name

          # The size, in bytes, of each part of a multipart upload. This applies when we are uploading files from disk
          # and defaults to 128 MiB
          # @return [Integer]
          attr_accessor :multipart_part_size

          # The size, in bytes, of each part of a multipart upload when we are reading from stdin or a non-file IO-like
          # source (e.g. a StringIO). Defaults to 10 MiB
          # @return [Integer]
          attr_accessor :non_file_io_multipart_part_size

          # How many parts we can upload in parallel. Defaults to 3. If this is set to 1, this is the
          # equivalent of not allowing parts to be uploaded in parallel.
          # @return [Integer]
          attr_accessor :parallel_process_count

          # A bag of optional parameter (e.g. the client request ID, metadata) which we can use when making calls to the Object Storage service.
          # @return [Hash]
          attr_accessor :multipart_upload_opts

          # If we encounter a failure when performing an operation and need to retry, the maximum number of attempts we
          # can make before declaring failure. Attempts are 1-based, i.e. the first call we make is considered attempt 1.
          # @return [Integer]
          attr_accessor :max_attempts

          # For exponential backoff and retry, the base time to use in our retry calculation in milliseconds. Defaults to 1000ms
          # @return [Integer]
          attr_accessor :base_sleep_millis

          # The maximum amount of time to wait between retries. Defaults to 8000ms
          # @return [Integer]
          attr_accessor :max_sleep_time_millis

          # For exponential backoff and retry, the exponent which we will raise to the power of the number of attempts. Defaults to 2
          # @return [Integer]
          attr_accessor :exponential_growth_factor

          # Contains the upload ID for the multipart upload and other upload-specific information (e.g. the destination namespace, bucket and object,
          # and the parts which have been uploaded)
          # @return [Hash]
          attr_reader :manifest

          # @param [OCI::ObjectStorage::ObjectStorageClient] object_storage_client The client used to interact with the Object Storage service
          # @param [String] namespace The namespace containing the bucket in which to store the object
          # @param [String] bucket_name The bucket where we'll upload the object
          # @param [String] object_name The name of the object in Object Storage
          # @param [Integer] multipart_part_size The size, in bytes, of each part of a multipart upload. This applies when we are uploading files from disk and defaults to 128 MiB
          # @param [Integer] non_file_io_multipart_part_size The size, in bytes, of each part of a multipart upload when we are reading from stdin or a non-file IO-like source (e.g. a StringIO). Defaults to 10 MiB
          # @param [Integer] parallel_process_count How many parts we can upload in parallel. Defaults to 3
          # @param [Hash] multipart_upload_opts
          # @option multipart_upload_opts [String] :if_match The entity tag to match. Only used for new multipart uploads and ignored otherwise.
          # @option multipart_upload_opts [String] :if_none_match The entity tag to avoid matching. The only valid value is *, which indicates that the request should fail if the object already exists. Only used for new multipart uploads and ignored otherwise.
          # @option multipart_upload_opts [String] :opc_client_request_id The client request ID for tracing. Will be applied to all requests made by this assembler.
          # @option multipart_upload_opts [String] :content_type The content type of the object.  Defaults to 'application/octet-stream' if not overridden. Only used for new multipart uploads and ignored otherwise.
          # @option multipart_upload_opts [String] :content_language The content language of the object. Only used for new multipart uploads and ignored otherwise.
          # @option multipart_upload_opts [String] :content_encoding The content encoding of the object. Only used for new multipart uploads and ignored otherwise.
          # @option multipart_upload_opts [Hash<String, String>] :metadata A hash of string keys to string values representing any custom metadata to be applied to the object.  Only used for new multipart uploads and ignored otherwise.
          def initialize(object_storage_client:,
                         namespace:,
                         bucket_name:,
                         object_name:,
                         multipart_part_size: OCI::ObjectStorage::Transfer::MULTIPART_PART_SIZE,
                         non_file_io_multipart_part_size: OCI::ObjectStorage::Transfer::NON_FILE_IO_MULTIPART_PART_SIZE,
                         parallel_process_count: OCI::ObjectStorage::Transfer::Multipart::DEFAULT_PARALLEL_PROCESS_COUNT,
                         multipart_upload_opts: {})
            @object_storage_client = object_storage_client
            @namespace = namespace
            @bucket_name = bucket_name
            @object_name = object_name
            @multipart_part_size = multipart_part_size
            @non_file_io_multipart_part_size = non_file_io_multipart_part_size
            @parallel_process_count = parallel_process_count
            @object_io = nil

            @manifest = {
              upload_id: nil,
              namespace: @namespace,
              bucket_name: @bucket_name,
              object_name: @object_name,
              object_io_or_file_path: nil,
              parts: OCI::ObjectStorage::Transfer::Multipart::Internal::MultipartUploadPartsCollection.new([])
            }

            @multipart_upload_opts = multipart_upload_opts
            @multipart_upload_opts.delete('content_md5') if @multipart_upload_opts.key?('content_md5')

            @max_attempts = DEFAULT_MAX_ATTEMPTS
            @base_sleep_millis = DEFAULT_BASE_SLEEP_MILLIS
            @exponential_growth_factor = DEFAULT_EXPONENTIAL_GROWTH_FACTOR
            @max_sleep_time_millis = DEFAULT_MAX_SLEEP_TIME_MILLIS
          end

          # Initializes a new multipart upload.
          #
          # @return [Response] A Response object with data of type OCI::ObjectStorage::Models::MultipartUpload
          def new_upload
            raise 'This MultipartObjectAssembler has already been initialized with an upload' if @manifest[:upload_id]

            create_multipart_upload_opts = {}
            create_multipart_upload_opts[:if_match] = @multipart_upload_opts[:if_match] if @multipart_upload_opts[:if_match]
            create_multipart_upload_opts[:if_none_match] = @multipart_upload_opts[:if_none_match] \
              if @multipart_upload_opts[:if_none_match]

            create_multipart_upload_opts[:opc_client_request_id] = @multipart_upload_opts[:opc_client_request_id] \
              if @multipart_upload_opts[:opc_client_request_id]

            create_multipart_upload_details =
              OCI::ObjectStorage::Models::CreateMultipartUploadDetails.new(object: @object_name)

            create_multipart_upload_details.content_type = @multipart_upload_opts[:content_type] \
              if @multipart_upload_opts[:content_type]

            create_multipart_upload_details.content_language = @multipart_upload_opts[:content_language] \
              if @multipart_upload_opts[:content_language]

            create_multipart_upload_details.content_encoding = @multipart_upload_opts[:content_encoding] \
              if @multipart_upload_opts[:content_encoding]

            if @multipart_upload_opts[:metadata] && !@multipart_upload_opts[:metadata].empty?
              processed_metadata = {}
              @multipart_upload_opts[:metadata].each do |key, value|
                processed_metadata[key] = value if key.to_s.start_with?('opc-meta-')
                processed_metadata["opc-meta-#{key}"] = value unless key.to_s.start_with?('opc-meta-')
              end
              create_multipart_upload_details.metadata = processed_metadata
            end

            response = make_retrying_call do
              @object_storage_client.create_multipart_upload(
                @namespace, @bucket_name,
                create_multipart_upload_details,
                create_multipart_upload_opts
              )
            end
            @manifest[:upload_id] = response.data.upload_id

            response
          end

          # Initializes the parts in the manifest based on the provided input. If the input is stdin then the list of parts in the manifest
          # will be left empty (the parts in this case are figured out dynamically at upload time since we may not have all the information in advance).
          # If the input is the path to a file (a String), a file or a IO-like object (e.g. a StringIO) then the parts in the manifest will
          # be initialized so that the assembler can go through and upload them.
          #
          # No uploads will be performed until the upload method is called.
          #
          # @param [String, IO] object_io_or_file_path Either a path to the file to upload, an IO-like object containing the data to upload or $stdin.
          def io_for_transfer=(object_io_or_file_path)
            # Supports IO-wrapping objects we can convert to an IO. An example is Rails'
            # ActionDispatch::Http::UploadedFile, which wraps an IO (a Tempfile) but
            # doesn't expose all the IO operations directly (e.g. you can't write to it, it's not seekable)
            #
            # This should be safe to use with IO and its subclasses as well as to_io is a method on IO:
            # http://ruby-doc.org/core-2.3.1/IO.html#method-i-to_io and returns itself if called on
            # an IO
            @manifest[:object_io_or_file_path] = object_io_or_file_path.to_io if object_io_or_file_path.respond_to?(:to_io)
            @manifest[:object_io_or_file_path] = object_io_or_file_path unless object_io_or_file_path.respond_to?(:to_io)

            return if stdin?(object_io_or_file_path)

            opened_file = false
            if object_io_or_file_path.is_a?(String)
              object_io = File.open(object_io_or_file_path, 'rb')
              opened_file = true
            end
            object_io = object_io_or_file_path if object_io_or_file_path.respond_to?(:seek)

            total_size = object_io.size if object_io.respond_to?(:size)
            total_size = object_io.stat.size unless object_io.respond_to?(:size)

            part_size_to_use = @multipart_part_size if file_based_io?(object_io_or_file_path)
            part_size_to_use = @non_file_io_multipart_part_size unless file_based_io?(object_io_or_file_path)

            offset = 0
            part_number = 1
            while offset < total_size
              part_info = {
                offset: offset,
                part_size: calculate_part_size(total_size, offset, part_size_to_use),
                part_number: part_number,
                part_md5_hash: nil
              }
              @manifest[:parts].push(part_info)
              offset += part_size_to_use
              part_number += 1
            end

            nil
          ensure
            object_io.close if opened_file && object_io
          end

          # Performs a multipart upload
          #
          # @return [Array] If the multipart upload was successful, an empty array. If there were errors then the array will contain
          # one element per error which occurred.
          def upload
            all_parts = @manifest[:parts].to_a
            pending_parts = OCI::ObjectStorage::Transfer::Multipart::Internal::MultipartUploadPartsCollection.new(
              all_parts.select { |ap| ap[:opc_md5].nil? && ap[:etag].nil? }
            )

            unless file_based_io?(@manifest[:object_io_or_file_path]) || stdin?(@manifest[:object_io_or_file_path])
              seekable_io_wrapper = OCI::ObjectStorage::Transfer::Multipart::Internal::SeekableNonFilePartIOWrapper.new(
                source: @manifest[:object_io_or_file_path]
              )
            end

            if stdin?(@manifest[:object_io_or_file_path])
              stdin_io_wrapper = OCI::ObjectStorage::Transfer::Multipart::Internal::StdinPartIOWrapper.new(
                source: @manifest[:object_io_or_file_path]
              )
            end

            threads = []
            @parallel_process_count.times do
              thread = Thread.new do
                begin
                  upload_non_stdin(pending_parts, seekable_io_wrapper) unless stdin?(@manifest[:object_io_or_file_path])
                  upload_stdin(stdin_io_wrapper) if stdin?(@manifest[:object_io_or_file_path])

                  nil
                rescue => e
                  pending_parts.clear! # Stop any futher processing on error
                  e
                end
              end

              thread.abort_on_exception = true # Do not continue if we encounter exceptions
              threads << thread
            end

            threads.map(&:value).compact
          end

          # Resume uploading a multipart object to Object Storage. This assumes that the assembler already has knowledge
          # of the parts which it could potentially need to upload (i.e. they have been prepared via the set_io_for_transfer
          # method).
          #
          # Prior to resuming the upload, we'll attempt to reconcile with Object Storage any previously uploaded parts so that
          # they are not uploaded again
          #
          # @param [String] upload_id The ID of the multipart upload to resume.
          #
          # @return [Array] If the multipart upload was successful, an empty array. If there were errors then the array will contain
          # one element per error which occurred.
          def resume(upload_id)
            raise 'An upload ID must be provided' if upload_id.nil?
            raise 'Parts must be initialized prior to resuming' if @manifest[:parts].length.zero?

            manifest[:upload_id] = upload_id
            upload_parts = list_uploaded_parts(upload_id)
            known_parts = @manifest[:parts].to_a

            raise 'There are more parts on the server than parts to resume, please check the upload ID.' \
              if upload_parts.length > known_parts.length

            upload_parts.each do |up|
              index = up.part_number - 1
              manifest_part = known_parts[index]

              if manifest_part[:part_size] != up.size
                raise 'Cannot resume upload with different part size. ' \
                  + "Parts were uploaded with a part size of #{up.size / OCI::ObjectStorage::Transfer::MEBIBYTE} MiB"
              end

              manifest_part[:etag] = up.etag
              manifest_part[:opc_md5] = up.md5
            end

            upload
          end

          # Commits the multipart upload.
          #
          # @return [Response] A Response object with data of type nil. For a multipart upload, the headers of the response will contain
          # an opc-multipart-md5 key.
          def commit
            raise 'Cannot commit as this MultipartObjectAssembler has not been initialized with an upload' \
              unless @manifest[:upload_id]

            parts = @manifest[:parts].to_a

            commit_upload_details = OCI::ObjectStorage::Models::CommitMultipartUploadDetails.new
            commit_upload_details.parts_to_commit = []
            commit_upload_details.parts_to_exclude = []

            parts.each do |part|
              if part[:etag]
                commit_upload_details.parts_to_commit << OCI::ObjectStorage::Models::CommitMultipartUploadPartDetails.new(
                  partNum: part[:part_number],
                  etag: part[:etag]
                )
              end

              commit_upload_details.parts_to_exclude << part[:part_number] unless part[:etag]
            end

            response = make_retrying_call do
              @object_storage_client.commit_multipart_upload(
                @namespace,
                @bucket_name,
                @object_name,
                @manifest[:upload_id],
                commit_upload_details
              )
            end

            response
          end

          # Aborts a multipart upload.
          #
          # @param [String] upload_id The ID of the multipart upload to abort.
          # @return [Response] A Response object with data of type nil
          def abort(upload_id)
            abort_opts = {}
            abort_opts[:opc_client_request_id] = @multipart_upload_opts[:opc_client_request_id] \
              if @multipart_upload_opts[:opc_client_request_id]

            response = make_retrying_call do
              @object_storage_client.abort_multipart_upload(
                @namespace,
                @bucket_name,
                @object_name,
                upload_id,
                abort_opts
              )
            end
            response
          end

          private

          def calculate_part_size(total_size, offset, part_size)
            if offset + part_size > total_size
              total_size - offset
            else
              part_size
            end
          end

          def calculate_md5(file_part: nil, raw_content: nil)
            raise 'Cannot specify both a file_part and raw_content' if file_part && raw_content

            md5 = OpenSSL::Digest::MD5.new

            if file_part
              file_part.rewind
              loop do
                part_read = file_part.read(MD5_CALC_PART_READ_BYTES)
                break unless part_read

                md5.update(part_read)
              end
              file_part.rewind
            end

            md5.update(raw_content) if raw_content

            md5.base64digest
          end

          def list_uploaded_parts(upload_id)
            list_multipart_upload_parts_opts = {}
            if @multipart_upload_opts[:opc_client_request_id]
              list_multipart_upload_parts_opts[:opc_client_request_id] = @multipart_upload_opts[:opc_client_request_id]
            end

            upload_parts = []
            @object_storage_client.list_multipart_upload_parts(
              @namespace,
              @bucket_name,
              @object_name,
              upload_id,
              list_multipart_upload_parts_opts
            ).each do |response|
              upload_parts += response.data
            end

            upload_parts
          end

          def file_based_io?(object_io_or_file_path)
            object_io_or_file_path.is_a?(String) ||
              object_io_or_file_path.is_a?(File) ||
              object_io_or_file_path.is_a?(Tempfile)
          end

          def stdin?(object_io_or_file_path)
            object_io_or_file_path.eql?($stdin)
          end

          def upload_non_stdin(pending_parts, seekable_io_wrapper = nil)
            while (part = pending_parts.shift) # While we have parts left to process
              if file_based_io?(@manifest[:object_io_or_file_path])
                part_content = OCI::ObjectStorage::Transfer::Multipart::Internal::FilePartIOWrapper.new(
                  source: @manifest[:object_io_or_file_path],
                  offset: part[:offset],
                  part_size: part[:part_size]
                )
                part[:part_md5_hash] = calculate_md5(file_part: part_content)
              else
                part_content = seekable_io_wrapper.read(part[:offset], part[:part_size])
                part[:part_md5_hash] = calculate_md5(raw_content: part_content)
              end

              upload_part_opts = { content_md5: part[:md5_hash] }
              if @multipart_upload_opts[:opc_client_request_id]
                upload_part_opts[:opc_client_request_id] = @multipart_upload_opts[:opc_client_request_id]
              end

              response = make_retrying_call do
                @object_storage_client.upload_part(
                  @namespace,
                  @bucket_name,
                  @object_name,
                  @manifest[:upload_id],
                  part[:part_number],
                  part_content,
                  upload_part_opts
                )
              end
              part_content.close if file_based_io?(@manifest[:object_io_or_file_path])

              part[:etag] = response.headers['etag']
              part[:opc_md5] = response.headers['opc-content-md5']
            end
          end

          def upload_stdin(stdin_io_wrapper)
            # While we can still pull content from stdin
            while (stdin_part = stdin_io_wrapper.read(@non_file_io_multipart_part_size))
              part = {
                part_number: stdin_part[:part_number],
                part_size: stdin_part[:content].size,
                part_md5_hash: calculate_md5(raw_content: stdin_part[:content])
              }

              upload_part_opts = { content_md5: part[:md5_hash] }
              if @multipart_upload_opts[:opc_client_request_id]
                upload_part_opts[:opc_client_request_id] = @multipart_upload_opts[:opc_client_request_id]
              end

              response = make_retrying_call do
                @object_storage_client.upload_part(
                  @namespace,
                  @bucket_name,
                  @object_name,
                  @manifest[:upload_id],
                  part[:part_number],
                  stdin_part[:content],
                  upload_part_opts
                )
              end

              part[:etag] = response.headers['etag']
              part[:opc_md5] = response.headers['opc-content-md5']

              @manifest[:parts].push(part)
            end
          end

          # Make a retrying call using a provided block (that we yield to) and return the result of the block
          # on success.
          def make_retrying_call
            @max_attempts.times do |attempt|
              try = attempt + 1
              begin
                return yield
              rescue OCI::Errors::NetworkError # Network errors should be retriable
                raise if try >= @max_attempts # Short-circuit if we're already on our last attempt

                # Use full jitter on networking errors (as hopefully they are short-lived/intermittent)
                sleep(get_full_jitter_sleep_time_millis(attempt) / 1000.0)
              rescue OCI::Errors::ServiceError => e
                raise if try >= @max_attempts # Short-circuit if we're already on our last attempt

                # For internal server errors, use full jitter as it's hopefully intermittent
                sleep(get_full_jitter_sleep_time_millis(attempt) / 1000.0) if e.status >= 500 || e.status == -1

                # For throttles and consistency errors, use equal jitter as this guarantees some sleep time
                # between attempts (full jitter doesn't because we get a value across the range 0 to something, i.e.
                # it is possible to get a very small sleep time)
                if e.status == 429 || (e.status == 409 && e.code == 'ConcurrentObjectUpdate')
                  sleep(get_equal_jitter_sleep_time_millis(attempt) / 1000.0)
                end

                # A non-retriable service error, so just throw it
                raise
              end
            end
          end

          def get_full_jitter_sleep_time_millis(attempt)
            random = Random.new
            random.rand(0..[@base_sleep_millis * (@exponent_growth_factor**attempt), @max_sleep_time_millis].min)
          end

          def get_equal_jitter_sleep_time_millis(attempt)
            random = Random.new
            sleep_raw = [@base_sleep_millis * (@exponent_growth_factor**attempt), @max_sleep_time_millis].min

            (sleep_raw / 2) + random.rand(0..(sleep_raw / 2))
          end
        end
      end
    end
  end
end
