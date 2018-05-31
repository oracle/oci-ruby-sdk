# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

module OCI
  module Identity
    # Module containing models for requests made to, and responses received from,
    # OCI Identity services
    module Models
    end
  end
end

# Require models
require 'oci/identity/models/add_user_to_group_details'
require 'oci/identity/models/api_key'
require 'oci/identity/models/auth_token'
require 'oci/identity/models/availability_domain'
require 'oci/identity/models/compartment'
require 'oci/identity/models/create_api_key_details'
require 'oci/identity/models/create_auth_token_details'
require 'oci/identity/models/create_compartment_details'
require 'oci/identity/models/create_customer_secret_key_details'
require 'oci/identity/models/create_dynamic_group_details'
require 'oci/identity/models/create_group_details'
require 'oci/identity/models/create_identity_provider_details'
require 'oci/identity/models/create_idp_group_mapping_details'
require 'oci/identity/models/create_policy_details'
require 'oci/identity/models/create_region_subscription_details'
require 'oci/identity/models/create_saml2_identity_provider_details'
require 'oci/identity/models/create_smtp_credential_details'
require 'oci/identity/models/create_swift_password_details'
require 'oci/identity/models/create_tag_details'
require 'oci/identity/models/create_tag_namespace_details'
require 'oci/identity/models/create_user_details'
require 'oci/identity/models/customer_secret_key'
require 'oci/identity/models/customer_secret_key_summary'
require 'oci/identity/models/dynamic_group'
require 'oci/identity/models/group'
require 'oci/identity/models/identity_provider'
require 'oci/identity/models/idp_group_mapping'
require 'oci/identity/models/policy'
require 'oci/identity/models/region'
require 'oci/identity/models/region_subscription'
require 'oci/identity/models/saml2_identity_provider'
require 'oci/identity/models/smtp_credential'
require 'oci/identity/models/smtp_credential_summary'
require 'oci/identity/models/swift_password'
require 'oci/identity/models/tag'
require 'oci/identity/models/tag_namespace'
require 'oci/identity/models/tag_namespace_summary'
require 'oci/identity/models/tag_summary'
require 'oci/identity/models/tenancy'
require 'oci/identity/models/ui_password'
require 'oci/identity/models/update_auth_token_details'
require 'oci/identity/models/update_compartment_details'
require 'oci/identity/models/update_customer_secret_key_details'
require 'oci/identity/models/update_dynamic_group_details'
require 'oci/identity/models/update_group_details'
require 'oci/identity/models/update_identity_provider_details'
require 'oci/identity/models/update_idp_group_mapping_details'
require 'oci/identity/models/update_policy_details'
require 'oci/identity/models/update_saml2_identity_provider_details'
require 'oci/identity/models/update_smtp_credential_details'
require 'oci/identity/models/update_state_details'
require 'oci/identity/models/update_swift_password_details'
require 'oci/identity/models/update_tag_details'
require 'oci/identity/models/update_tag_namespace_details'
require 'oci/identity/models/update_user_details'
require 'oci/identity/models/user'
require 'oci/identity/models/user_group_membership'

# Require generated clients
require 'oci/identity/identity_client'
require 'oci/identity/identity_client_composite_operations'

# Require service utilities
require 'oci/identity/util'
