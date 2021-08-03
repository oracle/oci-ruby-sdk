# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # API covering the Generic Artifacts Service content
  # Use this API to put and get generic artifact content.
  class GenericArtifactsContent::GenericArtifactsContentClient
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


    # Creates a new GenericArtifactsContentClient.
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
      # If the signer is an InstancePrincipalsSecurityTokenSigner or SecurityTokenSigner and no config was supplied (they are self-sufficient signers)
      # then create a dummy config to pass to the ApiClient constructor. If customers wish to create a client which uses instance principals
      # and has config (either populated programmatically or loaded from a file), they must construct that config themselves and then
      # pass it to this constructor.
      #
      # If there is no signer (or the signer is not an instance principals signer) and no config was supplied, this is not valid
      # so try and load the config from the default file.
      config = OCI::Config.validate_and_build_config_with_signer(config, signer)

      signer = OCI::Signer.config_file_auth_builder(config) if signer.nil?

      @api_client = OCI::ApiClient.new(config, signer, proxy_settings: proxy_settings)
      @retry_config = retry_config

      if endpoint
        @endpoint = endpoint + '/20160918'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "GenericArtifactsContentClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://generic.artifacts.{region}.oci.{secondLevelDomain}') + '/20160918'
      logger.info "GenericArtifactsContentClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the specified artifact's content.
    # @param [String] artifact_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the artifact.
    #
    #   Example: `ocid1.genericartifact.oc1..exampleuniqueID`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned [request ID](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm)
    #
    #   Example: `bxxxxxxx-fxxx-4xxx-9xxx-bxxxxxxxxxxx`
    #   If you contact Oracle about a request, provide this request ID.
    #
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/genericartifactscontent/get_generic_artifact_content.rb.html) to see an example of how to use get_generic_artifact_content API.
    def get_generic_artifact_content(artifact_id, opts = {}, &block)
      logger.debug 'Calling operation GenericArtifactsContentClient#get_generic_artifact_content.' if logger

      raise "Missing the required parameter 'artifact_id' when calling get_generic_artifact_content." if artifact_id.nil?
      raise "Parameter value for 'artifact_id' must not be blank" if OCI::Internal::Util.blank_string?(artifact_id)

      path = '/generic/artifacts/{artifactId}/content'.sub('{artifactId}', artifact_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = opts[:accept] if opts[:accept]
      header_params[:accept] ||= 'application/octet-stream'
      header_params[:'accept-encoding'] = opts[:accept_encoding] if opts[:accept_encoding]
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GenericArtifactsContentClient#get_generic_artifact_content') do
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


    # Gets the content of an artifact with a specified `artifactPath` and `version`.
    # @param [String] repository_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the repository.
    #
    #   Example: `ocid1.repository.oc1..exampleuniqueID`
    #
    # @param [String] artifact_path A user-defined path to describe the location of an artifact. You can use slashes to organize the repository, but slashes do not create a directory structure. An artifact path does not include an artifact version.
    #
    #   Example: `project01/my-web-app/artifact-abc`
    #
    # @param [String] version A user-defined string to describe the artifact version.
    #
    #   Example: `1.1.2` or `1.2-beta-2`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned [request ID](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm)
    #
    #   Example: `bxxxxxxx-fxxx-4xxx-9xxx-bxxxxxxxxxxx`
    #   If you contact Oracle about a request, provide this request ID.
    #
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/genericartifactscontent/get_generic_artifact_content_by_path.rb.html) to see an example of how to use get_generic_artifact_content_by_path API.
    def get_generic_artifact_content_by_path(repository_id, artifact_path, version, opts = {}, &block)
      logger.debug 'Calling operation GenericArtifactsContentClient#get_generic_artifact_content_by_path.' if logger

      raise "Missing the required parameter 'repository_id' when calling get_generic_artifact_content_by_path." if repository_id.nil?
      raise "Missing the required parameter 'artifact_path' when calling get_generic_artifact_content_by_path." if artifact_path.nil?
      raise "Missing the required parameter 'version' when calling get_generic_artifact_content_by_path." if version.nil?
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)
      raise "Parameter value for 'artifact_path' must not be blank" if OCI::Internal::Util.blank_string?(artifact_path)
      raise "Parameter value for 'version' must not be blank" if OCI::Internal::Util.blank_string?(version)

      path = '/generic/repositories/{repositoryId}/artifactPaths/{artifactPath}/versions/{version}/content'.sub('{repositoryId}', repository_id.to_s).sub('{artifactPath}', artifact_path.to_s).sub('{version}', version.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = opts[:accept] if opts[:accept]
      header_params[:accept] ||= 'application/octet-stream'
      header_params[:'accept-encoding'] = opts[:accept_encoding] if opts[:accept_encoding]
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GenericArtifactsContentClient#get_generic_artifact_content_by_path') do
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


    # Uploads an artifact. Provide `artifactPath`, `version` and content. Avoid entering confidential information when you define the path and version.
    # @param [String] repository_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the repository.
    #
    #   Example: `ocid1.repository.oc1..exampleuniqueID`
    #
    # @param [String] artifact_path A user-defined path to describe the location of an artifact. You can use slashes to organize the repository, but slashes do not create a directory structure. An artifact path does not include an artifact version.
    #
    #   Example: `project01/my-web-app/artifact-abc`
    #
    # @param [String] version A user-defined string to describe the artifact version.
    #
    #   Example: `1.1.2` or `1.2-beta-2`
    #
    # @param [String, IO] generic_artifact_content_body Uploads an artifact. Provide artifact path, version and content. Avoid entering confidential information when you define the path and version.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.  The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value. When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned [request ID](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm)
    #
    #   Example: `bxxxxxxx-fxxx-4xxx-9xxx-bxxxxxxxxxxx`
    #   If you contact Oracle about a request, provide this request ID.
    #
    # @return [Response] A Response object with data of type {OCI::GenericArtifactsContent::Models::GenericArtifact GenericArtifact}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/genericartifactscontent/put_generic_artifact_content_by_path.rb.html) to see an example of how to use put_generic_artifact_content_by_path API.
    def put_generic_artifact_content_by_path(repository_id, artifact_path, version, generic_artifact_content_body, opts = {})
      logger.debug 'Calling operation GenericArtifactsContentClient#put_generic_artifact_content_by_path.' if logger

      raise "Missing the required parameter 'repository_id' when calling put_generic_artifact_content_by_path." if repository_id.nil?
      raise "Missing the required parameter 'artifact_path' when calling put_generic_artifact_content_by_path." if artifact_path.nil?
      raise "Missing the required parameter 'version' when calling put_generic_artifact_content_by_path." if version.nil?
      raise "Missing the required parameter 'generic_artifact_content_body' when calling put_generic_artifact_content_by_path." if generic_artifact_content_body.nil?
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)
      raise "Parameter value for 'artifact_path' must not be blank" if OCI::Internal::Util.blank_string?(artifact_path)
      raise "Parameter value for 'version' must not be blank" if OCI::Internal::Util.blank_string?(version)

      path = '/generic/repositories/{repositoryId}/artifactPaths/{artifactPath}/versions/{version}/content'.sub('{repositoryId}', repository_id.to_s).sub('{artifactPath}', artifact_path.to_s).sub('{version}', version.to_s)
      operation_signing_strategy = :exclude_body

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'content-type'] ||= 'application/octet-stream'

      post_body = @api_client.object_to_http_body(generic_artifact_content_body)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GenericArtifactsContentClient#put_generic_artifact_content_by_path') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::GenericArtifactsContent::Models::GenericArtifact'
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
