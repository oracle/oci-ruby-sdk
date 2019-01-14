# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module Waiter
    module Errors
      # Raised when a call to wait_until reaches the maximum wait time.
      class MaximumWaitTimeExceededError < RuntimeError; end

      # Raised when wait_until is called on a response that does not
      # support waiters. Typically, waiters are only supported for
      # get operations.
      class WaitUntilNotSupportedError < RuntimeError; end

      # If thrown from the yield statement of a waiter, it will cause the
      # waiter to fail with this exception.
      class WaiterFailedError < RuntimeError; end
    end

    # Work request waiter utility method.
    module WorkRequest
      # Wait until the work request succeeds or fails, or max_wait_seconds is reached.
      # The work request will be polled at an increasing rate, with a maximum of
      # max_interval_seconds between requests.
      #
      # @param [Client] client A client that is able to call get_work_request()
      # @param [String] work_request_id, the work request identifier
      # @param [Proc] eval_success_proc the proc to evaluate if a wait condition has succeeded.
      # @param [Proc] eval_error_proc the proc to evaluate if an error based terminal condition has occurred.
      # @param [Integer] max_interval_seconds The maximum interval between queries, in seconds.
      # @param [Integer] max_wait_seconds The maximum total time to wait, in seconds.
      # @return [OCI::Response] A {OCI::Response} object containing the completed work request
      def self.wait_for_state(client,
                              work_request_id,
                              eval_success_proc = nil,
                              eval_error_proc = nil,
                              max_interval_seconds: 30,
                              max_wait_seconds: 1200)
        raise 'Work request ID not specified.' unless work_request_id
        raise 'Evaluation proc for determining success not specified' unless eval_success_proc

        interval_seconds = 1
        start_time = Time.now

        loop do
          response = client.get_work_request(work_request_id)
          return response if eval_success_proc && eval_success_proc.call(response.data)
          return response if eval_error_proc && eval_error_proc.call(response.data)

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

  # Adds to the Response class in lib/oci/response.rb to define wait behavior
  class Response
    # Wait until the value of the given property in the response data has
    # the given value. This will block the current thread until the
    # the desired state is reached, the maximum wait time is reached, or the
    # optional yield block throws :stop_succeed or :stop_fail. This is only
    # supported for responses resulting from GET operations. A typical use
    # case is to wait on an instance until it is in a running state:
    #
    #     compute_client.get_instance(@instance_id).wait_until(:lifecycle_state, OCI::Core::Models::Instance::LIFECYCLE_STATE_RUNNING)
    #
    # Although this can be run on any property of the data resulting from any
    # GET operation, the most common use case is to check state properties on
    # operations that GET a single object.
    #
    # The wait will poll at an increasing interval up to 'max_interval_seconds'
    # for a maximum total time of 'max_wait_seconds'. If the maximum time
    # is exceeded, then it will raise a {OCI::Waiter::Errors::MaximumWaitTimeExceededError}.
    #
    # On successful completion the final Response object will be returned. The
    # original Response object will not be altered.
    #
    # If any responses result in an error, then the error will be thrown as normal
    # resulting in the wait being aborted.
    #
    # @param [Symbol] property The property of the response data to evaluate. For example, :lifecycle_state.
    # @param state The value of the property that will indicate successful completion of the wait.
    # @param [Proc] eval_proc A proc/lambda which can be fed a response from a GET operation and evaluate whether a waiter should return
    #   or keep checking. This can be used for logic which extends beyond checking equality of a single attribute, for example checking
    #   that an attribute is one of a possible set of values. If an eval_proc is specified, then neither a property nor state can
    #   be specified. The result of the proc/lambda should be truthy if the waiter should stop waiting, and falsey otherwise.
    # @param [Integer] max_interval_seconds The maximum interval between queries, in seconds.
    # @param [Integer] max_wait_seconds The maximum time to wait, in seconds.
    # @param [boolean] succeed_on_not_found A boolean determining whether or not the waiter should return successfully if the data we're waiting on is not found (e.g. a 404 is
    #   returned from the service). This defaults to false and so a 404 would cause an exception to be thrown by this function. Setting it to true may be useful
    #   in scenarios when waiting for a resource to be terminated/deleted since it is possible that the resource would not be returned by the a GET call anymore.
    # @yieldparam [Response] response A response object for every additional successful call to the get request.
    #   Throw :stop_succeed from the yield to stop the waiter and return the current response.
    #   Throw :stop_fail from the yield to stop the waiter and throw a WaiterFailedError.
    # @return [Response] The final response, which will contain the property in the specified state.
    def wait_until(
      property = nil,
      state = nil,
      eval_proc: nil,
      max_interval_seconds: 30,
      max_wait_seconds: 1200,
      succeed_on_not_found: false
    )
      raise 'Cannot wait on a response without data.' unless data
      raise 'Either an eval_proc or a property and response must be specified' if !eval_proc && property.nil? && state.nil?
      raise 'Cannot specify both an eval_proc and a property or state' if eval_proc && (!property.nil? || !state.nil?)
      raise 'If a property is specified, then a state must also be specified' if !eval_proc && (property.nil? || state.nil?)
      raise 'Response data does not contain the given property.' if property && !data.methods.include?(property)

      raise Waiter::Errors::WaitUntilNotSupportedError, 'wait_until is not supported by this response.' unless @api_call

      response = self
      interval_seconds = 1
      start_time = Time.now

      loop do
        return response if !property.nil? && response.data.send(property) == state
        return response if eval_proc && eval_proc.call(response)

        elapsed_seconds = (Time.now - start_time).to_i

        if elapsed_seconds + interval_seconds > max_wait_seconds
          raise Waiter::Errors::MaximumWaitTimeExceededError, 'Maximum wait time has been exceeded.' \
            unless max_wait_seconds > elapsed_seconds

          # Make one last request right at the maximum wait time.
          interval_seconds = max_wait_seconds - elapsed_seconds
        end

        sleep(interval_seconds)

        interval_seconds *= 2
        interval_seconds = max_interval_seconds if interval_seconds > max_interval_seconds

        begin
          response = @api_call.call(nil)
          response.api_call = @api_call
        rescue OCI::Errors::ServiceError => e
          return nil if e.status_code == 404 && succeed_on_not_found

          raise
        end

        next unless block_given?

        continue = false
        catch(:stop_fail) do
          catch(:stop_succeed) do
            yield response
            continue = true
          end

          return response unless continue
        end

        raise Waiter::Errors::WaiterFailedError unless continue
      end
    end
  end
end
