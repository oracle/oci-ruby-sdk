# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'pp'

require 'logger'
module OCI
  # rubocop:disable Style/MutableConstant

  # Module defining available regions and helper methods to get value service endpoints
  module Regions
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

    # boolean flags to see if region meta data has been read from config file, envvar or instance metadata service(imds)
    # All are set to false initially.
    @has_read_env_var = @has_read_cfg_file = @has_read_imds = false

    # boolean flag to see if user has opt in to use imds, default set to false
    @opt_in_for_imds = false

    # rubocop:enable Style/MutableConstant

    # Region Metadata schema keys
    REGION_METADATA_KEYS = %w[realmKey realmDomainComponent regionKey regionIdentifier].freeze

    # Region metadata environment variable name
    OCI_REGION_METADATA_VAR_NAME = 'OCI_REGION_METADATA'.freeze

    # Region Metadata Configuration File location
    REGION_METADATA_CFG_FILE_LOCATION = "#{Dir.home}/.oci/regions-config.json".freeze

    # Default Realm environment variable name
    DEFAULT_REALM_ENV_VAR = 'OCI_DEFAULT_REALM'.freeze

    # Returns an endpoint for the given region and service.
    #
    # @param [String] region A region used to determine the service endpoint. This will usually
    #   correspond to a value in {OCI::Regions::REGION_ENUM}, but may be an arbitrary string.
    # @param [Symbol] service A symbol representing a service client class (e.g. :IdentityClient)
    #
    # @return [String] A fully qualified endpoint
    def self.get_service_endpoint(region, service)
      # check if the region exists in config file, environment variable or region meta_data_service
      # and add it to the existing map of regions.
      check_and_add_region_metadata(region)
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
      # check if the region exists in config file, environment variable or region meta_data_service
      # and add it to the existing map of regions.
      check_and_add_region_metadata(region)
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
      if REGION_REALM_MAPPING.key?(symbolised_region)
        realm = REGION_REALM_MAPPING[symbolised_region]
        # return second level domain if exists
        symbolised_realm = realm.to_sym
        return REALM_DOMAIN_MAPPING[symbolised_realm] if REALM_DOMAIN_MAPPING.key?(symbolised_realm)
      end

      # check if Default Realm exists in environment env, otherwise return oc1 domain by default
      return ENV[DEFAULT_REALM_ENV_VAR] if ENV.key?(DEFAULT_REALM_ENV_VAR)

      REALM_DOMAIN_MAPPING[:oc1]
    end

    #  If the region information is not available in the existing maps, following sources are checked in order:
    #  1. Regions Configuration File at ~/.oci/regions-config.json
    #  2. Region Metadata Environment variable
    #  3. Instance Metadata Service
    #
    #  The region metadata schema is:
    #  {
    #      "realmKey" : string,
    #      "realmDomainComponent" : string,
    #      "regionKey" : string,
    #      "regionIdentifier" : string
    #  }
    #
    #  If the region still cannot be resolved, we fall back to OC1 realm
    def self.check_and_add_region_metadata(region)
      # Follow the hierarchy of sources
      return if valid_region?(region)
      return if !@has_read_cfg_file && region_metadata_from_cfg_file(region)
      return if !@has_read_env_var && region_metadata_from_env_var(region)
      return if @opt_in_for_imds && !@has_read_imds && region_from_instance_metadata_service(region)
    end

    # Read region from metadata config file
    def self.region_metadata_from_cfg_file(region)
      @has_read_cfg_file = true
      config_file_location = File.expand_path(REGION_METADATA_CFG_FILE_LOCATION)
      unless File.file?(config_file_location)
        OCI.logger.debug('Config file does not exist.') if OCI.logger
        return false
      end

      begin
        file_hash = File.read(config_file_location)
        metadata_array = read_metadata(file_hash)
      rescue JSON::ParserError
        OCI.logger.debug('Failed to parse json file ' + config_file_location) if OCI.logger
        return false
      end

      # boolean flag to confirm if the region is found in the metadata array
      has_found_region = false
      metadata_array.each do |metadata|
        next unless check_valid_schema(metadata)

        metadata.each { |_k, v| v.downcase! }
        has_region = update_regions_map(metadata, region)
        has_found_region ||= has_region
      end
      has_found_region
    end

    # Read region from instance metadata service
    def self.region_from_instance_metadata_service(region)
      @has_read_imds = true

      region_info = {}
      begin
        url = OCI::Auth::Signers::InstancePrincipalsSecurityTokenSigner::GET_REGION_INFO_URL
        uri_region_info = URI(url)
        region_info_client = Net::HTTP.new(uri_region_info.hostname, uri_region_info.port)
        # region_info_client.max_retries = 0
        region_info_client.open_timeout = 10
        region_info_client.read_timeout = 60
        region_info_client.request(OCI::Auth::Util.get_metadata_request(url, 'get')) do |response|
          return false unless response.is_a? Net::HTTPSuccess

          region_info = read_metadata(response.body)
        end
      rescue JSON::ParserError
        OCI.logger.debug('Failed to parse json from regionInfo endpoint') if OCI.logger
        return false
      end

      if check_valid_schema(region_info)
        region_info.each { |_k, v| v.downcase! }
        return update_regions_map(region_info, region)
      end

      false
    end

    # This method adds Region metadata info from OCI_REGION_METADATA environment variable to list of existing regions
    # if the region does not exists already.
    def self.region_metadata_from_env_var(region)
      begin
        @has_read_env_var = true
        region_meta_data = ENV[OCI_REGION_METADATA_VAR_NAME]

        # Empty value for environment variable OCI_REGION_METADATA
        return false if region_meta_data.nil? || region_meta_data.empty?

        metadata = read_metadata(region_meta_data)
      rescue JSON::ParserError
        OCI.logger.debug('Failed to parse json from environment variable ' + OCI_REGION_METADATA_VAR_NAME) if OCI.logger
        return false
      end

      if check_valid_schema(metadata)
        metadata.each { |_k, v| v.downcase! }
        return update_regions_map(metadata, region)
      end

      false
    end

    def self.read_metadata(metadata_env)
      JSON.parse(metadata_env)
    end

    def self.check_valid_schema(region_metadata)
      REGION_METADATA_KEYS.each do |key|
        unless region_metadata.key? key
          OCI.logger.debug("Key #{key} not found in region metadata") if OCI.logger
          return false
        end

        if region_metadata[key].nil? || region_metadata[key].empty?
          OCI.logger.debug("Value for key #{key} in region metadata is empty") if OCI.logger
          return false
        end
      end
      true
    end

    def self.update_regions_map(metadata, region)
      region_identifier = metadata['regionIdentifier']
      realm_key = metadata['realmKey']
      region_key = metadata['regionKey']
      realm_domain_component = metadata['realmDomainComponent']

      # Add region
      REGION_ENUM.push(region_identifier) unless REGION_ENUM.include?(region_identifier)
      REGION_SHORT_NAMES_TO_LONG_NAMES[region_key.to_sym] ||= region_identifier
      REALM_DOMAIN_MAPPING[realm_key.to_sym] ||= realm_domain_component
      REGION_REALM_MAPPING[region_identifier.to_sym] ||= realm_key

      REGION_ENUM.include? region
    end

    def self.enable_instance_metadata_service
      @opt_in_for_imds = true
    end

    def self.reset_imds_settings
      @opt_in_for_imds = false
      @has_read_imds = false
    end
  end
end
