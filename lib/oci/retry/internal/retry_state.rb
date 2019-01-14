# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'time'

module OCI
  module Retry
    module Internal
      # A property bag containing the current state of making a retriable call
      class RetryState
        # The current number of attempts which have been made.  This is one-based (i.e. the first attempt is 1,
        # the second is 2 etc.)
        attr_reader :current_attempt_number

        # When we started making retriable calls, in epoch milliseconds
        #
        # @return [Integer]
        attr_reader :start_time_epoch_millis

        # The last exception which was raised when making a retriable call
        #
        # @return [Exception]
        attr_accessor :last_exception

        def initialize
          @current_attempt_number = 0
        end

        # Increments the number of attempts which have been made by 1
        def increment_attempts
          @current_attempt_number += 1
        end

        # Sets the {#start_time_epoch_millis} property to the current time in epoch milliseconds. This can
        # only be done once.
        def start
          raise 'The start_time for the retry state has already been set' unless @start_time_epoch_millis.nil?

          @start_time_epoch_millis = (Time.now.to_f * 1000).to_i
        end

        def to_s
          "{ 'current_attempt': '#{current_attempt_number}', " \
          "'start_time_epoch_millis': '#{start_time_epoch_millis}', " \
          "'last_exception': '#{last_exception}' }"
        end
      end
    end
  end
end
