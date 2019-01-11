# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module ContainerEngine
    # Container Engine utility methods
    module Util
      # Wait until the work request succeeds or fails, or max_wait_seconds is reached.
      # The work request will be polled at an increasing rate, with a maximum of
      # max_interval_seconds between requests.
      #
      # @param [ContainerEngineClient] client A container engine client
      # @param [String] the work request identifier
      # @param [Integer] max_interval_seconds The maximum interval between queries, in seconds.
      # @param [Integer] max_wait_seconds The maximum total time to wait, in seconds.
      # @param [Boolean] raise_error_on_failure If true, then a WorkRequestFailedError will be
      # raised if the work request is in a failed state. Similarly, if true, a WorkRequestCanceledError
      # will be raised if the work request is in a canceled state.
      # @return [OCI::Response] A {OCI::Response} object containing the completed
      # {OCI::ContainerEngine::Models::WorkRequest}
      def self.wait_on_work_request(client,
                                    work_request_id,
                                    max_interval_seconds: 30,
                                    max_wait_seconds: 1200,
                                    raise_error_on_failure: true)
        OCI::Waiter::WorkRequest.wait_for_state(
          client,
          work_request_id,
          ->(work_request) { work_request.status == OCI::ContainerEngine::Models::WorkRequest::STATUS_SUCCEEDED },
          lambda do |work_request|
            is_terminal_state = work_request.status == OCI::ContainerEngine::Models::WorkRequest::STATUS_FAILED
            raise OCI::Errors::WorkRequestFailedError.new(work_request, work_request.status) \
              if raise_error_on_failure && is_terminal_state

            is_terminal_state = work_request.status == OCI::ContainerEngine::Models::WorkRequest::STATUS_CANCELED
            raise OCI::Errors::WorkRequestCanceledError.new(work_request, work_request.status) \
              if raise_error_on_failure && is_terminal_state

            is_terminal_state
          end,
          max_interval_seconds: max_interval_seconds,
          max_wait_seconds: max_wait_seconds
        )
      end
    end
  end
end
