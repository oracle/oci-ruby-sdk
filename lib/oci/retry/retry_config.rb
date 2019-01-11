# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'time'

module OCI
  module Retry
    # The configuration for a retry strategy
    class RetryConfig
      # The maximum number of attempts before we stop trying to make calls. This is one-based (i.e. the first attempt is 1,
      # the second is 2 etc.) and nil indicates that there is no maximum.
      #
      # @return [Integer]
      attr_reader :max_attempts

      # The maximum amount of time (in milliseconds) that can elapse for all attempts before we stop trying
      # to make calls. A nil value indicates that there is no maximum
      #
      # @return [Integer]
      attr_reader :max_elapsed_time_millis

      # A proc which can be called to determine whether a particular exception can be retried. This proc should
      # take a single argument of type {OCI::Retry::Internal::RetryState}. The exception can be accessed via
      # {OCI::Retry::Intenral::RetryState#last_exception}
      #
      # @return [Proc]
      attr_reader :should_retry_exception_proc

      # A proc which can be called to determine the next sleep time (in milliseconds) when retrying. This proc
      # should take two arguments, the first argument of type {OCI::Retry::RetryConfig} and the second of type
      # {OCI::Retry::Internal::RetryState}
      #
      # @return [Proc]
      attr_reader :sleep_calc_millis_proc

      # For exponential backoff and retry calculations, the base time (in milliseconds) which we multiply by
      # some exponential value
      #
      # @return [Integer]
      attr_reader :base_sleep_time_millis

      # For exponential backoff and retry calculations, the exponent we'll raise to the number of attempts.
      # The result would then be multiplied by the value in {#base_sleep_time_millis}
      #
      # @return [Integer]
      attr_reader :exponential_growth_factor

      # For exponential backoff and retry calclulation, the maximum amount of time (in milliseconds) to
      # sleep between attempts. A nil value indicates that there is no maximum
      #
      # @return [Integer]
      attr_reader :max_sleep_between_attempts_millis

      # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Layout/EmptyLines


      def initialize(
        base_sleep_time_millis:,
        exponential_growth_factor:,
        should_retry_exception_proc:,
        sleep_calc_millis_proc:,
        max_attempts: nil,
        max_elapsed_time_millis: nil,
        max_sleep_between_attempts_millis: nil
      )
        raise 'base_sleep_time_millis must be greater than or equal to 1' \
          if base_sleep_time_millis.nil? || base_sleep_time_millis < 1

        raise 'exponential_growth_factor must be greater than or equal to 1' \
          if exponential_growth_factor.nil? || exponential_growth_factor < 1

        raise 'should_retry_exception_proc must be provided' if should_retry_exception_proc.nil?
        raise 'sleep_calc_millis_proc must be provided' if sleep_calc_millis_proc.nil?

        @base_sleep_time_millis = base_sleep_time_millis
        @exponential_growth_factor = exponential_growth_factor
        @should_retry_exception_proc = should_retry_exception_proc
        @sleep_calc_millis_proc = sleep_calc_millis_proc

        unless max_attempts.nil?
          raise 'max_attempts must be greater than or equal to 1' if max_attempts < 1

          @max_attempts = max_attempts
        end

        unless max_elapsed_time_millis.nil?
          raise 'max_elapsed_time_millis must be greater than or equal to 0' if max_elapsed_time_millis < 0

          @max_elapsed_time_millis = max_elapsed_time_millis
        end

        raise 'max_sleep_between_attempts_millis must be greater than or equal to 0' \
          if max_sleep_between_attempts_millis && max_sleep_between_attempts_millis < 0

        @max_sleep_between_attempts_millis = max_sleep_between_attempts_millis if max_sleep_between_attempts_millis
      end
      # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Layout/EmptyLines

      # Determines whether we should retry a call based on the current state of making a retriable call and the values
      # defined in this configuration.
      #
      # @param [OCI::Retry::Internal::RetryState] retry_state The current state of making a retriable call
      #
      # @return [Boolean] true if we should retry based on the current state and this configuration, and false
      #   otherwise
      def should_retry?(retry_state)
        current_time = (Time.now.to_f * 1000).to_i
        time_difference_millis = current_time - retry_state.start_time_epoch_millis

        return false if @max_attempts && retry_state.current_attempt_number >= @max_attempts
        return false if @max_elapsed_time_millis && time_difference_millis > @max_elapsed_time_millis

        should_retry_exception_proc.call(retry_state)
      end

      # Sleeps for some amount of time based on the current state of making a retriable call
      #
      # @param [OCI::Retry::Internal::RetryState] retry_state The current state of making a retriable call
      def do_sleep(retry_state)
        sleep_time_millis = sleep_calc_millis_proc.call(self, retry_state)
        sleep(sleep_time_millis / 1000.0)
      end
    end
  end
end
