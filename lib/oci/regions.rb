# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

module OCI
  # Module defining available regions and helper methods to get value service endpoints
  module Regions
    REGION_ENUM = [
      REGION_US_PHOENIX_1 = 'us-phoenix-1'.freeze,
      REGION_US_ASHBURN_1 = 'us-ashburn-1'.freeze,
      REGION_EU_FRANKFURT_1 = 'eu-frankfurt-1'.freeze,
      REGION_UK_LONDON_1 = 'uk-london-1'.freeze
    ].freeze

    REGION_SHORT_NAMES_TO_LONG_NAMES = {
      'phx': REGION_US_PHOENIX_1,
      'iad': REGION_US_ASHBURN_1,
      'fra': REGION_EU_FRANKFURT_1,
      'lhr': REGION_UK_LONDON_1
    }.freeze

    SERVICE_ENDPOINT_PREFIX_MAPPING = {
      BlockstorageClient: 'iaas',
      ComputeClient: 'iaas',
      VirtualNetworkClient: 'iaas',
      IdentityClient: 'identity',
      LoadBalancerClient: 'iaas',
      ObjectStorageClient: 'objectstorage',
      DatabaseClient: 'database',
      AuditClient: 'audit',
      Auth: 'auth',
      DnsClient: 'dns',
      FileStorageClient: 'filestorage',
      EmailClient: 'email'
    }.freeze

    # Returns an endpoint for the given region and service.
    #
    # @param [String] region A region used to determine the service endpoint. This will usually
    #   correspond to a value in {OCI::Regions::REGION_ENUM}, but may be an arbitrary string.
    # @param [Symbol] service A symbol representing a service client class (e.g. :IdentityClient)
    #
    # @return [String] A fully qualified endpoint
    def self.get_service_endpoint(region, service)
      prefix = SERVICE_ENDPOINT_PREFIX_MAPPING[service]
      raise "Service '#{service}' is not supported." unless prefix
      format_endpoint(prefix, region)
    end

    # @return [Boolean] Returns true if the given string corresponds to a known region, as defined in
    # {OCI::Regions::REGION_ENUM}.
    def self.valid_region?(region)
      REGION_ENUM.include? region
    end

    def self.format_endpoint(prefix, region)
      "https://#{prefix}.#{region}.oraclecloud.com"
    end
  end
end
