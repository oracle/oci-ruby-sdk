# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

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

      def token_valid_with_half_expiration_time?
        issue_epoch_seconds = @jwt[0]['iat']
        expiration_epoch_seconds = @jwt[0]['exp']
        half_valid_duration = (expiration_epoch_seconds - issue_epoch_seconds) / 2
        (expiration_epoch_seconds - half_valid_duration) > Time.now.to_i
      end
    end
  end
end
