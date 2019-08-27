# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'pp'

module OCI
  # Module defining available regions and helper methods to get value service endpoints
  module Regions
    REGION_ENUM = [
      REGION_AP_MUMBAI_1 = 'ap-mumbai-1'.freeze,
      REGION_AP_SEOUL_1 = 'ap-seoul-1'.freeze,
      REGION_AP_TOKYO_1 = 'ap-tokyo-1'.freeze,
      REGION_CA_TORONTO_1 = 'ca-toronto-1'.freeze,
      REGION_EU_FRANKFURT_1 = 'eu-frankfurt-1'.freeze,
      REGION_EU_ZURICH_1 = 'eu-zurich-1'.freeze,
      REGION_SA_SAOPAULO_1 = 'sa-saopaulo-1'.freeze,
      REGION_UK_LONDON_1 = 'uk-london-1'.freeze,
      REGION_US_PHOENIX_1 = 'us-phoenix-1'.freeze,
      REGION_US_ASHBURN_1 = 'us-ashburn-1'.freeze,
      REGION_US_LANGLEY_1 = 'us-langley-1'.freeze,
      REGION_US_LUKE_1 = 'us-luke-1'.freeze,
      REGION_US_GOV_ASHBURN_1 = 'us-gov-ashburn-1'.freeze,
      REGION_US_GOV_PHOENIX_1 = 'us-gov-phoenix-1'.freeze,
      REGION_US_GOV_CHICAGO_1 = 'us-gov-chicago-1'.freeze
    ].freeze

    REGION_SHORT_NAMES_TO_LONG_NAMES = {
      'bom': REGION_AP_MUMBAI_1,
      'fra': REGION_EU_FRANKFURT_1,
      'gru': REGION_SA_SAOPAULO_1,
      'iad': REGION_US_ASHBURN_1,
      'icn': REGION_AP_SEOUL_1,
      'lhr': REGION_UK_LONDON_1,
      'nrt': REGION_AP_TOKYO_1,
      'phx': REGION_US_PHOENIX_1,
      'yyz': REGION_CA_TORONTO_1,
      'zrh': REGION_EU_ZURICH_1
    }.freeze

    # --- Start of region realm mapping ---
    REGION_REALM_MAPPING = {
      'ap-mumbai-1': 'oc1'.freeze,
      'ap-seoul-1': 'oc1'.freeze,
      'ap-tokyo-1': 'oc1'.freeze,
      'ca-toronto-1': 'oc1'.freeze,
      'eu-frankfurt-1': 'oc1'.freeze,
      'eu-zurich-1': 'oc1'.freeze,
      'sa-saopaulo-1': 'oc1'.freeze,
      'uk-london-1': 'oc1'.freeze,
      'us-phoenix-1': 'oc1'.freeze,
      'us-ashburn-1': 'oc1'.freeze,
      'us-langley-1': 'oc2'.freeze,
      'us-luke-1': 'oc2'.freeze,
      'us-gov-ashburn-1': 'oc3'.freeze,
      'us-gov-phoenix-1': 'oc3'.freeze,
      'us-gov-chicago-1': 'oc3'.freeze
    }.freeze
    # ---  end of region realm mapping  ---

    # --- Start of realm domain mapping ---
    REALM_DOMAIN_MAPPING = {
      'oc1': 'oraclecloud.com'.freeze,
      'oc2': 'oraclegovcloud.com'.freeze,
      'oc3': 'oraclegovcloud.com'.freeze
    }.freeze
    # ---  end of realm domain mapping  ---

    # --- Start of service prefixes ---
    SERVICE_ENDPOINT_PREFIX_MAPPING = {
      AnnouncementClient: 'announcements',
      AuditClient: 'audit',
      Auth: 'auth',
      AutoScalingClient: 'autoscaling',
      BlockstorageClient: 'iaas',
      BudgetClient: 'usage',
      ComputeClient: 'iaas',
      ComputeManagementClient: 'iaas',
      ContainerEngineClient: 'containerengine',
      DatabaseClient: 'database',
      DnsClient: 'dns',
      EmailClient: 'email',
      FileStorageClient: 'filestorage',
      HealthChecksClient: 'healthchecks',
      IdentityClient: 'identity',
      KmsVaultClient: 'kms',
      LoadBalancerClient: 'iaas',
      MonitoringClient: 'telemetry',
      NotificationControlPlaneClient: 'notification',
      NotificationDataPlaneClient: 'notification',
      ObjectStorageClient: 'objectstorage',
      ResourceManagerClient: 'resourcemanager',
      ResourceSearchClient: 'query',
      StreamAdminClient: 'streams',
      StreamClient: 'streams',
      VirtualNetworkClient: 'iaas',
      WaasClient: 'waas'
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

      REALM_DOMAIN_MAPPING[:oc1]
    end
  end
end
