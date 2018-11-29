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

    # --- Start of region realm mapping ---
    REGION_REALM_MAPPING = {
      'us-phoenix-1': 'oc1'.freeze,
      'us-ashburn-1': 'oc1'.freeze,
      'eu-frankfurt-1': 'oc1'.freeze,
      'uk-london-1': 'oc1'.freeze
    }.freeze
    # ---  end of region realm mapping  ---

    # --- Start of realm domain mapping ---
    REALM_DOMAIN_MAPPING = {
      'oc1': 'oraclecloud.com'.freeze
    }.freeze
    # ---  end of realm domain mapping  ---

    # --- Start of service prefixes ---
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
      EmailClient: 'email',
      ContainerEngineClient: 'containerengine',
      ResourceSearchClient: 'query',
      ComputeManagementClient: 'iaas'
    }.freeze
    # --- End of service prefixes ---

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

    # Returns an endpoint for the given region and service endpoint template.
    #
    # @param [String] region A region used to determine the service endpoint. This will usually
    #   correspond to a value in {OCI::Regions::REGION_ENUM}, but may be an arbitrary string.
    # @param [String] endpoint_template A service endpoint template defined by service team in spec.
    #
    # @return [String] A fully qualified endpoint
    def self.get_service_endpoint_for_template(region, endpoint_template)
      endpoint = endpoint_template.clone

      # replace the token inside service_endpoint_template if exists
      [
        ['{region}', region],
        ['{secondLevelDomain}', get_second_level_domain(region).to_s]
      ].each { |k, v| endpoint.sub!(k, v) }
      endpoint
    end

    # @return [Boolean] Returns true if the given string corresponds to a known region, as defined in
    # {OCI::Regions::REGION_ENUM}.
    def self.valid_region?(region)
      REGION_ENUM.include? region
    end

    def self.format_endpoint(prefix, region)
      second_level_domain = get_second_level_domain(region)
      "https://#{prefix}.#{region}.#{second_level_domain}"
    end

    # Returns a second level domain for the given region.
    #
    # @param [String] region A region used to get the second level domain. This will usually
    #   correspond to a value in {OCI::Regions::REGION_ENUM}, but may be an arbitrary string.
    #
    # @return [String] A second level domain for given region, default to oraclecloud.com
    def self.get_second_level_domain(region)
      symbolised_region = region.to_sym

      # get realm from region, default to oc1
      realm = if REGION_REALM_MAPPING.key?(symbolised_region)
                REGION_REALM_MAPPING[symbolised_region]
              else
                'oc1'
              end

      # return second level domain if exists
      symbolised_realm = realm.to_sym
      return REALM_DOMAIN_MAPPING[symbolised_realm] if REALM_DOMAIN_MAPPING.key?(symbolised_realm)

      # otherwise return oc1 domain by default
      REALM_DOMAIN_MAPPING[:oc1]
    end
  end
end
