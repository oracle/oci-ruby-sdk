# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'oci/api_client'
require 'oci/api_client_proxy_settings'
require 'oci/config'
require 'oci/config_file_loader'
require 'oci/errors'
require 'oci/global_context'
require 'oci/internal/internal'
require 'oci/regions'
require 'oci/response_headers'
require 'oci/response'
require 'oci/base_signer'
require 'oci/signer'
require 'oci/version'
require 'oci/waiter'
require 'oci/retry/retry'

require 'oci/auth/auth'
require 'oci/audit/audit'
require 'oci/container_engine/container_engine'
require 'oci/core/core'
require 'oci/database/database'
require 'oci/dns/dns'
require 'oci/email/email'
require 'oci/file_storage/file_storage'
require 'oci/identity/identity'
require 'oci/load_balancer/load_balancer'
require 'oci/object_storage/object_storage'
require 'oci/object_storage/transfer/transfer'
require 'oci/resource_search/resource_search'
require 'oci/key_management/key_management'
require 'oci/announcements_service/announcements_service'
require 'oci/waas/waas'
require 'oci/healthchecks/healthchecks'
require 'oci/streaming/streaming'
require 'oci/monitoring/monitoring'
require 'oci/resource_manager/resource_manager'
require 'oci/autoscaling/autoscaling'
require 'oci/ons/ons'
require 'oci/budget/budget'
require 'oci/work_requests/work_requests'
require 'oci/limits/limits'
require 'oci/functions/functions'
require 'oci/events/events'
require 'oci/dts/dts'

# Top level module for the Oracle Cloud Infrastructure SDK
module OCI
  class << self
    attr_accessor :sdk_name

    # Defines the logger used for debugging for the OCI module.
    # For example, log to STDOUT by setting this to Logger.new(STDOUT).
    #
    # @return [Logger]
    attr_accessor :logger
  end
end

OracleBMC = OCI
