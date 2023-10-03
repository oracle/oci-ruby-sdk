# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Auth
    module Signers
      # Resource Principal Path Provider
      # Classes under this module will provide the complete path for getting the Resource Principal Token
      module RptPathProvider
        OCI_RESOURCE_PRINCIPAL_RPT_ID = 'OCI_RESOURCE_PRINCIPAL_RPT_ID'.freeze
        OCI_RESOURCE_PRINCIPAL_RPT_PATH = 'OCI_RESOURCE_PRINCIPAL_RPT_PATH'.freeze
        # base class
        class RptPathProvider
          def initialize(template)
            @template = template
          end

          def token_path
            path = @template
            unless replacement_dict.nil?
              path = @template
              replacement_dict.each do |key, val|
                path = path.gsub("{#{key}}", val)
              end
            end
            path
          end

          def replacement_dict
            nil
          end
        end

        def self.instance_id_from_imds(metadata_url_base)
          # Get the instance id from the metadata service
          instance_id_endpoint = "#{metadata_url_base}/instance/id"
          uri = URI(instance_id_endpoint)
          raw_client = Net::HTTP.new(uri.hostname, uri.port)
          raw_response = nil
          raw_client.request(OCI::Auth::Util.get_metadata_request(instance_id_endpoint, 'get')) do |response|
            raw_response = response.body.strip.downcase
            raise 'Get Metadata request failed, response code is: ' + response.code if response.code != '200'
          end
          raw_response
        end
      end
    end
  end
end

require 'oci/auth/signers/resource_principal_token_path_provider/default_rpt_path_provider'
require 'oci/auth/signers/resource_principal_token_path_provider/env_rpt_path_provider'
require 'oci/auth/signers/resource_principal_token_path_provider/imds_rpt_path_provider'
require 'oci/auth/signers/resource_principal_token_path_provider/string_rpt_path_provider'
