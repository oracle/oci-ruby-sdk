# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  # The Auth module contains classes to handle different authentication
  # methods, for example using instance principals instead of an API key,
  # against OCI services
  module Auth
  end
end

require 'oci/auth/federation_client'
require 'oci/auth/security_token_container'
require 'oci/auth/session_key_supplier'
require 'oci/auth/util'
require 'oci/auth/url_based_certificate_retriever'

require 'oci/auth/signers/security_token_signer'
require 'oci/auth/signers/x509_federation_client_based_security_token_signer'
require 'oci/auth/signers/instance_principals_security_token_signer'
require 'oci/auth/signers/resource_principals_signer'
require 'oci/auth/signers/resource_principals_federation_signer'
require 'oci/auth/signers/ephemeral_resource_principals_signer'
require 'oci/auth/signers/instance_principals_delegation_token_signer'
require 'oci/auth/signers/oke_workload_identity_resource_principal_signer'

require 'oci/auth/signers/resource_principal_token_path_provider/rpt_path_provider'

require 'oci/auth/signers/service_account_token_provider/sa_token_provider'
