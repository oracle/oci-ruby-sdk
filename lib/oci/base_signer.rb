# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'base64'
require 'openssl'
require 'securerandom'
require 'time'
require 'uri'
require 'cgi'

module OCI
  # The base class for other classes which are meant to generate a signature
  class BaseSigner
    # enum to define the signing strategy
    SIGNING_STRATEGY_ENUM = [STANDARD = 'standard'.freeze, OBJECT_STORAGE = 'object_storage'.freeze].freeze

    # The Oracle Cloud Infrastructure API signature version
    SIGNATURE_VERSION = '1'.freeze

    GENERIC_HEADERS = %i[date (request-target) host].freeze
    BODY_HEADERS = %i[content-length content-type x-content-sha256].freeze

    # Creates a BaseSigner
    #
    # @param [String] api_key The API key needed when making calls. For token-based signing this should be ST$<token> but for calling as a user it will be tenancy/user/fingerprint
    # @param [String] private_key_content The private key as a PEM-formatted string
    # @param [String] pass_phrase Optional the pass phrase for the private key (if any)
    # @param [SIGNING_STRATEGY_ENUM] signing_strategy Optional signing for standard service or object storage service
    # @param [Array<String>] headers_to_sign_in_all_requests Optional headers which should be signed on each request
    # @param [Array<String>] body_headers_to_sign Optional headers which should be signed on requests with bodies
    def initialize(
      api_key,
      private_key_content,
      pass_phrase: nil,
      signing_strategy: STANDARD,
      headers_to_sign_in_all_requests: GENERIC_HEADERS,
      body_headers_to_sign: BODY_HEADERS
    )
      raise 'Missing required parameter api_key.' unless api_key
      raise 'Missing required parameter private_key_content.' unless private_key_content

      @key_id = api_key
      @private_key_content = private_key_content
      @pass_phrase = pass_phrase
      @signing_strategy = signing_strategy

      @headers_to_sign_all_requests = headers_to_sign_in_all_requests
      @body_headers_to_sign = body_headers_to_sign
      @operation_header_mapping = {
        options: [],
        get: headers_to_sign_in_all_requests,
        head: headers_to_sign_in_all_requests,
        delete: headers_to_sign_in_all_requests,
        put: headers_to_sign_in_all_requests + body_headers_to_sign,
        post: headers_to_sign_in_all_requests + body_headers_to_sign,
        patch: headers_to_sign_in_all_requests + body_headers_to_sign
      }
    end

    # Generates the correct signature and adds it to the
    # headers that are passed in. Also injects any required
    # headers that might be missing.
    #
    # @param [Symbol] method The HTTP method, such as :get or :post.
    # @param [String] uri The URI, such as 'https://iaas.us-phoenix-1.oraclecloud.com/20160918/volumeAttachments/'
    # @param [Hash] headers A hash of headers
    # @param [String] body The request body
    # @param [String] operation_signing_strategy the signing strategy for the operation. Default is :standard
    def sign(method, uri, headers, body, operation_signing_strategy = :standard)
      method = method.to_sym.downcase
      uri = URI(uri)
      path = uri.query.nil? ? uri.path : "#{uri.path}?#{uri.query}"
      inject_missing_headers(method, headers, body, uri, operation_signing_strategy)
      signature = compute_signature(headers, method, path, operation_signing_strategy)
      inject_authorization_header(headers, method, signature, operation_signing_strategy) unless signature.nil?
    end

    private

    def inject_missing_headers(method, headers, body, uri, operation_signing_strategy)
      headers[:date] ||= Time.now.utc.httpdate
      headers[:accept] ||= '*/*'
      headers[:host] ||= uri.host if @headers_to_sign_all_requests.include?(:host)

      return unless %i[put post patch].include?(method)

      body ||= ''

      # For object storage service's put method, we don't need to set content length and x-content sha256
      if operation_signing_strategy == :exclude_body
        headers[:'content-length'] ||= if body.respond_to?(:read) && body.respond_to?(:write)
                                         body.respond_to?('size') ? body.size : body.stat.size
                                       else
                                         body.bytes.length.to_s
                                       end
      else
        headers[:'content-length'] ||= body.bytes.length.to_s
        headers[:'x-content-sha256'] ||= OpenSSL::Digest::SHA256.new.update(body).base64digest
      end
    end

    def fetch_header_mapping(method, operation_signing_strategy)
      return @headers_to_sign_all_requests if operation_signing_strategy == :exclude_body

      @operation_header_mapping[method]
    end

    def inject_authorization_header(headers, method, signature, operation_signing_strategy)
      header_mapping = fetch_header_mapping(method, operation_signing_strategy)

      signed_headers = header_mapping.map(&:to_s).join(' ')
      headers[:authorization] = [
        %(Signature headers="#{signed_headers}"),
        %(keyId="#{@key_id}"),
        %(algorithm="rsa-sha256"),
        %(signature="#{signature}"),
        %(version="#{SIGNATURE_VERSION}")
      ].join(',')
    end

    def compute_signature(headers, method, path, operation_signing_strategy)
      header_mapping = fetch_header_mapping(method, operation_signing_strategy)
      return if header_mapping.empty?

      signing_string = header_mapping.map do |header|
        if header == :'(request-target)'
          "#{header}: #{method.downcase} #{path}"
        else
          "#{header}: #{headers[header]}"
        end
      end.join("\n")

      signature = private_key.sign(OpenSSL::Digest::SHA256.new, signing_string.encode('ascii'))
      Base64.strict_encode64(signature)
    end

    def private_key
      # If a pass_phase was not provided and the key is in fact encrypted, then passing in
      # nil for the passphrase here will show a user prompt and block until there is a response.
      # Passing in an empty string will work for some versions of Ruby's openssl wrapper, but
      # other versions will enforce the 4 character password minimum at this point. Passing in
      # a dummy password that's greater than 4 characters avoids both problems, and will
      # always succeed if the file is not encrypted.
      @private_key ||= OpenSSL::PKey::RSA.new(
        @private_key_content,
        @pass_phrase || SecureRandom.uuid
      )
    end
  end
end
