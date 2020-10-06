# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::DataCatalog::DataCatalogClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class DataCatalog::DataCatalogClientCompositeOperations
    # The {OCI::DataCatalog::DataCatalogClient} used to communicate with the service_client
    #
    # @return [OCI::DataCatalog::DataCatalogClient]
    attr_reader :service_client

    # Initializes a new DataCatalogClientCompositeOperations
    #
    # @param [OCI::DataCatalog::DataCatalogClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::DataCatalog::DataCatalogClient#initialize} with no arguments
    def initialize(service_client = OCI::DataCatalog::DataCatalogClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::DataCatalog::DataCatalogClient#attach_catalog_private_endpoint} and then waits for the {OCI::DataCatalog::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::DataCatalog::Models::AttachCatalogPrivateEndpointDetails] attach_catalog_private_endpoint_details Details for private reverse connection endpoint to be used for attachment.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#attach_catalog_private_endpoint}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::DataCatalog::Models::WorkRequest}
    def attach_catalog_private_endpoint_and_wait_for_state(attach_catalog_private_endpoint_details, catalog_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.attach_catalog_private_endpoint(attach_catalog_private_endpoint_details, catalog_id, base_operation_opts)
      use_util = OCI::DataCatalog::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::DataCatalog::Util.wait_on_work_request(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#change_catalog_compartment} and then waits for the {OCI::DataCatalog::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::DataCatalog::Models::ChangeCatalogCompartmentDetails] change_catalog_compartment_details Details for the target compartment.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#change_catalog_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::DataCatalog::Models::WorkRequest}
    def change_catalog_compartment_and_wait_for_state(change_catalog_compartment_details, catalog_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_catalog_compartment(change_catalog_compartment_details, catalog_id, base_operation_opts)
      use_util = OCI::DataCatalog::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::DataCatalog::Util.wait_on_work_request(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#change_catalog_private_endpoint_compartment} and then waits for the {OCI::DataCatalog::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::DataCatalog::Models::ChangeCatalogPrivateEndpointCompartmentDetails] change_catalog_private_endpoint_compartment_details Details for the target compartment.
    # @param [String] catalog_private_endpoint_id Unique private reverse connection identifier.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#change_catalog_private_endpoint_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::DataCatalog::Models::WorkRequest}
    def change_catalog_private_endpoint_compartment_and_wait_for_state(change_catalog_private_endpoint_compartment_details, catalog_private_endpoint_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_catalog_private_endpoint_compartment(change_catalog_private_endpoint_compartment_details, catalog_private_endpoint_id, base_operation_opts)
      use_util = OCI::DataCatalog::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::DataCatalog::Util.wait_on_work_request(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#create_attribute} and then waits for the {OCI::DataCatalog::Models::Attribute} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
    # @param [OCI::DataCatalog::Models::CreateAttributeDetails] create_attribute_details The information used to create an entity attribute.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::Attribute#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#create_attribute}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::Attribute}
    def create_attribute_and_wait_for_state(catalog_id, data_asset_key, entity_key, create_attribute_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_attribute(catalog_id, data_asset_key, entity_key, create_attribute_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_attribute(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#create_attribute_tag} and then waits for the {OCI::DataCatalog::Models::AttributeTag} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
    # @param [String] attribute_key Unique attribute key.
    # @param [OCI::DataCatalog::Models::CreateTagDetails] create_attribute_tag_details The information used to create an entity attribute tag.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::AttributeTag#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#create_attribute_tag}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::AttributeTag}
    def create_attribute_tag_and_wait_for_state(catalog_id, data_asset_key, entity_key, attribute_key, create_attribute_tag_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_attribute_tag(catalog_id, data_asset_key, entity_key, attribute_key, create_attribute_tag_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_attribute_tag(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#create_catalog} and then waits for the {OCI::DataCatalog::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::DataCatalog::Models::CreateCatalogDetails] create_catalog_details Details for the new data catalog.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#create_catalog}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::DataCatalog::Models::WorkRequest}
    def create_catalog_and_wait_for_state(create_catalog_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_catalog(create_catalog_details, base_operation_opts)
      use_util = OCI::DataCatalog::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::DataCatalog::Util.wait_on_work_request(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#create_catalog_private_endpoint} and then waits for the {OCI::DataCatalog::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::DataCatalog::Models::CreateCatalogPrivateEndpointDetails] create_catalog_private_endpoint_details The information used to create the private reverse connection.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#create_catalog_private_endpoint}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::DataCatalog::Models::WorkRequest}
    def create_catalog_private_endpoint_and_wait_for_state(create_catalog_private_endpoint_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_catalog_private_endpoint(create_catalog_private_endpoint_details, base_operation_opts)
      use_util = OCI::DataCatalog::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::DataCatalog::Util.wait_on_work_request(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#create_connection} and then waits for the {OCI::DataCatalog::Models::Connection} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [OCI::DataCatalog::Models::CreateConnectionDetails] create_connection_details The information used to create the connection.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::Connection#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#create_connection}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::Connection}
    def create_connection_and_wait_for_state(catalog_id, data_asset_key, create_connection_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_connection(catalog_id, data_asset_key, create_connection_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_connection(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#create_data_asset} and then waits for the {OCI::DataCatalog::Models::DataAsset} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [OCI::DataCatalog::Models::CreateDataAssetDetails] create_data_asset_details The information used to create the data asset.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::DataAsset#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#create_data_asset}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::DataAsset}
    def create_data_asset_and_wait_for_state(catalog_id, create_data_asset_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_data_asset(catalog_id, create_data_asset_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_data_asset(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#create_data_asset_tag} and then waits for the {OCI::DataCatalog::Models::DataAssetTag} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [OCI::DataCatalog::Models::CreateTagDetails] create_data_asset_tag_details The information used to create the data asset tag.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::DataAssetTag#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#create_data_asset_tag}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::DataAssetTag}
    def create_data_asset_tag_and_wait_for_state(catalog_id, data_asset_key, create_data_asset_tag_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_data_asset_tag(catalog_id, data_asset_key, create_data_asset_tag_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_data_asset_tag(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#create_entity} and then waits for the {OCI::DataCatalog::Models::Entity} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [OCI::DataCatalog::Models::CreateEntityDetails] create_entity_details The information used to create the data entity.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::Entity#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#create_entity}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::Entity}
    def create_entity_and_wait_for_state(catalog_id, data_asset_key, create_entity_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_entity(catalog_id, data_asset_key, create_entity_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_entity(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#create_entity_tag} and then waits for the {OCI::DataCatalog::Models::EntityTag} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
    # @param [OCI::DataCatalog::Models::CreateTagDetails] create_entity_tag_details The information used to create the entity tag.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::EntityTag#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#create_entity_tag}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::EntityTag}
    def create_entity_tag_and_wait_for_state(catalog_id, data_asset_key, entity_key, create_entity_tag_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_entity_tag(catalog_id, data_asset_key, entity_key, create_entity_tag_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_entity_tag(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#create_folder} and then waits for the {OCI::DataCatalog::Models::Folder} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [OCI::DataCatalog::Models::CreateFolderDetails] create_folder_details The information used to create the folder.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::Folder#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#create_folder}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::Folder}
    def create_folder_and_wait_for_state(catalog_id, data_asset_key, create_folder_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_folder(catalog_id, data_asset_key, create_folder_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_folder(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#create_folder_tag} and then waits for the {OCI::DataCatalog::Models::FolderTag} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] folder_key Unique folder key.
    # @param [OCI::DataCatalog::Models::CreateTagDetails] create_folder_tag_details The information used to create the folder tag.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::FolderTag#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#create_folder_tag}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::FolderTag}
    def create_folder_tag_and_wait_for_state(catalog_id, data_asset_key, folder_key, create_folder_tag_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_folder_tag(catalog_id, data_asset_key, folder_key, create_folder_tag_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_folder_tag(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#create_glossary} and then waits for the {OCI::DataCatalog::Models::Glossary} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [OCI::DataCatalog::Models::CreateGlossaryDetails] create_glossary_details The information used to create the glossary.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::Glossary#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#create_glossary}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::Glossary}
    def create_glossary_and_wait_for_state(catalog_id, create_glossary_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_glossary(catalog_id, create_glossary_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_glossary(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#create_job} and then waits for the {OCI::DataCatalog::Models::Job} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [OCI::DataCatalog::Models::CreateJobDetails] create_job_details The information used to create the job.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::Job#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#create_job}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::Job}
    def create_job_and_wait_for_state(catalog_id, create_job_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_job(catalog_id, create_job_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_job(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#create_job_definition} and then waits for the {OCI::DataCatalog::Models::JobDefinition} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [OCI::DataCatalog::Models::CreateJobDefinitionDetails] create_job_definition_details The information used to create the job definition.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::JobDefinition#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#create_job_definition}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::JobDefinition}
    def create_job_definition_and_wait_for_state(catalog_id, create_job_definition_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_job_definition(catalog_id, create_job_definition_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_job_definition(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#create_job_execution} and then waits for the {OCI::DataCatalog::Models::JobExecution} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] job_key Unique job key.
    # @param [OCI::DataCatalog::Models::CreateJobExecutionDetails] create_job_execution_details The information used to create the job execution.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::JobExecution#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#create_job_execution}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::JobExecution}
    def create_job_execution_and_wait_for_state(catalog_id, job_key, create_job_execution_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_job_execution(catalog_id, job_key, create_job_execution_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_job_execution(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#create_term} and then waits for the {OCI::DataCatalog::Models::Term} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] glossary_key Unique glossary key.
    # @param [OCI::DataCatalog::Models::CreateTermDetails] create_term_details The information used to create the term.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::Term#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#create_term}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::Term}
    def create_term_and_wait_for_state(catalog_id, glossary_key, create_term_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_term(catalog_id, glossary_key, create_term_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_term(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#create_term_relationship} and then waits for the {OCI::DataCatalog::Models::TermRelationship} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] glossary_key Unique glossary key.
    # @param [String] term_key Unique glossary term key.
    # @param [OCI::DataCatalog::Models::CreateTermRelationshipDetails] create_term_relationship_details The information used to create the term relationship.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::TermRelationship#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#create_term_relationship}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::TermRelationship}
    def create_term_relationship_and_wait_for_state(catalog_id, glossary_key, term_key, create_term_relationship_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_term_relationship(catalog_id, glossary_key, term_key, create_term_relationship_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_term_relationship(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#delete_catalog} and then waits for the {OCI::DataCatalog::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#delete_catalog}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::DataCatalog::Models::WorkRequest}
    def delete_catalog_and_wait_for_state(catalog_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_catalog(catalog_id, base_operation_opts)
      use_util = OCI::DataCatalog::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::DataCatalog::Util.wait_on_work_request(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#delete_catalog_private_endpoint} and then waits for the {OCI::DataCatalog::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] catalog_private_endpoint_id Unique private reverse connection identifier.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#delete_catalog_private_endpoint}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::DataCatalog::Models::WorkRequest}
    def delete_catalog_private_endpoint_and_wait_for_state(catalog_private_endpoint_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_catalog_private_endpoint(catalog_private_endpoint_id, base_operation_opts)
      use_util = OCI::DataCatalog::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::DataCatalog::Util.wait_on_work_request(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#detach_catalog_private_endpoint} and then waits for the {OCI::DataCatalog::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::DataCatalog::Models::DetachCatalogPrivateEndpointDetails] detach_catalog_private_endpoint_details Details for private reverse connection endpoint to be used for attachment
    # @param [String] catalog_id Unique catalog identifier.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#detach_catalog_private_endpoint}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::DataCatalog::Models::WorkRequest}
    def detach_catalog_private_endpoint_and_wait_for_state(detach_catalog_private_endpoint_details, catalog_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.detach_catalog_private_endpoint(detach_catalog_private_endpoint_details, catalog_id, base_operation_opts)
      use_util = OCI::DataCatalog::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::DataCatalog::Util.wait_on_work_request(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#update_attribute} and then waits for the {OCI::DataCatalog::Models::Attribute} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
    # @param [String] attribute_key Unique attribute key.
    # @param [OCI::DataCatalog::Models::UpdateAttributeDetails] update_attribute_details The information to be updated in the attribute.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::Attribute#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#update_attribute}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::Attribute}
    def update_attribute_and_wait_for_state(catalog_id, data_asset_key, entity_key, attribute_key, update_attribute_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_attribute(catalog_id, data_asset_key, entity_key, attribute_key, update_attribute_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_attribute(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#update_catalog} and then waits for the {OCI::DataCatalog::Models::Catalog} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [OCI::DataCatalog::Models::UpdateCatalogDetails] update_catalog_details The data catalog information to be updated.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::Catalog#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#update_catalog}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::Catalog}
    def update_catalog_and_wait_for_state(catalog_id, update_catalog_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_catalog(catalog_id, update_catalog_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_catalog(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#update_catalog_private_endpoint} and then waits for the {OCI::DataCatalog::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] catalog_private_endpoint_id Unique private reverse connection identifier.
    # @param [OCI::DataCatalog::Models::UpdateCatalogPrivateEndpointDetails] update_catalog_private_endpoint_details The information to be updated in private reverse connection
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#update_catalog_private_endpoint}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::DataCatalog::Models::WorkRequest}
    def update_catalog_private_endpoint_and_wait_for_state(catalog_private_endpoint_id, update_catalog_private_endpoint_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_catalog_private_endpoint(catalog_private_endpoint_id, update_catalog_private_endpoint_details, base_operation_opts)
      use_util = OCI::DataCatalog::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::DataCatalog::Util.wait_on_work_request(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#update_connection} and then waits for the {OCI::DataCatalog::Models::Connection} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] connection_key Unique connection key.
    # @param [OCI::DataCatalog::Models::UpdateConnectionDetails] update_connection_details The information to be updated in the connection.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::Connection#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#update_connection}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::Connection}
    def update_connection_and_wait_for_state(catalog_id, data_asset_key, connection_key, update_connection_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_connection(catalog_id, data_asset_key, connection_key, update_connection_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_connection(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#update_data_asset} and then waits for the {OCI::DataCatalog::Models::DataAsset} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [OCI::DataCatalog::Models::UpdateDataAssetDetails] update_data_asset_details The information to be updated in the data asset.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::DataAsset#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#update_data_asset}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::DataAsset}
    def update_data_asset_and_wait_for_state(catalog_id, data_asset_key, update_data_asset_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_data_asset(catalog_id, data_asset_key, update_data_asset_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_data_asset(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#update_entity} and then waits for the {OCI::DataCatalog::Models::Entity} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
    # @param [OCI::DataCatalog::Models::UpdateEntityDetails] update_entity_details The information to be updated in the data entity.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::Entity#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#update_entity}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::Entity}
    def update_entity_and_wait_for_state(catalog_id, data_asset_key, entity_key, update_entity_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_entity(catalog_id, data_asset_key, entity_key, update_entity_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_entity(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#update_folder} and then waits for the {OCI::DataCatalog::Models::Folder} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] folder_key Unique folder key.
    # @param [OCI::DataCatalog::Models::UpdateFolderDetails] update_folder_details The information to be updated in the folder.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::Folder#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#update_folder}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::Folder}
    def update_folder_and_wait_for_state(catalog_id, data_asset_key, folder_key, update_folder_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_folder(catalog_id, data_asset_key, folder_key, update_folder_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_folder(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#update_glossary} and then waits for the {OCI::DataCatalog::Models::Glossary} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] glossary_key Unique glossary key.
    # @param [OCI::DataCatalog::Models::UpdateGlossaryDetails] update_glossary_details The information to be updated in the glossary.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::Glossary#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#update_glossary}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::Glossary}
    def update_glossary_and_wait_for_state(catalog_id, glossary_key, update_glossary_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_glossary(catalog_id, glossary_key, update_glossary_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_glossary(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#update_job} and then waits for the {OCI::DataCatalog::Models::Job} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] job_key Unique job key.
    # @param [OCI::DataCatalog::Models::UpdateJobDetails] update_job_details The information to be updated in the job.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::Job#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#update_job}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::Job}
    def update_job_and_wait_for_state(catalog_id, job_key, update_job_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_job(catalog_id, job_key, update_job_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_job(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#update_job_definition} and then waits for the {OCI::DataCatalog::Models::JobDefinition} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] job_definition_key Unique job definition key.
    # @param [OCI::DataCatalog::Models::UpdateJobDefinitionDetails] update_job_definition_details The information to be updated in the job definition.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::JobDefinition#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#update_job_definition}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::JobDefinition}
    def update_job_definition_and_wait_for_state(catalog_id, job_definition_key, update_job_definition_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_job_definition(catalog_id, job_definition_key, update_job_definition_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_job_definition(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#update_term} and then waits for the {OCI::DataCatalog::Models::Term} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] glossary_key Unique glossary key.
    # @param [String] term_key Unique glossary term key.
    # @param [OCI::DataCatalog::Models::UpdateTermDetails] update_term_details The information to be updated in the term.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::Term#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#update_term}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::Term}
    def update_term_and_wait_for_state(catalog_id, glossary_key, term_key, update_term_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_term(catalog_id, glossary_key, term_key, update_term_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_term(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#update_term_relationship} and then waits for the {OCI::DataCatalog::Models::TermRelationship} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] glossary_key Unique glossary key.
    # @param [String] term_key Unique glossary term key.
    # @param [String] term_relationship_key Unique glossary term relationship key.
    # @param [OCI::DataCatalog::Models::UpdateTermRelationshipDetails] update_term_relationship_details The information to be updated in the term relationship.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::TermRelationship#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#update_term_relationship}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::TermRelationship}
    def update_term_relationship_and_wait_for_state(catalog_id, glossary_key, term_key, term_relationship_key, update_term_relationship_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_term_relationship(catalog_id, glossary_key, term_key, term_relationship_key, update_term_relationship_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_term_relationship(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DataCatalog::DataCatalogClient#upload_credentials} and then waits for the {OCI::DataCatalog::Models::Connection} acted upon
    # to enter the given state(s).
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] connection_key Unique connection key.
    # @param [OCI::DataCatalog::Models::UploadCredentialsDetails] upload_credentials_details The information used to upload the credentials file and metadata for updating this connection.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DataCatalog::Models::Connection#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DataCatalog::DataCatalogClient#upload_credentials}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DataCatalog::Models::Connection}
    def upload_credentials_and_wait_for_state(catalog_id, data_asset_key, connection_key, upload_credentials_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.upload_credentials(catalog_id, data_asset_key, connection_key, upload_credentials_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_connection(wait_for_resource_id).wait_until(
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
