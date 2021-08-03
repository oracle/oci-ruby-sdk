# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::Jms::JavaManagementServiceClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class Jms::JavaManagementServiceClientCompositeOperations
    # The {OCI::Jms::JavaManagementServiceClient} used to communicate with the service_client
    #
    # @return [OCI::Jms::JavaManagementServiceClient]
    attr_reader :service_client

    # Initializes a new JavaManagementServiceClientCompositeOperations
    #
    # @param [OCI::Jms::JavaManagementServiceClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::Jms::JavaManagementServiceClient#initialize} with no arguments
    def initialize(service_client = OCI::Jms::JavaManagementServiceClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::Jms::JavaManagementServiceClient#change_fleet_compartment} and then waits for the {OCI::Jms::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] fleet_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Fleet.
    # @param [OCI::Jms::Models::ChangeFleetCompartmentDetails] change_fleet_compartment_details Compartment identifier.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Jms::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Jms::JavaManagementServiceClient#change_fleet_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Jms::Models::WorkRequest}
    def change_fleet_compartment_and_wait_for_state(fleet_id, change_fleet_compartment_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_fleet_compartment(fleet_id, change_fleet_compartment_details, base_operation_opts)
      use_util = OCI::Jms::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Jms::Util.wait_on_work_request(
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


    # Calls {OCI::Jms::JavaManagementServiceClient#create_fleet} and then waits for the {OCI::Jms::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::Jms::Models::CreateFleetDetails] create_fleet_details Details for the new Fleet.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Jms::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Jms::JavaManagementServiceClient#create_fleet}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Jms::Models::WorkRequest}
    def create_fleet_and_wait_for_state(create_fleet_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_fleet(create_fleet_details, base_operation_opts)
      use_util = OCI::Jms::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Jms::Util.wait_on_work_request(
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


    # Calls {OCI::Jms::JavaManagementServiceClient#delete_fleet} and then waits for the {OCI::Jms::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] fleet_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Fleet.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Jms::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Jms::JavaManagementServiceClient#delete_fleet}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Jms::Models::WorkRequest}
    def delete_fleet_and_wait_for_state(fleet_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_fleet(fleet_id, base_operation_opts)
      use_util = OCI::Jms::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Jms::Util.wait_on_work_request(
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


    # Calls {OCI::Jms::JavaManagementServiceClient#update_fleet} and then waits for the {OCI::Jms::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] fleet_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Fleet.
    # @param [OCI::Jms::Models::UpdateFleetDetails] update_fleet_details The new details for the Fleet.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Jms::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Jms::JavaManagementServiceClient#update_fleet}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Jms::Models::WorkRequest}
    def update_fleet_and_wait_for_state(fleet_id, update_fleet_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_fleet(fleet_id, update_fleet_details, base_operation_opts)
      use_util = OCI::Jms::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Jms::Util.wait_on_work_request(
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


    # Calls {OCI::Jms::JavaManagementServiceClient#update_fleet_agent_configuration} and then waits for the {OCI::Jms::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] fleet_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Fleet.
    # @param [OCI::Jms::Models::UpdateFleetAgentConfigurationDetails] update_fleet_agent_configuration_details The new details for the Fleet Agent Configuration.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Jms::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Jms::JavaManagementServiceClient#update_fleet_agent_configuration}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Jms::Models::WorkRequest}
    def update_fleet_agent_configuration_and_wait_for_state(fleet_id, update_fleet_agent_configuration_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_fleet_agent_configuration(fleet_id, update_fleet_agent_configuration_details, base_operation_opts)
      use_util = OCI::Jms::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Jms::Util.wait_on_work_request(
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
