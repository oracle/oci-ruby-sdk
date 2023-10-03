# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: release

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::KeyManagement::EkmClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class KeyManagement::EkmClientCompositeOperations
    # The {OCI::KeyManagement::EkmClient} used to communicate with the service_client
    #
    # @return [OCI::KeyManagement::EkmClient]
    attr_reader :service_client

    # Initializes a new EkmClientCompositeOperations
    #
    # @param [OCI::KeyManagement::EkmClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::KeyManagement::EkmClient#initialize} with no arguments
    def initialize(service_client = OCI::KeyManagement::EkmClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::KeyManagement::EkmClient#create_ekms_private_endpoint} and then waits for the {OCI::KeyManagement::Models::EkmsPrivateEndpoint} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::KeyManagement::Models::CreateEkmsPrivateEndpointDetails] create_ekms_private_endpoint_details The information used to create EKMS private endpoint.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::KeyManagement::Models::EkmsPrivateEndpoint#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::KeyManagement::EkmClient#create_ekms_private_endpoint}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::KeyManagement::Models::EkmsPrivateEndpoint}
    def create_ekms_private_endpoint_and_wait_for_state(create_ekms_private_endpoint_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_ekms_private_endpoint(create_ekms_private_endpoint_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_ekms_private_endpoint(wait_for_resource_id).wait_until(
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


    # Calls {OCI::KeyManagement::EkmClient#delete_ekms_private_endpoint} and then waits for the {OCI::KeyManagement::Models::EkmsPrivateEndpoint} acted upon
    # to enter the given state(s).
    #
    # @param [String] ekms_private_endpoint_id Unique EKMS private endpoint identifier.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::KeyManagement::Models::EkmsPrivateEndpoint#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::KeyManagement::EkmClient#delete_ekms_private_endpoint}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_ekms_private_endpoint_and_wait_for_state(ekms_private_endpoint_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_ekms_private_endpoint(ekms_private_endpoint_id)
      operation_result = @service_client.delete_ekms_private_endpoint(ekms_private_endpoint_id, base_operation_opts)

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


    # Calls {OCI::KeyManagement::EkmClient#update_ekms_private_endpoint} and then waits for the {OCI::KeyManagement::Models::EkmsPrivateEndpoint} acted upon
    # to enter the given state(s).
    #
    # @param [String] ekms_private_endpoint_id Unique EKMS private endpoint identifier.
    # @param [OCI::KeyManagement::Models::UpdateEkmsPrivateEndpointDetails] update_ekms_private_endpoint_details The information to be updated in EKMS private endpoint
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::KeyManagement::Models::EkmsPrivateEndpoint#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::KeyManagement::EkmClient#update_ekms_private_endpoint}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::KeyManagement::Models::EkmsPrivateEndpoint}
    def update_ekms_private_endpoint_and_wait_for_state(ekms_private_endpoint_id, update_ekms_private_endpoint_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_ekms_private_endpoint(ekms_private_endpoint_id, update_ekms_private_endpoint_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_ekms_private_endpoint(wait_for_resource_id).wait_until(
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
