# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

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


    # Calls {OCI::Database::DatabaseClient#create_data_guard_association} and then waits for the {OCI::Database::Models::DataGuardAssociation} acted upon
    # to enter the given state(s).
    #
    # @param [String] database_id The database [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
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


    # Calls {OCI::Database::DatabaseClient#create_db_home} and then waits for the {OCI::Database::Models::DbHome} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::CreateDbHomeWithDbSystemIdBase] create_db_home_with_db_system_id_details Request to create a new DB Home.
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


    # Calls {OCI::Database::DatabaseClient#db_node_action} and then waits for the {OCI::Database::Models::DbNode} acted upon
    # to enter the given state(s).
    #
    # @param [String] db_node_id The database node [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
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


    # Calls {OCI::Database::DatabaseClient#delete_backup} and then waits for the {OCI::Database::Models::Backup} acted upon
    # to enter the given state(s).
    #
    # @param [String] backup_id The backup OCID.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::Backup#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#delete_backup}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_backup_and_wait_for_state(backup_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_backup(backup_id)
      operation_result = @service_client.delete_backup(backup_id, base_operation_opts)

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


    # Calls {OCI::Database::DatabaseClient#delete_db_home} and then waits for the {OCI::Database::Models::DbHome} acted upon
    # to enter the given state(s).
    #
    # @param [String] db_home_id The database home [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::DbHome#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#delete_db_home}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_db_home_and_wait_for_state(db_home_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_db_home(db_home_id)
      operation_result = @service_client.delete_db_home(db_home_id, base_operation_opts)

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


    # Calls {OCI::Database::DatabaseClient#launch_db_system} and then waits for the {OCI::Database::Models::DbSystem} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Database::Models::LaunchDbSystemBase] launch_db_system_details Request to launch a DB System.
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


    # Calls {OCI::Database::DatabaseClient#terminate_db_system} and then waits for the {OCI::Database::Models::DbSystem} acted upon
    # to enter the given state(s).
    #
    # @param [String] db_system_id The DB System [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Database::Models::DbSystem#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Database::DatabaseClient#terminate_db_system}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def terminate_db_system_and_wait_for_state(db_system_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_db_system(db_system_id)
      operation_result = @service_client.terminate_db_system(db_system_id, base_operation_opts)

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


    # Calls {OCI::Database::DatabaseClient#update_database} and then waits for the {OCI::Database::Models::Database} acted upon
    # to enter the given state(s).
    #
    # @param [String] database_id The database [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
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


    # Calls {OCI::Database::DatabaseClient#update_db_home} and then waits for the {OCI::Database::Models::DbHome} acted upon
    # to enter the given state(s).
    #
    # @param [String] db_home_id The database home [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateDbHomeDetails] update_db_home_details Request to update the properties of a DB Home.
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
    # @param [String] db_system_id The DB System [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateDbSystemDetails] update_db_system_details Request to update the properties of a DB System.
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
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
