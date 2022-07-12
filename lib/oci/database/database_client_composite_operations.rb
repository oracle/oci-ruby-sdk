# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::Database::DatabaseClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class Database::DatabaseClientCompositeOperations
    # The {OCI::Database::DatabaseClient} used to communicate with the service_client
    #
    # @return [OCI::Database::DatabaseClient]
    attr_reader :service_client

    # Initializes a new DatabaseClientCompositeOperations
    #
    # @param [OCI::Database::DatabaseClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::Database::DatabaseClient#initialize} with no arguments
    def initialize(service_client = OCI::Database::DatabaseClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::Database::DatabaseClient#activate_exadata_infrastructure} and then waits for the {OCI::Database::Models::ExadataInfrastructure} acted upon
    # to enter the given state(s).
    #
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::ActivateExadataInfrastructureDetails] activate_exadata_infrastructure_details The activation details for the Exadata infrastructure and the additional storage servers requested.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::ExadataInfrastructure#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#activate_exadata_infrastructure}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::ExadataInfrastructure}
    def activate_exadata_infrastructure_and_wait_for_state(exadata_infrastructure_id, activate_exadata_infrastructure_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.activate_exadata_infrastructure(exadata_infrastructure_id, activate_exadata_infrastructure_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_exadata_infrastructure(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#add_storage_capacity_exadata_infrastructure} and then waits for the {OCI::Database::Models::ExadataInfrastructure} acted upon
    # to enter the given state(s).
    #
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::ExadataInfrastructure#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#add_storage_capacity_exadata_infrastructure}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::ExadataInfrastructure}
    def add_storage_capacity_exadata_infrastructure_and_wait_for_state(exadata_infrastructure_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.add_storage_capacity_exadata_infrastructure(exadata_infrastructure_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_exadata_infrastructure(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#add_virtual_machine_to_vm_cluster} and then waits for the {OCI::Database::Models::VmCluster} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::AddVirtualMachineToVmClusterDetails] add_virtual_machine_to_vm_cluster_details Request to add Virtual Machines to the VM cluster.
    # @param [String] vm_cluster_id The VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::VmCluster#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#add_virtual_machine_to_vm_cluster}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::VmCluster}
    def add_virtual_machine_to_vm_cluster_and_wait_for_state(add_virtual_machine_to_vm_cluster_details, vm_cluster_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.add_virtual_machine_to_vm_cluster(add_virtual_machine_to_vm_cluster_details, vm_cluster_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_vm_cluster(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#autonomous_database_manual_refresh} and then waits for the {OCI::Database::Models::AutonomousDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::AutonomousDatabaseManualRefreshDetails] autonomous_database_manual_refresh_details Request details for manually refreshing an Autonomous Database refreshable clone.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#autonomous_database_manual_refresh}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousDatabase}
    def autonomous_database_manual_refresh_and_wait_for_state(autonomous_database_id, autonomous_database_manual_refresh_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.autonomous_database_manual_refresh(autonomous_database_id, autonomous_database_manual_refresh_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#change_autonomous_container_database_compartment} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::ChangeCompartmentDetails] change_compartment_details Request to move Autonomous Container Database to a different compartment
    # @param [String] autonomous_container_database_id The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#change_autonomous_container_database_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def change_autonomous_container_database_compartment_and_wait_for_state(change_compartment_details, autonomous_container_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_autonomous_container_database_compartment(change_compartment_details, autonomous_container_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#change_autonomous_database_compartment} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::ChangeCompartmentDetails] change_compartment_details Request to move Autonomous Database to a different compartment
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#change_autonomous_database_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def change_autonomous_database_compartment_and_wait_for_state(change_compartment_details, autonomous_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_autonomous_database_compartment(change_compartment_details, autonomous_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#change_autonomous_exadata_infrastructure_compartment} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::ChangeCompartmentDetails] change_compartment_details Request to move an Autonomous Exadata Infrastructure resource to a different compartment.
    # @param [String] autonomous_exadata_infrastructure_id The Autonomous Exadata Infrastructure  [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#change_autonomous_exadata_infrastructure_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def change_autonomous_exadata_infrastructure_compartment_and_wait_for_state(change_compartment_details, autonomous_exadata_infrastructure_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_autonomous_exadata_infrastructure_compartment(change_compartment_details, autonomous_exadata_infrastructure_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#change_autonomous_vm_cluster_compartment} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::ChangeAutonomousVmClusterCompartmentDetails] change_autonomous_vm_cluster_compartment_details Request to move Autonomous VM cluster to a different compartment
    # @param [String] autonomous_vm_cluster_id The autonomous VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#change_autonomous_vm_cluster_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def change_autonomous_vm_cluster_compartment_and_wait_for_state(change_autonomous_vm_cluster_compartment_details, autonomous_vm_cluster_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_autonomous_vm_cluster_compartment(change_autonomous_vm_cluster_compartment_details, autonomous_vm_cluster_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#change_backup_destination_compartment} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::ChangeCompartmentDetails] change_compartment_details Request to move backup destination to a different compartment.
    #
    # @param [String] backup_destination_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the backup destination.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#change_backup_destination_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def change_backup_destination_compartment_and_wait_for_state(change_compartment_details, backup_destination_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_backup_destination_compartment(change_compartment_details, backup_destination_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#change_cloud_autonomous_vm_cluster_compartment} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::ChangeCloudAutonomousVmClusterCompartmentDetails] change_cloud_autonomous_vm_cluster_compartment_details Request to move cloud Autonomous VM cluster to a different compartment
    # @param [String] cloud_autonomous_vm_cluster_id The Cloud VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#change_cloud_autonomous_vm_cluster_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def change_cloud_autonomous_vm_cluster_compartment_and_wait_for_state(change_cloud_autonomous_vm_cluster_compartment_details, cloud_autonomous_vm_cluster_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_cloud_autonomous_vm_cluster_compartment(change_cloud_autonomous_vm_cluster_compartment_details, cloud_autonomous_vm_cluster_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#change_cloud_exadata_infrastructure_compartment} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::ChangeCloudExadataInfrastructureCompartmentDetails] change_cloud_exadata_infrastructure_compartment_details Request to move cloud Exadata infrastructure resource to a different compartment.
    # @param [String] cloud_exadata_infrastructure_id The cloud Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#change_cloud_exadata_infrastructure_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def change_cloud_exadata_infrastructure_compartment_and_wait_for_state(change_cloud_exadata_infrastructure_compartment_details, cloud_exadata_infrastructure_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_cloud_exadata_infrastructure_compartment(change_cloud_exadata_infrastructure_compartment_details, cloud_exadata_infrastructure_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#change_cloud_vm_cluster_compartment} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::ChangeCloudVmClusterCompartmentDetails] change_cloud_vm_cluster_compartment_details Request to move cloud VM cluster to a different compartment
    # @param [String] cloud_vm_cluster_id The cloud VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#change_cloud_vm_cluster_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def change_cloud_vm_cluster_compartment_and_wait_for_state(change_cloud_vm_cluster_compartment_details, cloud_vm_cluster_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_cloud_vm_cluster_compartment(change_cloud_vm_cluster_compartment_details, cloud_vm_cluster_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#change_database_software_image_compartment} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::ChangeCompartmentDetails] change_compartment_details Request to move Database Software Image to a different compartment
    # @param [String] database_software_image_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#change_database_software_image_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def change_database_software_image_compartment_and_wait_for_state(change_compartment_details, database_software_image_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_database_software_image_compartment(change_compartment_details, database_software_image_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#change_db_system_compartment} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::ChangeCompartmentDetails] change_compartment_details Request to move the DB system to a different compartment.
    #
    #   **Note:** Deprecated for Exadata Cloud Service systems. Use the [new resource model APIs](https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/exaflexsystem.htm#exaflexsystem_topic-resource_model) instead.
    #
    #   For Exadata Cloud Service instances, support for this API will end on May 15th, 2021. See [Switching an Exadata DB System to the New Resource Model and APIs](https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/exaflexsystem_topic-resource_model_conversion.htm) for details on converting existing Exadata DB systems to the new resource model.
    #
    # @param [String] db_system_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#change_db_system_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def change_db_system_compartment_and_wait_for_state(change_compartment_details, db_system_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_db_system_compartment(change_compartment_details, db_system_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#change_exadata_infrastructure_compartment} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::ChangeExadataInfrastructureCompartmentDetails] change_exadata_infrastructure_compartment_details Request to move Exadata infrastructure to a different compartment
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#change_exadata_infrastructure_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def change_exadata_infrastructure_compartment_and_wait_for_state(change_exadata_infrastructure_compartment_details, exadata_infrastructure_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_exadata_infrastructure_compartment(change_exadata_infrastructure_compartment_details, exadata_infrastructure_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#change_external_container_database_compartment} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::ChangeCompartmentDetails] change_compartment_details Request to move the external container database to a different compartment.
    # @param [String] external_container_database_id The ExternalContainerDatabase [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#change_external_container_database_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def change_external_container_database_compartment_and_wait_for_state(change_compartment_details, external_container_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_external_container_database_compartment(change_compartment_details, external_container_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#change_external_non_container_database_compartment} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::ChangeCompartmentDetails] change_compartment_details Request to move the external non-container database to a different compartment.
    # @param [String] external_non_container_database_id The external non-container database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#change_external_non_container_database_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def change_external_non_container_database_compartment_and_wait_for_state(change_compartment_details, external_non_container_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_external_non_container_database_compartment(change_compartment_details, external_non_container_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#change_external_pluggable_database_compartment} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::ChangeCompartmentDetails] change_compartment_details Request to move the
    #   {#create_external_pluggable_database_details create_external_pluggable_database_details} resource
    #   to a different compartment.
    #
    # @param [String] external_pluggable_database_id The ExternalPluggableDatabaseId [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#change_external_pluggable_database_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def change_external_pluggable_database_compartment_and_wait_for_state(change_compartment_details, external_pluggable_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_external_pluggable_database_compartment(change_compartment_details, external_pluggable_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#change_key_store_compartment} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::ChangeKeyStoreCompartmentDetails] change_key_store_compartment_details Request to move key store to a different compartment
    #
    # @param [String] key_store_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the key store.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#change_key_store_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def change_key_store_compartment_and_wait_for_state(change_key_store_compartment_details, key_store_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_key_store_compartment(change_key_store_compartment_details, key_store_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#change_vm_cluster_compartment} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::ChangeVmClusterCompartmentDetails] change_vm_cluster_compartment_details Request to move the Exadata Cloud@Customer VM cluster to a different compartment.
    # @param [String] vm_cluster_id The VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#change_vm_cluster_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def change_vm_cluster_compartment_and_wait_for_state(change_vm_cluster_compartment_details, vm_cluster_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_vm_cluster_compartment(change_vm_cluster_compartment_details, vm_cluster_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#check_external_database_connector_connection_status} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] external_database_connector_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the
    #   external database connector resource (`ExternalDatabaseConnectorId`).
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#check_external_database_connector_connection_status}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def check_external_database_connector_connection_status_and_wait_for_state(external_database_connector_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.check_external_database_connector_connection_status(external_database_connector_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#configure_autonomous_database_vault_key} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::ConfigureAutonomousDatabaseVaultKeyDetails] configure_autonomous_database_vault_key_details Configuration details for the Autonomous Database Vault service [key](https://docs.cloud.oracle.com/Content/KeyManagement/Concepts/keyoverview.htm#concepts).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#configure_autonomous_database_vault_key}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def configure_autonomous_database_vault_key_and_wait_for_state(autonomous_database_id, configure_autonomous_database_vault_key_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.configure_autonomous_database_vault_key(autonomous_database_id, configure_autonomous_database_vault_key_details, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#convert_to_pdb} and then waits for the {OCI::Database::Models::Database} acted upon
    # to enter the given state(s).
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::ConvertToPdbDetails] convert_to_pdb_details Request to convert a non-container database to a pluggable database.
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::Database#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#convert_to_pdb}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::Database}
    def convert_to_pdb_and_wait_for_state(database_id, convert_to_pdb_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.convert_to_pdb(database_id, convert_to_pdb_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_autonomous_container_database} and then waits for the {OCI::Database::Models::AutonomousContainerDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::CreateAutonomousContainerDatabaseDetails] create_autonomous_container_database_details Request to create an Autonomous Container Database in a specified Autonomous Exadata Infrastructure or in Autonomous VM Cluster.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousContainerDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_autonomous_container_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousContainerDatabase}
    def create_autonomous_container_database_and_wait_for_state(create_autonomous_container_database_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_autonomous_container_database(create_autonomous_container_database_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_container_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_autonomous_database} and then waits for the {OCI::Database::Models::AutonomousDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::CreateAutonomousDatabaseBase] create_autonomous_database_details Request to create a new Autonomous Database.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_autonomous_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousDatabase}
    def create_autonomous_database_and_wait_for_state(create_autonomous_database_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_autonomous_database(create_autonomous_database_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_autonomous_database_backup} and then waits for the {OCI::Database::Models::AutonomousDatabaseBackup} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::CreateAutonomousDatabaseBackupDetails] create_autonomous_database_backup_details Request to create a new Autonomous Database backup.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousDatabaseBackup#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_autonomous_database_backup}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousDatabaseBackup}
    def create_autonomous_database_backup_and_wait_for_state(create_autonomous_database_backup_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_autonomous_database_backup(create_autonomous_database_backup_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_database_backup(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_autonomous_vm_cluster} and then waits for the {OCI::Database::Models::AutonomousVmCluster} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::CreateAutonomousVmClusterDetails] create_autonomous_vm_cluster_details Request to create an Autonomous VM cluster.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousVmCluster#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_autonomous_vm_cluster}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousVmCluster}
    def create_autonomous_vm_cluster_and_wait_for_state(create_autonomous_vm_cluster_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_autonomous_vm_cluster(create_autonomous_vm_cluster_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_vm_cluster(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_backup} and then waits for the {OCI::Database::Models::Backup} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::CreateBackupDetails] create_backup_details Request to create a new database backup.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::Backup#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_backup}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::Backup}
    def create_backup_and_wait_for_state(create_backup_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_backup(create_backup_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_backup(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_backup_destination} and then waits for the {OCI::Database::Models::BackupDestination} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::CreateBackupDestinationDetails] create_backup_destination_details Request to create a new backup destination.
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::BackupDestination#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_backup_destination}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::BackupDestination}
    def create_backup_destination_and_wait_for_state(create_backup_destination_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_backup_destination(create_backup_destination_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_backup_destination(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_cloud_autonomous_vm_cluster} and then waits for the {OCI::Database::Models::CloudAutonomousVmCluster} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::CreateCloudAutonomousVmClusterDetails] create_cloud_autonomous_vm_cluster_details Request to create a cloud Autonomous VM cluster.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::CloudAutonomousVmCluster#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_cloud_autonomous_vm_cluster}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::CloudAutonomousVmCluster}
    def create_cloud_autonomous_vm_cluster_and_wait_for_state(create_cloud_autonomous_vm_cluster_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_cloud_autonomous_vm_cluster(create_cloud_autonomous_vm_cluster_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_cloud_autonomous_vm_cluster(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_cloud_exadata_infrastructure} and then waits for the {OCI::Database::Models::CloudExadataInfrastructure} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::CreateCloudExadataInfrastructureDetails] create_cloud_exadata_infrastructure_details Request to create a cloud Exadata infrastructure resource in an [Exadata Cloud Service](https://docs.cloud.oracle.com/Content/Database/Concepts/exaoverview.htm) instance.
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::CloudExadataInfrastructure#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_cloud_exadata_infrastructure}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::CloudExadataInfrastructure}
    def create_cloud_exadata_infrastructure_and_wait_for_state(create_cloud_exadata_infrastructure_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_cloud_exadata_infrastructure(create_cloud_exadata_infrastructure_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_cloud_exadata_infrastructure(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_cloud_vm_cluster} and then waits for the {OCI::Database::Models::CloudVmCluster} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::CreateCloudVmClusterDetails] create_cloud_vm_cluster_details Request to create a cloud VM cluster. Applies to Exadata Cloud Service instances only. See [The New Exadata Cloud Service Resource Model](https://docs.cloud.oracle.com/iaas/Content/Database/iaas/Content/Database/Concepts/exaflexsystem.htm#exaflexsystem_topic-resource_model) for information on this resource type.
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::CloudVmCluster#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_cloud_vm_cluster}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::CloudVmCluster}
    def create_cloud_vm_cluster_and_wait_for_state(create_cloud_vm_cluster_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_cloud_vm_cluster(create_cloud_vm_cluster_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_cloud_vm_cluster(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_console_connection} and then waits for the {OCI::Database::Models::ConsoleConnection} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::CreateConsoleConnectionDetails] create_console_connection_details Request object for creating an CreateConsoleConnection
    # @param [String] db_node_id The database node [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::ConsoleConnection#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_console_connection}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::ConsoleConnection}
    def create_console_connection_and_wait_for_state(create_console_connection_details, db_node_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_console_connection(create_console_connection_details, db_node_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_console_connection(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_data_guard_association} and then waits for the {OCI::Database::Models::DataGuardAssociation} acted upon
    # to enter the given state(s).
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::CreateDataGuardAssociationDetails] create_data_guard_association_details A request to create a Data Guard association.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::DataGuardAssociation#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_data_guard_association}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::DataGuardAssociation}
    def create_data_guard_association_and_wait_for_state(database_id, create_data_guard_association_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_data_guard_association(database_id, create_data_guard_association_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_data_guard_association(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_database} and then waits for the {OCI::Database::Models::Database} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::CreateDatabaseBase] create_new_database_details Request to create a new database.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::Database#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::Database}
    def create_database_and_wait_for_state(create_new_database_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_database(create_new_database_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_database_software_image} and then waits for the {OCI::Database::Models::DatabaseSoftwareImage} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::CreateDatabaseSoftwareImageDetails] create_database_software_image_details Request to create database software image.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::DatabaseSoftwareImage#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_database_software_image}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::DatabaseSoftwareImage}
    def create_database_software_image_and_wait_for_state(create_database_software_image_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_database_software_image(create_database_software_image_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_database_software_image(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_db_home} and then waits for the {OCI::Database::Models::DbHome} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::CreateDbHomeBase] create_db_home_with_db_system_id_details Request to create a new Database Home.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::DbHome#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_db_home}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::DbHome}
    def create_db_home_and_wait_for_state(create_db_home_with_db_system_id_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_db_home(create_db_home_with_db_system_id_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_db_home(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_exadata_infrastructure} and then waits for the {OCI::Database::Models::ExadataInfrastructure} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::CreateExadataInfrastructureDetails] create_exadata_infrastructure_details Request to create Exadata Cloud@Customer infrastructure.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::ExadataInfrastructure#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_exadata_infrastructure}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::ExadataInfrastructure}
    def create_exadata_infrastructure_and_wait_for_state(create_exadata_infrastructure_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_exadata_infrastructure(create_exadata_infrastructure_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_exadata_infrastructure(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_external_container_database} and then waits for the {OCI::Database::Models::ExternalContainerDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::CreateExternalContainerDatabaseDetails] create_external_container_database_details Request to create a new external container database resource.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::ExternalContainerDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_external_container_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::ExternalContainerDatabase}
    def create_external_container_database_and_wait_for_state(create_external_container_database_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_external_container_database(create_external_container_database_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_external_container_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_external_database_connector} and then waits for the {OCI::Database::Models::ExternalDatabaseConnector} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::CreateExternalDatabaseConnectorDetails] create_external_database_connector_details Request to create a connector to an external database.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::ExternalDatabaseConnector#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_external_database_connector}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::ExternalDatabaseConnector}
    def create_external_database_connector_and_wait_for_state(create_external_database_connector_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_external_database_connector(create_external_database_connector_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_external_database_connector(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_external_non_container_database} and then waits for the {OCI::Database::Models::ExternalNonContainerDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::CreateExternalNonContainerDatabaseDetails] create_external_non_container_database_details Request to create a new external non-container database.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::ExternalNonContainerDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_external_non_container_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::ExternalNonContainerDatabase}
    def create_external_non_container_database_and_wait_for_state(create_external_non_container_database_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_external_non_container_database(create_external_non_container_database_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_external_non_container_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_external_pluggable_database} and then waits for the {OCI::Database::Models::ExternalPluggableDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::CreateExternalPluggableDatabaseDetails] create_external_pluggable_database_details Request to create a new external pluggable database.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::ExternalPluggableDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_external_pluggable_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::ExternalPluggableDatabase}
    def create_external_pluggable_database_and_wait_for_state(create_external_pluggable_database_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_external_pluggable_database(create_external_pluggable_database_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_external_pluggable_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_key_store} and then waits for the {OCI::Database::Models::KeyStore} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::CreateKeyStoreDetails] create_key_store_details Request to create a new key store.
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::KeyStore#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_key_store}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::KeyStore}
    def create_key_store_and_wait_for_state(create_key_store_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_key_store(create_key_store_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_key_store(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_pluggable_database} and then waits for the {OCI::Database::Models::PluggableDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::CreatePluggableDatabaseDetails] create_pluggable_database_details Request to create pluggable database.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::PluggableDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_pluggable_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::PluggableDatabase}
    def create_pluggable_database_and_wait_for_state(create_pluggable_database_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_pluggable_database(create_pluggable_database_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_pluggable_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_vm_cluster} and then waits for the {OCI::Database::Models::VmCluster} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::CreateVmClusterDetails] create_vm_cluster_details Request to create a VM cluster. Applies to Exadata Cloud@Customer instances only.
    #   See {#create_cloud_vm_cluster_details create_cloud_vm_cluster_details} for details on creating a cloud VM cluster in an Exadata Cloud Service instance.
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::VmCluster#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_vm_cluster}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::VmCluster}
    def create_vm_cluster_and_wait_for_state(create_vm_cluster_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_vm_cluster(create_vm_cluster_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_vm_cluster(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#create_vm_cluster_network} and then waits for the {OCI::Database::Models::VmClusterNetwork} acted upon
    # to enter the given state(s).
    #
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::VmClusterNetworkDetails] vm_cluster_network_details Request to create the Cloud@Customer VM cluster network.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::VmClusterNetwork#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#create_vm_cluster_network}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::VmClusterNetwork}
    def create_vm_cluster_network_and_wait_for_state(exadata_infrastructure_id, vm_cluster_network_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_vm_cluster_network(exadata_infrastructure_id, vm_cluster_network_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_vm_cluster_network(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#db_node_action} and then waits for the {OCI::Database::Models::DbNode} acted upon
    # to enter the given state(s).
    #
    # @param [String] db_node_id The database node [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] action The action to perform on the DB Node.
    #   Allowed values are: STOP, START, SOFTRESET, RESET
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::DbNode#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#db_node_action}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::DbNode}
    def db_node_action_and_wait_for_state(db_node_id, action, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.db_node_action(db_node_id, action, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_db_node(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#delete_autonomous_database} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#delete_autonomous_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def delete_autonomous_database_and_wait_for_state(autonomous_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_autonomous_database(autonomous_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#delete_autonomous_vm_cluster} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] autonomous_vm_cluster_id The autonomous VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#delete_autonomous_vm_cluster}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def delete_autonomous_vm_cluster_and_wait_for_state(autonomous_vm_cluster_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_autonomous_vm_cluster(autonomous_vm_cluster_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#delete_backup} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] backup_id The backup [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#delete_backup}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def delete_backup_and_wait_for_state(backup_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_backup(backup_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#delete_backup_destination} and then waits for the {OCI::Database::Models::BackupDestination} acted upon
    # to enter the given state(s).
    #
    # @param [String] backup_destination_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the backup destination.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::BackupDestination#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#delete_backup_destination}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_backup_destination_and_wait_for_state(backup_destination_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_backup_destination(backup_destination_id)
      operation_result = @service_client.delete_backup_destination(backup_destination_id, base_operation_opts)

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


    # Calls {OCI::Database::DatabaseClient#delete_cloud_autonomous_vm_cluster} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] cloud_autonomous_vm_cluster_id The Cloud VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#delete_cloud_autonomous_vm_cluster}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def delete_cloud_autonomous_vm_cluster_and_wait_for_state(cloud_autonomous_vm_cluster_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_cloud_autonomous_vm_cluster(cloud_autonomous_vm_cluster_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#delete_cloud_exadata_infrastructure} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] cloud_exadata_infrastructure_id The cloud Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#delete_cloud_exadata_infrastructure}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def delete_cloud_exadata_infrastructure_and_wait_for_state(cloud_exadata_infrastructure_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_cloud_exadata_infrastructure(cloud_exadata_infrastructure_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#delete_cloud_vm_cluster} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] cloud_vm_cluster_id The cloud VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#delete_cloud_vm_cluster}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def delete_cloud_vm_cluster_and_wait_for_state(cloud_vm_cluster_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_cloud_vm_cluster(cloud_vm_cluster_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#delete_database} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#delete_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def delete_database_and_wait_for_state(database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_database(database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#delete_database_software_image} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] database_software_image_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#delete_database_software_image}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def delete_database_software_image_and_wait_for_state(database_software_image_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_database_software_image(database_software_image_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#delete_db_home} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] db_home_id The Database Home [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#delete_db_home}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def delete_db_home_and_wait_for_state(db_home_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_db_home(db_home_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#delete_exadata_infrastructure} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#delete_exadata_infrastructure}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def delete_exadata_infrastructure_and_wait_for_state(exadata_infrastructure_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_exadata_infrastructure(exadata_infrastructure_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#delete_external_container_database} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] external_container_database_id The ExternalContainerDatabase [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#delete_external_container_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def delete_external_container_database_and_wait_for_state(external_container_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_external_container_database(external_container_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#delete_external_database_connector} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] external_database_connector_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the
    #   external database connector resource (`ExternalDatabaseConnectorId`).
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#delete_external_database_connector}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def delete_external_database_connector_and_wait_for_state(external_database_connector_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_external_database_connector(external_database_connector_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#delete_external_non_container_database} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] external_non_container_database_id The external non-container database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#delete_external_non_container_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def delete_external_non_container_database_and_wait_for_state(external_non_container_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_external_non_container_database(external_non_container_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#delete_external_pluggable_database} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] external_pluggable_database_id The ExternalPluggableDatabaseId [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#delete_external_pluggable_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def delete_external_pluggable_database_and_wait_for_state(external_pluggable_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_external_pluggable_database(external_pluggable_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#delete_key_store} and then waits for the {OCI::Database::Models::KeyStore} acted upon
    # to enter the given state(s).
    #
    # @param [String] key_store_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the key store.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::KeyStore#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#delete_key_store}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_key_store_and_wait_for_state(key_store_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_key_store(key_store_id)
      operation_result = @service_client.delete_key_store(key_store_id, base_operation_opts)

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


    # Calls {OCI::Database::DatabaseClient#delete_pluggable_database} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] pluggable_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#delete_pluggable_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def delete_pluggable_database_and_wait_for_state(pluggable_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_pluggable_database(pluggable_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#delete_vm_cluster} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] vm_cluster_id The VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#delete_vm_cluster}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def delete_vm_cluster_and_wait_for_state(vm_cluster_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_vm_cluster(vm_cluster_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#delete_vm_cluster_network} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] vm_cluster_network_id The VM cluster network [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#delete_vm_cluster_network}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def delete_vm_cluster_network_and_wait_for_state(exadata_infrastructure_id, vm_cluster_network_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_vm_cluster_network(exadata_infrastructure_id, vm_cluster_network_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#deregister_autonomous_database_data_safe} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#deregister_autonomous_database_data_safe}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def deregister_autonomous_database_data_safe_and_wait_for_state(autonomous_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.deregister_autonomous_database_data_safe(autonomous_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#disable_autonomous_database_management} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#disable_autonomous_database_management}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def disable_autonomous_database_management_and_wait_for_state(autonomous_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.disable_autonomous_database_management(autonomous_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#disable_autonomous_database_operations_insights} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#disable_autonomous_database_operations_insights}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def disable_autonomous_database_operations_insights_and_wait_for_state(autonomous_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.disable_autonomous_database_operations_insights(autonomous_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#disable_database_management} and then waits for the {OCI::Database::Models::Database} acted upon
    # to enter the given state(s).
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::Database#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#disable_database_management}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::Database}
    def disable_database_management_and_wait_for_state(database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.disable_database_management(database_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#disable_external_container_database_database_management} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] external_container_database_id The ExternalContainerDatabase [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#disable_external_container_database_database_management}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def disable_external_container_database_database_management_and_wait_for_state(external_container_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.disable_external_container_database_database_management(external_container_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#disable_external_container_database_stack_monitoring} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] external_container_database_id The ExternalContainerDatabase [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#disable_external_container_database_stack_monitoring}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def disable_external_container_database_stack_monitoring_and_wait_for_state(external_container_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.disable_external_container_database_stack_monitoring(external_container_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#disable_external_non_container_database_database_management} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] external_non_container_database_id The external non-container database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#disable_external_non_container_database_database_management}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def disable_external_non_container_database_database_management_and_wait_for_state(external_non_container_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.disable_external_non_container_database_database_management(external_non_container_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#disable_external_non_container_database_operations_insights} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] external_non_container_database_id The external non-container database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#disable_external_non_container_database_operations_insights}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def disable_external_non_container_database_operations_insights_and_wait_for_state(external_non_container_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.disable_external_non_container_database_operations_insights(external_non_container_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#disable_external_non_container_database_stack_monitoring} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] external_non_container_database_id The external non-container database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#disable_external_non_container_database_stack_monitoring}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def disable_external_non_container_database_stack_monitoring_and_wait_for_state(external_non_container_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.disable_external_non_container_database_stack_monitoring(external_non_container_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#disable_external_pluggable_database_database_management} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] external_pluggable_database_id The ExternalPluggableDatabaseId [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#disable_external_pluggable_database_database_management}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def disable_external_pluggable_database_database_management_and_wait_for_state(external_pluggable_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.disable_external_pluggable_database_database_management(external_pluggable_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#disable_external_pluggable_database_operations_insights} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] external_pluggable_database_id The ExternalPluggableDatabaseId [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#disable_external_pluggable_database_operations_insights}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def disable_external_pluggable_database_operations_insights_and_wait_for_state(external_pluggable_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.disable_external_pluggable_database_operations_insights(external_pluggable_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#disable_external_pluggable_database_stack_monitoring} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] external_pluggable_database_id The ExternalPluggableDatabaseId [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#disable_external_pluggable_database_stack_monitoring}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def disable_external_pluggable_database_stack_monitoring_and_wait_for_state(external_pluggable_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.disable_external_pluggable_database_stack_monitoring(external_pluggable_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#enable_autonomous_database_management} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#enable_autonomous_database_management}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def enable_autonomous_database_management_and_wait_for_state(autonomous_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.enable_autonomous_database_management(autonomous_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#enable_autonomous_database_operations_insights} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#enable_autonomous_database_operations_insights}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def enable_autonomous_database_operations_insights_and_wait_for_state(autonomous_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.enable_autonomous_database_operations_insights(autonomous_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#enable_database_management} and then waits for the {OCI::Database::Models::Database} acted upon
    # to enter the given state(s).
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::EnableDatabaseManagementDetails] enable_database_management_details Request to enable the Database Management service for an Oracle Database located in Oracle Cloud Infrastructure.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::Database#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#enable_database_management}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::Database}
    def enable_database_management_and_wait_for_state(database_id, enable_database_management_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.enable_database_management(database_id, enable_database_management_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#enable_external_container_database_database_management} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] external_container_database_id The ExternalContainerDatabase [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::EnableExternalContainerDatabaseDatabaseManagementDetails] enable_external_container_database_database_management_details Request to enable the Database Management Service for an external container database.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#enable_external_container_database_database_management}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def enable_external_container_database_database_management_and_wait_for_state(external_container_database_id, enable_external_container_database_database_management_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.enable_external_container_database_database_management(external_container_database_id, enable_external_container_database_database_management_details, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#enable_external_container_database_stack_monitoring} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] external_container_database_id The ExternalContainerDatabase [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::EnableExternalContainerDatabaseStackMonitoringDetails] enable_external_container_database_stack_monitoring_details Details to enable Stack Monitoring on the external container database.
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#enable_external_container_database_stack_monitoring}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def enable_external_container_database_stack_monitoring_and_wait_for_state(external_container_database_id, enable_external_container_database_stack_monitoring_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.enable_external_container_database_stack_monitoring(external_container_database_id, enable_external_container_database_stack_monitoring_details, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#enable_external_non_container_database_database_management} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] external_non_container_database_id The external non-container database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::EnableExternalNonContainerDatabaseDatabaseManagementDetails] enable_external_non_container_database_database_management_details Request to enable the Database Management Service for an external non-container database.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#enable_external_non_container_database_database_management}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def enable_external_non_container_database_database_management_and_wait_for_state(external_non_container_database_id, enable_external_non_container_database_database_management_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.enable_external_non_container_database_database_management(external_non_container_database_id, enable_external_non_container_database_database_management_details, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#enable_external_non_container_database_operations_insights} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] external_non_container_database_id The external non-container database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::EnableExternalNonContainerDatabaseOperationsInsightsDetails] enable_external_non_container_database_operations_insights_details Details to enable Operations Insights on the external non-container database
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#enable_external_non_container_database_operations_insights}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def enable_external_non_container_database_operations_insights_and_wait_for_state(external_non_container_database_id, enable_external_non_container_database_operations_insights_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.enable_external_non_container_database_operations_insights(external_non_container_database_id, enable_external_non_container_database_operations_insights_details, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#enable_external_non_container_database_stack_monitoring} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] external_non_container_database_id The external non-container database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::EnableExternalNonContainerDatabaseStackMonitoringDetails] enable_external_non_container_database_stack_monitoring_details Details to enable Stack Monitoring on the external non-container database.
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#enable_external_non_container_database_stack_monitoring}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def enable_external_non_container_database_stack_monitoring_and_wait_for_state(external_non_container_database_id, enable_external_non_container_database_stack_monitoring_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.enable_external_non_container_database_stack_monitoring(external_non_container_database_id, enable_external_non_container_database_stack_monitoring_details, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#enable_external_pluggable_database_database_management} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] external_pluggable_database_id The ExternalPluggableDatabaseId [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::EnableExternalPluggableDatabaseDatabaseManagementDetails] enable_external_pluggable_database_database_management_details Request to enable the Database Management Service for an external database.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#enable_external_pluggable_database_database_management}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def enable_external_pluggable_database_database_management_and_wait_for_state(external_pluggable_database_id, enable_external_pluggable_database_database_management_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.enable_external_pluggable_database_database_management(external_pluggable_database_id, enable_external_pluggable_database_database_management_details, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#enable_external_pluggable_database_operations_insights} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] external_pluggable_database_id The ExternalPluggableDatabaseId [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::EnableExternalPluggableDatabaseOperationsInsightsDetails] enable_external_pluggable_database_operations_insights_details Details to enable Operations Insights on the external pluggable database
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#enable_external_pluggable_database_operations_insights}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def enable_external_pluggable_database_operations_insights_and_wait_for_state(external_pluggable_database_id, enable_external_pluggable_database_operations_insights_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.enable_external_pluggable_database_operations_insights(external_pluggable_database_id, enable_external_pluggable_database_operations_insights_details, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#enable_external_pluggable_database_stack_monitoring} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] external_pluggable_database_id The ExternalPluggableDatabaseId [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::EnableExternalPluggableDatabaseStackMonitoringDetails] enable_external_pluggable_database_stack_monitoring_details Details to enable Stack Monitoring on the external pluggable database.
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#enable_external_pluggable_database_stack_monitoring}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def enable_external_pluggable_database_stack_monitoring_and_wait_for_state(external_pluggable_database_id, enable_external_pluggable_database_stack_monitoring_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.enable_external_pluggable_database_stack_monitoring(external_pluggable_database_id, enable_external_pluggable_database_stack_monitoring_details, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#fail_over_autonomous_database} and then waits for the {OCI::Database::Models::AutonomousDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#fail_over_autonomous_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousDatabase}
    def fail_over_autonomous_database_and_wait_for_state(autonomous_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.fail_over_autonomous_database(autonomous_database_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#failover_autonomous_container_database_dataguard_association} and then waits for the {OCI::Database::Models::AutonomousContainerDatabaseDataguardAssociation} acted upon
    # to enter the given state(s).
    #
    # @param [String] autonomous_container_database_id The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] autonomous_container_database_dataguard_association_id The Autonomous Container Database-Autonomous Data Guard association [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousContainerDatabaseDataguardAssociation#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#failover_autonomous_container_database_dataguard_association}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousContainerDatabaseDataguardAssociation}
    def failover_autonomous_container_database_dataguard_association_and_wait_for_state(autonomous_container_database_id, autonomous_container_database_dataguard_association_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.failover_autonomous_container_database_dataguard_association(autonomous_container_database_id, autonomous_container_database_dataguard_association_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_container_database_dataguard_association(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#failover_data_guard_association} and then waits for the {OCI::Database::Models::DataGuardAssociation} acted upon
    # to enter the given state(s).
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] data_guard_association_id The Data Guard association's [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::FailoverDataGuardAssociationDetails] failover_data_guard_association_details A request to perform a failover, transitioning a standby database into a primary database.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::DataGuardAssociation#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#failover_data_guard_association}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::DataGuardAssociation}
    def failover_data_guard_association_and_wait_for_state(database_id, data_guard_association_id, failover_data_guard_association_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.failover_data_guard_association(database_id, data_guard_association_id, failover_data_guard_association_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_data_guard_association(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#launch_autonomous_exadata_infrastructure} and then waits for the {OCI::Database::Models::AutonomousExadataInfrastructure} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::LaunchAutonomousExadataInfrastructureDetails] launch_autonomous_exadata_infrastructure_details **Deprecated.** Use the {#create_cloud_exadata_infrastructure create_cloud_exadata_infrastructure} or {#create_cloud_autonomous_vm_cluster create_cloud_autonomous_vm_cluster} operations instead.
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousExadataInfrastructure#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#launch_autonomous_exadata_infrastructure}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousExadataInfrastructure}
    def launch_autonomous_exadata_infrastructure_and_wait_for_state(launch_autonomous_exadata_infrastructure_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.launch_autonomous_exadata_infrastructure(launch_autonomous_exadata_infrastructure_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_exadata_infrastructure(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#launch_db_system} and then waits for the {OCI::Database::Models::DbSystem} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::LaunchDbSystemBase] launch_db_system_details Request to launch a DB system.
    #
    #   **Note:** Deprecated for Exadata Cloud Service systems. Use the [new resource model APIs](https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/exaflexsystem.htm#exaflexsystem_topic-resource_model) instead.
    #
    #   For Exadata Cloud Service instances, support for this API will end on May 15th, 2021. See [Switching an Exadata DB System to the New Resource Model and APIs](https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/exaflexsystem_topic-resource_model_conversion.htm) for details on converting existing Exadata DB systems to the new resource model.
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::DbSystem#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#launch_db_system}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::DbSystem}
    def launch_db_system_and_wait_for_state(launch_db_system_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.launch_db_system(launch_db_system_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_db_system(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#local_clone_pluggable_database} and then waits for the {OCI::Database::Models::PluggableDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::LocalClonePluggableDatabaseDetails] local_clone_pluggable_database_details Request to clone a pluggable database locally.
    # @param [String] pluggable_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::PluggableDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#local_clone_pluggable_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::PluggableDatabase}
    def local_clone_pluggable_database_and_wait_for_state(local_clone_pluggable_database_details, pluggable_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.local_clone_pluggable_database(local_clone_pluggable_database_details, pluggable_database_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_pluggable_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#migrate_vault_key} and then waits for the {OCI::Database::Models::Database} acted upon
    # to enter the given state(s).
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::MigrateVaultKeyDetails] migrate_vault_key_details Request to change the source of the encryption key for the database.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::Database#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#migrate_vault_key}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::Database}
    def migrate_vault_key_and_wait_for_state(database_id, migrate_vault_key_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.migrate_vault_key(database_id, migrate_vault_key_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#modify_database_management} and then waits for the {OCI::Database::Models::Database} acted upon
    # to enter the given state(s).
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::ModifyDatabaseManagementDetails] modify_database_management_details The data to update one or more attributes of the Database Management Service for the database.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::Database#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#modify_database_management}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::Database}
    def modify_database_management_and_wait_for_state(database_id, modify_database_management_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.modify_database_management(database_id, modify_database_management_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#register_autonomous_database_data_safe} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#register_autonomous_database_data_safe}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def register_autonomous_database_data_safe_and_wait_for_state(autonomous_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.register_autonomous_database_data_safe(autonomous_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#reinstate_autonomous_container_database_dataguard_association} and then waits for the {OCI::Database::Models::AutonomousContainerDatabaseDataguardAssociation} acted upon
    # to enter the given state(s).
    #
    # @param [String] autonomous_container_database_id The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] autonomous_container_database_dataguard_association_id The Autonomous Container Database-Autonomous Data Guard association [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousContainerDatabaseDataguardAssociation#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#reinstate_autonomous_container_database_dataguard_association}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousContainerDatabaseDataguardAssociation}
    def reinstate_autonomous_container_database_dataguard_association_and_wait_for_state(autonomous_container_database_id, autonomous_container_database_dataguard_association_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.reinstate_autonomous_container_database_dataguard_association(autonomous_container_database_id, autonomous_container_database_dataguard_association_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_container_database_dataguard_association(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#reinstate_data_guard_association} and then waits for the {OCI::Database::Models::DataGuardAssociation} acted upon
    # to enter the given state(s).
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] data_guard_association_id The Data Guard association's [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::ReinstateDataGuardAssociationDetails] reinstate_data_guard_association_details A request to reinstate a database in a standby role.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::DataGuardAssociation#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#reinstate_data_guard_association}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::DataGuardAssociation}
    def reinstate_data_guard_association_and_wait_for_state(database_id, data_guard_association_id, reinstate_data_guard_association_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.reinstate_data_guard_association(database_id, data_guard_association_id, reinstate_data_guard_association_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_data_guard_association(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#remote_clone_pluggable_database} and then waits for the {OCI::Database::Models::PluggableDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::RemoteClonePluggableDatabaseDetails] remote_clone_pluggable_database_details Request to clone a pluggable database (PDB) to a different database (CDB) from the source PDB.
    # @param [String] pluggable_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::PluggableDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#remote_clone_pluggable_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::PluggableDatabase}
    def remote_clone_pluggable_database_and_wait_for_state(remote_clone_pluggable_database_details, pluggable_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.remote_clone_pluggable_database(remote_clone_pluggable_database_details, pluggable_database_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_pluggable_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#remove_virtual_machine_from_vm_cluster} and then waits for the {OCI::Database::Models::VmCluster} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::RemoveVirtualMachineFromVmClusterDetails] remove_virtual_machine_from_vm_cluster_details Request to remove Virtual Machines from the VM cluster.
    # @param [String] vm_cluster_id The VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::VmCluster#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#remove_virtual_machine_from_vm_cluster}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::VmCluster}
    def remove_virtual_machine_from_vm_cluster_and_wait_for_state(remove_virtual_machine_from_vm_cluster_details, vm_cluster_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.remove_virtual_machine_from_vm_cluster(remove_virtual_machine_from_vm_cluster_details, vm_cluster_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_vm_cluster(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#restart_autonomous_container_database} and then waits for the {OCI::Database::Models::AutonomousContainerDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [String] autonomous_container_database_id The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousContainerDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#restart_autonomous_container_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousContainerDatabase}
    def restart_autonomous_container_database_and_wait_for_state(autonomous_container_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.restart_autonomous_container_database(autonomous_container_database_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_container_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#restart_autonomous_database} and then waits for the {OCI::Database::Models::AutonomousDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#restart_autonomous_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousDatabase}
    def restart_autonomous_database_and_wait_for_state(autonomous_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.restart_autonomous_database(autonomous_database_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#restore_autonomous_database} and then waits for the {OCI::Database::Models::AutonomousDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::RestoreAutonomousDatabaseDetails] restore_autonomous_database_details Request to perform an Autonomous Database restore.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#restore_autonomous_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousDatabase}
    def restore_autonomous_database_and_wait_for_state(autonomous_database_id, restore_autonomous_database_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.restore_autonomous_database(autonomous_database_id, restore_autonomous_database_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#restore_database} and then waits for the {OCI::Database::Models::Database} acted upon
    # to enter the given state(s).
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::RestoreDatabaseDetails] restore_database_details Request to perform database restore.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::Database#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#restore_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::Database}
    def restore_database_and_wait_for_state(database_id, restore_database_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.restore_database(database_id, restore_database_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#rotate_autonomous_container_database_encryption_key} and then waits for the {OCI::Database::Models::AutonomousContainerDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [String] autonomous_container_database_id The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousContainerDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#rotate_autonomous_container_database_encryption_key}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousContainerDatabase}
    def rotate_autonomous_container_database_encryption_key_and_wait_for_state(autonomous_container_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.rotate_autonomous_container_database_encryption_key(autonomous_container_database_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_container_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#rotate_autonomous_database_encryption_key} and then waits for the {OCI::Database::Models::AutonomousDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#rotate_autonomous_database_encryption_key}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousDatabase}
    def rotate_autonomous_database_encryption_key_and_wait_for_state(autonomous_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.rotate_autonomous_database_encryption_key(autonomous_database_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#rotate_cloud_autonomous_vm_cluster_ords_certs} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] cloud_autonomous_vm_cluster_id The Cloud VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#rotate_cloud_autonomous_vm_cluster_ords_certs}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def rotate_cloud_autonomous_vm_cluster_ords_certs_and_wait_for_state(cloud_autonomous_vm_cluster_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.rotate_cloud_autonomous_vm_cluster_ords_certs(cloud_autonomous_vm_cluster_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#rotate_cloud_autonomous_vm_cluster_ssl_certs} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] cloud_autonomous_vm_cluster_id The Cloud VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#rotate_cloud_autonomous_vm_cluster_ssl_certs}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def rotate_cloud_autonomous_vm_cluster_ssl_certs_and_wait_for_state(cloud_autonomous_vm_cluster_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.rotate_cloud_autonomous_vm_cluster_ssl_certs(cloud_autonomous_vm_cluster_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#rotate_ords_certs} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] autonomous_exadata_infrastructure_id The Autonomous Exadata Infrastructure  [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#rotate_ords_certs}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def rotate_ords_certs_and_wait_for_state(autonomous_exadata_infrastructure_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.rotate_ords_certs(autonomous_exadata_infrastructure_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#rotate_ssl_certs} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] autonomous_exadata_infrastructure_id The Autonomous Exadata Infrastructure  [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#rotate_ssl_certs}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def rotate_ssl_certs_and_wait_for_state(autonomous_exadata_infrastructure_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.rotate_ssl_certs(autonomous_exadata_infrastructure_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#rotate_vault_key} and then waits for the {OCI::Database::Models::Database} acted upon
    # to enter the given state(s).
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::Database#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#rotate_vault_key}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::Database}
    def rotate_vault_key_and_wait_for_state(database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.rotate_vault_key(database_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#scan_external_container_database_pluggable_databases} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] external_container_database_id The ExternalContainerDatabase [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] external_database_connector_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the
    #   external database connector resource (`ExternalDatabaseConnectorId`).
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#scan_external_container_database_pluggable_databases}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def scan_external_container_database_pluggable_databases_and_wait_for_state(external_container_database_id, external_database_connector_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.scan_external_container_database_pluggable_databases(external_container_database_id, external_database_connector_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#shrink_autonomous_database} and then waits for the {OCI::Database::Models::AutonomousDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#shrink_autonomous_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousDatabase}
    def shrink_autonomous_database_and_wait_for_state(autonomous_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.shrink_autonomous_database(autonomous_database_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#start_autonomous_database} and then waits for the {OCI::Database::Models::AutonomousDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#start_autonomous_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousDatabase}
    def start_autonomous_database_and_wait_for_state(autonomous_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.start_autonomous_database(autonomous_database_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#start_pluggable_database} and then waits for the {OCI::Database::Models::PluggableDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [String] pluggable_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::PluggableDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#start_pluggable_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::PluggableDatabase}
    def start_pluggable_database_and_wait_for_state(pluggable_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.start_pluggable_database(pluggable_database_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_pluggable_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#stop_autonomous_database} and then waits for the {OCI::Database::Models::AutonomousDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#stop_autonomous_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousDatabase}
    def stop_autonomous_database_and_wait_for_state(autonomous_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.stop_autonomous_database(autonomous_database_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#stop_pluggable_database} and then waits for the {OCI::Database::Models::PluggableDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [String] pluggable_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::PluggableDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#stop_pluggable_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::PluggableDatabase}
    def stop_pluggable_database_and_wait_for_state(pluggable_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.stop_pluggable_database(pluggable_database_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_pluggable_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#switchover_autonomous_container_database_dataguard_association} and then waits for the {OCI::Database::Models::AutonomousContainerDatabaseDataguardAssociation} acted upon
    # to enter the given state(s).
    #
    # @param [String] autonomous_container_database_id The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] autonomous_container_database_dataguard_association_id The Autonomous Container Database-Autonomous Data Guard association [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousContainerDatabaseDataguardAssociation#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#switchover_autonomous_container_database_dataguard_association}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousContainerDatabaseDataguardAssociation}
    def switchover_autonomous_container_database_dataguard_association_and_wait_for_state(autonomous_container_database_id, autonomous_container_database_dataguard_association_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.switchover_autonomous_container_database_dataguard_association(autonomous_container_database_id, autonomous_container_database_dataguard_association_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_container_database_dataguard_association(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#switchover_autonomous_database} and then waits for the {OCI::Database::Models::AutonomousDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#switchover_autonomous_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousDatabase}
    def switchover_autonomous_database_and_wait_for_state(autonomous_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.switchover_autonomous_database(autonomous_database_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#switchover_data_guard_association} and then waits for the {OCI::Database::Models::DataGuardAssociation} acted upon
    # to enter the given state(s).
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] data_guard_association_id The Data Guard association's [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::SwitchoverDataGuardAssociationDetails] switchover_data_guard_association_details Request to swtichover a primary to a standby.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::DataGuardAssociation#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#switchover_data_guard_association}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::DataGuardAssociation}
    def switchover_data_guard_association_and_wait_for_state(database_id, data_guard_association_id, switchover_data_guard_association_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.switchover_data_guard_association(database_id, data_guard_association_id, switchover_data_guard_association_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_data_guard_association(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#terminate_autonomous_container_database} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] autonomous_container_database_id The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#terminate_autonomous_container_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def terminate_autonomous_container_database_and_wait_for_state(autonomous_container_database_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.terminate_autonomous_container_database(autonomous_container_database_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#terminate_autonomous_exadata_infrastructure} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] autonomous_exadata_infrastructure_id The Autonomous Exadata Infrastructure  [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#terminate_autonomous_exadata_infrastructure}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def terminate_autonomous_exadata_infrastructure_and_wait_for_state(autonomous_exadata_infrastructure_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.terminate_autonomous_exadata_infrastructure(autonomous_exadata_infrastructure_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#terminate_db_system} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] db_system_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#terminate_db_system}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def terminate_db_system_and_wait_for_state(db_system_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.terminate_db_system(db_system_id, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#update_autonomous_container_database} and then waits for the {OCI::Database::Models::AutonomousContainerDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [String] autonomous_container_database_id The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateAutonomousContainerDatabaseDetails] update_autonomous_container_database_details Request to update the properties of an Autonomous Container Database.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousContainerDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_autonomous_container_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousContainerDatabase}
    def update_autonomous_container_database_and_wait_for_state(autonomous_container_database_id, update_autonomous_container_database_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_autonomous_container_database(autonomous_container_database_id, update_autonomous_container_database_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_container_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_autonomous_container_database_dataguard_association} and then waits for the {OCI::Database::Models::AutonomousContainerDatabaseDataguardAssociation} acted upon
    # to enter the given state(s).
    #
    # @param [String] autonomous_container_database_id The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] autonomous_container_database_dataguard_association_id The Autonomous Container Database-Autonomous Data Guard association [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateAutonomousContainerDatabaseDataGuardAssociationDetails] update_autonomous_container_database_data_guard_association_details A request to update Data Guard association of a database.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousContainerDatabaseDataguardAssociation#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_autonomous_container_database_dataguard_association}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousContainerDatabaseDataguardAssociation}
    def update_autonomous_container_database_dataguard_association_and_wait_for_state(autonomous_container_database_id, autonomous_container_database_dataguard_association_id, update_autonomous_container_database_data_guard_association_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_autonomous_container_database_dataguard_association(autonomous_container_database_id, autonomous_container_database_dataguard_association_id, update_autonomous_container_database_data_guard_association_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_container_database_dataguard_association(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_autonomous_database} and then waits for the {OCI::Database::Models::AutonomousDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateAutonomousDatabaseDetails] update_autonomous_database_details Request to update the properties of an Autonomous Database.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_autonomous_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousDatabase}
    def update_autonomous_database_and_wait_for_state(autonomous_database_id, update_autonomous_database_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_autonomous_database(autonomous_database_id, update_autonomous_database_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_autonomous_database_regional_wallet} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::UpdateAutonomousDatabaseWalletDetails] update_autonomous_database_wallet_details Request to update the properties of Autonomous Database regional wallet.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_autonomous_database_regional_wallet}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def update_autonomous_database_regional_wallet_and_wait_for_state(update_autonomous_database_wallet_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_autonomous_database_regional_wallet(update_autonomous_database_wallet_details, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#update_autonomous_database_wallet} and then waits for the {OCI::Database::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateAutonomousDatabaseWalletDetails] update_autonomous_database_wallet_details Request to update the properties of an Autonomous Database wallet.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_autonomous_database_wallet}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Database::Models::WorkRequest}
    def update_autonomous_database_wallet_and_wait_for_state(autonomous_database_id, update_autonomous_database_wallet_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_autonomous_database_wallet(autonomous_database_id, update_autonomous_database_wallet_details, base_operation_opts)
      use_util = OCI::Database::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Database::Util.wait_on_work_request(
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


    # Calls {OCI::Database::DatabaseClient#update_autonomous_exadata_infrastructure} and then waits for the {OCI::Database::Models::AutonomousExadataInfrastructure} acted upon
    # to enter the given state(s).
    #
    # @param [String] autonomous_exadata_infrastructure_id The Autonomous Exadata Infrastructure  [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateAutonomousExadataInfrastructureDetails] update_autonomous_exadata_infrastructures_details Request to update the properties of a Autonomous Exadata Infrastructure.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousExadataInfrastructure#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_autonomous_exadata_infrastructure}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousExadataInfrastructure}
    def update_autonomous_exadata_infrastructure_and_wait_for_state(autonomous_exadata_infrastructure_id, update_autonomous_exadata_infrastructures_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_autonomous_exadata_infrastructure(autonomous_exadata_infrastructure_id, update_autonomous_exadata_infrastructures_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_exadata_infrastructure(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_autonomous_vm_cluster} and then waits for the {OCI::Database::Models::AutonomousVmCluster} acted upon
    # to enter the given state(s).
    #
    # @param [String] autonomous_vm_cluster_id The autonomous VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateAutonomousVmClusterDetails] update_autonomous_vm_cluster_details Request to update the attributes of an Autonomous VM cluster.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::AutonomousVmCluster#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_autonomous_vm_cluster}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::AutonomousVmCluster}
    def update_autonomous_vm_cluster_and_wait_for_state(autonomous_vm_cluster_id, update_autonomous_vm_cluster_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_autonomous_vm_cluster(autonomous_vm_cluster_id, update_autonomous_vm_cluster_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_autonomous_vm_cluster(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_backup_destination} and then waits for the {OCI::Database::Models::BackupDestination} acted upon
    # to enter the given state(s).
    #
    # @param [String] backup_destination_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the backup destination.
    # @param [OCI::Database::Models::UpdateBackupDestinationDetails] update_backup_destination_details For a RECOVERY_APPLIANCE backup destination, request to update the connection string and/or the list of VPC users.
    #   For an NFS backup destination, request to update the NFS location.
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::BackupDestination#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_backup_destination}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::BackupDestination}
    def update_backup_destination_and_wait_for_state(backup_destination_id, update_backup_destination_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_backup_destination(backup_destination_id, update_backup_destination_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_backup_destination(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_cloud_autonomous_vm_cluster} and then waits for the {OCI::Database::Models::CloudAutonomousVmCluster} acted upon
    # to enter the given state(s).
    #
    # @param [String] cloud_autonomous_vm_cluster_id The Cloud VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateCloudAutonomousVmClusterDetails] update_cloud_autonomous_vm_cluster_details Request to update the attributes of a cloud VM cluster.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::CloudAutonomousVmCluster#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_cloud_autonomous_vm_cluster}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::CloudAutonomousVmCluster}
    def update_cloud_autonomous_vm_cluster_and_wait_for_state(cloud_autonomous_vm_cluster_id, update_cloud_autonomous_vm_cluster_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_cloud_autonomous_vm_cluster(cloud_autonomous_vm_cluster_id, update_cloud_autonomous_vm_cluster_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_cloud_autonomous_vm_cluster(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_cloud_exadata_infrastructure} and then waits for the {OCI::Database::Models::CloudExadataInfrastructure} acted upon
    # to enter the given state(s).
    #
    # @param [String] cloud_exadata_infrastructure_id The cloud Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateCloudExadataInfrastructureDetails] update_cloud_exadata_infrastructure_details Request to update the properties of an cloud Exadata infrastructure resource.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::CloudExadataInfrastructure#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_cloud_exadata_infrastructure}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::CloudExadataInfrastructure}
    def update_cloud_exadata_infrastructure_and_wait_for_state(cloud_exadata_infrastructure_id, update_cloud_exadata_infrastructure_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_cloud_exadata_infrastructure(cloud_exadata_infrastructure_id, update_cloud_exadata_infrastructure_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_cloud_exadata_infrastructure(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_cloud_vm_cluster} and then waits for the {OCI::Database::Models::CloudVmCluster} acted upon
    # to enter the given state(s).
    #
    # @param [String] cloud_vm_cluster_id The cloud VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateCloudVmClusterDetails] update_cloud_vm_cluster_details Request to update the attributes of a cloud VM cluster.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::CloudVmCluster#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_cloud_vm_cluster}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::CloudVmCluster}
    def update_cloud_vm_cluster_and_wait_for_state(cloud_vm_cluster_id, update_cloud_vm_cluster_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_cloud_vm_cluster(cloud_vm_cluster_id, update_cloud_vm_cluster_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_cloud_vm_cluster(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_data_guard_association} and then waits for the {OCI::Database::Models::DataGuardAssociation} acted upon
    # to enter the given state(s).
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] data_guard_association_id The Data Guard association's [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateDataGuardAssociationDetails] update_data_guard_association_details A request to update Data Guard association of a database.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::DataGuardAssociation#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_data_guard_association}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::DataGuardAssociation}
    def update_data_guard_association_and_wait_for_state(database_id, data_guard_association_id, update_data_guard_association_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_data_guard_association(database_id, data_guard_association_id, update_data_guard_association_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_data_guard_association(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_database} and then waits for the {OCI::Database::Models::Database} acted upon
    # to enter the given state(s).
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateDatabaseDetails] update_database_details Request to perform database update.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::Database#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::Database}
    def update_database_and_wait_for_state(database_id, update_database_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_database(database_id, update_database_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_database_software_image} and then waits for the {OCI::Database::Models::DatabaseSoftwareImage} acted upon
    # to enter the given state(s).
    #
    # @param [String] database_software_image_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateDatabaseSoftwareImageDetails] update_database_software_image_details Request to update the properties of a DB system.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::DatabaseSoftwareImage#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_database_software_image}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::DatabaseSoftwareImage}
    def update_database_software_image_and_wait_for_state(database_software_image_id, update_database_software_image_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_database_software_image(database_software_image_id, update_database_software_image_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_database_software_image(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_db_home} and then waits for the {OCI::Database::Models::DbHome} acted upon
    # to enter the given state(s).
    #
    # @param [String] db_home_id The Database Home [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateDbHomeDetails] update_db_home_details Request to update the properties of a Database Home.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::DbHome#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_db_home}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::DbHome}
    def update_db_home_and_wait_for_state(db_home_id, update_db_home_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_db_home(db_home_id, update_db_home_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_db_home(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_db_system} and then waits for the {OCI::Database::Models::DbSystem} acted upon
    # to enter the given state(s).
    #
    # @param [String] db_system_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateDbSystemDetails] update_db_system_details Request to update the properties of a DB system.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::DbSystem#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_db_system}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::DbSystem}
    def update_db_system_and_wait_for_state(db_system_id, update_db_system_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_db_system(db_system_id, update_db_system_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_db_system(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_exadata_infrastructure} and then waits for the {OCI::Database::Models::ExadataInfrastructure} acted upon
    # to enter the given state(s).
    #
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateExadataInfrastructureDetails] update_exadata_infrastructure_details Request to update the properties of an Exadata Cloud@Customer infrastructure.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::ExadataInfrastructure#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_exadata_infrastructure}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::ExadataInfrastructure}
    def update_exadata_infrastructure_and_wait_for_state(exadata_infrastructure_id, update_exadata_infrastructure_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_exadata_infrastructure(exadata_infrastructure_id, update_exadata_infrastructure_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_exadata_infrastructure(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_exadata_iorm_config} and then waits for the {OCI::Database::Models::ExadataIormConfig} acted upon
    # to enter the given state(s).
    #
    # @param [String] db_system_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::ExadataIormConfigUpdateDetails] exadata_iorm_config_update_details Request to perform database update.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::ExadataIormConfig#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_exadata_iorm_config}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::ExadataIormConfig}
    def update_exadata_iorm_config_and_wait_for_state(db_system_id, exadata_iorm_config_update_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_exadata_iorm_config(db_system_id, exadata_iorm_config_update_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_exadata_iorm_config(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_external_container_database} and then waits for the {OCI::Database::Models::ExternalContainerDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [String] external_container_database_id The ExternalContainerDatabase [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateExternalContainerDatabaseDetails] update_external_container_database_details Request to update the properties of an
    #   {#create_external_container_database_details create_external_container_database_details} resource.
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::ExternalContainerDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_external_container_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::ExternalContainerDatabase}
    def update_external_container_database_and_wait_for_state(external_container_database_id, update_external_container_database_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_external_container_database(external_container_database_id, update_external_container_database_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_external_container_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_external_database_connector} and then waits for the {OCI::Database::Models::ExternalDatabaseConnector} acted upon
    # to enter the given state(s).
    #
    # @param [String] external_database_connector_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the
    #   external database connector resource (`ExternalDatabaseConnectorId`).
    #
    # @param [OCI::Database::Models::UpdateExternalDatabaseConnectorDetails] update_external_database_connector_details Request to update the properties of an external database connector.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::ExternalDatabaseConnector#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_external_database_connector}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::ExternalDatabaseConnector}
    def update_external_database_connector_and_wait_for_state(external_database_connector_id, update_external_database_connector_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_external_database_connector(external_database_connector_id, update_external_database_connector_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_external_database_connector(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_external_non_container_database} and then waits for the {OCI::Database::Models::ExternalNonContainerDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [String] external_non_container_database_id The external non-container database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateExternalNonContainerDatabaseDetails] update_external_non_container_database_details Request to update the properties of an external non-container database.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::ExternalNonContainerDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_external_non_container_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::ExternalNonContainerDatabase}
    def update_external_non_container_database_and_wait_for_state(external_non_container_database_id, update_external_non_container_database_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_external_non_container_database(external_non_container_database_id, update_external_non_container_database_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_external_non_container_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_external_pluggable_database} and then waits for the {OCI::Database::Models::ExternalPluggableDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [String] external_pluggable_database_id The ExternalPluggableDatabaseId [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateExternalPluggableDatabaseDetails] update_external_pluggable_database_details Request to update the properties of an external pluggable database resource.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::ExternalPluggableDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_external_pluggable_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::ExternalPluggableDatabase}
    def update_external_pluggable_database_and_wait_for_state(external_pluggable_database_id, update_external_pluggable_database_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_external_pluggable_database(external_pluggable_database_id, update_external_pluggable_database_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_external_pluggable_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_key_store} and then waits for the {OCI::Database::Models::KeyStore} acted upon
    # to enter the given state(s).
    #
    # @param [String] key_store_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the key store.
    # @param [OCI::Database::Models::UpdateKeyStoreDetails] update_key_store_details Request to update the attributes of a key store.
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::KeyStore#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_key_store}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::KeyStore}
    def update_key_store_and_wait_for_state(key_store_id, update_key_store_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_key_store(key_store_id, update_key_store_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_key_store(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_maintenance_run} and then waits for the {OCI::Database::Models::MaintenanceRun} acted upon
    # to enter the given state(s).
    #
    # @param [String] maintenance_run_id The maintenance run OCID.
    # @param [OCI::Database::Models::UpdateMaintenanceRunDetails] update_maintenance_run_details Request to update the properties of a maintenance run.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::MaintenanceRun#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_maintenance_run}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::MaintenanceRun}
    def update_maintenance_run_and_wait_for_state(maintenance_run_id, update_maintenance_run_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_maintenance_run(maintenance_run_id, update_maintenance_run_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_maintenance_run(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_pluggable_database} and then waits for the {OCI::Database::Models::PluggableDatabase} acted upon
    # to enter the given state(s).
    #
    # @param [String] pluggable_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdatePluggableDatabaseDetails] update_pluggable_database_details Request to perform pluggable database update.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::PluggableDatabase#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_pluggable_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::PluggableDatabase}
    def update_pluggable_database_and_wait_for_state(pluggable_database_id, update_pluggable_database_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_pluggable_database(pluggable_database_id, update_pluggable_database_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_pluggable_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_vm_cluster} and then waits for the {OCI::Database::Models::VmCluster} acted upon
    # to enter the given state(s).
    #
    # @param [String] vm_cluster_id The VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateVmClusterDetails] update_vm_cluster_details Request to update the attributes of a VM cluster.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::VmCluster#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_vm_cluster}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::VmCluster}
    def update_vm_cluster_and_wait_for_state(vm_cluster_id, update_vm_cluster_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_vm_cluster(vm_cluster_id, update_vm_cluster_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_vm_cluster(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#update_vm_cluster_network} and then waits for the {OCI::Database::Models::VmClusterNetwork} acted upon
    # to enter the given state(s).
    #
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] vm_cluster_network_id The VM cluster network [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateVmClusterNetworkDetails] update_vm_cluster_network_details Request to update the properties of a VM cluster network.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::VmClusterNetwork#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#update_vm_cluster_network}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::VmClusterNetwork}
    def update_vm_cluster_network_and_wait_for_state(exadata_infrastructure_id, vm_cluster_network_id, update_vm_cluster_network_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_vm_cluster_network(exadata_infrastructure_id, vm_cluster_network_id, update_vm_cluster_network_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_vm_cluster_network(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#upgrade_database} and then waits for the {OCI::Database::Models::Database} acted upon
    # to enter the given state(s).
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpgradeDatabaseDetails] upgrade_database_details Request to perform a database upgrade.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::Database#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#upgrade_database}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::Database}
    def upgrade_database_and_wait_for_state(database_id, upgrade_database_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.upgrade_database(database_id, upgrade_database_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_database(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#upgrade_db_system} and then waits for the {OCI::Database::Models::DbSystem} acted upon
    # to enter the given state(s).
    #
    # @param [String] db_system_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpgradeDbSystemDetails] upgrade_db_system_details Request to perform an upgrade of the operating system and the Oracle Grid Infrastructure (GI) of the DB system.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::DbSystem#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#upgrade_db_system}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::DbSystem}
    def upgrade_db_system_and_wait_for_state(db_system_id, upgrade_db_system_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.upgrade_db_system(db_system_id, upgrade_db_system_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_db_system(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Database::DatabaseClient#validate_vm_cluster_network} and then waits for the {OCI::Database::Models::VmClusterNetwork} acted upon
    # to enter the given state(s).
    #
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] vm_cluster_network_id The VM cluster network [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::VmClusterNetwork#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#validate_vm_cluster_network}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Database::Models::VmClusterNetwork}
    def validate_vm_cluster_network_and_wait_for_state(exadata_infrastructure_id, vm_cluster_network_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.validate_vm_cluster_network(exadata_infrastructure_id, vm_cluster_network_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_vm_cluster_network(wait_for_resource_id).wait_until(
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
