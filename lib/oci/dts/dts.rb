# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module Dts
    # Module containing models for requests made to, and responses received from,
    # OCI Dts services
    module Models
    end
  end
end

# Require models
require 'oci/dts/models/attach_devices_details'
require 'oci/dts/models/change_transfer_job_compartment_details'
require 'oci/dts/models/create_transfer_appliance_details'
require 'oci/dts/models/create_transfer_appliance_entitlement_details'
require 'oci/dts/models/create_transfer_device_details'
require 'oci/dts/models/create_transfer_job_details'
require 'oci/dts/models/create_transfer_package_details'
require 'oci/dts/models/detach_devices_details'
require 'oci/dts/models/multiple_transfer_appliances'
require 'oci/dts/models/multiple_transfer_devices'
require 'oci/dts/models/multiple_transfer_packages'
require 'oci/dts/models/new_transfer_device'
require 'oci/dts/models/shipping_address'
require 'oci/dts/models/shipping_vendors'
require 'oci/dts/models/transfer_appliance'
require 'oci/dts/models/transfer_appliance_certificate'
require 'oci/dts/models/transfer_appliance_encryption_passphrase'
require 'oci/dts/models/transfer_appliance_entitlement'
require 'oci/dts/models/transfer_appliance_public_key'
require 'oci/dts/models/transfer_appliance_summary'
require 'oci/dts/models/transfer_device'
require 'oci/dts/models/transfer_device_summary'
require 'oci/dts/models/transfer_job'
require 'oci/dts/models/transfer_job_summary'
require 'oci/dts/models/transfer_package'
require 'oci/dts/models/transfer_package_summary'
require 'oci/dts/models/update_transfer_appliance_details'
require 'oci/dts/models/update_transfer_device_details'
require 'oci/dts/models/update_transfer_job_details'
require 'oci/dts/models/update_transfer_package_details'

# Require generated clients
require 'oci/dts/shipping_vendors_client'
require 'oci/dts/transfer_appliance_client'
require 'oci/dts/transfer_appliance_client_composite_operations'
require 'oci/dts/transfer_appliance_entitlement_client'
require 'oci/dts/transfer_device_client'
require 'oci/dts/transfer_device_client_composite_operations'
require 'oci/dts/transfer_job_client'
require 'oci/dts/transfer_job_client_composite_operations'
require 'oci/dts/transfer_package_client'
require 'oci/dts/transfer_package_client_composite_operations'

# Require service utilities
require 'oci/dts/util'
