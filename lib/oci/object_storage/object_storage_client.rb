# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Common set of Object Storage and Archive Storage APIs for managing buckets, objects, and related resources.
  class ObjectStorage::ObjectStorageClient
    # Client used to make HTTP requests.
    # @return [OCI::ApiClient]
    attr_reader :api_client

    # Fully qualified endpoint URL
    # @return [String]
    attr_reader :endpoint

    # The default retry configuration to apply to all operations in this service client. This can be overridden
    # on a per-operation basis. The default retry configuration value is `nil`, which means that an operation
    # will not perform any retries
    # @return [OCI::Retry::RetryConfig]
    attr_reader :retry_config

    # The region, which will usually correspond to a value in {OCI::Regions::REGION_ENUM}.
    # @return [String]
    attr_reader :region

    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity


    # Creates a new ObjectStorageClient.
    # Notes:
    #   If a config is not specified, then the global OCI.config will be used.
    #
    #   This client is not thread-safe
    #
    #   Either a region or an endpoint must be specified.  If an endpoint is specified, it will be used instead of the
    #     region. A region may be specified in the config or via or the region parameter. If specified in both, then the
    #     region parameter will be used.
    # @param [Config] config A Config object.
    # @param [String] region A region used to determine the service endpoint. This will usually
    #   correspond to a value in {OCI::Regions::REGION_ENUM}, but may be an arbitrary string.
    # @param [String] endpoint The fully qualified endpoint URL
    # @param [OCI::BaseSigner] signer A signer implementation which can be used by this client. If this is not provided then
    #   a signer will be constructed via the provided config. One use case of this parameter is instance principals authentication,
    #   so that the instance principals signer can be provided to the client
    # @param [OCI::ApiClientProxySettings] proxy_settings If your environment requires you to use a proxy server for outgoing HTTP requests
    #   the details for the proxy can be provided in this parameter
    # @param [OCI::Retry::RetryConfig] retry_config The retry configuration for this service client. This represents the default retry configuration to
    #   apply across all operations. This can be overridden on a per-operation basis. The default retry configuration value is `nil`, which means that an operation
    #   will not perform any retries
    def initialize(config: nil, region: nil, endpoint: nil, signer: nil, proxy_settings: nil, retry_config: nil)
      # If the signer is an InstancePrincipalsSecurityTokenSigner and no config was supplied (which is valid for instance principals)
      # then create a dummy config to pass to the ApiClient constructor. If customers wish to create a client which uses instance principals
      # and has config (either populated programmatically or loaded from a file), they must construct that config themselves and then
      # pass it to this constructor.
      #
      # If there is no signer (or the signer is not an instance principals signer) and no config was supplied, this is not valid
      # so try and load the config from the default file.
      config ||= OCI.config unless signer.is_a?(OCI::Auth::Signers::InstancePrincipalsSecurityTokenSigner)
      config ||= OCI::Config.new if signer.is_a?(OCI::Auth::Signers::InstancePrincipalsSecurityTokenSigner)
      config.validate unless signer.is_a?(OCI::Auth::Signers::InstancePrincipalsSecurityTokenSigner)

      if signer.nil?
        signer = OCI::Signer.new(
          config.user,
          config.fingerprint,
          config.tenancy,
          config.key_file,
          pass_phrase: config.pass_phrase,
          private_key_content: config.key_content
        )
      end

      @api_client = OCI::ApiClient.new(config, signer, proxy_settings: proxy_settings)
      @retry_config = retry_config

      if endpoint
        @endpoint = endpoint + '/'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "ObjectStorageClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://objectstorage.{region}.{secondLevelDomain}') + '/'
      logger.info "ObjectStorageClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Aborts an in-progress multipart upload and deletes all parts that have been uploaded.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] object_name The name of the object. Avoid entering confidential information.
    #   Example: `test/object1.log`
    #
    # @param [String] upload_id The upload ID for a multipart upload.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    def abort_multipart_upload(namespace_name, bucket_name, object_name, upload_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#abort_multipart_upload.' if logger

      raise "Missing the required parameter 'namespace_name' when calling abort_multipart_upload." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling abort_multipart_upload." if bucket_name.nil?
      raise "Missing the required parameter 'object_name' when calling abort_multipart_upload." if object_name.nil?
      raise "Missing the required parameter 'upload_id' when calling abort_multipart_upload." if upload_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'object_name' must not be blank" if OCI::Internal::Util.blank_string?(object_name)

      path = '/n/{namespaceName}/b/{bucketName}/u/{objectName}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{objectName}', object_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:uploadId] = upload_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#abort_multipart_upload') do
        @api_client.call_api(
          :DELETE,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Cancels a work request.
    #
    # @param [String] work_request_id The ID of the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    def cancel_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#cancel_work_request.' if logger

      raise "Missing the required parameter 'work_request_id' when calling cancel_work_request." if work_request_id.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}'.sub('{workRequestId}', work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#cancel_work_request') do
        @api_client.call_api(
          :DELETE,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Commits a multipart upload, which involves checking part numbers and entity tags (ETags) of the parts, to create an aggregate object.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] object_name The name of the object. Avoid entering confidential information.
    #   Example: `test/object1.log`
    #
    # @param [String] upload_id The upload ID for a multipart upload.
    # @param [OCI::ObjectStorage::Models::CommitMultipartUploadDetails] commit_multipart_upload_details The part numbers and entity tags (ETags) for the parts you want to commit.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The entity tag (ETag) to match. For creating and committing a multipart upload to an object, this is the entity tag of the target object.
    #   For uploading a part, this is the entity tag of the target part.
    #
    # @option opts [String] :if_none_match The entity tag (ETag) to avoid matching. The only valid value is '*', which indicates that the request should fail if the object
    #   already exists. For creating and committing a multipart upload, this is the entity tag of the target object. For uploading a
    #   part, this is the entity tag of the target part.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    def commit_multipart_upload(namespace_name, bucket_name, object_name, upload_id, commit_multipart_upload_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#commit_multipart_upload.' if logger

      raise "Missing the required parameter 'namespace_name' when calling commit_multipart_upload." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling commit_multipart_upload." if bucket_name.nil?
      raise "Missing the required parameter 'object_name' when calling commit_multipart_upload." if object_name.nil?
      raise "Missing the required parameter 'upload_id' when calling commit_multipart_upload." if upload_id.nil?
      raise "Missing the required parameter 'commit_multipart_upload_details' when calling commit_multipart_upload." if commit_multipart_upload_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'object_name' must not be blank" if OCI::Internal::Util.blank_string?(object_name)

      path = '/n/{namespaceName}/b/{bucketName}/u/{objectName}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{objectName}', object_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:uploadId] = upload_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(commit_multipart_upload_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#commit_multipart_upload') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a request to copy an object within a region or to another region.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [OCI::ObjectStorage::Models::CopyObjectDetails] copy_object_details The source and destination of the object to be copied.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    def copy_object(namespace_name, bucket_name, copy_object_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#copy_object.' if logger

      raise "Missing the required parameter 'namespace_name' when calling copy_object." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling copy_object." if bucket_name.nil?
      raise "Missing the required parameter 'copy_object_details' when calling copy_object." if copy_object_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/actions/copyObject'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(copy_object_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#copy_object') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a bucket in the given namespace with a bucket name and optional user-defined metadata. Avoid entering
    # confidential information in bucket names.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [OCI::ObjectStorage::Models::CreateBucketDetails] create_bucket_details Request object for creating a bucket.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::Bucket Bucket}
    def create_bucket(namespace_name, create_bucket_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#create_bucket.' if logger

      raise "Missing the required parameter 'namespace_name' when calling create_bucket." if namespace_name.nil?
      raise "Missing the required parameter 'create_bucket_details' when calling create_bucket." if create_bucket_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/n/{namespaceName}/b/'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(create_bucket_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#create_bucket') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::Bucket'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Starts a new multipart upload to a specific object in the given bucket in the given namespace.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [OCI::ObjectStorage::Models::CreateMultipartUploadDetails] create_multipart_upload_details Request object for creating a multi-part upload.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The entity tag (ETag) to match. For creating and committing a multipart upload to an object, this is the entity tag of the target object.
    #   For uploading a part, this is the entity tag of the target part.
    #
    # @option opts [String] :if_none_match The entity tag (ETag) to avoid matching. The only valid value is '*', which indicates that the request should fail if the object
    #   already exists. For creating and committing a multipart upload, this is the entity tag of the target object. For uploading a
    #   part, this is the entity tag of the target part.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::MultipartUpload MultipartUpload}
    def create_multipart_upload(namespace_name, bucket_name, create_multipart_upload_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#create_multipart_upload.' if logger

      raise "Missing the required parameter 'namespace_name' when calling create_multipart_upload." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling create_multipart_upload." if bucket_name.nil?
      raise "Missing the required parameter 'create_multipart_upload_details' when calling create_multipart_upload." if create_multipart_upload_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/u'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(create_multipart_upload_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#create_multipart_upload') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::MultipartUpload'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a pre-authenticated request specific to the bucket.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [OCI::ObjectStorage::Models::CreatePreauthenticatedRequestDetails] create_preauthenticated_request_details Information needed to create the pre-authenticated request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::PreauthenticatedRequest PreauthenticatedRequest}
    def create_preauthenticated_request(namespace_name, bucket_name, create_preauthenticated_request_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#create_preauthenticated_request.' if logger

      raise "Missing the required parameter 'namespace_name' when calling create_preauthenticated_request." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling create_preauthenticated_request." if bucket_name.nil?
      raise "Missing the required parameter 'create_preauthenticated_request_details' when calling create_preauthenticated_request." if create_preauthenticated_request_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/p/'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(create_preauthenticated_request_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#create_preauthenticated_request') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::PreauthenticatedRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes a bucket if the bucket is already empty. If the bucket is not empty, use
    # {#delete_object delete_object} first. You also cannot
    # delete a bucket that has a pre-authenticated request associated with that bucket.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The entity tag (ETag) to match. For creating and committing a multipart upload to an object, this is the entity tag of the target object.
    #   For uploading a part, this is the entity tag of the target part.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    def delete_bucket(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#delete_bucket.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_bucket." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling delete_bucket." if bucket_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#delete_bucket') do
        @api_client.call_api(
          :DELETE,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes an object.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] object_name The name of the object. Avoid entering confidential information.
    #   Example: `test/object1.log`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The entity tag (ETag) to match. For creating and committing a multipart upload to an object, this is the entity tag of the target object.
    #   For uploading a part, this is the entity tag of the target part.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    def delete_object(namespace_name, bucket_name, object_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#delete_object.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_object." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling delete_object." if bucket_name.nil?
      raise "Missing the required parameter 'object_name' when calling delete_object." if object_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'object_name' must not be blank" if OCI::Internal::Util.blank_string?(object_name)

      path = '/n/{namespaceName}/b/{bucketName}/o/{objectName}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{objectName}', object_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#delete_object') do
        @api_client.call_api(
          :DELETE,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes the object lifecycle policy for the bucket.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [String] :if_match The entity tag (ETag) to match. For creating and committing a multipart upload to an object, this is the entity tag of the target object.
    #   For uploading a part, this is the entity tag of the target part.
    #
    # @return [Response] A Response object with data of type nil
    def delete_object_lifecycle_policy(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#delete_object_lifecycle_policy.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_object_lifecycle_policy." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling delete_object_lifecycle_policy." if bucket_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/l'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#delete_object_lifecycle_policy') do
        @api_client.call_api(
          :DELETE,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes the pre-authenticated request for the bucket.
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] par_id The unique identifier for the pre-authenticated request. This can be used to manage operations against
    #   the pre-authenticated request, such as GET or DELETE.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    def delete_preauthenticated_request(namespace_name, bucket_name, par_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#delete_preauthenticated_request.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_preauthenticated_request." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling delete_preauthenticated_request." if bucket_name.nil?
      raise "Missing the required parameter 'par_id' when calling delete_preauthenticated_request." if par_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'par_id' must not be blank" if OCI::Internal::Util.blank_string?(par_id)

      path = '/n/{namespaceName}/b/{bucketName}/p/{parId}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{parId}', par_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#delete_preauthenticated_request') do
        @api_client.call_api(
          :DELETE,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the current representation of the given bucket in the given Object Storage namespace.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The entity tag (ETag) to match. For creating and committing a multipart upload to an object, this is the entity tag of the target object.
    #   For uploading a part, this is the entity tag of the target part.
    #
    # @option opts [String] :if_none_match The entity tag (ETag) to avoid matching. The only valid value is '*', which indicates that the request should fail if the object
    #   already exists. For creating and committing a multipart upload, this is the entity tag of the target object. For uploading a
    #   part, this is the entity tag of the target part.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [Array<String>] :fields Bucket summary includes the 'namespace', 'name', 'compartmentId', 'createdBy', 'timeCreated',
    #   and 'etag' fields. This parameter can also include 'approximateCount' (approximate number of objects) and 'approximateSize'
    #   (total approximate size in bytes of all objects). For example 'approximateCount,approximateSize'.
    #
    #   Allowed values are: approximateCount, approximateSize
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::Bucket Bucket}
    def get_bucket(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#get_bucket.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_bucket." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling get_bucket." if bucket_name.nil?


      fields_allowable_values = %w[approximateCount approximateSize]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of approximateCount, approximateSize.'
          end
        end
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :csv) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#get_bucket') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::Bucket'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Each Oracle Cloud Infrastructure tenant is assigned one unique and uneditable Object Storage namespace. The namespace
    # is a system-generated string assigned during account creation. For some older tenancies, the namespace string may be
    # the tenancy name in all lower-case letters. You cannot edit a namespace.
    #
    # GetNamespace returns the name of the Object Storage namespace for the user making the request.
    # If an optional compartmentId query parameter is provided, GetNamespace returns the namespace name of the corresponding
    # tenancy, provided the user has access to it.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [String] :compartment_id This is an optional field representing the tenancy OCID or the compartment OCID within the tenancy whose Object Storage namespace
    #   name has to be retrieved.
    #
    # @return [Response] A Response object with data of type String
    def get_namespace(opts = {})
      logger.debug 'Calling operation ObjectStorageClient#get_namespace.' if logger


      path = '/n/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#get_namespace') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'String'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the metadata for the Object Storage namespace, which contains defaultS3CompartmentId and
    # defaultSwiftCompartmentId.
    #
    # Any user with the NAMESPACE_READ permission will be able to see the current metadata. If you are
    # not authorized, talk to an administrator. If you are an administrator who needs to write policies
    # to give users access, see
    # [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::NamespaceMetadata NamespaceMetadata}
    def get_namespace_metadata(namespace_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#get_namespace_metadata.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_namespace_metadata." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/n/{namespaceName}'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#get_namespace_metadata') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::NamespaceMetadata'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the metadata and body of an object.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] object_name The name of the object. Avoid entering confidential information.
    #   Example: `test/object1.log`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The entity tag (ETag) to match. For creating and committing a multipart upload to an object, this is the entity tag of the target object.
    #   For uploading a part, this is the entity tag of the target part.
    #
    # @option opts [String] :if_none_match The entity tag (ETag) to avoid matching. The only valid value is '*', which indicates that the request should fail if the object
    #   already exists. For creating and committing a multipart upload, this is the entity tag of the target object. For uploading a
    #   part, this is the entity tag of the target part.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [String] :range Optional byte range to fetch, as described in [RFC 7233](https://tools.ietf.org/rfc/rfc7233), section 2.1.
    #   Note that only a single range of bytes is supported.
    #
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    def get_object(namespace_name, bucket_name, object_name, opts = {}, &block)
      logger.debug 'Calling operation ObjectStorageClient#get_object.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_object." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling get_object." if bucket_name.nil?
      raise "Missing the required parameter 'object_name' when calling get_object." if object_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'object_name' must not be blank" if OCI::Internal::Util.blank_string?(object_name)

      path = '/n/{namespaceName}/b/{bucketName}/o/{objectName}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{objectName}', object_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = opts[:accept] if opts[:accept]
      header_params[:accept] ||= 'application/json'
      header_params[:'accept-encoding'] = opts[:accept_encoding] if opts[:accept_encoding]
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      header_params[:range] = opts[:range] if opts[:range]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#get_object') do
        if !block.nil?
          @api_client.call_api(
            :GET,
            path,
            endpoint,
            header_params: header_params,
            query_params: query_params,
            operation_signing_strategy: operation_signing_strategy,
            body: post_body,
            return_type: 'Stream',
            &block
          )
        elsif opts[:response_target]
          if opts[:response_target].respond_to? :write
            @api_client.call_api(
              :GET,
              path,
              endpoint,
              header_params: header_params,
              query_params: query_params,
              operation_signing_strategy: operation_signing_strategy,
              body: post_body,
              return_type: 'Stream',
              &proc { |chunk, _response| opts[:response_target].write(chunk) }
            )
          elsif opts[:response_target].is_a?(String)
            File.open(opts[:response_target], 'wb') do |output|
              return @api_client.call_api(
                :GET,
                path,
                endpoint,
                header_params: header_params,
                query_params: query_params,
                operation_signing_strategy: operation_signing_strategy,
                body: post_body,
                return_type: 'Stream',
                &proc { |chunk, _response| output.write(chunk) }
              )
            end
          end
        else
          @api_client.call_api(
            :GET,
            path,
            endpoint,
            header_params: header_params,
            query_params: query_params,
            operation_signing_strategy: operation_signing_strategy,
            body: post_body,
            return_type: 'String'
          )
        end
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the object lifecycle policy for the bucket.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::ObjectLifecyclePolicy ObjectLifecyclePolicy}
    def get_object_lifecycle_policy(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#get_object_lifecycle_policy.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_object_lifecycle_policy." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling get_object_lifecycle_policy." if bucket_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/l'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#get_object_lifecycle_policy') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::ObjectLifecyclePolicy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the pre-authenticated request for the bucket.
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] par_id The unique identifier for the pre-authenticated request. This can be used to manage operations against
    #   the pre-authenticated request, such as GET or DELETE.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::PreauthenticatedRequestSummary PreauthenticatedRequestSummary}
    def get_preauthenticated_request(namespace_name, bucket_name, par_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#get_preauthenticated_request.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_preauthenticated_request." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling get_preauthenticated_request." if bucket_name.nil?
      raise "Missing the required parameter 'par_id' when calling get_preauthenticated_request." if par_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'par_id' must not be blank" if OCI::Internal::Util.blank_string?(par_id)

      path = '/n/{namespaceName}/b/{bucketName}/p/{parId}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{parId}', par_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#get_preauthenticated_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::PreauthenticatedRequestSummary'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the status of the work request for the given ID.
    # @param [String] work_request_id The ID of the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::WorkRequest WorkRequest}
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#get_work_request.' if logger

      raise "Missing the required parameter 'work_request_id' when calling get_work_request." if work_request_id.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}'.sub('{workRequestId}', work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::WorkRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Efficiently checks to see if a bucket exists and gets the current entity tag (ETag) for the bucket.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The entity tag (ETag) to match. For creating and committing a multipart upload to an object, this is the entity tag of the target object.
    #   For uploading a part, this is the entity tag of the target part.
    #
    # @option opts [String] :if_none_match The entity tag (ETag) to avoid matching. The only valid value is '*', which indicates that the request should fail if the object
    #   already exists. For creating and committing a multipart upload, this is the entity tag of the target object. For uploading a
    #   part, this is the entity tag of the target part.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    def head_bucket(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#head_bucket.' if logger

      raise "Missing the required parameter 'namespace_name' when calling head_bucket." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling head_bucket." if bucket_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#head_bucket') do
        @api_client.call_api(
          :HEAD,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the user-defined metadata and entity tag (ETag) for an object.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] object_name The name of the object. Avoid entering confidential information.
    #   Example: `test/object1.log`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The entity tag (ETag) to match. For creating and committing a multipart upload to an object, this is the entity tag of the target object.
    #   For uploading a part, this is the entity tag of the target part.
    #
    # @option opts [String] :if_none_match The entity tag (ETag) to avoid matching. The only valid value is '*', which indicates that the request should fail if the object
    #   already exists. For creating and committing a multipart upload, this is the entity tag of the target object. For uploading a
    #   part, this is the entity tag of the target part.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    def head_object(namespace_name, bucket_name, object_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#head_object.' if logger

      raise "Missing the required parameter 'namespace_name' when calling head_object." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling head_object." if bucket_name.nil?
      raise "Missing the required parameter 'object_name' when calling head_object." if object_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'object_name' must not be blank" if OCI::Internal::Util.blank_string?(object_name)

      path = '/n/{namespaceName}/b/{bucketName}/o/{objectName}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{objectName}', object_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#head_object') do
        @api_client.call_api(
          :HEAD,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of all BucketSummary items in a compartment. A BucketSummary contains only summary fields for the bucket
    # and does not contain fields like the user-defined metadata.
    #
    # To use this and other API operations, you must be authorized in an IAM policy. If you are not authorized,
    # talk to an administrator. If you are an administrator who needs to write policies to give users access, see
    # [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] compartment_id The ID of the compartment in which to list buckets.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page at which to start retrieving results.
    # @option opts [Array<String>] :fields Bucket summary in list of buckets includes the 'namespace', 'name', 'compartmentId', 'createdBy', 'timeCreated',
    #   and 'etag' fields. This parameter can also include 'tags' (freeformTags and definedTags). The only supported value
    #   of this parameter is 'tags' for now. Example 'tags'.
    #
    #   Allowed values are: tags
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::ObjectStorage::Models::BucketSummary BucketSummary}>
    def list_buckets(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#list_buckets.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_buckets." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_buckets." if compartment_id.nil?


      fields_allowable_values = %w[tags]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of tags.'
          end
        end
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/n/{namespaceName}/b/'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :csv) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#list_buckets') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::ObjectStorage::Models::BucketSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the parts of an in-progress multipart upload.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] object_name The name of the object. Avoid entering confidential information.
    #   Example: `test/object1.log`
    #
    # @param [String] upload_id The upload ID for a multipart upload.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page at which to start retrieving results.
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::ObjectStorage::Models::MultipartUploadPartSummary MultipartUploadPartSummary}>
    def list_multipart_upload_parts(namespace_name, bucket_name, object_name, upload_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#list_multipart_upload_parts.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_multipart_upload_parts." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling list_multipart_upload_parts." if bucket_name.nil?
      raise "Missing the required parameter 'object_name' when calling list_multipart_upload_parts." if object_name.nil?
      raise "Missing the required parameter 'upload_id' when calling list_multipart_upload_parts." if upload_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'object_name' must not be blank" if OCI::Internal::Util.blank_string?(object_name)

      path = '/n/{namespaceName}/b/{bucketName}/u/{objectName}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{objectName}', object_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:uploadId] = upload_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#list_multipart_upload_parts') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::ObjectStorage::Models::MultipartUploadPartSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists all of the in-progress multipart uploads for the given bucket in the given Object Storage namespace.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page at which to start retrieving results.
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::ObjectStorage::Models::MultipartUpload MultipartUpload}>
    def list_multipart_uploads(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#list_multipart_uploads.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_multipart_uploads." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling list_multipart_uploads." if bucket_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/u'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#list_multipart_uploads') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::ObjectStorage::Models::MultipartUpload>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the objects in a bucket.
    #
    # To use this and other API operations, you must be authorized in an IAM policy. If you are not authorized,
    # talk to an administrator. If you are an administrator who needs to write policies to give users access, see
    # [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :prefix The string to use for matching against the start of object names in a list query.
    # @option opts [String] :start Object names returned by a list query must be greater or equal to this parameter.
    # @option opts [String] :_end Object names returned by a list query must be strictly less than this parameter.
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :delimiter When this parameter is set, only objects whose names do not contain the delimiter character
    #   (after an optionally specified prefix) are returned in the objects key of the response body.
    #   Scanned objects whose names contain the delimiter have the part of their name up to the first
    #   occurrence of the delimiter (including the optional prefix) returned as a set of prefixes.
    #   Note that only '/' is a supported delimiter character at this time.
    #
    # @option opts [String] :fields Object summary in list of objects includes the 'name' field. This parameter can also include 'size'
    #   (object size in bytes), 'md5', and 'timeCreated' (object creation date and time) fields.
    #   Value of this parameter should be a comma-separated, case-insensitive list of those field names.
    #   For example 'name,timeCreated,md5'.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::ListObjects ListObjects}
    def list_objects(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#list_objects.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_objects." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling list_objects." if bucket_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/o'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:prefix] = opts[:prefix] if opts[:prefix]
      query_params[:start] = opts[:start] if opts[:start]
      query_params[:end] = opts[:_end] if opts[:_end]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:delimiter] = opts[:delimiter] if opts[:delimiter]
      query_params[:fields] = opts[:fields] if opts[:fields]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#list_objects') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::ListObjects'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists pre-authenticated requests for the bucket.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :object_name_prefix User-specified object name prefixes can be used to query and return a list of pre-authenticated requests.
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page at which to start retrieving results.
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::ObjectStorage::Models::PreauthenticatedRequestSummary PreauthenticatedRequestSummary}>
    def list_preauthenticated_requests(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#list_preauthenticated_requests.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_preauthenticated_requests." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling list_preauthenticated_requests." if bucket_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/p/'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:objectNamePrefix] = opts[:object_name_prefix] if opts[:object_name_prefix]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#list_preauthenticated_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::ObjectStorage::Models::PreauthenticatedRequestSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the errors of the work request with the given ID.
    # @param [String] work_request_id The ID of the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The page at which to start retrieving results.
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::ObjectStorage::Models::WorkRequestError WorkRequestError}>
    def list_work_request_errors(work_request_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#list_work_request_errors.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_errors." if work_request_id.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/errors'.sub('{workRequestId}', work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#list_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::ObjectStorage::Models::WorkRequestError>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the logs of the work request with the given ID.
    # @param [String] work_request_id The ID of the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The page at which to start retrieving results.
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::ObjectStorage::Models::WorkRequestLogEntry WorkRequestLogEntry}>
    def list_work_request_logs(work_request_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#list_work_request_logs.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_logs." if work_request_id.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/logs'.sub('{workRequestId}', work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#list_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::ObjectStorage::Models::WorkRequestLogEntry>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the work requests in a compartment.
    #
    # @param [String] compartment_id The ID of the compartment in which to list buckets.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [String] :page The page at which to start retrieving results.
    # @option opts [Integer] :limit The maximum number of items to return.
    # @return [Response] A Response object with data of type Array<{OCI::ObjectStorage::Models::WorkRequestSummary WorkRequestSummary}>
    def list_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#list_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_work_requests." if compartment_id.nil?

      path = '/workRequests'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::ObjectStorage::Models::WorkRequestSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new object or overwrites an existing one. See [Special Instructions for Object Storage
    # PUT](https://docs.cloud.oracle.com/Content/API/Concepts/signingrequests.htm#ObjectStoragePut) for request signature requirements.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] object_name The name of the object. Avoid entering confidential information.
    #   Example: `test/object1.log`
    #
    # @param [String, IO] put_object_body The object to upload to the object store.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :content_length The content length of the body.
    # @option opts [String] :if_match The entity tag (ETag) to match. For creating and committing a multipart upload to an object, this is the entity tag of the target object.
    #   For uploading a part, this is the entity tag of the target part.
    #
    # @option opts [String] :if_none_match The entity tag (ETag) to avoid matching. The only valid value is '*', which indicates that the request should fail if the object
    #   already exists. For creating and committing a multipart upload, this is the entity tag of the target object. For uploading a
    #   part, this is the entity tag of the target part.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [String] :expect 100-continue (default to 100-continue)
    # @option opts [String] :content_md5 The base-64 encoded MD5 hash of the body. If the Content-MD5 header is present, Object Storage performs an integrity check
    #   on the body of the HTTP request by computing the MD5 hash for the body and comparing it to the MD5 hash supplied in the header.
    #   If the two hashes do not match, the object is rejected and an HTTP-400 Unmatched Content MD5 error is returned with the message:
    #
    #   \"The computed MD5 of the request body (ACTUAL_MD5) does not match the Content-MD5 header (HEADER_MD5)\"
    #
    # @option opts [String] :content_type The content type of the object.  Defaults to 'application/octet-stream' if not overridden during the PutObject call.
    # @option opts [String] :content_language The content language of the object.
    # @option opts [String] :content_encoding The content encoding of the object.
    # @option opts [Hash<String, String>] :opc_meta Optional user-defined metadata key and value.
    #   "opc-meta-" will be appended to each Hash key before it is sent to the server.
    # @return [Response] A Response object with data of type nil
    def put_object(namespace_name, bucket_name, object_name, put_object_body, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#put_object.' if logger

      raise "Missing the required parameter 'namespace_name' when calling put_object." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling put_object." if bucket_name.nil?
      raise "Missing the required parameter 'object_name' when calling put_object." if object_name.nil?
      raise "Missing the required parameter 'put_object_body' when calling put_object." if put_object_body.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'object_name' must not be blank" if OCI::Internal::Util.blank_string?(object_name)

      path = '/n/{namespaceName}/b/{bucketName}/o/{objectName}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{objectName}', object_name.to_s)
      operation_signing_strategy = :exclude_body

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      header_params[:expect] = opts[:expect] if opts[:expect]
      header_params[:'content-length'] = opts[:content_length] if opts[:content_length]
      header_params[:'content-md5'] = opts[:content_md5] if opts[:content_md5]
      header_params[:'content-type'] = opts[:content_type] if opts[:content_type]
      header_params[:'content-language'] = opts[:content_language] if opts[:content_language]
      header_params[:'content-encoding'] = opts[:content_encoding] if opts[:content_encoding]
      # rubocop:enable Style/NegatedIf

      if opts[:opc_meta]
        opts[:opc_meta].each do |key, value|
          header_params["opc-meta-#{key}".to_sym] = value
        end
      end
      header_params[:'content-type'] ||= 'application/octet-stream'

      post_body = @api_client.object_to_http_body(put_object_body)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#put_object') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates or replaces the object lifecycle policy for the bucket.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [OCI::ObjectStorage::Models::PutObjectLifecyclePolicyDetails] put_object_lifecycle_policy_details The lifecycle policy to apply to the bucket.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [String] :if_match The entity tag (ETag) to match. For creating and committing a multipart upload to an object, this is the entity tag of the target object.
    #   For uploading a part, this is the entity tag of the target part.
    #
    # @option opts [String] :if_none_match The entity tag (ETag) to avoid matching. The only valid value is '*', which indicates that the request should fail if the object
    #   already exists. For creating and committing a multipart upload, this is the entity tag of the target object. For uploading a
    #   part, this is the entity tag of the target part.
    #
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::ObjectLifecyclePolicy ObjectLifecyclePolicy}
    def put_object_lifecycle_policy(namespace_name, bucket_name, put_object_lifecycle_policy_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#put_object_lifecycle_policy.' if logger

      raise "Missing the required parameter 'namespace_name' when calling put_object_lifecycle_policy." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling put_object_lifecycle_policy." if bucket_name.nil?
      raise "Missing the required parameter 'put_object_lifecycle_policy_details' when calling put_object_lifecycle_policy." if put_object_lifecycle_policy_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/l'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(put_object_lifecycle_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#put_object_lifecycle_policy') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::ObjectLifecyclePolicy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Rename an object in the given Object Storage namespace.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [OCI::ObjectStorage::Models::RenameObjectDetails] rename_object_details The sourceName and newName of rename operation.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    def rename_object(namespace_name, bucket_name, rename_object_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#rename_object.' if logger

      raise "Missing the required parameter 'namespace_name' when calling rename_object." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling rename_object." if bucket_name.nil?
      raise "Missing the required parameter 'rename_object_details' when calling rename_object." if rename_object_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/actions/renameObject'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(rename_object_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#rename_object') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Restores one or more objects specified by the objectName parameter.
    # By default objects will be restored for 24 hours. Duration can be configured using the hours parameter.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [OCI::ObjectStorage::Models::RestoreObjectsDetails] restore_objects_details Request to restore objects.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    def restore_objects(namespace_name, bucket_name, restore_objects_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#restore_objects.' if logger

      raise "Missing the required parameter 'namespace_name' when calling restore_objects." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling restore_objects." if bucket_name.nil?
      raise "Missing the required parameter 'restore_objects_details' when calling restore_objects." if restore_objects_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/actions/restoreObjects'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(restore_objects_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#restore_objects') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Performs a partial or full update of a bucket's user-defined metadata.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [OCI::ObjectStorage::Models::UpdateBucketDetails] update_bucket_details Request object for updating a bucket.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The entity tag (ETag) to match. For creating and committing a multipart upload to an object, this is the entity tag of the target object.
    #   For uploading a part, this is the entity tag of the target part.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::Bucket Bucket}
    def update_bucket(namespace_name, bucket_name, update_bucket_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#update_bucket.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_bucket." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling update_bucket." if bucket_name.nil?
      raise "Missing the required parameter 'update_bucket_details' when calling update_bucket." if update_bucket_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_bucket_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#update_bucket') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::Bucket'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # By default, buckets created using the Amazon S3 Compatibility API or the Swift API are created in the root
    # compartment of the Oracle Cloud Infrastructure tenancy.
    #
    # You can change the default Swift/Amazon S3 compartmentId designation to a different compartmentId. All
    # subsequent bucket creations will use the new default compartment, but no previously created
    # buckets will be modified. A user must have NAMESPACE_UPDATE permission to make changes to the default
    # compartments for Amazon S3 and Swift.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [OCI::ObjectStorage::Models::UpdateNamespaceMetadataDetails] update_namespace_metadata_details Request object for update NamespaceMetadata.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::NamespaceMetadata NamespaceMetadata}
    def update_namespace_metadata(namespace_name, update_namespace_metadata_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#update_namespace_metadata.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_namespace_metadata." if namespace_name.nil?
      raise "Missing the required parameter 'update_namespace_metadata_details' when calling update_namespace_metadata." if update_namespace_metadata_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/n/{namespaceName}'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_namespace_metadata_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#update_namespace_metadata') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::NamespaceMetadata'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Uploads a single part of a multipart upload.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] object_name The name of the object. Avoid entering confidential information.
    #   Example: `test/object1.log`
    #
    # @param [String] upload_id The upload ID for a multipart upload.
    # @param [Integer] upload_part_num The part number that identifies the object part currently being uploaded.
    # @param [String, IO] upload_part_body The part being uploaded to the Object Storage service.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :content_length The content length of the body.
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [String] :if_match The entity tag (ETag) to match. For creating and committing a multipart upload to an object, this is the entity tag of the target object.
    #   For uploading a part, this is the entity tag of the target part.
    #
    # @option opts [String] :if_none_match The entity tag (ETag) to avoid matching. The only valid value is '*', which indicates that the request should fail if the object
    #   already exists. For creating and committing a multipart upload, this is the entity tag of the target object. For uploading a
    #   part, this is the entity tag of the target part.
    #
    # @option opts [String] :expect 100-continue (default to 100-continue)
    # @option opts [String] :content_md5 The base-64 encoded MD5 hash of the body. If the Content-MD5 header is present, Object Storage performs an integrity check
    #   on the body of the HTTP request by computing the MD5 hash for the body and comparing it to the MD5 hash supplied in the header.
    #   If the two hashes do not match, the object is rejected and an HTTP-400 Unmatched Content MD5 error is returned with the message:
    #
    #   \"The computed MD5 of the request body (ACTUAL_MD5) does not match the Content-MD5 header (HEADER_MD5)\"
    #
    # @return [Response] A Response object with data of type nil
    def upload_part(namespace_name, bucket_name, object_name, upload_id, upload_part_num, upload_part_body, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#upload_part.' if logger

      raise "Missing the required parameter 'namespace_name' when calling upload_part." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling upload_part." if bucket_name.nil?
      raise "Missing the required parameter 'object_name' when calling upload_part." if object_name.nil?
      raise "Missing the required parameter 'upload_id' when calling upload_part." if upload_id.nil?
      raise "Missing the required parameter 'upload_part_num' when calling upload_part." if upload_part_num.nil?
      raise "Missing the required parameter 'upload_part_body' when calling upload_part." if upload_part_body.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'object_name' must not be blank" if OCI::Internal::Util.blank_string?(object_name)

      path = '/n/{namespaceName}/b/{bucketName}/u/{objectName}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{objectName}', object_name.to_s)
      operation_signing_strategy = :exclude_body

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:uploadId] = upload_id
      query_params[:uploadPartNum] = upload_part_num

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:expect] = opts[:expect] if opts[:expect]
      header_params[:'content-length'] = opts[:content_length] if opts[:content_length]
      header_params[:'content-md5'] = opts[:content_md5] if opts[:content_md5]
      # rubocop:enable Style/NegatedIf
      header_params[:'content-type'] ||= 'application/octet-stream'

      post_body = @api_client.object_to_http_body(upload_part_body)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#upload_part') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    private

    def applicable_retry_config(opts = {})
      return @retry_config unless opts.key?(:retry_config)

      opts[:retry_config]
    end
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
