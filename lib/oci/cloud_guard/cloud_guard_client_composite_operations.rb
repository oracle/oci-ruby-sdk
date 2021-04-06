# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::CloudGuard::CloudGuardClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class CloudGuard::CloudGuardClientCompositeOperations
    # The {OCI::CloudGuard::CloudGuardClient} used to communicate with the service_client
    #
    # @return [OCI::CloudGuard::CloudGuardClient]
    attr_reader :service_client

    # Initializes a new CloudGuardClientCompositeOperations
    #
    # @param [OCI::CloudGuard::CloudGuardClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::CloudGuard::CloudGuardClient#initialize} with no arguments
    def initialize(service_client = OCI::CloudGuard::CloudGuardClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::CloudGuard::CloudGuardClient#create_detector_recipe} and then waits for the {OCI::CloudGuard::Models::DetectorRecipe} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::CloudGuard::Models::CreateDetectorRecipeDetails] create_detector_recipe_details Details for the new DetectorRecipe.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::CloudGuard::Models::DetectorRecipe#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::CloudGuard::CloudGuardClient#create_detector_recipe}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::CloudGuard::Models::DetectorRecipe}
    def create_detector_recipe_and_wait_for_state(create_detector_recipe_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_detector_recipe(create_detector_recipe_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_detector_recipe(wait_for_resource_id).wait_until(
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


    # Calls {OCI::CloudGuard::CloudGuardClient#create_managed_list} and then waits for the {OCI::CloudGuard::Models::ManagedList} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::CloudGuard::Models::CreateManagedListDetails] create_managed_list_details Details for the new ManagedList.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::CloudGuard::Models::ManagedList#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::CloudGuard::CloudGuardClient#create_managed_list}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::CloudGuard::Models::ManagedList}
    def create_managed_list_and_wait_for_state(create_managed_list_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_managed_list(create_managed_list_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_managed_list(wait_for_resource_id).wait_until(
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


    # Calls {OCI::CloudGuard::CloudGuardClient#create_responder_recipe} and then waits for the {OCI::CloudGuard::Models::ResponderRecipe} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::CloudGuard::Models::CreateResponderRecipeDetails] create_responder_recipe_details Details for ResponderRecipe.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::CloudGuard::Models::ResponderRecipe#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::CloudGuard::CloudGuardClient#create_responder_recipe}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::CloudGuard::Models::ResponderRecipe}
    def create_responder_recipe_and_wait_for_state(create_responder_recipe_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_responder_recipe(create_responder_recipe_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_responder_recipe(wait_for_resource_id).wait_until(
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


    # Calls {OCI::CloudGuard::CloudGuardClient#create_target} and then waits for the {OCI::CloudGuard::Models::Target} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::CloudGuard::Models::CreateTargetDetails] create_target_details Details for the new Target.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::CloudGuard::Models::Target#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::CloudGuard::CloudGuardClient#create_target}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::CloudGuard::Models::Target}
    def create_target_and_wait_for_state(create_target_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_target(create_target_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_target(wait_for_resource_id).wait_until(
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


    # Calls {OCI::CloudGuard::CloudGuardClient#create_target_detector_recipe} and then waits for the {OCI::CloudGuard::Models::TargetDetectorRecipe} acted upon
    # to enter the given state(s).
    #
    # @param [String] target_id OCID of target
    # @param [OCI::CloudGuard::Models::AttachTargetDetectorRecipeDetails] attach_target_detector_recipe_details Details for associating DetectorRecipe to Target
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::CloudGuard::Models::TargetDetectorRecipe#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::CloudGuard::CloudGuardClient#create_target_detector_recipe}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::CloudGuard::Models::TargetDetectorRecipe}
    def create_target_detector_recipe_and_wait_for_state(target_id, attach_target_detector_recipe_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_target_detector_recipe(target_id, attach_target_detector_recipe_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_target_detector_recipe(wait_for_resource_id).wait_until(
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


    # Calls {OCI::CloudGuard::CloudGuardClient#delete_detector_recipe} and then waits for the {OCI::CloudGuard::Models::DetectorRecipe} acted upon
    # to enter the given state(s).
    #
    # @param [String] detector_recipe_id DetectorRecipe OCID
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::CloudGuard::Models::DetectorRecipe#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::CloudGuard::CloudGuardClient#delete_detector_recipe}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_detector_recipe_and_wait_for_state(detector_recipe_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_detector_recipe(detector_recipe_id)
      operation_result = @service_client.delete_detector_recipe(detector_recipe_id, base_operation_opts)

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


    # Calls {OCI::CloudGuard::CloudGuardClient#delete_managed_list} and then waits for the {OCI::CloudGuard::Models::ManagedList} acted upon
    # to enter the given state(s).
    #
    # @param [String] managed_list_id The cloudguard list OCID to be passed in the request.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::CloudGuard::Models::ManagedList#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::CloudGuard::CloudGuardClient#delete_managed_list}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_managed_list_and_wait_for_state(managed_list_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_managed_list(managed_list_id)
      operation_result = @service_client.delete_managed_list(managed_list_id, base_operation_opts)

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


    # Calls {OCI::CloudGuard::CloudGuardClient#delete_responder_recipe} and then waits for the {OCI::CloudGuard::Models::ResponderRecipe} acted upon
    # to enter the given state(s).
    #
    # @param [String] responder_recipe_id OCID of ResponderRecipe
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::CloudGuard::Models::ResponderRecipe#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::CloudGuard::CloudGuardClient#delete_responder_recipe}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_responder_recipe_and_wait_for_state(responder_recipe_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_responder_recipe(responder_recipe_id)
      operation_result = @service_client.delete_responder_recipe(responder_recipe_id, base_operation_opts)

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


    # Calls {OCI::CloudGuard::CloudGuardClient#delete_target} and then waits for the {OCI::CloudGuard::Models::Target} acted upon
    # to enter the given state(s).
    #
    # @param [String] target_id OCID of target
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::CloudGuard::Models::Target#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::CloudGuard::CloudGuardClient#delete_target}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_target_and_wait_for_state(target_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_target(target_id)
      operation_result = @service_client.delete_target(target_id, base_operation_opts)

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


    # Calls {OCI::CloudGuard::CloudGuardClient#update_detector_recipe} and then waits for the {OCI::CloudGuard::Models::DetectorRecipe} acted upon
    # to enter the given state(s).
    #
    # @param [String] detector_recipe_id DetectorRecipe OCID
    # @param [OCI::CloudGuard::Models::UpdateDetectorRecipeDetails] update_detector_recipe_details Details for the DetectorRecipe to be updated
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::CloudGuard::Models::DetectorRecipe#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::CloudGuard::CloudGuardClient#update_detector_recipe}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::CloudGuard::Models::DetectorRecipe}
    def update_detector_recipe_and_wait_for_state(detector_recipe_id, update_detector_recipe_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_detector_recipe(detector_recipe_id, update_detector_recipe_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_detector_recipe(wait_for_resource_id).wait_until(
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


    # Calls {OCI::CloudGuard::CloudGuardClient#update_detector_recipe_detector_rule} and then waits for the {OCI::CloudGuard::Models::DetectorRecipeDetectorRule} acted upon
    # to enter the given state(s).
    #
    # @param [String] detector_recipe_id DetectorRecipe OCID
    # @param [String] detector_rule_id The key of Detector Rule.
    # @param [OCI::CloudGuard::Models::UpdateDetectorRecipeDetectorRuleDetails] update_detector_recipe_detector_rule_details The details to be updated for DetectorRule.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::CloudGuard::Models::DetectorRecipeDetectorRule#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::CloudGuard::CloudGuardClient#update_detector_recipe_detector_rule}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::CloudGuard::Models::DetectorRecipeDetectorRule}
    def update_detector_recipe_detector_rule_and_wait_for_state(detector_recipe_id, detector_rule_id, update_detector_recipe_detector_rule_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_detector_recipe_detector_rule(detector_recipe_id, detector_rule_id, update_detector_recipe_detector_rule_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_detector_recipe_detector_rule(wait_for_resource_id).wait_until(
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


    # Calls {OCI::CloudGuard::CloudGuardClient#update_managed_list} and then waits for the {OCI::CloudGuard::Models::ManagedList} acted upon
    # to enter the given state(s).
    #
    # @param [String] managed_list_id The cloudguard list OCID to be passed in the request.
    # @param [OCI::CloudGuard::Models::UpdateManagedListDetails] update_managed_list_details Details for the ManagedList to be updated
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::CloudGuard::Models::ManagedList#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::CloudGuard::CloudGuardClient#update_managed_list}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::CloudGuard::Models::ManagedList}
    def update_managed_list_and_wait_for_state(managed_list_id, update_managed_list_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_managed_list(managed_list_id, update_managed_list_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_managed_list(wait_for_resource_id).wait_until(
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


    # Calls {OCI::CloudGuard::CloudGuardClient#update_problem_status} and then waits for the {OCI::CloudGuard::Models::Problem} acted upon
    # to enter the given state(s).
    #
    # @param [String] problem_id OCId of the problem.
    # @param [OCI::CloudGuard::Models::UpdateProblemStatusDetails] update_problem_status_details The additional details for the problem.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::CloudGuard::Models::Problem#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::CloudGuard::CloudGuardClient#update_problem_status}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::CloudGuard::Models::Problem}
    def update_problem_status_and_wait_for_state(problem_id, update_problem_status_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_problem_status(problem_id, update_problem_status_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_problem(wait_for_resource_id).wait_until(
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


    # Calls {OCI::CloudGuard::CloudGuardClient#update_responder_recipe} and then waits for the {OCI::CloudGuard::Models::ResponderRecipe} acted upon
    # to enter the given state(s).
    #
    # @param [String] responder_recipe_id OCID of ResponderRecipe
    # @param [OCI::CloudGuard::Models::UpdateResponderRecipeDetails] update_responder_recipe_details The details to be updated.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::CloudGuard::Models::ResponderRecipe#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::CloudGuard::CloudGuardClient#update_responder_recipe}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::CloudGuard::Models::ResponderRecipe}
    def update_responder_recipe_and_wait_for_state(responder_recipe_id, update_responder_recipe_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_responder_recipe(responder_recipe_id, update_responder_recipe_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_responder_recipe(wait_for_resource_id).wait_until(
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


    # Calls {OCI::CloudGuard::CloudGuardClient#update_responder_recipe_responder_rule} and then waits for the {OCI::CloudGuard::Models::ResponderRecipeResponderRule} acted upon
    # to enter the given state(s).
    #
    # @param [String] responder_recipe_id OCID of ResponderRecipe
    # @param [String] responder_rule_id The id of ResponderRule
    # @param [OCI::CloudGuard::Models::UpdateResponderRecipeResponderRuleDetails] update_responder_recipe_responder_rule_details The details to be updated for ResponderRule.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::CloudGuard::Models::ResponderRecipeResponderRule#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::CloudGuard::CloudGuardClient#update_responder_recipe_responder_rule}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::CloudGuard::Models::ResponderRecipeResponderRule}
    def update_responder_recipe_responder_rule_and_wait_for_state(responder_recipe_id, responder_rule_id, update_responder_recipe_responder_rule_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_responder_recipe_responder_rule(responder_recipe_id, responder_rule_id, update_responder_recipe_responder_rule_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_responder_recipe_responder_rule(wait_for_resource_id).wait_until(
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


    # Calls {OCI::CloudGuard::CloudGuardClient#update_target} and then waits for the {OCI::CloudGuard::Models::Target} acted upon
    # to enter the given state(s).
    #
    # @param [String] target_id OCID of target
    # @param [OCI::CloudGuard::Models::UpdateTargetDetails] update_target_details The information to be updated.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::CloudGuard::Models::Target#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::CloudGuard::CloudGuardClient#update_target}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::CloudGuard::Models::Target}
    def update_target_and_wait_for_state(target_id, update_target_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_target(target_id, update_target_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_target(wait_for_resource_id).wait_until(
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


    # Calls {OCI::CloudGuard::CloudGuardClient#update_target_detector_recipe} and then waits for the {OCI::CloudGuard::Models::TargetDetectorRecipe} acted upon
    # to enter the given state(s).
    #
    # @param [String] target_id OCID of target
    # @param [String] target_detector_recipe_id OCID of TargetDetectorRecipe
    # @param [OCI::CloudGuard::Models::UpdateTargetDetectorRecipeDetails] update_target_detector_recipe_details The details to be updated.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::CloudGuard::Models::TargetDetectorRecipe#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::CloudGuard::CloudGuardClient#update_target_detector_recipe}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::CloudGuard::Models::TargetDetectorRecipe}
    def update_target_detector_recipe_and_wait_for_state(target_id, target_detector_recipe_id, update_target_detector_recipe_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_target_detector_recipe(target_id, target_detector_recipe_id, update_target_detector_recipe_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_target_detector_recipe(wait_for_resource_id).wait_until(
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


    # Calls {OCI::CloudGuard::CloudGuardClient#update_target_detector_recipe_detector_rule} and then waits for the {OCI::CloudGuard::Models::TargetDetectorRecipeDetectorRule} acted upon
    # to enter the given state(s).
    #
    # @param [String] target_id OCID of target
    # @param [String] target_detector_recipe_id OCID of TargetDetectorRecipe
    # @param [String] detector_rule_id The id of DetectorRule
    # @param [OCI::CloudGuard::Models::UpdateTargetDetectorRecipeDetectorRuleDetails] update_target_detector_recipe_detector_rule_details The details to be updated for DetectorRule.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::CloudGuard::Models::TargetDetectorRecipeDetectorRule#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::CloudGuard::CloudGuardClient#update_target_detector_recipe_detector_rule}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::CloudGuard::Models::TargetDetectorRecipeDetectorRule}
    def update_target_detector_recipe_detector_rule_and_wait_for_state(target_id, target_detector_recipe_id, detector_rule_id, update_target_detector_recipe_detector_rule_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_target_detector_recipe_detector_rule(target_id, target_detector_recipe_id, detector_rule_id, update_target_detector_recipe_detector_rule_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_target_detector_recipe_detector_rule(wait_for_resource_id).wait_until(
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


    # Calls {OCI::CloudGuard::CloudGuardClient#update_target_responder_recipe_responder_rule} and then waits for the {OCI::CloudGuard::Models::TargetResponderRecipeResponderRule} acted upon
    # to enter the given state(s).
    #
    # @param [String] target_id OCID of target
    # @param [String] target_responder_recipe_id OCID of TargetResponderRecipe
    # @param [String] responder_rule_id The id of ResponderRule
    # @param [OCI::CloudGuard::Models::UpdateTargetResponderRecipeResponderRuleDetails] update_target_responder_recipe_responder_rule_details The details to be updated for ResponderRule.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::CloudGuard::Models::TargetResponderRecipeResponderRule#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::CloudGuard::CloudGuardClient#update_target_responder_recipe_responder_rule}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::CloudGuard::Models::TargetResponderRecipeResponderRule}
    def update_target_responder_recipe_responder_rule_and_wait_for_state(target_id, target_responder_recipe_id, responder_rule_id, update_target_responder_recipe_responder_rule_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_target_responder_recipe_responder_rule(target_id, target_responder_recipe_id, responder_rule_id, update_target_responder_recipe_responder_rule_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_target_responder_recipe_responder_rule(wait_for_resource_id).wait_until(
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
