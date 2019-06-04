# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::Core::ComputeManagementClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class Core::ComputeManagementClientCompositeOperations
    # The {OCI::Core::ComputeManagementClient} used to communicate with the service_client
    #
    # @return [OCI::Core::ComputeManagementClient]
    attr_reader :service_client

    # Initializes a new ComputeManagementClientCompositeOperations
    #
    # @param [OCI::Core::ComputeManagementClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::Core::ComputeManagementClient#initialize} with no arguments
    def initialize(service_client = OCI::Core::ComputeManagementClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::Core::ComputeManagementClient#attach_load_balancer} and then waits for the {OCI::Core::Models::InstancePool} acted upon
    # to enter the given state(s).
    #
    # @param [String] instance_pool_id The OCID of the instance pool.
    # @param [OCI::Core::Models::AttachLoadBalancerDetails] attach_load_balancer_details Load balancer being attached
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Core::Models::InstancePool#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Core::ComputeManagementClient#attach_load_balancer}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Core::Models::InstancePool}
    def attach_load_balancer_and_wait_for_state(instance_pool_id, attach_load_balancer_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.attach_load_balancer(instance_pool_id, attach_load_balancer_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_instance_pool(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Core::ComputeManagementClient#create_instance_pool} and then waits for the {OCI::Core::Models::InstancePool} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Core::Models::CreateInstancePoolDetails] create_instance_pool_details Instance pool creation details
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Core::Models::InstancePool#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Core::ComputeManagementClient#create_instance_pool}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Core::Models::InstancePool}
    def create_instance_pool_and_wait_for_state(create_instance_pool_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_instance_pool(create_instance_pool_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_instance_pool(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Core::ComputeManagementClient#detach_load_balancer} and then waits for the {OCI::Core::Models::InstancePool} acted upon
    # to enter the given state(s).
    #
    # @param [String] instance_pool_id The OCID of the instance pool.
    # @param [OCI::Core::Models::DetachLoadBalancerDetails] detach_load_balancer_details Load balancer being detached
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Core::Models::InstancePool#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Core::ComputeManagementClient#detach_load_balancer}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Core::Models::InstancePool}
    def detach_load_balancer_and_wait_for_state(instance_pool_id, detach_load_balancer_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.detach_load_balancer(instance_pool_id, detach_load_balancer_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_instance_pool(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Core::ComputeManagementClient#reset_instance_pool} and then waits for the {OCI::Core::Models::InstancePool} acted upon
    # to enter the given state(s).
    #
    # @param [String] instance_pool_id The OCID of the instance pool.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Core::Models::InstancePool#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Core::ComputeManagementClient#reset_instance_pool}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Core::Models::InstancePool}
    def reset_instance_pool_and_wait_for_state(instance_pool_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.reset_instance_pool(instance_pool_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_instance_pool(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Core::ComputeManagementClient#softreset_instance_pool} and then waits for the {OCI::Core::Models::InstancePool} acted upon
    # to enter the given state(s).
    #
    # @param [String] instance_pool_id The OCID of the instance pool.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Core::Models::InstancePool#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Core::ComputeManagementClient#softreset_instance_pool}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Core::Models::InstancePool}
    def softreset_instance_pool_and_wait_for_state(instance_pool_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.softreset_instance_pool(instance_pool_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_instance_pool(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Core::ComputeManagementClient#start_instance_pool} and then waits for the {OCI::Core::Models::InstancePool} acted upon
    # to enter the given state(s).
    #
    # @param [String] instance_pool_id The OCID of the instance pool.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Core::Models::InstancePool#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Core::ComputeManagementClient#start_instance_pool}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Core::Models::InstancePool}
    def start_instance_pool_and_wait_for_state(instance_pool_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.start_instance_pool(instance_pool_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_instance_pool(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Core::ComputeManagementClient#stop_instance_pool} and then waits for the {OCI::Core::Models::InstancePool} acted upon
    # to enter the given state(s).
    #
    # @param [String] instance_pool_id The OCID of the instance pool.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Core::Models::InstancePool#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Core::ComputeManagementClient#stop_instance_pool}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Core::Models::InstancePool}
    def stop_instance_pool_and_wait_for_state(instance_pool_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.stop_instance_pool(instance_pool_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_instance_pool(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Core::ComputeManagementClient#terminate_instance_pool} and then waits for the {OCI::Core::Models::InstancePool} acted upon
    # to enter the given state(s).
    #
    # @param [String] instance_pool_id The OCID of the instance pool.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Core::Models::InstancePool#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Core::ComputeManagementClient#terminate_instance_pool}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def terminate_instance_pool_and_wait_for_state(instance_pool_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_instance_pool(instance_pool_id)
      operation_result = @service_client.terminate_instance_pool(instance_pool_id, base_operation_opts)

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


    # Calls {OCI::Core::ComputeManagementClient#update_instance_pool} and then waits for the {OCI::Core::Models::InstancePool} acted upon
    # to enter the given state(s).
    #
    # @param [String] instance_pool_id The OCID of the instance pool.
    # @param [OCI::Core::Models::UpdateInstancePoolDetails] update_instance_pool_details Update instance pool configuration
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Core::Models::InstancePool#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Core::ComputeManagementClient#update_instance_pool}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Core::Models::InstancePool}
    def update_instance_pool_and_wait_for_state(instance_pool_id, update_instance_pool_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_instance_pool(instance_pool_id, update_instance_pool_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_instance_pool(wait_for_resource_id).wait_until(
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
