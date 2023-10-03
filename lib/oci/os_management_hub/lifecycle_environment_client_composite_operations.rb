# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220901

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::OsManagementHub::LifecycleEnvironmentClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class OsManagementHub::LifecycleEnvironmentClientCompositeOperations
    # The {OCI::OsManagementHub::LifecycleEnvironmentClient} used to communicate with the service_client
    #
    # @return [OCI::OsManagementHub::LifecycleEnvironmentClient]
    attr_reader :service_client

    # Initializes a new LifecycleEnvironmentClientCompositeOperations
    #
    # @param [OCI::OsManagementHub::LifecycleEnvironmentClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::OsManagementHub::LifecycleEnvironmentClient#initialize} with no arguments
    def initialize(service_client = OCI::OsManagementHub::LifecycleEnvironmentClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::OsManagementHub::LifecycleEnvironmentClient#attach_managed_instances_to_lifecycle_stage} and then waits for the {OCI::OsManagementHub::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] lifecycle_stage_id The OCID of the lifecycle stage.
    # @param [OCI::OsManagementHub::Models::AttachManagedInstancesToLifecycleStageDetails] attach_managed_instances_to_lifecycle_stage_details Details for managed instances to attach to the lifecycle stage.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::OsManagementHub::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::OsManagementHub::LifecycleEnvironmentClient#attach_managed_instances_to_lifecycle_stage}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::OsManagementHub::Models::WorkRequest}
    def attach_managed_instances_to_lifecycle_stage_and_wait_for_state(lifecycle_stage_id, attach_managed_instances_to_lifecycle_stage_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.attach_managed_instances_to_lifecycle_stage(lifecycle_stage_id, attach_managed_instances_to_lifecycle_stage_details, base_operation_opts)
      use_util = OCI::OsManagementHub::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::OsManagementHub::Util.wait_on_work_request(
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


    # Calls {OCI::OsManagementHub::LifecycleEnvironmentClient#create_lifecycle_environment} and then waits for the {OCI::OsManagementHub::Models::LifecycleEnvironment} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::OsManagementHub::Models::CreateLifecycleEnvironmentDetails] create_lifecycle_environment_details Details for the new lifecycle environment.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::OsManagementHub::Models::LifecycleEnvironment#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::OsManagementHub::LifecycleEnvironmentClient#create_lifecycle_environment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::OsManagementHub::Models::LifecycleEnvironment}
    def create_lifecycle_environment_and_wait_for_state(create_lifecycle_environment_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_lifecycle_environment(create_lifecycle_environment_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_lifecycle_environment(wait_for_resource_id).wait_until(
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


    # Calls {OCI::OsManagementHub::LifecycleEnvironmentClient#delete_lifecycle_environment} and then waits for the {OCI::OsManagementHub::Models::LifecycleEnvironment} acted upon
    # to enter the given state(s).
    #
    # @param [String] lifecycle_environment_id The OCID of the lifecycle environment.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::OsManagementHub::Models::LifecycleEnvironment#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::OsManagementHub::LifecycleEnvironmentClient#delete_lifecycle_environment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_lifecycle_environment_and_wait_for_state(lifecycle_environment_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_lifecycle_environment(lifecycle_environment_id)
      operation_result = @service_client.delete_lifecycle_environment(lifecycle_environment_id, base_operation_opts)

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


    # Calls {OCI::OsManagementHub::LifecycleEnvironmentClient#detach_managed_instances_from_lifecycle_stage} and then waits for the {OCI::OsManagementHub::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] lifecycle_stage_id The OCID of the lifecycle stage.
    # @param [OCI::OsManagementHub::Models::DetachManagedInstancesFromLifecycleStageDetails] detach_managed_instances_from_lifecycle_stage_details Details for managed instances to detach from the lifecycle stage.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::OsManagementHub::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::OsManagementHub::LifecycleEnvironmentClient#detach_managed_instances_from_lifecycle_stage}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::OsManagementHub::Models::WorkRequest}
    def detach_managed_instances_from_lifecycle_stage_and_wait_for_state(lifecycle_stage_id, detach_managed_instances_from_lifecycle_stage_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.detach_managed_instances_from_lifecycle_stage(lifecycle_stage_id, detach_managed_instances_from_lifecycle_stage_details, base_operation_opts)
      use_util = OCI::OsManagementHub::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::OsManagementHub::Util.wait_on_work_request(
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


    # Calls {OCI::OsManagementHub::LifecycleEnvironmentClient#promote_software_source_to_lifecycle_stage} and then waits for the {OCI::OsManagementHub::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] lifecycle_stage_id The OCID of the lifecycle stage.
    # @param [OCI::OsManagementHub::Models::PromoteSoftwareSourceToLifecycleStageDetails] promote_software_source_to_lifecycle_stage_details Details for the software source promotion job.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::OsManagementHub::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::OsManagementHub::LifecycleEnvironmentClient#promote_software_source_to_lifecycle_stage}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::OsManagementHub::Models::WorkRequest}
    def promote_software_source_to_lifecycle_stage_and_wait_for_state(lifecycle_stage_id, promote_software_source_to_lifecycle_stage_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.promote_software_source_to_lifecycle_stage(lifecycle_stage_id, promote_software_source_to_lifecycle_stage_details, base_operation_opts)
      use_util = OCI::OsManagementHub::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::OsManagementHub::Util.wait_on_work_request(
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


    # Calls {OCI::OsManagementHub::LifecycleEnvironmentClient#update_lifecycle_environment} and then waits for the {OCI::OsManagementHub::Models::LifecycleEnvironment} acted upon
    # to enter the given state(s).
    #
    # @param [String] lifecycle_environment_id The OCID of the lifecycle environment.
    # @param [OCI::OsManagementHub::Models::UpdateLifecycleEnvironmentDetails] update_lifecycle_environment_details The information to be updated.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::OsManagementHub::Models::LifecycleEnvironment#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::OsManagementHub::LifecycleEnvironmentClient#update_lifecycle_environment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::OsManagementHub::Models::LifecycleEnvironment}
    def update_lifecycle_environment_and_wait_for_state(lifecycle_environment_id, update_lifecycle_environment_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_lifecycle_environment(lifecycle_environment_id, update_lifecycle_environment_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_lifecycle_environment(wait_for_resource_id).wait_until(
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
