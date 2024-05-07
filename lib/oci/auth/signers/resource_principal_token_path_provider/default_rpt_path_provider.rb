# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Auth
    module Signers
      module RptPathProvider
        # This path provider makes sure the behavior happens with the correct fallback.
        # For the path, Use the contents of the OCI_RESOURCE_PRINCIPAL_RPT_PATH environment variable, if set.
        # Otherwise, use the current path: "/20180711/resourcePrincipalToken/{id}"
        # For the resource id, Use the contents of the OCI_RESOURCE_PRINCIPAL_RPT_ID environment variable, if set.
        # Otherwise, use IMDS to get the instance id
        # This path provider is used when the caller doesn't provide a specific path provider to the resource principals signer
        class DefaultRptPathProvider < OCI::Auth::Signers::RptPathProvider::RptPathProvider
          def initialize(metadata_url: nil)
            @id = ENV[OCI_RESOURCE_PRINCIPAL_RPT_ID] unless ENV[OCI_RESOURCE_PRINCIPAL_RPT_ID].nil?
            @id ||= OCI::Auth::Signers::RptPathProvider.instance_id_from_imds(metadata_url) unless metadata_url.nil?
            raise 'Unable to get OCI_RESOURCE_PRINCIPAL_RPT_ID from env or IMDS service' if @id.nil?

            template = ENV[OCI_RESOURCE_PRINCIPAL_RPT_PATH] || '/20180711/resourcePrincipalToken/{id}'
            super(template)
          end

          def replacement_dict
            { 'id' => @id }
          end
        end
      end
    end
  end
end
