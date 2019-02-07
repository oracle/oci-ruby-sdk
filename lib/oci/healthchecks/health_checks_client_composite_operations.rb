# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::Healthchecks::HealthChecksClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class Healthchecks::HealthChecksClientCompositeOperations
    # The {OCI::Healthchecks::HealthChecksClient} used to communicate with the service_client
    #
    # @return [OCI::Healthchecks::HealthChecksClient]
    attr_reader :service_client

    # Initializes a new HealthChecksClientCompositeOperations
    #
    # @param [OCI::Healthchecks::HealthChecksClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::Healthchecks::HealthChecksClient#initialize} with no arguments
    def initialize(service_client = OCI::Healthchecks::HealthChecksClient.new)
      @service_client = service_client
    end
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
