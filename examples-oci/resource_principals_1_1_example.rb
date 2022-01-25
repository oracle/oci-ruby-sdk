# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require_relative '../lib/oci'
require 'pp'

compartment_id = ARGV[0]
ENV['OCI_RESOURCE_PRINCIPAL_VERSION'] = '1.1'

pp 'Initializing new signer'
rps = OCI::Auth::Signers.resource_principals_signer

pp 'Resource Principal Security Token'
pp rps.security_token

pp 'Calling list_autonomous_database'
db_client = OCI::Database::DatabaseClient.new(signer: rps)
response = db_client.list_autonomous_databases(compartment_id, limit: 5)
pp response.data
