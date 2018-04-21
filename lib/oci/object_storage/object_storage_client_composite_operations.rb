# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::ObjectStorage::ObjectStorageClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class ObjectStorage::ObjectStorageClientCompositeOperations
    # The {OCI::ObjectStorage::ObjectStorageClient} used to communicate with the service_client
    #
    # @return [OCI::ObjectStorage::ObjectStorageClient]
    attr_reader :service_client

    # Initializes a new ObjectStorageClientCompositeOperations
    #
    # @param [OCI::ObjectStorage::ObjectStorageClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::ObjectStorage::ObjectStorageClient#initialize} with no arguments
    def initialize(service_client = OCI::ObjectStorage::ObjectStorageClient.new)
      @service_client = service_client
    end
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
