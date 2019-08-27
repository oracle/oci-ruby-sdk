# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::Dts::TransferApplianceClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class Dts::TransferApplianceClientCompositeOperations
    # The {OCI::Dts::TransferApplianceClient} used to communicate with the service_client
    #
    # @return [OCI::Dts::TransferApplianceClient]
    attr_reader :service_client

    # Initializes a new TransferApplianceClientCompositeOperations
    #
    # @param [OCI::Dts::TransferApplianceClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::Dts::TransferApplianceClient#initialize} with no arguments
    def initialize(service_client = OCI::Dts::TransferApplianceClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::Dts::TransferApplianceClient#create_transfer_appliance} and then waits for the {OCI::Dts::Models::TransferAppliance} acted upon
    # to enter the given state(s).
    #
    # @param [String] id ID of the Transfer Job
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Dts::Models::TransferAppliance#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Dts::TransferApplianceClient#create_transfer_appliance}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Dts::Models::TransferAppliance}
    def create_transfer_appliance_and_wait_for_state(id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_transfer_appliance(id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_transfer_appliance(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Dts::TransferApplianceClient#update_transfer_appliance} and then waits for the {OCI::Dts::Models::TransferAppliance} acted upon
    # to enter the given state(s).
    #
    # @param [String] id ID of the Transfer Job
    # @param [String] transfer_appliance_label Label of the Transfer Appliance
    # @param [OCI::Dts::Models::UpdateTransferApplianceDetails] update_transfer_appliance_details fields to update
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Dts::Models::TransferAppliance#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Dts::TransferApplianceClient#update_transfer_appliance}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Dts::Models::TransferAppliance}
    def update_transfer_appliance_and_wait_for_state(id, transfer_appliance_label, update_transfer_appliance_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_transfer_appliance(id, transfer_appliance_label, update_transfer_appliance_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_transfer_appliance(wait_for_resource_id).wait_until(
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
