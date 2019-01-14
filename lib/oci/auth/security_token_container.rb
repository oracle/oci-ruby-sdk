# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'jwt'

module OCI
  module Auth
    # A container class which holds the raw token retrieved from Auth Service and its decoded
    # equivalent
    class SecurityTokenContainer
      attr_reader :jwt
      attr_reader :security_token

      def initialize(security_token, key_pair: nil)
        @key_pair = key_pair
        @security_token = security_token
        @jwt = JWT.decode(@security_token, nil, false)
      end

      def token_valid?
        expiration_epoch_seconds = @jwt[0]['exp']
        expiration_epoch_seconds > Time.now.to_i
      end
    end
  end
end
