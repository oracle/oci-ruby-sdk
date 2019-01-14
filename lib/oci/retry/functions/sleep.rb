# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module Retry
    module Functions
      # A module containing functions that can be used to calculate sleep times between retries.
      #
      # These functions should take two arguments: the first argument an object of type
      # {OCI::Retry::RetryConfig} and the second an object of type {OCI::Retry::Internal::RetryState}
      module Sleep
        # Returns a proc which applies an exponential backoff with full jitter calculation. This is
        # defined as:
        #
        #   random(0, min(base_sleep_time * (exponent**attempts), max_sleep_time_between_attempts))
        #
        # Where the base_sleep_time, exponent, max_sleep_time_between_attempts is taken from the
        # {OCI::Retry::RetryConfig} provided to the proc and the attempts is taken from the
        # {OCI::Retry::Internal::RetryState} provided to the proc.
        #
        # @return [Proc]
        def self.exponential_backoff_with_full_jitter
          lambda do |retry_config, retry_state|
            random = Random.new
            attempt = retry_state.current_attempt_number
            base_sleep_millis = retry_config.base_sleep_time_millis
            exponential_growth_factor = retry_config.exponential_growth_factor
            max_sleep_time_millis = retry_config.max_sleep_between_attempts_millis

            return random.rand(0..(base_sleep_millis * (exponential_growth_factor**attempt))) \
              if max_sleep_time_millis.nil?

            random.rand(0..[base_sleep_millis * (exponential_growth_factor**attempt), max_sleep_time_millis].min)
          end
        end
        # rubocop:disable Metrics/AbcSize, Layout/EmptyLines


        # Returns a proc which applies an exponential backoff with equal jitter calclulation. This is defined as:
        #
        #   base_sleep_time = min(base_sleep_time * (exponent**attempts), max_sleep_time)
        #   (base_sleep_time / 2) + random(0, (base_sleep_time / 2))
        #
        # Where the base_sleep_time, exponent, max_sleep_time_between_attempts is taken from the
        # {OCI::Retry::RetryConfig} provided to the proc and the attempts is taken from the
        # {OCI::Retry::Internal::RetryState} provided to the proc.
        #
        # @return [Proc]
        def self.exponential_backoff_with_equal_jitter
          lambda do |retry_config, retry_state|
            random = Random.new
            attempt = retry_state.current_attempt_number
            base_sleep_millis = retry_config.base_sleep_time_millis
            exponential_growth_factor = retry_config.exponential_growth_factor
            max_sleep_time_millis = retry_config.max_sleep_between_attempts_millis

            sleep_raw = if max_sleep_time_millis.nil?
                          base_sleep_millis * (exponential_growth_factor**attempt)
                        else
                          [base_sleep_millis * (exponential_growth_factor**attempt), max_sleep_time_millis].min
                        end
            (sleep_raw / 2) + random.rand(0..(sleep_raw / 2))
          end
        end
        # rubocop:enable Metrics/AbcSize, Layout/EmptyLines

        # Returns a proc which uses exponential backoff with full jitter for retries, except in the case of
        # throttles where exponential backoff with equal jitter is used instead. This ensures some base
        # level of sleep for throttles rather than, potentially, retrying again in quick succession
        #
        # @return [Proc]
        def self.exponential_backoff_with_full_jitter_equal_on_throttle
          lambda do |retry_config, retry_state|
            use_equal_jitter =
              !retry_state.last_exception.nil? &&
              retry_state.last_exception.respond_to?(:status_code) &&
              retry_state.last_exception.status_code == 429

            return exponential_backoff_with_full_jitter.call(retry_config, retry_state) unless use_equal_jitter

            exponential_backoff_with_equal_jitter.call(retry_config, retry_state)
          end
        end
      end
    end
  end
end
