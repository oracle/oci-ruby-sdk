# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'openssl'

module OCI
  module Auth
    # A supplier which can vend a public and private key to be used for signing requests
    class SessionKeySupplier
      PUBLIC_EXPONENT = 65_537 # Ruby docs suggest 3, 17 or 65537
      def initialize(key_size: 2048)
        @key_size = key_size
        @refresh_lock = Mutex.new

        @private_key = OpenSSL::PKey::RSA.generate(@key_size, PUBLIC_EXPONENT)
      end

      # Retrieves a public key and private key
      # @return [Hash] A 2 element hash, where the key 'private_key' retrieves the private key and the public key can be retrieved by using the key 'public_key'
      def key_pair
        @refresh_lock.lock
        private_key = @private_key
        @refresh_lock.unlock

        { 'private_key': private_key, 'public_key': private_key.public_key }
      end

      # Generates a new public and private key
      def refresh
        @refresh_lock.lock
        @private_key = OpenSSL::PKey::RSA.generate(@key_size, PUBLIC_EXPONENT)
      ensure
        @refresh_lock.unlock if @refresh_lock.locked? && @refresh_lock.owned?
      end
    end
  end
end
