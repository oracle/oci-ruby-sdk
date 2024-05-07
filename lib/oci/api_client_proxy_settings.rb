# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  # This class contains proxy configuration information that can be provided to {ApiClient}. If
  # {ApiClient} is provided a proxy settings object then it will send requests via the specified
  # proxy.
  #
  # If no object of this class is provided to {ApiClient} then it will use the proxy settings from
  # the `http_proxy` environment variable, if present.
  #
  # To make {ApiClient} bypass proxies completely, pass it an object of this class with a nil
  # {#proxy_address}
  class ApiClientProxySettings
    # The address of the proxy. This should be a DNS hostname or an IP address, but may be
    # nil to indicate that proxies should be bypassed
    #
    # @return [String]
    attr_reader :proxy_address

    # The proxy port
    #
    # @return [Integer]
    attr_reader :proxy_port

    # The username used for the proxy if it supports username/password authentication
    #
    # @return [String]
    attr_reader :proxy_user

    # The password used for the proxy if it supports username/password authentication
    #
    # @return [String]
    attr_reader :proxy_password

    # Creates a new ApiClientProxySettings object that can be provided to an {ApiClient}
    #
    # @param [String] proxy_address The address of the proxy. This should be a DNS hostname or an IP address. nil can be provided to indicate that proxies should be bypassed
    # @param [Integer] proxy_port The proxy port
    # @param [String] proxy_user Optional the username used for the proxy if it supports username/password authentication
    # @param [String] proxy_password Optional the password used for the proxy if it supports username/password authentication
    def initialize(proxy_address, proxy_port = nil, proxy_user = nil, proxy_password = nil)
      validate_proxy_address_port(proxy_address, proxy_port)
      validate_proxy_user_password(proxy_user, proxy_password)

      @proxy_address = proxy_address
      @proxy_port = proxy_port
      @proxy_user = proxy_user
      @proxy_password = proxy_password
    end

    private

    def validate_proxy_address_port(proxy_address, proxy_port)
      raise 'If the proxy address is not nil, it cannot be blank' if !proxy_address.nil? && proxy_address.strip.empty?
      raise 'A proxy port must be provided if a proxy address is provided' if proxy_port.nil? && !proxy_address.nil?
    end

    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    def validate_proxy_user_password(proxy_user, proxy_password)
      proxy_user_blank = proxy_user.nil? || proxy_user.strip.empty?
      proxy_password_blank = proxy_password.nil? || proxy_password.strip.empty?

      raise 'If the proxy user is not nil, it cannot be blank' if !proxy_user.nil? && proxy_user_blank
      raise 'If the proxy password is not nil, it cannot be blank' if !proxy_password.nil? && proxy_password_blank

      raise 'If either a proxy user or proxy password is provided, then both must be provided' \
        if (!proxy_user_blank && proxy_password_blank) || (proxy_user_blank && !proxy_password_blank)
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  end
end
