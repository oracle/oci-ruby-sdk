# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::KeyManagement::KmsVaultClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class KeyManagement::KmsVaultClientCompositeOperations
    # The {OCI::KeyManagement::KmsVaultClient} used to communicate with the service_client
    #
    # @return [OCI::KeyManagement::KmsVaultClient]
    attr_reader :service_client

    # Initializes a new KmsVaultClientCompositeOperations
    #
    # @param [OCI::KeyManagement::KmsVaultClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::KeyManagement::KmsVaultClient#initialize} with no arguments
    def initialize(service_client = OCI::KeyManagement::KmsVaultClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::KeyManagement::KmsVaultClient#cancel_vault_deletion} and then waits for the {OCI::KeyManagement::Models::Vault} acted upon
    # to enter the given state(s).
    #
    # @param [String] vault_id The OCID of the vault.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::KeyManagement::Models::Vault#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::KeyManagement::KmsVaultClient#cancel_vault_deletion}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::KeyManagement::Models::Vault}
    def cancel_vault_deletion_and_wait_for_state(vault_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.cancel_vault_deletion(vault_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_vault(wait_for_resource_id).wait_until(
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


    # Calls {OCI::KeyManagement::KmsVaultClient#create_vault} and then waits for the {OCI::KeyManagement::Models::Vault} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::KeyManagement::Models::CreateVaultDetails] create_vault_details CreateVaultDetails
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::KeyManagement::Models::Vault#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::KeyManagement::KmsVaultClient#create_vault}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::KeyManagement::Models::Vault}
    def create_vault_and_wait_for_state(create_vault_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_vault(create_vault_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_vault(wait_for_resource_id).wait_until(
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


    # Calls {OCI::KeyManagement::KmsVaultClient#schedule_vault_deletion} and then waits for the {OCI::KeyManagement::Models::Vault} acted upon
    # to enter the given state(s).
    #
    # @param [String] vault_id The OCID of the vault.
    # @param [OCI::KeyManagement::Models::ScheduleVaultDeletionDetails] schedule_vault_deletion_details ScheduleVaultDeletionDetails
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::KeyManagement::Models::Vault#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::KeyManagement::KmsVaultClient#schedule_vault_deletion}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::KeyManagement::Models::Vault}
    def schedule_vault_deletion_and_wait_for_state(vault_id, schedule_vault_deletion_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.schedule_vault_deletion(vault_id, schedule_vault_deletion_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_vault(wait_for_resource_id).wait_until(
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


    # Calls {OCI::KeyManagement::KmsVaultClient#update_vault} and then waits for the {OCI::KeyManagement::Models::Vault} acted upon
    # to enter the given state(s).
    #
    # @param [String] vault_id The OCID of the vault.
    # @param [OCI::KeyManagement::Models::UpdateVaultDetails] update_vault_details UpdateVaultDetails
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::KeyManagement::Models::Vault#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::KeyManagement::KmsVaultClient#update_vault}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::KeyManagement::Models::Vault}
    def update_vault_and_wait_for_state(vault_id, update_vault_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_vault(vault_id, update_vault_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_vault(wait_for_resource_id).wait_until(
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
