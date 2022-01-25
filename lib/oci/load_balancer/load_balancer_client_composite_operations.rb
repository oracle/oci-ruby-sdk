# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::LoadBalancer::LoadBalancerClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class LoadBalancer::LoadBalancerClientCompositeOperations
    # The {OCI::LoadBalancer::LoadBalancerClient} used to communicate with the service_client
    #
    # @return [OCI::LoadBalancer::LoadBalancerClient]
    attr_reader :service_client

    # Initializes a new LoadBalancerClientCompositeOperations
    #
    # @param [OCI::LoadBalancer::LoadBalancerClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::LoadBalancer::LoadBalancerClient#initialize} with no arguments
    def initialize(service_client = OCI::LoadBalancer::LoadBalancerClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::LoadBalancer::LoadBalancerClient#change_load_balancer_compartment} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the load balancer to move.
    # @param [OCI::LoadBalancer::Models::ChangeLoadBalancerCompartmentDetails] change_load_balancer_compartment_details The configuration details for moving a load balancer to a different compartment.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#change_load_balancer_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def change_load_balancer_compartment_and_wait_for_state(load_balancer_id, change_load_balancer_compartment_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_load_balancer_compartment(load_balancer_id, change_load_balancer_compartment_details, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#create_backend} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::LoadBalancer::Models::CreateBackendDetails] create_backend_details The details to add a backend server to a backend set.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the backend set and servers.
    # @param [String] backend_set_name The name of the backend set to add the backend server to.
    #
    #   Example: `example_backend_set`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#create_backend}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def create_backend_and_wait_for_state(create_backend_details, load_balancer_id, backend_set_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_backend(create_backend_details, load_balancer_id, backend_set_name, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#create_backend_set} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::LoadBalancer::Models::CreateBackendSetDetails] create_backend_set_details The details for adding a backend set.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer on which to add a backend set.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#create_backend_set}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def create_backend_set_and_wait_for_state(create_backend_set_details, load_balancer_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_backend_set(create_backend_set_details, load_balancer_id, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#create_certificate} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::LoadBalancer::Models::CreateCertificateDetails] create_certificate_details The details of the certificate bundle to add.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer on which to add the certificate bundle.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#create_certificate}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def create_certificate_and_wait_for_state(create_certificate_details, load_balancer_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_certificate(create_certificate_details, load_balancer_id, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#create_hostname} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::LoadBalancer::Models::CreateHostnameDetails] create_hostname_details The details of the hostname resource to add to the specified load balancer.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer to add the hostname to.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#create_hostname}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def create_hostname_and_wait_for_state(create_hostname_details, load_balancer_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_hostname(create_hostname_details, load_balancer_id, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#create_listener} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::LoadBalancer::Models::CreateListenerDetails] create_listener_details Details to add a listener.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer on which to add a listener.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#create_listener}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def create_listener_and_wait_for_state(create_listener_details, load_balancer_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_listener(create_listener_details, load_balancer_id, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#create_load_balancer} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::LoadBalancer::Models::CreateLoadBalancerDetails] create_load_balancer_details The configuration details for creating a load balancer.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#create_load_balancer}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::LoadBalancer::Models::LoadBalancer}
    def create_load_balancer_and_wait_for_state(create_load_balancer_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_load_balancer(create_load_balancer_details, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        end
        result_to_return = @service_client.get_load_balancer(waiter_result.data.load_balancer_id)

        return result_to_return
      rescue StandardError
        raise OCI::Errors::CompositeOperationError.new(partial_results: [operation_result])
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:enable Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::LoadBalancer::LoadBalancerClient#create_path_route_set} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::LoadBalancer::Models::CreatePathRouteSetDetails] create_path_route_set_details The details of the path route set to add.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer to add the path route set to.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#create_path_route_set}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def create_path_route_set_and_wait_for_state(create_path_route_set_details, load_balancer_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_path_route_set(create_path_route_set_details, load_balancer_id, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#create_routing_policy} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::LoadBalancer::Models::CreateRoutingPolicyDetails] create_routing_policy_details The details of the routing policy rules to add.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer to add the routing policy rule list to.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#create_routing_policy}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def create_routing_policy_and_wait_for_state(create_routing_policy_details, load_balancer_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_routing_policy(create_routing_policy_details, load_balancer_id, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#create_rule_set} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the specified load balancer.
    # @param [OCI::LoadBalancer::Models::CreateRuleSetDetails] create_rule_set_details The configuration details for the rule set to create.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#create_rule_set}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def create_rule_set_and_wait_for_state(load_balancer_id, create_rule_set_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_rule_set(load_balancer_id, create_rule_set_details, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#create_ssl_cipher_suite} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::LoadBalancer::Models::CreateSSLCipherSuiteDetails] create_ssl_cipher_suite_details The details of the SSL cipher suite to add.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the associated load balancer.
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#create_ssl_cipher_suite}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def create_ssl_cipher_suite_and_wait_for_state(create_ssl_cipher_suite_details, load_balancer_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_ssl_cipher_suite(create_ssl_cipher_suite_details, load_balancer_id, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#delete_backend} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the backend set and server.
    # @param [String] backend_set_name The name of the backend set associated with the backend server.
    #
    #   Example: `example_backend_set`
    #
    # @param [String] backend_name The IP address and port of the backend server to remove.
    #
    #   Example: `10.0.0.3:8080`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#delete_backend}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def delete_backend_and_wait_for_state(load_balancer_id, backend_set_name, backend_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_backend(load_balancer_id, backend_set_name, backend_name, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#delete_backend_set} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the backend set.
    # @param [String] backend_set_name The name of the backend set to delete.
    #
    #   Example: `example_backend_set`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#delete_backend_set}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def delete_backend_set_and_wait_for_state(load_balancer_id, backend_set_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_backend_set(load_balancer_id, backend_set_name, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#delete_certificate} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the certificate bundle
    #   to be deleted.
    #
    # @param [String] certificate_name The name of the certificate bundle to delete.
    #
    #   Example: `example_certificate_bundle`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#delete_certificate}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def delete_certificate_and_wait_for_state(load_balancer_id, certificate_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_certificate(load_balancer_id, certificate_name, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#delete_hostname} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the hostname to delete.
    # @param [String] name The name of the hostname resource to delete.
    #
    #   Example: `example_hostname_001`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#delete_hostname}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def delete_hostname_and_wait_for_state(load_balancer_id, name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_hostname(load_balancer_id, name, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#delete_listener} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the listener to delete.
    # @param [String] listener_name The name of the listener to delete.
    #
    #   Example: `example_listener`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#delete_listener}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def delete_listener_and_wait_for_state(load_balancer_id, listener_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_listener(load_balancer_id, listener_name, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#delete_load_balancer} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer to delete.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#delete_load_balancer}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def delete_load_balancer_and_wait_for_state(load_balancer_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_load_balancer(load_balancer_id, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#delete_path_route_set} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the path route set to delete.
    # @param [String] path_route_set_name The name of the path route set to delete.
    #
    #   Example: `example_path_route_set`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#delete_path_route_set}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def delete_path_route_set_and_wait_for_state(load_balancer_id, path_route_set_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_path_route_set(load_balancer_id, path_route_set_name, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#delete_routing_policy} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the routing policy to delete.
    # @param [String] routing_policy_name The name of the routing policy to delete.
    #
    #   Example: `example_routing_policy`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#delete_routing_policy}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def delete_routing_policy_and_wait_for_state(load_balancer_id, routing_policy_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_routing_policy(load_balancer_id, routing_policy_name, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#delete_rule_set} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the specified load balancer.
    # @param [String] rule_set_name The name of the rule set to delete.
    #
    #   Example: `example_rule_set`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#delete_rule_set}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def delete_rule_set_and_wait_for_state(load_balancer_id, rule_set_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_rule_set(load_balancer_id, rule_set_name, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#delete_ssl_cipher_suite} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the associated load balancer.
    #
    # @param [String] name The name of the SSL cipher suite to delete.
    #
    #   example: `example_cipher_suite`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#delete_ssl_cipher_suite}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def delete_ssl_cipher_suite_and_wait_for_state(load_balancer_id, name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_ssl_cipher_suite(load_balancer_id, name, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#update_backend} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::LoadBalancer::Models::UpdateBackendDetails] update_backend_details Details for updating a backend server.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the backend set and server.
    # @param [String] backend_set_name The name of the backend set associated with the backend server.
    #
    #   Example: `example_backend_set`
    #
    # @param [String] backend_name The IP address and port of the backend server to update.
    #
    #   Example: `10.0.0.3:8080`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#update_backend}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def update_backend_and_wait_for_state(update_backend_details, load_balancer_id, backend_set_name, backend_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_backend(update_backend_details, load_balancer_id, backend_set_name, backend_name, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#update_backend_set} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::LoadBalancer::Models::UpdateBackendSetDetails] update_backend_set_details The details to update a backend set.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the backend set.
    # @param [String] backend_set_name The name of the backend set to update.
    #
    #   Example: `example_backend_set`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#update_backend_set}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def update_backend_set_and_wait_for_state(update_backend_set_details, load_balancer_id, backend_set_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_backend_set(update_backend_set_details, load_balancer_id, backend_set_name, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#update_health_checker} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::LoadBalancer::Models::UpdateHealthCheckerDetails] health_checker The health check policy configuration details.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the health check policy to be updated.
    # @param [String] backend_set_name The name of the backend set associated with the health check policy to be retrieved.
    #
    #   Example: `example_backend_set`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#update_health_checker}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def update_health_checker_and_wait_for_state(health_checker, load_balancer_id, backend_set_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_health_checker(health_checker, load_balancer_id, backend_set_name, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#update_hostname} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::LoadBalancer::Models::UpdateHostnameDetails] update_hostname_details The configuration details to update a virtual hostname.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the virtual hostname
    #   to update.
    #
    # @param [String] name The name of the hostname resource to update.
    #
    #   Example: `example_hostname_001`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#update_hostname}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def update_hostname_and_wait_for_state(update_hostname_details, load_balancer_id, name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_hostname(update_hostname_details, load_balancer_id, name, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#update_listener} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::LoadBalancer::Models::UpdateListenerDetails] update_listener_details Details to update a listener.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the listener to update.
    # @param [String] listener_name The name of the listener to update.
    #
    #   Example: `example_listener`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#update_listener}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def update_listener_and_wait_for_state(update_listener_details, load_balancer_id, listener_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_listener(update_listener_details, load_balancer_id, listener_name, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#update_load_balancer} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::LoadBalancer::Models::UpdateLoadBalancerDetails] update_load_balancer_details The details for updating a load balancer's configuration.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer to update.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#update_load_balancer}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::LoadBalancer::Models::LoadBalancer}
    def update_load_balancer_and_wait_for_state(update_load_balancer_details, load_balancer_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_load_balancer(update_load_balancer_details, load_balancer_id, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        end
        result_to_return = @service_client.get_load_balancer(waiter_result.data.load_balancer_id)

        return result_to_return
      rescue StandardError
        raise OCI::Errors::CompositeOperationError.new(partial_results: [operation_result])
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:enable Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::LoadBalancer::LoadBalancerClient#update_load_balancer_shape} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the load balancer whose shape will be updated.
    # @param [OCI::LoadBalancer::Models::UpdateLoadBalancerShapeDetails] update_load_balancer_shape_details The details for updating a load balancer's shape. This contains the new, desired shape.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#update_load_balancer_shape}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def update_load_balancer_shape_and_wait_for_state(load_balancer_id, update_load_balancer_shape_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_load_balancer_shape(load_balancer_id, update_load_balancer_shape_details, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#update_network_security_groups} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::LoadBalancer::Models::UpdateNetworkSecurityGroupsDetails] update_network_security_groups_details The details for updating the NSGs associated with the specified load balancer.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer to update the NSGs for.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#update_network_security_groups}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def update_network_security_groups_and_wait_for_state(update_network_security_groups_details, load_balancer_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_network_security_groups(update_network_security_groups_details, load_balancer_id, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#update_path_route_set} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::LoadBalancer::Models::UpdatePathRouteSetDetails] update_path_route_set_details The configuration details to update a path route set.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the path route set to update.
    # @param [String] path_route_set_name The name of the path route set to update.
    #
    #   Example: `example_path_route_set`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#update_path_route_set}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def update_path_route_set_and_wait_for_state(update_path_route_set_details, load_balancer_id, path_route_set_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_path_route_set(update_path_route_set_details, load_balancer_id, path_route_set_name, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#update_routing_policy} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::LoadBalancer::Models::UpdateRoutingPolicyDetails] update_routing_policy_details The configuration details needed to update a routing policy.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the routing policy to update.
    # @param [String] routing_policy_name The name of the routing policy to update.
    #
    #   Example: `example_routing_policy_name`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#update_routing_policy}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def update_routing_policy_and_wait_for_state(update_routing_policy_details, load_balancer_id, routing_policy_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_routing_policy(update_routing_policy_details, load_balancer_id, routing_policy_name, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#update_rule_set} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the specified load balancer.
    # @param [String] rule_set_name The name of the rule set to update.
    #
    #   Example: `example_rule_set`
    #
    # @param [OCI::LoadBalancer::Models::UpdateRuleSetDetails] update_rule_set_details The configuration details to update a set of rules.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#update_rule_set}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def update_rule_set_and_wait_for_state(load_balancer_id, rule_set_name, update_rule_set_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_rule_set(load_balancer_id, rule_set_name, update_rule_set_details, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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


    # Calls {OCI::LoadBalancer::LoadBalancerClient#update_ssl_cipher_suite} and then waits for the {OCI::LoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::LoadBalancer::Models::UpdateSSLCipherSuiteDetails] update_ssl_cipher_suite_details The configuration details to update an SSL cipher suite.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the associated load balancer.
    #
    # @param [String] name The name of the SSL cipher suite to update.
    #
    #   example: `example_cipher_suite`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LoadBalancer::Models::WorkRequest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LoadBalancer::LoadBalancerClient#update_ssl_cipher_suite}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LoadBalancer::Models::WorkRequest}
    def update_ssl_cipher_suite_and_wait_for_state(update_ssl_cipher_suite_details, load_balancer_id, name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_ssl_cipher_suite(update_ssl_cipher_suite_details, load_balancer_id, name, base_operation_opts)
      use_util = OCI::LoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LoadBalancer::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
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
