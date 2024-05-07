# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'json'
require 'logger'
require 'net/http'
require 'securerandom'
require 'tempfile'
require 'time'
require 'uri'

require_relative 'signer'
require_relative 'version'
require_relative 'response'

module OCI
  # The base API client which contains functionality make requests and receive responses from OCI
  # services. This client also handles request serialization and response deserialization
  class ApiClient
    class << self
      OCI_SDK_APPEND_USER_AGENT = 'OCI_SDK_APPEND_USER_AGENT'.freeze
      # Builds the client info string to be sent with each request.
      def build_request_id
        SecureRandom.uuid.delete!('-').upcase
      end

      # Builds the client info string to be sent with each request.
      def build_user_info
        "Oracle-RubySDK/#{VERSION}"
      end

      # Build the user agent string to be sent with each request.
      def build_user_agent
        "#{build_user_info}#{OCI.sdk_name} (ruby #{RUBY_VERSION}; #{RUBY_PLATFORM})" unless ENV[OCI_SDK_APPEND_USER_AGENT]
        "#{build_user_info}#{OCI.sdk_name} (ruby #{RUBY_VERSION}; #{RUBY_PLATFORM}) #{ENV[OCI_SDK_APPEND_USER_AGENT]}"
      end

      private

      def get_rfc339_formatted_date_string_with_z_offset(date_time)
        as_utc = date_time.to_time.utc

        # Port of the Java SDK behaviour where we omit fractional seconds if they would be 0
        return as_utc.iso8601 if as_utc.strftime('%L').to_i.zero?

        as_utc.iso8601(3)
      end

      def cgi_escape_query_param(raw_value)
        return CGI.escape(get_rfc339_formatted_date_string_with_z_offset(raw_value)) if raw_value.is_a?(DateTime)

        CGI.escape(raw_value.to_s)
      end
    end

    # Maps collection format types (as per the collectionFormat types described here:
    # https://swagger.io/docs/specification/2-0/describing-parameters/) to the delimiters
    # we should use to separate values.
    #
    # The :multi type contains no delimiter because this means we should preserve values as
    # a collection rather than transforming them into a single string
    VALID_COLLECTION_FORMATS = {
      multi: nil,
      csv: ','.freeze,
      ssv: ' '.freeze,
      pipes: '|'.freeze,

      # this is double quoted so it is interpreted as a tab rather than as a literal slash ('\') followed by a 't'
      tsv: "\t".freeze
    }.freeze

    # The Config object holding settings to be used in the API client.
    attr_accessor :config

    # Defines the headers to be used in HTTP requests of all API calls by default.
    #
    # @return [Hash]
    attr_accessor :default_headers

    # Request options to be sent with Net::HTTP.
    # These options will override any defaults normally set by ApiClient.
    # See {http://ruby-doc.org/stdlib-2.4.1/libdoc/net/http/rdoc/Net/HTTP.html#method-c-start} for
    # some of the available options.
    #
    # @return [Hash]
    attr_accessor :request_option_overrides

    # The proxy settings which this ApiClient will use
    #
    # @return [OCI::ApiClientProxySettings]
    attr_accessor :proxy_settings

    def initialize(config, signer, proxy_settings: nil)
      raise "Missing the required parameter 'config' when initializing ApiClient." if config.nil?
      raise "Missing the required parameter 'signer' when initializing ApiClient." if signer.nil?

      @config = config
      @signer = signer
      @default_headers = {}
      @request_option_overrides = {}
      @proxy_settings = proxy_settings
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Call an API with given options.
    #
    # @param [Symbol] http_method HTTP method/verb (e.g. :post, :get)
    # @param [String] path URL path (e.g. /volumeAttachments/)
    # @param [String] endpoint URL of the endpoint (e.g https://iaas.us-phoenix-1.oraclecloud.com/20160918)
    # @option opts [Hash] :header_params Header parameters
    # @option opts [Hash] :query_params Query parameters
    # @option opts [Hash] :form_params Form parameters
    # @option opts [String] :operation_signing_strategy The signing strategy for the api operation
    # @option opts [Object] :body HTTP body in JSON
    # @option [Block] block Allow to receive data from http body as streaming
    #
    # @return [Array<(Object, Fixnum, Hash)>] an array of 3 elements:
    #   the data deserialized from response body (could be nil), response status code,
    #   and response headers.
    def call_api(http_method, path, endpoint, opts, &block)
      http_method = http_method.to_sym.downcase

      if http_method != :get
        return call_api_inner(http_method, path, endpoint, opts, &block) unless using_refresh_eligible_signer?

        return instance_principals_signer_wrapped_call do
          call_api_inner(http_method, path, endpoint, opts, &block)
        end
      end

      # Wrap get calls in a lambda that can be called later for paging
      # and wait_until.
      proc = lambda { |page|
        unless page.nil?
          opts[:query_params] ||= {}
          opts[:query_params][:page] = page
          opts[:query_params][:start] = page if opts[:return_type] == 'OCI::ObjectStorage::Models::ListObjects'
        end

        return call_api_inner(http_method, path, endpoint, opts, &block)
      }

      response = proc.call(nil) unless using_refresh_eligible_signer?
      response = instance_principals_signer_wrapped_call { proc.call(nil) } if using_refresh_eligible_signer?

      response.api_call = proc
      response
    end

    # Convert object (array, hash, object, etc) to JSON string.
    # @param [Object] model object to be converted into JSON string
    # @return [String] JSON string representation of the object
    def object_to_http_body(model)
      # to support IO-like object as well like StringIO
      return model if model.nil? || model.is_a?(String) || (model.respond_to?(:read) && model.respond_to?(:write))

      # Supports IO-wrapping objects we can convert to an IO. An example is Rails'
      # ActionDispatch::Http::UploadedFile, which wraps an IO (a Tempfile) but
      # doesn't expose all the IO operations directly (e.g. you can't write to it, it's not seekable)
      #
      # This should be safe to use with IO and its subclasses as well as to_io is a method on IO:
      # http://ruby-doc.org/core-2.3.1/IO.html#method-i-to_io and returns itself if called on
      # an IO
      return model.to_io if (model.respond_to?(:read) || model.respond_to?(:write)) && model.respond_to?(:to_io)

      local_body = if model.is_a?(Array)
                     model.map { |m| object_to_hash(m) }
                   else
                     object_to_hash(model)
                   end

      local_body.to_json
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    def self.build_collection_params(collection, collection_format)
      if collection_format.nil? || !VALID_COLLECTION_FORMATS.key?(collection_format.to_sym)
        raise "Invalid collection_format: #{collection_format}. Must be one of: #{VALID_COLLECTION_FORMATS.keys}"
      end

      return collection if collection_format == :multi

      collection.join(VALID_COLLECTION_FORMATS[collection_format.to_sym])
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    def self.append_query_params(url, query_params)
      return url if query_params.empty?

      # First divide our query params into ones where the param value is a simple value (e.g. a string), an array or a hash.
      # The params  where the value is a hash are, for example, tags we need to handle differently for inclusion in the query
      # string. We also need to handle array params differently in the query string since the values should appear as separate entries
      # in the query string with the same key (this corresponds to using collectionFormat=multi in Swagger)
      #
      # An example query_params is:
      #
      #   {
      #       "stuff" => "things",
      #       "anArrayType" => ["hello", "world"]
      #       "hashType" => { "key" => ["val1", "val2", "val3"], "key2" => ["val1"] },
      #
      #   }
      #
      # So our simple_params will be: { "stuff" => "things" }
      # And our array_params will be: { "anArrayType" => ["hello", "world"]}
      # And our hash_params will be: { "hashType" => { "key" => ["val1", "val2", "val3"], "key2" => ["val1"] }
      simple_params = query_params.select { |_k, v| !v.is_a?(Hash) && !v.is_a?(Array) }.to_h
      array_params = query_params.select { |_k, v| v.is_a?(Array) }.to_h
      hash_params = query_params.select { |_k, v| v.is_a?(Hash) }.to_h

      # Simple params just go key to value
      base_query_string = ''

      base_query_string << simple_params.map { |k, v| "#{k}=#{cgi_escape_query_param(v)}" }.join('&') unless simple_params.empty?

      # Using the previous comment:
      #   k = "anArrayType", v = ["hello", "world"]
      #
      # And we want query string params like #{k}=#{v[0]}&#{k}=#{v[1]}&#{k}=#{v[2]}...
      # So the same key is repeated, but each value is a different value from the array
      array_params.each do |k, v|
        v.each do |query_string_val|
          base_query_string << '&' unless base_query_string.empty?
          base_query_string << "#{k}=#{cgi_escape_query_param(query_string_val)}"
        end
      end

      # Using the previous comment:
      #    k = "hashType", v = { "key1" => [...] }
      #
      # Hash params are exploded as follows:
      #
      #    - If value in v is an array then we explode the content like: #{k}.#{v.key}=#{v.value[0]}&#{k}.#{v.key}=#{v.value[1]}&... so that there is
      #      one query string parameter per item in the array
      #    - If value in v is not an array then we explode the content like: #{k}.#{v.key}=#{v.value}
      hash_params.each do |k, v|
        v.each do |tag_key, tag_val|
          # TODO: Should this be ERB::Util.url_encode instead? CGI.escape gives "+" here but url_encode will give %20
          # CGI.escape is what we've been using until now, and it looks like it works...A literal "+" in the string will
          # be encoded to %2B
          query_string_val = if tag_val.is_a?(Array)
                               # to_s tag_key to avoid errors around implicit conversion of symbols to strings
                               tag_val.map do |tv|
                                 "#{k}.#{cgi_escape_query_param(tag_key)}=#{cgi_escape_query_param(tv)}"
                               end.join('&')
                             else
                               "#{k}.#{cgi_escape_query_param(tag_key)}=#{cgi_escape_query_param(tag_val)}"
                             end
          base_query_string << '&' unless base_query_string.empty?
          base_query_string << query_string_val
        end
      end

      url << '?' unless base_query_string.empty?
      url << base_query_string

      url
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    # Build the user agent string that also includes the additional_user_agent to be sent with each request.
    def build_user_agent
      agent = self.class.build_user_agent
      !config.nil? && !config.additional_user_agent.nil? ? "#{agent} #{config.additional_user_agent}" : agent
    end

    private

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    def call_api_inner(http_method, path, endpoint, opts, &block)
      query_params = opts[:query_params] || {}
      header_params = @default_headers.merge(opts[:header_params] || {})
      form_params = opts[:form_params] || {}
      body = opts[:body] || nil
      operation_signing_strategy = opts[:operation_signing_strategy] || nil

      url = ApiClient.append_query_params(build_request_url(path, endpoint), query_params)
      uri = URI(url)

      request = nil

      if http_method == :get
        request = Net::HTTP::Get.new(uri)
      elsif http_method == :put
        request = Net::HTTP::Put.new(uri)
      elsif http_method == :post
        request = Net::HTTP::Post.new(uri)
      elsif http_method == :delete
        request = Net::HTTP::Delete.new(uri)
      elsif http_method == :head
        request = Net::HTTP::Head.new(uri)
      elsif http_method == :patch
        request = Net::HTTP::Patch.new(uri)
      else
        raise "new http method (#{http_method}) needs to be supported!"
      end

      if body.respond_to?(:read) && body.respond_to?(:write)
        request.body_stream = body
      else
        body = build_request_body(header_params, form_params, body) if %i[post put delete patch].include?(http_method)
        request.body = body
      end

      @config.logger.debug "HTTP request body param ~BEGIN~\n#{body}\n~END~\n" if @config.logger

      @signer.sign(http_method, url, header_params, body, operation_signing_strategy)

      header_params.each do |key, value|
        request[key.to_s] = value
      end

      request['opc-client-info'] = self.class.build_user_info
      request['opc-request-id'] ||= self.class.build_request_id
      request['User-Agent'] = build_user_agent

      http = get_http_object(uri.hostname, uri.port)

      unless @request_option_overrides.empty?
        http.methods.grep(/\A(\w+)=\z/) do |meth|
          key = Regexp.last_match(1).to_sym
          @request_option_overrides.key?(key) || next
          http.__send__(meth, @request_option_overrides[key])
        end
      end

      http.use_ssl = (uri.scheme == 'https')
      http.set_debug_output(@config.log_requests ? $stdout : nil)
      http.open_timeout = @config.connection_timeout
      http.read_timeout = @config.timeout.zero? ? 31_536_000 : @config.timeout # 31536000 means 365 days
      http.continue_timeout = 3 # expect 100 continue timeout

      response_ref = nil
      begin
        http.start do
          http.request(request) do |response|
            response_ref = response

            # process headers for opc-meta- key
            replace_keys_in_response_headers_with_non_prefixed_equivalents(response, 'opc-meta-')

            # Either stream the body through a block (if we have one) and return, or read the body so that it can be accessed
            # again later and jump out of the http.start block
            #
            # The idea is to terminate the HTTP connection as early as possible. There are two main reasons for
            # this:
            #
            #   1. Net::HTTP can throw a lot of exceptions, both from itself and what bubbles up from the underlying OS
            #      via Errno:: so we have a very broad rescue block. This isn't great because the more work we do inside the
            #      http.start block the more gaps we leave for non-Net::HTTP related errors. This makes it hard to throw
            #      a meaningful error back to the customer (i.e. we leave ourselves gaps where Errors::NetworkError does not apply
            #      and could throw something disingenuous if we mask everything as a NetworkError)
            #
            #   2. Release resources sooner/don't hold connections open longer than necessary (e.g. we don't need the
            #      connection open while we're deserialising)
            return process_response_block(response, &block) if success?(response) && !block.nil?

            response.body
          end
        end
      rescue StandardError => e
        # Unfortunately, catching StandardError is the surest way to capture all the errors originating from Net::HTTP
        code_from_response = if !response_ref.nil?
                               response_ref.code.to_i
                             else
                               0
                             end

        raise Errors::NetworkError.new(
          e.message,
          code_from_response,
          request_made: request,
          response_received: response_ref
        )
      end

      # If the response is a timeout (HTTP 408), it does not make sense to parse the http body because a partial
      # response may be returned. We should skip JSON parsing and raise an error immediately
      handle_timeout_response(request, response_ref)

      @config.logger.debug("HTTP response body ~BEGIN~\n#{response_ref.body}\n~END~\n") if @config.logger

      return handle_success_response(request, response_ref, opts[:return_type]) if success?(response_ref)

      handle_non_success_response(request, response_ref)
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity

    def get_http_object(hostname, port)
      return Net::HTTP.new(hostname, port) if @proxy_settings.nil?
      return Net::HTTP.new(hostname, port, @proxy_settings.proxy_address) if @proxy_settings.proxy_address.nil?

      Net::HTTP.new(
        hostname,
        port,
        @proxy_settings.proxy_address,
        @proxy_settings.proxy_port,
        @proxy_settings.proxy_user,
        @proxy_settings.proxy_password
      )
    end

    def success?(response)
      response.is_a?(Net::HTTPSuccess)
    end

    # Determines whether a response "looks like" one returned from an OCI service (regardless of whether the response itself
    # represents success or failure).
    #
    # This is determined by whether the response includes an opc-request-id header or some header which starts with
    # opc-
    def response_from_oci_service?(response)
      response.key?('opc-request-id') || response.to_hash.keys.any? { |k| k.downcase.start_with?('opc-') }
    end

    def replace_keys_in_response_headers_with_non_prefixed_equivalents(response, prefix)
      raise 'Response cannot be nil' if response.nil?
      raise 'A non-blank prefix must be provided' if prefix.nil? || prefix.strip.empty?

      prefix_size = prefix.length
      processed_keys = {}

      response.each_header do |key, value|
        processed_keys[key[prefix_size..-1]] = value if key.start_with?(prefix)
      end

      processed_keys.each do |key, value|
        response.delete("#{prefix}#{key}")
        response[key] = value
      end

      processed_keys
    end

    def process_response_block(response)
      raise 'A block must be provided' unless block_given?

      response.read_body do |chunk|
        yield chunk, response
      end

      Response.new(response.code.to_i, response.header, nil)
    end

    def handle_timeout_response(request, response)
      return unless response.is_a?(Net::HTTPRequestTimeOut)

      raise Errors::NetworkError.new(
        response.message,
        response.code.to_i,
        request_made: request,
        response_received: response
      )
    end

    def handle_success_response(request, response, return_type)
      data = return_type ? deserialize(request, response, return_type) : nil

      if @config.logger
        @config.logger.debug(
          "API Response Received:\nData: #{data.inspect}\nStatus code: #{response.code}\nHeaders: #{response.header}"
        )
      end

      Response.new(response.code.to_i, response.header, data)
    end

    # rubocop:disable Metrics/AbcSize
    def handle_non_success_response(request, response)
      # For errors, we expect a plain JSON object so pass 'Object' here in order to serialize it into a hash
      data = deserialize(request, response, 'Object')
      if data
        raise Errors::ServiceError.new(
          response.code.to_i,
          data[:code],
          response.header['opc-request-id'],
          data[:message],
          request_made: request
        )
      elsif response_from_oci_service?(response)
        # TODO: Once we have a standard for how service errors are transmitted when there is no body (e.g. in the header),
        # change how the ServiceError gets constructed to get data from those fields
        raise Errors::ServiceError.new(
          response.code.to_i,
          nil,
          response.header['opc-request-id'],
          response.message,
          request_made: request
        )
      else
        raise Errors::NetworkError.new(
          response.message,
          response.code.to_i,
          request_made: request,
          response_received: response
        )
      end
    end
    # rubocop:enable Metrics/AbcSize

    # Check if the given MIME is a JSON MIME.
    # JSON MIME examples:
    #   application/json
    #   application/json; charset=UTF8
    #   APPLICATION/JSON
    # @param [String] mime MIME
    # @return [Boolean] True if the MIME is applicaton/json
    def json_mime?(mime)
      !(mime =~ /\Aapplication\/json(;.*)?\z/i).nil?
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Deserialize the response to the given return type.
    #
    # @param [Response] response HTTP response
    # @param [String] return_type some examples: "User", "Array[User]", "Hash[String,Integer]"
    def deserialize(request, response, return_type)
      body = response.body
      return if body.nil? || body.empty?

      # ensuring a default content type
      content_type = response.content_type || 'application/json'

      return body if (return_type == 'String' && !json_mime?(content_type)) || return_type == 'Stream'

      # There are some cases, the error is not returned by services but by like gateway, for example in bug
      # https://jira.oci.oraclecorp.com/browse/DEX-564, gateway timeouts and 504 is returned and content is generated
      # by gateway, so there is no guarantee that the content-type will be application/json.
      if !success?(response) && !response_from_oci_service?(response)
        raise Errors::NetworkError.new(
          response.message,
          response.code.to_i,
          request_made: request,
          response_received: response
        )
      end

      begin
        data = JSON.parse("[#{body}]", symbolize_names: true)[0]
      rescue JSON::ParserError
        if %w[String Date DateTime].include?(return_type)
          data = body
        else
          # If we received an error here then we received a response from the OCI service that
          # we could not parse. Instead of throwing a parsing error, throw out a service error
          # (so the customer has all the information) and put the response body in the message
          # so that they may also have a sense of what the error from the service was
          unless success?(response)
            raise OCI::Errors::ServiceError.new(
              response.code.to_i,
              nil,
              response['opc-request-id'],
              response.body,
              request_made: request
            )
          end

          raise OCI::Errors::ResponseParsingError.new(
            request_made: request,
            response_received: response
          )
        end
      end

      OCI::Internal::Util.convert_to_type return_type, data
    end

    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    def build_request_url(path, endpoint)
      # Add leading and trailing slashes to path
      path = "/#{path}".gsub(/\/+/, '/')
      endpoint = endpoint.chop if endpoint.end_with? '/'

      endpoint + path
    end

    # Builds the HTTP request body
    #
    # @param [Hash] header_params Header parameters
    # @param [Hash] form_params Query parameters
    # @param [Object] body HTTP body (JSON/XML)
    # @return [String] HTTP body data in the form of string
    def build_request_body(header_params, form_params, body)
      # http form
      if header_params[:'content-type'] == 'application/x-www-form-urlencoded' ||
         header_params[:'content-type'] == 'multipart/form-data'

        data = {}
        form_params.each do |key, value|
          case value
          when File, Tempfile, Array, nil
            # let Net::HTTP handle File, Tempfile, Array and nil parameters
            data[key] = value
          else
            data[key] = value.to_s
          end
        end
      elsif body
        data = body.is_a?(String) ? body : body.to_json
      else
        data = nil
      end
      data
    end

    # Convert object(non-array) to hash.
    # @param [Object] obj object to be converted into JSON string
    # @return [String] JSON string representation of the object
    def object_to_hash(obj)
      if obj.respond_to?(:to_hash)
        obj.to_hash
      else
        obj
      end
    end

    def using_refresh_eligible_signer?
      @signer.is_a?(OCI::Auth::Signers::InstancePrincipalsSecurityTokenSigner) || \
        @signer.is_a?(OCI::Auth::Signers::ResourcePrincipalsFederationSigner) || \
        @signer.is_a?(OCI::Auth::Signers::EphemeralResourcePrincipalsSigner) || \
        @signer.is_a?(OCI::Auth::Signers::OkeWorkloadIdentityResourcePrincipalSigner)
    end

    def instance_principals_signer_wrapped_call
      max_attempts = 2

      max_attempts.times do |attempt|
        begin
          return yield
        rescue OCI::Errors::ServiceError => e
          @config.logger.debug("Error encountered inside instance_principals_signer_wrapped_call: #{e.inspect}") if @config.logger
          raise if attempt >= (max_attempts - 1) # .times is zero-based
          raise if e.status_code != 401

          @signer.refresh_security_token
        end
      end
    end
  end
end
