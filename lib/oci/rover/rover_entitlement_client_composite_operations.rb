# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::Rover::RoverEntitlementClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class Rover::RoverEntitlementClientCompositeOperations
    # The {OCI::Rover::RoverEntitlementClient} used to communicate with the service_client
    #
    # @return [OCI::Rover::RoverEntitlementClient]
    attr_reader :service_client

    # Initializes a new RoverEntitlementClientCompositeOperations
    #
    # @param [OCI::Rover::RoverEntitlementClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::Rover::RoverEntitlementClient#initialize} with no arguments
    def initialize(service_client = OCI::Rover::RoverEntitlementClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::Rover::RoverEntitlementClient#create_rover_entitlement} and then waits for the {OCI::Rover::Models::RoverEntitlement} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Rover::Models::CreateRoverEntitlementDetails] create_rover_entitlement_details Creates a Rover Device Entitlement
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Rover::Models::RoverEntitlement#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Rover::RoverEntitlementClient#create_rover_entitlement}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Rover::Models::RoverEntitlement}
    def create_rover_entitlement_and_wait_for_state(create_rover_entitlement_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_rover_entitlement(create_rover_entitlement_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_rover_entitlement(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Rover::RoverEntitlementClient#delete_rover_entitlement} and then waits for the {OCI::Rover::Models::RoverEntitlement} acted upon
    # to enter the given state(s).
    #
    # @param [String] rover_entitlement_id ID of the rover node or cluster entitlement
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Rover::Models::RoverEntitlement#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Rover::RoverEntitlementClient#delete_rover_entitlement}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_rover_entitlement_and_wait_for_state(rover_entitlement_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_rover_entitlement(rover_entitlement_id)
      operation_result = @service_client.delete_rover_entitlement(rover_entitlement_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)

      begin
        waiter_result = initial_get_result.wait_until(
          eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
          max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
          max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200,
          succeed_on_not_found: true
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


    # Calls {OCI::Rover::RoverEntitlementClient#update_rover_entitlement} and then waits for the {OCI::Rover::Models::RoverEntitlement} acted upon
    # to enter the given state(s).
    #
    # @param [String] rover_entitlement_id ID of the rover node or cluster entitlement
    # @param [OCI::Rover::Models::UpdateRoverEntitlementDetails] update_rover_entitlement_details The information to be updated.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Rover::Models::RoverEntitlement#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Rover::RoverEntitlementClient#update_rover_entitlement}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Rover::Models::RoverEntitlement}
    def update_rover_entitlement_and_wait_for_state(rover_entitlement_id, update_rover_entitlement_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_rover_entitlement(rover_entitlement_id, update_rover_entitlement_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_rover_entitlement(wait_for_resource_id).wait_until(
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
