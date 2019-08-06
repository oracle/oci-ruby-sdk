# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module KeyManagement
    # Module containing models for requests made to, and responses received from,
    # OCI KeyManagement services
    module Models
    end
  end
end

# Require models
require 'oci/key_management/models/change_key_compartment_details'
require 'oci/key_management/models/change_vault_compartment_details'
require 'oci/key_management/models/create_key_details'
require 'oci/key_management/models/create_vault_details'
require 'oci/key_management/models/decrypt_data_details'
require 'oci/key_management/models/decrypted_data'
require 'oci/key_management/models/encrypt_data_details'
require 'oci/key_management/models/encrypted_data'
require 'oci/key_management/models/generate_key_details'
require 'oci/key_management/models/generated_key'
require 'oci/key_management/models/key'
require 'oci/key_management/models/key_shape'
require 'oci/key_management/models/key_summary'
require 'oci/key_management/models/key_version'
require 'oci/key_management/models/key_version_summary'
require 'oci/key_management/models/schedule_key_deletion_details'
require 'oci/key_management/models/schedule_vault_deletion_details'
require 'oci/key_management/models/update_key_details'
require 'oci/key_management/models/update_vault_details'
require 'oci/key_management/models/vault'
require 'oci/key_management/models/vault_summary'

# Require generated clients
require 'oci/key_management/kms_crypto_client'
require 'oci/key_management/kms_management_client'
require 'oci/key_management/kms_management_client_composite_operations'
require 'oci/key_management/kms_vault_client'
require 'oci/key_management/kms_vault_client_composite_operations'

# Require service utilities
require 'oci/key_management/util'
