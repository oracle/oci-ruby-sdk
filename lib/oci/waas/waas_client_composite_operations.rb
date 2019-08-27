# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::Waas::WaasClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class Waas::WaasClientCompositeOperations
    # The {OCI::Waas::WaasClient} used to communicate with the service_client
    #
    # @return [OCI::Waas::WaasClient]
    attr_reader :service_client

    # Initializes a new WaasClientCompositeOperations
    #
    # @param [OCI::Waas::WaasClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::Waas::WaasClient#initialize} with no arguments
    def initialize(service_client = OCI::Waas::WaasClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::Waas::WaasClient#accept_recommendations} and then waits for the {OCI::Waas::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Array<String>] protection_rule_keys
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#accept_recommendations}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Waas::Models::WorkRequest}
    def accept_recommendations_and_wait_for_state(waas_policy_id, protection_rule_keys, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.accept_recommendations(waas_policy_id, protection_rule_keys, base_operation_opts)
      use_util = OCI::Waas::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Waas::Util.wait_on_work_request(
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


    # Calls {OCI::Waas::WaasClient#create_address_list} and then waits for the {OCI::Waas::Models::AddressList} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Waas::Models::CreateAddressListDetails] create_address_list_details The details of the address list resource to create.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::AddressList#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#create_address_list}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Waas::Models::AddressList}
    def create_address_list_and_wait_for_state(create_address_list_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_address_list(create_address_list_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_address_list(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Waas::WaasClient#create_certificate} and then waits for the {OCI::Waas::Models::Certificate} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Waas::Models::CreateCertificateDetails] create_certificate_details The details of the SSL certificate resource to create.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::Certificate#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#create_certificate}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Waas::Models::Certificate}
    def create_certificate_and_wait_for_state(create_certificate_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_certificate(create_certificate_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_certificate(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Waas::WaasClient#create_custom_protection_rule} and then waits for the {OCI::Waas::Models::CustomProtectionRule} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Waas::Models::CreateCustomProtectionRuleDetails] create_custom_protection_rule_details The details of the Custom Protection rule.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::CustomProtectionRule#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#create_custom_protection_rule}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Waas::Models::CustomProtectionRule}
    def create_custom_protection_rule_and_wait_for_state(create_custom_protection_rule_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_custom_protection_rule(create_custom_protection_rule_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_custom_protection_rule(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Waas::WaasClient#create_waas_policy} and then waits for the {OCI::Waas::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::Waas::Models::CreateWaasPolicyDetails] create_waas_policy_details The details of the WAAS policy.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#create_waas_policy}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Waas::Models::WorkRequest}
    def create_waas_policy_and_wait_for_state(create_waas_policy_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_waas_policy(create_waas_policy_details, base_operation_opts)
      use_util = OCI::Waas::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Waas::Util.wait_on_work_request(
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


    # Calls {OCI::Waas::WaasClient#delete_address_list} and then waits for the {OCI::Waas::Models::AddressList} acted upon
    # to enter the given state(s).
    #
    # @param [String] address_list_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the address list. This number is generated when the address list is added to the compartment.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::AddressList#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#delete_address_list}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_address_list_and_wait_for_state(address_list_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_address_list(address_list_id)
      operation_result = @service_client.delete_address_list(address_list_id, base_operation_opts)

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


    # Calls {OCI::Waas::WaasClient#delete_certificate} and then waits for the {OCI::Waas::Models::Certificate} acted upon
    # to enter the given state(s).
    #
    # @param [String] certificate_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the SSL certificate used in the WAAS policy. This number is generated when the certificate is added to the policy.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::Certificate#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#delete_certificate}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_certificate_and_wait_for_state(certificate_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_certificate(certificate_id)
      operation_result = @service_client.delete_certificate(certificate_id, base_operation_opts)

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


    # Calls {OCI::Waas::WaasClient#delete_custom_protection_rule} and then waits for the {OCI::Waas::Models::CustomProtectionRule} acted upon
    # to enter the given state(s).
    #
    # @param [String] custom_protection_rule_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Custom Protection rule. This number is generated when the Custom Protection rule is added to the compartment.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::CustomProtectionRule#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#delete_custom_protection_rule}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_custom_protection_rule_and_wait_for_state(custom_protection_rule_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_custom_protection_rule(custom_protection_rule_id)
      operation_result = @service_client.delete_custom_protection_rule(custom_protection_rule_id, base_operation_opts)

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


    # Calls {OCI::Waas::WaasClient#delete_waas_policy} and then waits for the {OCI::Waas::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#delete_waas_policy}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Waas::Models::WorkRequest}
    def delete_waas_policy_and_wait_for_state(waas_policy_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_waas_policy(waas_policy_id, base_operation_opts)
      use_util = OCI::Waas::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Waas::Util.wait_on_work_request(
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


    # Calls {OCI::Waas::WaasClient#purge_cache} and then waits for the {OCI::Waas::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#purge_cache}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Waas::Models::WorkRequest}
    def purge_cache_and_wait_for_state(waas_policy_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.purge_cache(waas_policy_id, base_operation_opts)
      use_util = OCI::Waas::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Waas::Util.wait_on_work_request(
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


    # Calls {OCI::Waas::WaasClient#update_access_rules} and then waits for the {OCI::Waas::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Array<OCI::Waas::Models::OCI::Waas::Models::AccessRule>] access_rules
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#update_access_rules}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Waas::Models::WorkRequest}
    def update_access_rules_and_wait_for_state(waas_policy_id, access_rules, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_access_rules(waas_policy_id, access_rules, base_operation_opts)
      use_util = OCI::Waas::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Waas::Util.wait_on_work_request(
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


    # Calls {OCI::Waas::WaasClient#update_address_list} and then waits for the {OCI::Waas::Models::AddressList} acted upon
    # to enter the given state(s).
    #
    # @param [String] address_list_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the address list. This number is generated when the address list is added to the compartment.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::AddressList#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#update_address_list}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Waas::Models::AddressList}
    def update_address_list_and_wait_for_state(address_list_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_address_list(address_list_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_address_list(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Waas::WaasClient#update_caching_rules} and then waits for the {OCI::Waas::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Array<OCI::Waas::Models::OCI::Waas::Models::CachingRule>] caching_rules_details
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#update_caching_rules}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Waas::Models::WorkRequest}
    def update_caching_rules_and_wait_for_state(waas_policy_id, caching_rules_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_caching_rules(waas_policy_id, caching_rules_details, base_operation_opts)
      use_util = OCI::Waas::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Waas::Util.wait_on_work_request(
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


    # Calls {OCI::Waas::WaasClient#update_captchas} and then waits for the {OCI::Waas::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Array<OCI::Waas::Models::OCI::Waas::Models::Captcha>] captchas A list of CAPTCHA details.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#update_captchas}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Waas::Models::WorkRequest}
    def update_captchas_and_wait_for_state(waas_policy_id, captchas, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_captchas(waas_policy_id, captchas, base_operation_opts)
      use_util = OCI::Waas::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Waas::Util.wait_on_work_request(
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


    # Calls {OCI::Waas::WaasClient#update_certificate} and then waits for the {OCI::Waas::Models::Certificate} acted upon
    # to enter the given state(s).
    #
    # @param [String] certificate_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the SSL certificate used in the WAAS policy. This number is generated when the certificate is added to the policy.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::Certificate#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#update_certificate}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Waas::Models::Certificate}
    def update_certificate_and_wait_for_state(certificate_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_certificate(certificate_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_certificate(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Waas::WaasClient#update_custom_protection_rule} and then waits for the {OCI::Waas::Models::CustomProtectionRule} acted upon
    # to enter the given state(s).
    #
    # @param [String] custom_protection_rule_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Custom Protection rule. This number is generated when the Custom Protection rule is added to the compartment.
    # @param [OCI::Waas::Models::UpdateCustomProtectionRuleDetails] update_custom_protection_rule_details The details of the Custom Protection rule to update.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::CustomProtectionRule#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#update_custom_protection_rule}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Waas::Models::CustomProtectionRule}
    def update_custom_protection_rule_and_wait_for_state(custom_protection_rule_id, update_custom_protection_rule_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_custom_protection_rule(custom_protection_rule_id, update_custom_protection_rule_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_custom_protection_rule(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Waas::WaasClient#update_device_fingerprint_challenge} and then waits for the {OCI::Waas::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [OCI::Waas::Models::DeviceFingerprintChallenge] update_device_fingerprint_challenge_details The device fingerprint challenge settings to be updated.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#update_device_fingerprint_challenge}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Waas::Models::WorkRequest}
    def update_device_fingerprint_challenge_and_wait_for_state(waas_policy_id, update_device_fingerprint_challenge_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_device_fingerprint_challenge(waas_policy_id, update_device_fingerprint_challenge_details, base_operation_opts)
      use_util = OCI::Waas::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Waas::Util.wait_on_work_request(
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


    # Calls {OCI::Waas::WaasClient#update_good_bots} and then waits for the {OCI::Waas::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Array<OCI::Waas::Models::OCI::Waas::Models::GoodBot>] good_bots
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#update_good_bots}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Waas::Models::WorkRequest}
    def update_good_bots_and_wait_for_state(waas_policy_id, good_bots, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_good_bots(waas_policy_id, good_bots, base_operation_opts)
      use_util = OCI::Waas::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Waas::Util.wait_on_work_request(
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


    # Calls {OCI::Waas::WaasClient#update_human_interaction_challenge} and then waits for the {OCI::Waas::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [OCI::Waas::Models::HumanInteractionChallenge] update_human_interaction_challenge_details The human interaction challenge settings.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#update_human_interaction_challenge}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Waas::Models::WorkRequest}
    def update_human_interaction_challenge_and_wait_for_state(waas_policy_id, update_human_interaction_challenge_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_human_interaction_challenge(waas_policy_id, update_human_interaction_challenge_details, base_operation_opts)
      use_util = OCI::Waas::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Waas::Util.wait_on_work_request(
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


    # Calls {OCI::Waas::WaasClient#update_js_challenge} and then waits for the {OCI::Waas::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [OCI::Waas::Models::JsChallenge] update_js_challenge_details The JavaScript challenge settings to be updated.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#update_js_challenge}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Waas::Models::WorkRequest}
    def update_js_challenge_and_wait_for_state(waas_policy_id, update_js_challenge_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_js_challenge(waas_policy_id, update_js_challenge_details, base_operation_opts)
      use_util = OCI::Waas::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Waas::Util.wait_on_work_request(
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


    # Calls {OCI::Waas::WaasClient#update_policy_config} and then waits for the {OCI::Waas::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [OCI::Waas::Models::PolicyConfig] update_policy_config_details The new configuration to apply to a WAAS policy.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#update_policy_config}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Waas::Models::WorkRequest}
    def update_policy_config_and_wait_for_state(waas_policy_id, update_policy_config_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_policy_config(waas_policy_id, update_policy_config_details, base_operation_opts)
      use_util = OCI::Waas::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Waas::Util.wait_on_work_request(
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


    # Calls {OCI::Waas::WaasClient#update_protection_rules} and then waits for the {OCI::Waas::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Array<OCI::Waas::Models::OCI::Waas::Models::ProtectionRuleAction>] protection_rules
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#update_protection_rules}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Waas::Models::WorkRequest}
    def update_protection_rules_and_wait_for_state(waas_policy_id, protection_rules, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_protection_rules(waas_policy_id, protection_rules, base_operation_opts)
      use_util = OCI::Waas::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Waas::Util.wait_on_work_request(
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


    # Calls {OCI::Waas::WaasClient#update_protection_settings} and then waits for the {OCI::Waas::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [OCI::Waas::Models::ProtectionSettings] update_protection_settings_details The details of the protection settings to be updated.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#update_protection_settings}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Waas::Models::WorkRequest}
    def update_protection_settings_and_wait_for_state(waas_policy_id, update_protection_settings_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_protection_settings(waas_policy_id, update_protection_settings_details, base_operation_opts)
      use_util = OCI::Waas::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Waas::Util.wait_on_work_request(
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


    # Calls {OCI::Waas::WaasClient#update_threat_feeds} and then waits for the {OCI::Waas::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Array<OCI::Waas::Models::OCI::Waas::Models::ThreatFeedAction>] threat_feeds A list of threat feeds for which to update the actions.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#update_threat_feeds}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Waas::Models::WorkRequest}
    def update_threat_feeds_and_wait_for_state(waas_policy_id, threat_feeds, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_threat_feeds(waas_policy_id, threat_feeds, base_operation_opts)
      use_util = OCI::Waas::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Waas::Util.wait_on_work_request(
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


    # Calls {OCI::Waas::WaasClient#update_waas_policy} and then waits for the {OCI::Waas::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [OCI::Waas::Models::UpdateWaasPolicyDetails] update_waas_policy_details The details of the WAAS policy to update.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#update_waas_policy}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Waas::Models::WorkRequest}
    def update_waas_policy_and_wait_for_state(waas_policy_id, update_waas_policy_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_waas_policy(waas_policy_id, update_waas_policy_details, base_operation_opts)
      use_util = OCI::Waas::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Waas::Util.wait_on_work_request(
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


    # Calls {OCI::Waas::WaasClient#update_waas_policy_custom_protection_rules} and then waits for the {OCI::Waas::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Array<OCI::Waas::Models::OCI::Waas::Models::CustomProtectionRuleSetting>] update_custom_protection_rules_details
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#update_waas_policy_custom_protection_rules}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Waas::Models::WorkRequest}
    def update_waas_policy_custom_protection_rules_and_wait_for_state(waas_policy_id, update_custom_protection_rules_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_waas_policy_custom_protection_rules(waas_policy_id, update_custom_protection_rules_details, base_operation_opts)
      use_util = OCI::Waas::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Waas::Util.wait_on_work_request(
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


    # Calls {OCI::Waas::WaasClient#update_waf_address_rate_limiting} and then waits for the {OCI::Waas::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [OCI::Waas::Models::AddressRateLimiting] update_waf_address_rate_limiting_details The address rate limiting settings.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#update_waf_address_rate_limiting}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Waas::Models::WorkRequest}
    def update_waf_address_rate_limiting_and_wait_for_state(waas_policy_id, update_waf_address_rate_limiting_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_waf_address_rate_limiting(waas_policy_id, update_waf_address_rate_limiting_details, base_operation_opts)
      use_util = OCI::Waas::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Waas::Util.wait_on_work_request(
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


    # Calls {OCI::Waas::WaasClient#update_waf_config} and then waits for the {OCI::Waas::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [OCI::Waas::Models::WafConfig] update_waf_config_details The new Web Application Firewall configuration to apply to a WAAS policy.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#update_waf_config}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Waas::Models::WorkRequest}
    def update_waf_config_and_wait_for_state(waas_policy_id, update_waf_config_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_waf_config(waas_policy_id, update_waf_config_details, base_operation_opts)
      use_util = OCI::Waas::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Waas::Util.wait_on_work_request(
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


    # Calls {OCI::Waas::WaasClient#update_whitelists} and then waits for the {OCI::Waas::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Array<OCI::Waas::Models::OCI::Waas::Models::Whitelist>] whitelists
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Waas::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Waas::WaasClient#update_whitelists}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Waas::Models::WorkRequest}
    def update_whitelists_and_wait_for_state(waas_policy_id, whitelists, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_whitelists(waas_policy_id, whitelists, base_operation_opts)
      use_util = OCI::Waas::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Waas::Util.wait_on_work_request(
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
