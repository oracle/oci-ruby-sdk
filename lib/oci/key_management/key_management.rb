# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module KeyManagement
    # Module containing models for requests made to, and responses received from,
    # OCI KeyManagement services
    module Models
    end
  end
end

# Require models
require 'oci/key_management/models/backup_key_details'
require 'oci/key_management/models/backup_location'
require 'oci/key_management/models/backup_location_bucket'
require 'oci/key_management/models/backup_location_uri'
require 'oci/key_management/models/backup_vault_details'
require 'oci/key_management/models/change_key_compartment_details'
require 'oci/key_management/models/change_vault_compartment_details'
require 'oci/key_management/models/create_key_details'
require 'oci/key_management/models/create_vault_details'
require 'oci/key_management/models/decrypt_data_details'
require 'oci/key_management/models/decrypted_data'
require 'oci/key_management/models/encrypt_data_details'
require 'oci/key_management/models/encrypted_data'
require 'oci/key_management/models/export_key_details'
require 'oci/key_management/models/exported_key_data'
require 'oci/key_management/models/generate_key_details'
require 'oci/key_management/models/generated_key'
require 'oci/key_management/models/import_key_details'
require 'oci/key_management/models/import_key_version_details'
require 'oci/key_management/models/key'
require 'oci/key_management/models/key_shape'
require 'oci/key_management/models/key_summary'
require 'oci/key_management/models/key_version'
require 'oci/key_management/models/key_version_summary'
require 'oci/key_management/models/restore_key_from_object_store_details'
require 'oci/key_management/models/restore_vault_from_object_store_details'
require 'oci/key_management/models/schedule_key_deletion_details'
require 'oci/key_management/models/schedule_key_version_deletion_details'
require 'oci/key_management/models/schedule_vault_deletion_details'
require 'oci/key_management/models/update_key_details'
require 'oci/key_management/models/update_vault_details'
require 'oci/key_management/models/vault'
require 'oci/key_management/models/vault_summary'
require 'oci/key_management/models/vault_usage'
require 'oci/key_management/models/wrapped_import_key'
require 'oci/key_management/models/wrapping_key'

# Require generated clients
require 'oci/key_management/kms_crypto_client'
require 'oci/key_management/kms_management_client'
require 'oci/key_management/kms_management_client_composite_operations'
require 'oci/key_management/kms_vault_client'
require 'oci/key_management/kms_vault_client_composite_operations'

# Require service utilities
require 'oci/key_management/util'
