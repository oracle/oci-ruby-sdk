# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

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
