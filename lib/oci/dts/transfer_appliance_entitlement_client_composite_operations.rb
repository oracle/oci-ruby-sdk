# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::Dts::TransferApplianceEntitlementClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class Dts::TransferApplianceEntitlementClientCompositeOperations
    # The {OCI::Dts::TransferApplianceEntitlementClient} used to communicate with the service_client
    #
    # @return [OCI::Dts::TransferApplianceEntitlementClient]
    attr_reader :service_client

    # Initializes a new TransferApplianceEntitlementClientCompositeOperations
    #
    # @param [OCI::Dts::TransferApplianceEntitlementClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::Dts::TransferApplianceEntitlementClient#initialize} with no arguments
    def initialize(service_client = OCI::Dts::TransferApplianceEntitlementClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::Dts::TransferApplianceEntitlementClient#create_transfer_appliance_entitlement} and then waits for the {OCI::Dts::Models::TransferApplianceEntitlement} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::Dts::Models::CreateTransferApplianceEntitlementDetails] create_transfer_appliance_entitlement_details Creates a Transfer Appliance Entitlement
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Dts::Models::TransferApplianceEntitlement#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Dts::TransferApplianceEntitlementClient#create_transfer_appliance_entitlement}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Dts::Models::TransferApplianceEntitlement}
    def create_transfer_appliance_entitlement_and_wait_for_state(create_transfer_appliance_entitlement_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_transfer_appliance_entitlement(create_transfer_appliance_entitlement_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_transfer_appliance_entitlement(wait_for_resource_id).wait_until(
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
