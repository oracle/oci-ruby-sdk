# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'fdk'
require 'oci'
require 'pp'
# rubocop:disable Metrics/AbcSize, Lint/UnusedMethodArgument, Lint/RescueException
def myfunction(context:, input:)
  # This example is required to be deployed to OCI Functions service
  # This example will use Resource Principal V2.2 to create signer and use the signer
  # to retrieve region data from identity service
  #
  # In order to run this example, please refer to README file, fn project document and
  # OCI Functions document
  begin
    session_token = ENV['OCI_RESOURCE_PRINCIPAL_RPST']
    private_key = ENV['OCI_RESOURCE_PRINCIPAL_PRIVATE_PEM']
    private_key_passphrase = ENV['OCI_RESOURCE_PRINCIPAL_PRIVATE_PEM_PASSPHRASE']
    region = ENV['OCI_RESOURCE_PRINCIPAL_REGION']

    FDK.log(entry: 'Initializing new signer')
    rps = OCI::Auth::Signers::EphemeralResourcePrincipalsSigner.new(
      session_token: session_token,
      private_key: private_key,
      private_key_passphrase: private_key_passphrase,
      region: region
    )
  rescue Exception => e
    FDK.log(entry: e.to_s)
    return e.to_s
  end
  FDK.log(entry: 'Resource Principal Signer')
  FDK.log(entry: rps)

  FDK.log(entry: 'Resource Principal Security Token')
  FDK.log(entry: rps.security_token)

  identity_client = OCI::Identity::IdentityClient.new(signer: rps)
  response = identity_client.list_regions
  FDK.log(entry: 'Regions')
  FDK.log(entry: response.data)
  response.data
end

FDK.handle(target: :myfunction)
# rubocop:enable Metrics/AbcSize, Lint/UnusedMethodArgument, Lint/RescueException
