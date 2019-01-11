# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module LoadBalancer
    # Load balancer utility methods
    module Util
      # Wait until the work request succeeds or fails, or max_wait_seconds is reached.
      # The work request will be polled at an increasing rate, with a maximum of
      # max_interval_seconds between requests.
      #
      # @param [LoadBalancerClient] client A load balancer client
      # @param [Integer] max_interval_seconds The maximum interval between queries, in seconds.
      # @param [Integer] max_wait_seconds The maximum total time to wait, in seconds.
      # @param [Boolean] raise_error_on_failure If true, then a WorkRequestFailedError will be
      # raised if the work request is in a failed state.
      # @return [OCI::Response] A {OCI::Response} object containing the completed
      # {OCI::LoadBalancer::Models::WorkRequest}
      def self.wait_on_work_request(client,
                                    work_request_id,
                                    max_interval_seconds: 30,
                                    max_wait_seconds: 1200,
                                    raise_error_on_failure: true)
        OCI::Waiter::WorkRequest.wait_for_state(
          client,
          work_request_id,
          lambda do |work_request|
            work_request.lifecycle_state == OCI::LoadBalancer::Models::WorkRequest::LIFECYCLE_STATE_SUCCEEDED
          end,
          lambda do |work_request|
            is_failed_state = work_request.lifecycle_state == \
              OCI::LoadBalancer::Models::WorkRequest::LIFECYCLE_STATE_FAILED
            raise OCI::Errors::WorkRequestFailedError.new(work_request, work_request.lifecycle_state) \
              if raise_error_on_failure && is_failed_state

            is_failed_state
          end,
          max_interval_seconds: max_interval_seconds,
          max_wait_seconds: max_wait_seconds
        )
      end
    end
  end
end
