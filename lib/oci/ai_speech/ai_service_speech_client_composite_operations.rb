# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::AiSpeech::AIServiceSpeechClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class AiSpeech::AIServiceSpeechClientCompositeOperations
    # The {OCI::AiSpeech::AIServiceSpeechClient} used to communicate with the service_client
    #
    # @return [OCI::AiSpeech::AIServiceSpeechClient]
    attr_reader :service_client

    # Initializes a new AIServiceSpeechClientCompositeOperations
    #
    # @param [OCI::AiSpeech::AIServiceSpeechClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::AiSpeech::AIServiceSpeechClient#initialize} with no arguments
    def initialize(service_client = OCI::AiSpeech::AIServiceSpeechClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::AiSpeech::AIServiceSpeechClient#create_transcription_job} and then waits for the {OCI::AiSpeech::Models::TranscriptionJob} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::AiSpeech::Models::CreateTranscriptionJobDetails] create_transcription_job_details Details for the new Transcription Job.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::AiSpeech::Models::TranscriptionJob#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::AiSpeech::AIServiceSpeechClient#create_transcription_job}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::AiSpeech::Models::TranscriptionJob}
    def create_transcription_job_and_wait_for_state(create_transcription_job_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_transcription_job(create_transcription_job_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_transcription_job(wait_for_resource_id).wait_until(
          eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
          max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
          max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
        )
        result_to_return = waiter_result

        return result_to_return
      rescue StandardError
        raise OCI::Errors::CompositeOperationError.new(partial_results: [operation_result])
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:enable Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::AiSpeech::AIServiceSpeechClient#update_transcription_job} and then waits for the {OCI::AiSpeech::Models::TranscriptionJob} acted upon
    # to enter the given state(s).
    #
    # @param [String] transcription_job_id Unique Transcription Job identifier.
    # @param [OCI::AiSpeech::Models::UpdateTranscriptionJobDetails] update_transcription_job_details The information to be updated.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::AiSpeech::Models::TranscriptionJob#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::AiSpeech::AIServiceSpeechClient#update_transcription_job}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::AiSpeech::Models::TranscriptionJob}
    def update_transcription_job_and_wait_for_state(transcription_job_id, update_transcription_job_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_transcription_job(transcription_job_id, update_transcription_job_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_transcription_job(wait_for_resource_id).wait_until(
          eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
          max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
          max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
        )
        result_to_return = waiter_result

        return result_to_return
      rescue StandardError
        raise OCI::Errors::CompositeOperationError.new(partial_results: [operation_result])
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:enable Layout/EmptyLines
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
