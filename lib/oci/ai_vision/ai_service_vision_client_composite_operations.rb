# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::AiVision::AIServiceVisionClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class AiVision::AIServiceVisionClientCompositeOperations
    # The {OCI::AiVision::AIServiceVisionClient} used to communicate with the service_client
    #
    # @return [OCI::AiVision::AIServiceVisionClient]
    attr_reader :service_client

    # Initializes a new AIServiceVisionClientCompositeOperations
    #
    # @param [OCI::AiVision::AIServiceVisionClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::AiVision::AIServiceVisionClient#initialize} with no arguments
    def initialize(service_client = OCI::AiVision::AIServiceVisionClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::AiVision::AIServiceVisionClient#create_document_job} and then waits for the {OCI::AiVision::Models::DocumentJob} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::AiVision::Models::CreateDocumentJobDetails] create_document_job_details The details of the batch document analysis.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::AiVision::Models::DocumentJob#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::AiVision::AIServiceVisionClient#create_document_job}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::AiVision::Models::DocumentJob}
    def create_document_job_and_wait_for_state(create_document_job_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_document_job(create_document_job_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_document_job(wait_for_resource_id).wait_until(
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


    # Calls {OCI::AiVision::AIServiceVisionClient#create_image_job} and then waits for the {OCI::AiVision::Models::ImageJob} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::AiVision::Models::CreateImageJobDetails] create_image_job_details The details of the batch image analysis.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::AiVision::Models::ImageJob#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::AiVision::AIServiceVisionClient#create_image_job}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::AiVision::Models::ImageJob}
    def create_image_job_and_wait_for_state(create_image_job_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_image_job(create_image_job_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_image_job(wait_for_resource_id).wait_until(
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


    # Calls {OCI::AiVision::AIServiceVisionClient#create_model} and then waits for the {OCI::AiVision::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::AiVision::Models::CreateModelDetails] create_model_details The metadata about the new model.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::AiVision::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::AiVision::AIServiceVisionClient#create_model}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::AiVision::Models::WorkRequest}
    def create_model_and_wait_for_state(create_model_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_model(create_model_details, base_operation_opts)
      use_util = OCI::AiVision::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::AiVision::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:status) && lowered_wait_for_states.include?(response.data.status.downcase) },
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        end
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


    # Calls {OCI::AiVision::AIServiceVisionClient#create_project} and then waits for the {OCI::AiVision::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::AiVision::Models::CreateProjectDetails] create_project_details The new Project's details.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::AiVision::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::AiVision::AIServiceVisionClient#create_project}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::AiVision::Models::WorkRequest}
    def create_project_and_wait_for_state(create_project_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_project(create_project_details, base_operation_opts)
      use_util = OCI::AiVision::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::AiVision::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:status) && lowered_wait_for_states.include?(response.data.status.downcase) },
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        end
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


    # Calls {OCI::AiVision::AIServiceVisionClient#delete_model} and then waits for the {OCI::AiVision::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] model_id A unique model identifier.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::AiVision::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::AiVision::AIServiceVisionClient#delete_model}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::AiVision::Models::WorkRequest}
    def delete_model_and_wait_for_state(model_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_model(model_id, base_operation_opts)
      use_util = OCI::AiVision::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::AiVision::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:status) && lowered_wait_for_states.include?(response.data.status.downcase) },
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        end
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


    # Calls {OCI::AiVision::AIServiceVisionClient#delete_project} and then waits for the {OCI::AiVision::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] project_id A unique project identifier.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::AiVision::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::AiVision::AIServiceVisionClient#delete_project}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::AiVision::Models::WorkRequest}
    def delete_project_and_wait_for_state(project_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_project(project_id, base_operation_opts)
      use_util = OCI::AiVision::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::AiVision::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:status) && lowered_wait_for_states.include?(response.data.status.downcase) },
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        end
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


    # Calls {OCI::AiVision::AIServiceVisionClient#update_model} and then waits for the {OCI::AiVision::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] model_id A unique model identifier.
    # @param [OCI::AiVision::Models::UpdateModelDetails] update_model_details The model metadata to be updated.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::AiVision::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::AiVision::AIServiceVisionClient#update_model}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::AiVision::Models::WorkRequest}
    def update_model_and_wait_for_state(model_id, update_model_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_model(model_id, update_model_details, base_operation_opts)
      use_util = OCI::AiVision::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::AiVision::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:status) && lowered_wait_for_states.include?(response.data.status.downcase) },
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        end
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


    # Calls {OCI::AiVision::AIServiceVisionClient#update_project} and then waits for the {OCI::AiVision::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] project_id A unique project identifier.
    # @param [OCI::AiVision::Models::UpdateProjectDetails] update_project_details The project metadata to be updated.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::AiVision::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::AiVision::AIServiceVisionClient#update_project}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::AiVision::Models::WorkRequest}
    def update_project_and_wait_for_state(project_id, update_project_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_project(project_id, update_project_details, base_operation_opts)
      use_util = OCI::AiVision::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::AiVision::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:status) && lowered_wait_for_states.include?(response.data.status.downcase) },
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        end
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
