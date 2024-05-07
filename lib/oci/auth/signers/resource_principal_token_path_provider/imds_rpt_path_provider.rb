# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Auth
    module Signers
      module RptPathProvider
        # imds rpt path provider
        class ImdsRptPathProvider < OCI::Auth::Signers::RptPathProvider::RptPathProvider
          def initialize(metadata_url)
            @instance_id = OCI::Auth::Signers::RptPathProvider.instance_id_from_imds(metadata_url)
            super('/20180711/resourcePrincipalToken/{id}')
          end

          def replacement_dict
            { 'id' => @instance_id }
          end
        end
      end
    end
  end
end
