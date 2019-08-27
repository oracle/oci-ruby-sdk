# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::Dts::TransferPackageClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class Dts::TransferPackageClientCompositeOperations
    # The {OCI::Dts::TransferPackageClient} used to communicate with the service_client
    #
    # @return [OCI::Dts::TransferPackageClient]
    attr_reader :service_client

    # Initializes a new TransferPackageClientCompositeOperations
    #
    # @param [OCI::Dts::TransferPackageClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::Dts::TransferPackageClient#initialize} with no arguments
    def initialize(service_client = OCI::Dts::TransferPackageClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::Dts::TransferPackageClient#create_transfer_package} and then waits for the {OCI::Dts::Models::TransferPackage} acted upon
    # to enter the given state(s).
    #
    # @param [String] id ID of the Transfer Job
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Dts::Models::TransferPackage#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Dts::TransferPackageClient#create_transfer_package}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Dts::Models::TransferPackage}
    def create_transfer_package_and_wait_for_state(id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_transfer_package(id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_transfer_package(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Dts::TransferPackageClient#update_transfer_package} and then waits for the {OCI::Dts::Models::TransferPackage} acted upon
    # to enter the given state(s).
    #
    # @param [String] id ID of the Transfer Job
    # @param [String] transfer_package_label Label of the Transfer Package
    # @param [OCI::Dts::Models::UpdateTransferPackageDetails] update_transfer_package_details fields to update
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Dts::Models::TransferPackage#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Dts::TransferPackageClient#update_transfer_package}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Dts::Models::TransferPackage}
    def update_transfer_package_and_wait_for_state(id, transfer_package_label, update_transfer_package_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_transfer_package(id, transfer_package_label, update_transfer_package_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_transfer_package(wait_for_resource_id).wait_until(
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
