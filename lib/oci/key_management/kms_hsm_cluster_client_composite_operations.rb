# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: release

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::KeyManagement::KmsHsmClusterClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class KeyManagement::KmsHsmClusterClientCompositeOperations
    # The {OCI::KeyManagement::KmsHsmClusterClient} used to communicate with the service_client
    #
    # @return [OCI::KeyManagement::KmsHsmClusterClient]
    attr_reader :service_client

    # Initializes a new KmsHsmClusterClientCompositeOperations
    #
    # @param [OCI::KeyManagement::KmsHsmClusterClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::KeyManagement::KmsHsmClusterClient#initialize} with no arguments
    def initialize(service_client = OCI::KeyManagement::KmsHsmClusterClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::KeyManagement::KmsHsmClusterClient#cancel_hsm_cluster_deletion} and then waits for the {OCI::KeyManagement::Models::HsmCluster} acted upon
    # to enter the given state(s).
    #
    # @param [String] hsm_cluster_id The OCID of the HSM Cluster.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::KeyManagement::Models::HsmCluster#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::KeyManagement::KmsHsmClusterClient#cancel_hsm_cluster_deletion}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::KeyManagement::Models::HsmCluster}
    def cancel_hsm_cluster_deletion_and_wait_for_state(hsm_cluster_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.cancel_hsm_cluster_deletion(hsm_cluster_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_hsm_cluster(wait_for_resource_id).wait_until(
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


    # Calls {OCI::KeyManagement::KmsHsmClusterClient#create_hsm_cluster} and then waits for the {OCI::KeyManagement::Models::HsmCluster} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::KeyManagement::Models::CreateHsmClusterDetails] create_hsm_cluster_details Details for the new HsmCluster resource
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::KeyManagement::Models::HsmCluster#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::KeyManagement::KmsHsmClusterClient#create_hsm_cluster}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::KeyManagement::Models::HsmCluster}
    def create_hsm_cluster_and_wait_for_state(create_hsm_cluster_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_hsm_cluster(create_hsm_cluster_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_hsm_cluster(wait_for_resource_id).wait_until(
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


    # Calls {OCI::KeyManagement::KmsHsmClusterClient#schedule_hsm_cluster_deletion} and then waits for the {OCI::KeyManagement::Models::HsmCluster} acted upon
    # to enter the given state(s).
    #
    # @param [String] hsm_cluster_id The OCID of the HSM Cluster.
    # @param [OCI::KeyManagement::Models::ScheduleHsmClusterDeletionDetails] schedule_hsm_cluster_deletion_details Details of ScheduleHsmClusterDeletionDetails
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::KeyManagement::Models::HsmCluster#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::KeyManagement::KmsHsmClusterClient#schedule_hsm_cluster_deletion}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::KeyManagement::Models::HsmCluster}
    def schedule_hsm_cluster_deletion_and_wait_for_state(hsm_cluster_id, schedule_hsm_cluster_deletion_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.schedule_hsm_cluster_deletion(hsm_cluster_id, schedule_hsm_cluster_deletion_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_hsm_cluster(wait_for_resource_id).wait_until(
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


    # Calls {OCI::KeyManagement::KmsHsmClusterClient#update_hsm_cluster} and then waits for the {OCI::KeyManagement::Models::HsmCluster} acted upon
    # to enter the given state(s).
    #
    # @param [String] hsm_cluster_id The OCID of the HSM Cluster.
    # @param [OCI::KeyManagement::Models::UpdateHsmClusterDetails] update_hsm_cluster_details Details of the HsmCluster Resource
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::KeyManagement::Models::HsmCluster#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::KeyManagement::KmsHsmClusterClient#update_hsm_cluster}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::KeyManagement::Models::HsmCluster}
    def update_hsm_cluster_and_wait_for_state(hsm_cluster_id, update_hsm_cluster_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_hsm_cluster(hsm_cluster_id, update_hsm_cluster_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_hsm_cluster(wait_for_resource_id).wait_until(
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
