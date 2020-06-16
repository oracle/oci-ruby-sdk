# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Retry
    module Functions
      # A module containing functions that can be used to determine whether to retry based on
      # the error/exception encountered.
      #
      # These functions should take a single argument of a {OCI::Retry::Internal::RetryState}
      # object
      module ShouldRetryOnError
        # Returns a proc which will retry on {OCI::Errors::NetworkError} and on {OCI::Errors::ServiceError}
        # when the status code indicates a throttle (HTTP 429) or an internal server error
        # (any HTTP 5xx)
        #
        # @return [Proc]
        def self.retry_on_network_error_throttle_and_internal_server_errors
          lambda do |retry_state|
            return true if retry_state.last_exception.is_a?(OCI::Errors::NetworkError)
            return false unless retry_state.last_exception.is_a?(OCI::Errors::ServiceError)

            retry_state.last_exception.status_code == 429 || retry_state.last_exception.status_code >= 500
          end
        end
      end
    end
  end
end
