# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'oci'

# By default this will hit the auth service in the region returned by http://169.254.169.254/opc/v1/instance/region on the instance. To customize
# which auth service endpoint gets hit (e.g. in R1), you can provide an explicit federation_endpoint when creating the object. For example:
#
#   OCI::Auth::Signers::InstancePrincipalsSecurityTokenSigner.new(federation_endpoint: "my endpoint")
#
# If you need to customize the certificate bundle used for SSL verification against the federation endpoint, you can do that via:
#
#   OCI::Auth::Signers::InstancePrincipalsSecurityTokenSigner.new(federation_client_cert_bundle: "/path/to/my/cert/bundle")
instance_principals_signer = OCI::Auth::Signers::InstancePrincipalsSecurityTokenSigner.new

# In the base case, configuration does not need to be provided as the region and tenancy are obtained from the InstancePrincipalsSecurityTokenSigner
identity = OCI::Identity::IdentityClient.new(config: OCI::Config.new, signer: instance_principals_signer)
puts identity.list_regions.data

# If you explicitly specify a region in configuration, or as a parameter to client construction, it will be honoured.
# In the below example, you can also change the region later by doing:
#
#   identity.region = 'us-ashburn-1'
config = OCI::Config.new
config.region = 'us-ashburn-1'
identity = OCI::Identity::IdentityClient.new(config: config, signer: instance_principals_signer)
puts identity.list_regions.data

identity = OCI::Identity::IdentityClient.new(
  config: OCI::Config.new,
  region: 'us-ashburn-1',
  signer: instance_principals_signer
)
puts identity.list_regions.data

# When configuring a signer, you can specify a signing strategy, which can be either OCI::BaseSigner::STANDARD  (the default) or OCI::BaseSigner::OBJECT_STORAGE. When
# configuring instance principals authentication for use against the Object Storage service you should specify a value of OCI::BaseSigner::OBJECT_STORAGE. Otherwise,
# you don't need to specify the value of this field and just use the default
object_storage_instance_principals_signer = OCI::Auth::Signers::InstancePrincipalsSecurityTokenSigner.new(
  signing_strategy: OCI::BaseSigner::OBJECT_STORAGE
)
object_storage = OCI::ObjectStorage::ObjectStorageClient.new(
  config: OCI::Config.new,
  signer: object_storage_instance_principals_signer
)
puts object_storage.get_namespace.data
