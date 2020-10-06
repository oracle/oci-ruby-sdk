# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::LogAnalytics::LogAnalyticsClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class LogAnalytics::LogAnalyticsClientCompositeOperations
    # The {OCI::LogAnalytics::LogAnalyticsClient} used to communicate with the service_client
    #
    # @return [OCI::LogAnalytics::LogAnalyticsClient]
    attr_reader :service_client

    # Initializes a new LogAnalyticsClientCompositeOperations
    #
    # @param [OCI::LogAnalytics::LogAnalyticsClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::LogAnalytics::LogAnalyticsClient#initialize} with no arguments
    def initialize(service_client = OCI::LogAnalytics::LogAnalyticsClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::LogAnalytics::LogAnalyticsClient#create_log_analytics_entity} and then waits for the {OCI::LogAnalytics::Models::LogAnalyticsEntity} acted upon
    # to enter the given state(s).
    #
    # @param [String] namespace_name The Log Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::CreateLogAnalyticsEntityDetails] create_log_analytics_entity_details Details for the new log analytics entity.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LogAnalytics::Models::LogAnalyticsEntity#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LogAnalytics::LogAnalyticsClient#create_log_analytics_entity}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEntity}
    def create_log_analytics_entity_and_wait_for_state(namespace_name, create_log_analytics_entity_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_log_analytics_entity(namespace_name, create_log_analytics_entity_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_log_analytics_entity(wait_for_resource_id).wait_until(
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


    # Calls {OCI::LogAnalytics::LogAnalyticsClient#create_log_analytics_object_collection_rule} and then waits for the {OCI::LogAnalytics::Models::LogAnalyticsObjectCollectionRule} acted upon
    # to enter the given state(s).
    #
    # @param [String] namespace_name The Log Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::CreateLogAnalyticsObjectCollectionRuleDetails] create_log_analytics_object_collection_rule_details Details of the rule to be created.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LogAnalytics::Models::LogAnalyticsObjectCollectionRule#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LogAnalytics::LogAnalyticsClient#create_log_analytics_object_collection_rule}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::LogAnalytics::Models::LogAnalyticsObjectCollectionRule}
    def create_log_analytics_object_collection_rule_and_wait_for_state(namespace_name, create_log_analytics_object_collection_rule_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_log_analytics_object_collection_rule(namespace_name, create_log_analytics_object_collection_rule_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_log_analytics_object_collection_rule(wait_for_resource_id).wait_until(
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


    # Calls {OCI::LogAnalytics::LogAnalyticsClient#create_scheduled_task} and then waits for the {OCI::LogAnalytics::Models::ScheduledTask} acted upon
    # to enter the given state(s).
    #
    # @param [String] namespace_name The Log Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::CreateScheduledTaskDetails] create_scheduled_task_details Scheduled task to be created.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LogAnalytics::Models::ScheduledTask#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LogAnalytics::LogAnalyticsClient#create_scheduled_task}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::LogAnalytics::Models::ScheduledTask}
    def create_scheduled_task_and_wait_for_state(namespace_name, create_scheduled_task_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_scheduled_task(namespace_name, create_scheduled_task_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_scheduled_task(wait_for_resource_id).wait_until(
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


    # Calls {OCI::LogAnalytics::LogAnalyticsClient#offboard_namespace} and then waits for the {OCI::LogAnalytics::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] namespace_name The Log Analytics namespace used for the request.
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LogAnalytics::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LogAnalytics::LogAnalyticsClient#offboard_namespace}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LogAnalytics::Models::WorkRequest}
    def offboard_namespace_and_wait_for_state(namespace_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.offboard_namespace(namespace_name, base_operation_opts)
      use_util = OCI::LogAnalytics::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LogAnalytics::Util.wait_on_work_request(
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


    # Calls {OCI::LogAnalytics::LogAnalyticsClient#onboard_namespace} and then waits for the {OCI::LogAnalytics::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] namespace_name The Log Analytics namespace used for the request.
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LogAnalytics::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LogAnalytics::LogAnalyticsClient#onboard_namespace}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LogAnalytics::Models::WorkRequest}
    def onboard_namespace_and_wait_for_state(namespace_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.onboard_namespace(namespace_name, base_operation_opts)
      use_util = OCI::LogAnalytics::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LogAnalytics::Util.wait_on_work_request(
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


    # Calls {OCI::LogAnalytics::LogAnalyticsClient#purge_storage_data} and then waits for the {OCI::LogAnalytics::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] namespace_name The Log Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::PurgeStorageDataDetails] purge_storage_data_details purge old data request details
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LogAnalytics::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LogAnalytics::LogAnalyticsClient#purge_storage_data}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LogAnalytics::Models::WorkRequest}
    def purge_storage_data_and_wait_for_state(namespace_name, purge_storage_data_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.purge_storage_data(namespace_name, purge_storage_data_details, base_operation_opts)
      use_util = OCI::LogAnalytics::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LogAnalytics::Util.wait_on_work_request(
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


    # Calls {OCI::LogAnalytics::LogAnalyticsClient#query} and then waits for the {OCI::LogAnalytics::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] namespace_name The Log Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::QueryDetails] query_details Query to be executed.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LogAnalytics::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LogAnalytics::LogAnalyticsClient#query}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LogAnalytics::Models::WorkRequest}
    def query_and_wait_for_state(namespace_name, query_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.query(namespace_name, query_details, base_operation_opts)
      use_util = OCI::LogAnalytics::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LogAnalytics::Util.wait_on_work_request(
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


    # Calls {OCI::LogAnalytics::LogAnalyticsClient#recall_archived_data} and then waits for the {OCI::LogAnalytics::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] namespace_name The Log Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::RecallArchivedDataDetails] recall_archived_data_details recall archived data request details
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LogAnalytics::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LogAnalytics::LogAnalyticsClient#recall_archived_data}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LogAnalytics::Models::WorkRequest}
    def recall_archived_data_and_wait_for_state(namespace_name, recall_archived_data_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.recall_archived_data(namespace_name, recall_archived_data_details, base_operation_opts)
      use_util = OCI::LogAnalytics::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LogAnalytics::Util.wait_on_work_request(
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


    # Calls {OCI::LogAnalytics::LogAnalyticsClient#release_recalled_data} and then waits for the {OCI::LogAnalytics::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] namespace_name The Log Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::ReleaseRecalledDataDetails] release_recalled_data_details release recalled data request details
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LogAnalytics::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LogAnalytics::LogAnalyticsClient#release_recalled_data}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LogAnalytics::Models::WorkRequest}
    def release_recalled_data_and_wait_for_state(namespace_name, release_recalled_data_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.release_recalled_data(namespace_name, release_recalled_data_details, base_operation_opts)
      use_util = OCI::LogAnalytics::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LogAnalytics::Util.wait_on_work_request(
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


    # Calls {OCI::LogAnalytics::LogAnalyticsClient#update_log_analytics_entity} and then waits for the {OCI::LogAnalytics::Models::LogAnalyticsEntity} acted upon
    # to enter the given state(s).
    #
    # @param [String] namespace_name The Log Analytics namespace used for the request.
    #
    # @param [String] log_analytics_entity_id The log analytics entity OCID.
    #
    # @param [OCI::LogAnalytics::Models::UpdateLogAnalyticsEntityDetails] update_log_analytics_entity_details The information to be updated.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LogAnalytics::Models::LogAnalyticsEntity#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LogAnalytics::LogAnalyticsClient#update_log_analytics_entity}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEntity}
    def update_log_analytics_entity_and_wait_for_state(namespace_name, log_analytics_entity_id, update_log_analytics_entity_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_log_analytics_entity(namespace_name, log_analytics_entity_id, update_log_analytics_entity_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_log_analytics_entity(wait_for_resource_id).wait_until(
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


    # Calls {OCI::LogAnalytics::LogAnalyticsClient#update_log_analytics_object_collection_rule} and then waits for the {OCI::LogAnalytics::Models::LogAnalyticsObjectCollectionRule} acted upon
    # to enter the given state(s).
    #
    # @param [String] namespace_name The Log Analytics namespace used for the request.
    #
    # @param [String] log_analytics_object_collection_rule_id The log analytics os collection rule [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm)
    # @param [OCI::LogAnalytics::Models::UpdateLogAnalyticsObjectCollectionRuleDetails] update_log_analytics_object_collection_rule_details The rule config to be updated.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LogAnalytics::Models::LogAnalyticsObjectCollectionRule#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LogAnalytics::LogAnalyticsClient#update_log_analytics_object_collection_rule}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::LogAnalytics::Models::LogAnalyticsObjectCollectionRule}
    def update_log_analytics_object_collection_rule_and_wait_for_state(namespace_name, log_analytics_object_collection_rule_id, update_log_analytics_object_collection_rule_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_log_analytics_object_collection_rule(namespace_name, log_analytics_object_collection_rule_id, update_log_analytics_object_collection_rule_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_log_analytics_object_collection_rule(wait_for_resource_id).wait_until(
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


    # Calls {OCI::LogAnalytics::LogAnalyticsClient#update_scheduled_task} and then waits for the {OCI::LogAnalytics::Models::ScheduledTask} acted upon
    # to enter the given state(s).
    #
    # @param [String] namespace_name The Log Analytics namespace used for the request.
    #
    # @param [String] scheduled_task_id Unique scheduledTask id returned from task create.
    #   If invalid will lead to a 404 not found.
    #
    # @param [OCI::LogAnalytics::Models::UpdateScheduledTaskDetails] update_scheduled_task_details Update details.
    #   Schedules may be updated only for taskType SAVED_SEARCH and PURGE.
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LogAnalytics::Models::ScheduledTask#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LogAnalytics::LogAnalyticsClient#update_scheduled_task}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::LogAnalytics::Models::ScheduledTask}
    def update_scheduled_task_and_wait_for_state(namespace_name, scheduled_task_id, update_scheduled_task_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_scheduled_task(namespace_name, scheduled_task_id, update_scheduled_task_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_scheduled_task(wait_for_resource_id).wait_until(
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


    # Calls {OCI::LogAnalytics::LogAnalyticsClient#upsert_associations} and then waits for the {OCI::LogAnalytics::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] namespace_name The Log Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::UpsertLogAnalyticsAssociationDetails] upsert_log_analytics_association_details list of association details
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LogAnalytics::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LogAnalytics::LogAnalyticsClient#upsert_associations}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::LogAnalytics::Models::WorkRequest}
    def upsert_associations_and_wait_for_state(namespace_name, upsert_log_analytics_association_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.upsert_associations(namespace_name, upsert_log_analytics_association_details, base_operation_opts)
      use_util = OCI::LogAnalytics::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::LogAnalytics::Util.wait_on_work_request(
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
