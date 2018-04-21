# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

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
      # @return [WorkRequest] The final work request
      def self.wait_on_work_request(client,
                                    work_request_id,
                                    max_interval_seconds: 30,
                                    max_wait_seconds: 1200,
                                    raise_error_on_failure: true)
        raise 'Work request ID not specified.' unless work_request_id

        interval_seconds = 1
        start_time = Time.now

        loop do
          response = client.get_work_request(work_request_id)
          lifecycle_state = response.data.lifecycle_state

          return response.data if lifecycle_state == OCI::LoadBalancer::Models::WorkRequest::LIFECYCLE_STATE_SUCCEEDED

          if response.data.lifecycle_state == OCI::LoadBalancer::Models::WorkRequest::LIFECYCLE_STATE_FAILED
            raise OCI::Errors::WorkRequestFailedError, response.data if raise_error_on_failure
            return response.data
          end

          elapsed_seconds = (Time.now - start_time).to_i

          if elapsed_seconds + interval_seconds > max_wait_seconds
            raise OCI::Errors::MaximumWaitTimeExceededError, 'Maximum wait time has been exceeded.' \
              unless max_wait_seconds > elapsed_seconds

            # Make one last request right at the maximum wait time.
            interval_seconds = max_wait_seconds - elapsed_seconds
          end

          sleep(interval_seconds)

          interval_seconds *= 2
          interval_seconds = max_interval_seconds if interval_seconds > max_interval_seconds
        end
      end
    end
  end
end
