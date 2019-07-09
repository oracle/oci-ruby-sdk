# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::KeyManagement::KmsManagementClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class KeyManagement::KmsManagementClientCompositeOperations
    # The {OCI::KeyManagement::KmsManagementClient} used to communicate with the service_client
    #
    # @return [OCI::KeyManagement::KmsManagementClient]
    attr_reader :service_client

    # Initializes a new KmsManagementClientCompositeOperations
    #
    # @param [OCI::KeyManagement::KmsManagementClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::KeyManagement::KmsManagementClient#initialize} with no arguments
    def initialize(service_client = OCI::KeyManagement::KmsManagementClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::KeyManagement::KmsManagementClient#cancel_key_deletion} and then waits for the {OCI::KeyManagement::Models::Key} acted upon
    # to enter the given state(s).
    #
    # @param [String] key_id The OCID of the key.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::KeyManagement::Models::Key#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::KeyManagement::KmsManagementClient#cancel_key_deletion}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::KeyManagement::Models::Key}
    def cancel_key_deletion_and_wait_for_state(key_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.cancel_key_deletion(key_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_key(wait_for_resource_id).wait_until(
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


    # Calls {OCI::KeyManagement::KmsManagementClient#create_key} and then waits for the {OCI::KeyManagement::Models::Key} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::KeyManagement::Models::CreateKeyDetails] create_key_details CreateKeyDetails
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::KeyManagement::Models::Key#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::KeyManagement::KmsManagementClient#create_key}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::KeyManagement::Models::Key}
    def create_key_and_wait_for_state(create_key_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_key(create_key_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_key(wait_for_resource_id).wait_until(
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


    # Calls {OCI::KeyManagement::KmsManagementClient#disable_key} and then waits for the {OCI::KeyManagement::Models::Key} acted upon
    # to enter the given state(s).
    #
    # @param [String] key_id The OCID of the key.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::KeyManagement::Models::Key#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::KeyManagement::KmsManagementClient#disable_key}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::KeyManagement::Models::Key}
    def disable_key_and_wait_for_state(key_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.disable_key(key_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_key(wait_for_resource_id).wait_until(
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


    # Calls {OCI::KeyManagement::KmsManagementClient#enable_key} and then waits for the {OCI::KeyManagement::Models::Key} acted upon
    # to enter the given state(s).
    #
    # @param [String] key_id The OCID of the key.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::KeyManagement::Models::Key#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::KeyManagement::KmsManagementClient#enable_key}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::KeyManagement::Models::Key}
    def enable_key_and_wait_for_state(key_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.enable_key(key_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_key(wait_for_resource_id).wait_until(
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


    # Calls {OCI::KeyManagement::KmsManagementClient#schedule_key_deletion} and then waits for the {OCI::KeyManagement::Models::Key} acted upon
    # to enter the given state(s).
    #
    # @param [String] key_id The OCID of the key.
    # @param [OCI::KeyManagement::Models::ScheduleKeyDeletionDetails] schedule_key_deletion_details ScheduleKeyDeletionDetails
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::KeyManagement::Models::Key#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::KeyManagement::KmsManagementClient#schedule_key_deletion}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::KeyManagement::Models::Key}
    def schedule_key_deletion_and_wait_for_state(key_id, schedule_key_deletion_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.schedule_key_deletion(key_id, schedule_key_deletion_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_key(wait_for_resource_id).wait_until(
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


    # Calls {OCI::KeyManagement::KmsManagementClient#update_key} and then waits for the {OCI::KeyManagement::Models::Key} acted upon
    # to enter the given state(s).
    #
    # @param [String] key_id The OCID of the key.
    # @param [OCI::KeyManagement::Models::UpdateKeyDetails] update_key_details UpdateKeyDetails
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::KeyManagement::Models::Key#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::KeyManagement::KmsManagementClient#update_key}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::KeyManagement::Models::Key}
    def update_key_and_wait_for_state(key_id, update_key_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_key(key_id, update_key_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_key(wait_for_resource_id).wait_until(
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
