# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  # Module for retry strategies for use with the SDK when calling OCI services
  module Retry
    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Takes a block and then executes it with retries based on the provided configuration.
    #
    # @param [OCI::Retry::RetryConfig] retry_config The configuration to be used for retries, defining what
    #   exceptions to retry on, how to calculate sleep times between retries etc. If the parameter value is nil
    #   then no retries are performed and the block is called once
    #
    # @param [String] operation_name A friendly name for the operation being called so that it can be written
    #   to the logs
    #
    # @return [Object] The result of the block passed to this method
    def self.make_retrying_call(retry_config, call_name: nil)
      raise 'A block must be provided' unless block_given?

      # If no retry configuration has been given, just do a single call
      return yield if retry_config.nil?

      retry_state = OCI::Retry::Internal::RetryState.new
      retry_state.start

      loop do
        begin
          OCI.logger.debug("[RETRYING_CALL] #{call_name}") if OCI.logger
          return yield
        rescue => e # rubocop:disable Style/RescueStandardError
          retry_state.increment_attempts
          retry_state.last_exception = e
          if retry_config.should_retry?(retry_state)
            if OCI.logger
              OCI.logger.debug(
                "[RETRYING] #{call_name} failed. Sleeping then retrying. Retry state: #{retry_state}"
              )
            end
            retry_config.do_sleep(retry_state)
          else
            if OCI.logger
              OCI.logger.debug(
                "[RETRIES_EXHAUSTED] #{call_name} failed and exhausted retries. Retry state: #{retry_state}"
              )
            end
            raise
          end
        end
      end
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Layout/EmptyLines

    # Generates a token which can be used as a value for the opc-retry-token header value. The token will
    # consist of uppercase letters (A-Z), lowercase letters (a-z) and digits (0-9)
    #
    # @param [Integer] token_length how many characters the token should be
    #
    # @return [String]
    def self.generate_opc_retry_token(token_length = 32)
      raise 'The token must be at least one character long' if token_length.nil? || token_length < 1

      available_chars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
      retry_token = ''
      token_length.times { retry_token << available_chars[rand(available_chars.size)] }

      retry_token
    end

    # A module containing functions that can be used with retries (e.g. for sleeping and working
    # out whether a particular error/exception can be retried)
    module Functions
    end

    # Internal functionality to support the {OCI::Retry} module. Not intended for public use.
    module Internal
    end
  end
end

require 'oci/retry/retry_config'
require 'oci/retry/functions/should_retry_on_error'
require 'oci/retry/functions/sleep'
require 'oci/retry/internal/retry_state'
