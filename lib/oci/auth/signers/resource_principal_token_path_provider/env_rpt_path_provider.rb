# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Auth
    module Signers
      module RptPathProvider
        # env rpt path provider
        class EnvRptPathProvider < OCI::Auth::Signers::RptPathProvider::RptPathProvider
          def initialize
            raise 'Unable to get OCI_RESOURCE_PRINCIPAL_RPT_ID from env var' if ENV[OCI_RESOURCE_PRINCIPAL_RPT_ID].nil?
            raise 'Unable to get OCI_RESOURCE_PRINCIPAL_RPT_PATH from env var' if ENV[OCI_RESOURCE_PRINCIPAL_RPT_PATH].nil?

            @rpt_id = ENV[OCI_RESOURCE_PRINCIPAL_RPT_ID]
            super(ENV[OCI_RESOURCE_PRINCIPAL_RPT_PATH])
          end

          def replacement_dict
            { 'id' => @rpt_id }
          end
        end
      end
    end
  end
end
