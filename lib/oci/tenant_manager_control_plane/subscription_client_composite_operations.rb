# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::TenantManagerControlPlane::SubscriptionClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class TenantManagerControlPlane::SubscriptionClientCompositeOperations
    # The {OCI::TenantManagerControlPlane::SubscriptionClient} used to communicate with the service_client
    #
    # @return [OCI::TenantManagerControlPlane::SubscriptionClient]
    attr_reader :service_client

    # Initializes a new SubscriptionClientCompositeOperations
    #
    # @param [OCI::TenantManagerControlPlane::SubscriptionClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::TenantManagerControlPlane::SubscriptionClient#initialize} with no arguments
    def initialize(service_client = OCI::TenantManagerControlPlane::SubscriptionClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::TenantManagerControlPlane::SubscriptionClient#create_subscription_mapping} and then waits for the {OCI::TenantManagerControlPlane::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::TenantManagerControlPlane::Models::CreateSubscriptionMappingDetails] create_subscription_mapping_details Compartment ID and Subscription ID details to create a subscription mapping.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::TenantManagerControlPlane::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::TenantManagerControlPlane::SubscriptionClient#create_subscription_mapping}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::TenantManagerControlPlane::Models::WorkRequest}
    def create_subscription_mapping_and_wait_for_state(create_subscription_mapping_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_subscription_mapping(create_subscription_mapping_details, base_operation_opts)
      use_util = OCI::TenantManagerControlPlane::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::TenantManagerControlPlane::Util.wait_on_work_request(
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


    # Calls {OCI::TenantManagerControlPlane::SubscriptionClient#delete_subscription_mapping} and then waits for the {OCI::TenantManagerControlPlane::Models::SubscriptionMapping} acted upon
    # to enter the given state(s).
    #
    # @param [String] subscription_mapping_id OCID of the subscription mapping ID.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::TenantManagerControlPlane::Models::SubscriptionMapping#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::TenantManagerControlPlane::SubscriptionClient#delete_subscription_mapping}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_subscription_mapping_and_wait_for_state(subscription_mapping_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_subscription_mapping(subscription_mapping_id)
      operation_result = @service_client.delete_subscription_mapping(subscription_mapping_id, base_operation_opts)

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
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
