# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # OCI Language Service solutions can help enterprise customers integrate AI into their products immediately using our proven,
  #     pre-trained and custom models or containers, without a need to set up an house team of AI and ML experts.
  #     This allows enterprises to focus on business drivers and development work rather than AI and ML operations, which shortens the time to market.
  class AiLanguage::AIServiceLanguageClient
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


    # Creates a new AIServiceLanguageClient.
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
        @endpoint = endpoint + '/20210101'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "AIServiceLanguageClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://language.aiservice.{region}.oci.{secondLevelDomain}') + '/20210101'
      logger.info "AIServiceLanguageClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Make a detect call to language detection pre-deployed model.
    # @param [OCI::AiLanguage::Models::BatchDetectDominantLanguageDetails] batch_detect_dominant_language_details The details to make a language detection detect call.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::AiLanguage::Models::BatchDetectDominantLanguageResult BatchDetectDominantLanguageResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ailanguage/batch_detect_dominant_language.rb.html) to see an example of how to use batch_detect_dominant_language API.
    def batch_detect_dominant_language(batch_detect_dominant_language_details, opts = {})
      logger.debug 'Calling operation AIServiceLanguageClient#batch_detect_dominant_language.' if logger

      raise "Missing the required parameter 'batch_detect_dominant_language_details' when calling batch_detect_dominant_language." if batch_detect_dominant_language_details.nil?

      path = '/actions/batchDetectDominantLanguage'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(batch_detect_dominant_language_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AIServiceLanguageClient#batch_detect_dominant_language') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiLanguage::Models::BatchDetectDominantLanguageResult'
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


    # Make a batch detect call to entity pre-deployed model
    # @param [OCI::AiLanguage::Models::BatchDetectLanguageEntitiesDetails] batch_detect_language_entities_details The details to make a Entity detect call.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::AiLanguage::Models::BatchDetectLanguageEntitiesResult BatchDetectLanguageEntitiesResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ailanguage/batch_detect_language_entities.rb.html) to see an example of how to use batch_detect_language_entities API.
    def batch_detect_language_entities(batch_detect_language_entities_details, opts = {})
      logger.debug 'Calling operation AIServiceLanguageClient#batch_detect_language_entities.' if logger

      raise "Missing the required parameter 'batch_detect_language_entities_details' when calling batch_detect_language_entities." if batch_detect_language_entities_details.nil?

      path = '/actions/batchDetectLanguageEntities'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(batch_detect_language_entities_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AIServiceLanguageClient#batch_detect_language_entities') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiLanguage::Models::BatchDetectLanguageEntitiesResult'
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


    # Make a detect call to the keyPhrase pre-deployed model.
    # @param [OCI::AiLanguage::Models::BatchDetectLanguageKeyPhrasesDetails] batch_detect_language_key_phrases_details The details to make keyPhrase detect call.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::AiLanguage::Models::BatchDetectLanguageKeyPhrasesResult BatchDetectLanguageKeyPhrasesResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ailanguage/batch_detect_language_key_phrases.rb.html) to see an example of how to use batch_detect_language_key_phrases API.
    def batch_detect_language_key_phrases(batch_detect_language_key_phrases_details, opts = {})
      logger.debug 'Calling operation AIServiceLanguageClient#batch_detect_language_key_phrases.' if logger

      raise "Missing the required parameter 'batch_detect_language_key_phrases_details' when calling batch_detect_language_key_phrases." if batch_detect_language_key_phrases_details.nil?

      path = '/actions/batchDetectLanguageKeyPhrases'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(batch_detect_language_key_phrases_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AIServiceLanguageClient#batch_detect_language_key_phrases') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiLanguage::Models::BatchDetectLanguageKeyPhrasesResult'
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


    # Make a detect call to sentiment pre-deployed model.
    # @param [OCI::AiLanguage::Models::BatchDetectLanguageSentimentsDetails] batch_detect_language_sentiments_details The details to make sentiment detect call.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [Array<String>] :level Set this parameter for sentence and aspect level sentiment analysis.
    #   Allowed values are:
    #      - ASPECT
    #      - SENTENCE
    #
    #   Allowed values are: ASPECT, SENTENCE
    # @return [Response] A Response object with data of type {OCI::AiLanguage::Models::BatchDetectLanguageSentimentsResult BatchDetectLanguageSentimentsResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ailanguage/batch_detect_language_sentiments.rb.html) to see an example of how to use batch_detect_language_sentiments API.
    def batch_detect_language_sentiments(batch_detect_language_sentiments_details, opts = {})
      logger.debug 'Calling operation AIServiceLanguageClient#batch_detect_language_sentiments.' if logger

      raise "Missing the required parameter 'batch_detect_language_sentiments_details' when calling batch_detect_language_sentiments." if batch_detect_language_sentiments_details.nil?


      level_allowable_values = %w[ASPECT SENTENCE]
      if opts[:level] && !opts[:level].empty?
        opts[:level].each do |val_to_check|
          unless level_allowable_values.include?(val_to_check)
            raise 'Invalid value for "level", must be one of ASPECT, SENTENCE.'
          end
        end
      end

      path = '/actions/batchDetectLanguageSentiments'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:level] = OCI::ApiClient.build_collection_params(opts[:level], :multi) if opts[:level] && !opts[:level].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(batch_detect_language_sentiments_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AIServiceLanguageClient#batch_detect_language_sentiments') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiLanguage::Models::BatchDetectLanguageSentimentsResult'
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


    # Make a detect call to text classification from the pre-deployed model.
    # @param [OCI::AiLanguage::Models::BatchDetectLanguageTextClassificationDetails] batch_detect_language_text_classification_details The details to make text classification detect call.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::AiLanguage::Models::BatchDetectLanguageTextClassificationResult BatchDetectLanguageTextClassificationResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ailanguage/batch_detect_language_text_classification.rb.html) to see an example of how to use batch_detect_language_text_classification API.
    def batch_detect_language_text_classification(batch_detect_language_text_classification_details, opts = {})
      logger.debug 'Calling operation AIServiceLanguageClient#batch_detect_language_text_classification.' if logger

      raise "Missing the required parameter 'batch_detect_language_text_classification_details' when calling batch_detect_language_text_classification." if batch_detect_language_text_classification_details.nil?

      path = '/actions/batchDetectLanguageTextClassification'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(batch_detect_language_text_classification_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AIServiceLanguageClient#batch_detect_language_text_classification') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiLanguage::Models::BatchDetectLanguageTextClassificationResult'
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


    # Make a detect call to language detection pre-deployed model.
    # @param [OCI::AiLanguage::Models::DetectDominantLanguageDetails] detect_dominant_language_details The details to make a language detection detect call.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::AiLanguage::Models::DetectDominantLanguageResult DetectDominantLanguageResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ailanguage/detect_dominant_language.rb.html) to see an example of how to use detect_dominant_language API.
    def detect_dominant_language(detect_dominant_language_details, opts = {})
      logger.debug 'Calling operation AIServiceLanguageClient#detect_dominant_language.' if logger

      raise "Missing the required parameter 'detect_dominant_language_details' when calling detect_dominant_language." if detect_dominant_language_details.nil?

      path = '/actions/detectDominantLanguage'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(detect_dominant_language_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AIServiceLanguageClient#detect_dominant_language') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiLanguage::Models::DetectDominantLanguageResult'
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


    # Make a detect call to enitiy pre-deployed model
    # @param [OCI::AiLanguage::Models::DetectLanguageEntitiesDetails] detect_language_entities_details The details to make a Entity detect call.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :model_version Named Entity Recognition model versions. By default user will get output from V2.1 implementation. (default to V2.1)
    # @option opts [BOOLEAN] :is_pii If this parameter is set to true, you only get PII (Personally identifiable information) entities
    #   like PhoneNumber, Email, Person, and so on. Default value is false.
    #    (default to false)
    # @return [Response] A Response object with data of type {OCI::AiLanguage::Models::DetectLanguageEntitiesResult DetectLanguageEntitiesResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ailanguage/detect_language_entities.rb.html) to see an example of how to use detect_language_entities API.
    def detect_language_entities(detect_language_entities_details, opts = {})
      logger.debug 'Calling operation AIServiceLanguageClient#detect_language_entities.' if logger

      raise "Missing the required parameter 'detect_language_entities_details' when calling detect_language_entities." if detect_language_entities_details.nil?

      if opts[:model_version] && !OCI::AiLanguage::Models::NER_MODEL_VERSION_ENUM.include?(opts[:model_version])
        raise 'Invalid value for "model_version", must be one of the values in OCI::AiLanguage::Models::NER_MODEL_VERSION_ENUM.'
      end

      path = '/actions/detectLanguageEntities'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:modelVersion] = opts[:model_version] if opts[:model_version]
      query_params[:isPii] = opts[:is_pii] if !opts[:is_pii].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(detect_language_entities_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AIServiceLanguageClient#detect_language_entities') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiLanguage::Models::DetectLanguageEntitiesResult'
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


    # Make a detect call to the keyPhrase pre-deployed model.
    # @param [OCI::AiLanguage::Models::DetectLanguageKeyPhrasesDetails] detect_language_key_phrases_details The details to make keyPhrase detect call.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::AiLanguage::Models::DetectLanguageKeyPhrasesResult DetectLanguageKeyPhrasesResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ailanguage/detect_language_key_phrases.rb.html) to see an example of how to use detect_language_key_phrases API.
    def detect_language_key_phrases(detect_language_key_phrases_details, opts = {})
      logger.debug 'Calling operation AIServiceLanguageClient#detect_language_key_phrases.' if logger

      raise "Missing the required parameter 'detect_language_key_phrases_details' when calling detect_language_key_phrases." if detect_language_key_phrases_details.nil?

      path = '/actions/detectLanguageKeyPhrases'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(detect_language_key_phrases_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AIServiceLanguageClient#detect_language_key_phrases') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiLanguage::Models::DetectLanguageKeyPhrasesResult'
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


    # Make a detect call to sentiment pre-deployed model.
    # @param [OCI::AiLanguage::Models::DetectLanguageSentimentsDetails] detect_language_sentiments_details The details to make sentiment detect call.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::AiLanguage::Models::DetectLanguageSentimentsResult DetectLanguageSentimentsResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ailanguage/detect_language_sentiments.rb.html) to see an example of how to use detect_language_sentiments API.
    def detect_language_sentiments(detect_language_sentiments_details, opts = {})
      logger.debug 'Calling operation AIServiceLanguageClient#detect_language_sentiments.' if logger

      raise "Missing the required parameter 'detect_language_sentiments_details' when calling detect_language_sentiments." if detect_language_sentiments_details.nil?

      path = '/actions/detectLanguageSentiments'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(detect_language_sentiments_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AIServiceLanguageClient#detect_language_sentiments') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiLanguage::Models::DetectLanguageSentimentsResult'
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


    # Make a detect call to text classification from the pre-deployed model.
    # @param [OCI::AiLanguage::Models::DetectLanguageTextClassificationDetails] detect_language_text_classification_details The details to make text classification detect call.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::AiLanguage::Models::DetectLanguageTextClassificationResult DetectLanguageTextClassificationResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ailanguage/detect_language_text_classification.rb.html) to see an example of how to use detect_language_text_classification API.
    def detect_language_text_classification(detect_language_text_classification_details, opts = {})
      logger.debug 'Calling operation AIServiceLanguageClient#detect_language_text_classification.' if logger

      raise "Missing the required parameter 'detect_language_text_classification_details' when calling detect_language_text_classification." if detect_language_text_classification_details.nil?

      path = '/actions/detectLanguageTextClassification'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(detect_language_text_classification_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AIServiceLanguageClient#detect_language_text_classification') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiLanguage::Models::DetectLanguageTextClassificationResult'
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
