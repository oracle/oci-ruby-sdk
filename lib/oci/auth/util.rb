# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module Auth
    # Contains utility methods to support functionality in the {OCI::Auth} module, for example being able
    # to extract information from certificates and scrubbing certificate information for calls to Auth Service
    module Util
      AUTHORIZATION_HEADER = 'Authorization'.freeze
      AUTHORIZATION_HEADER_VALUE = 'Bearer Oracle'.freeze

      def self.get_tenancy_id_from_certificate(x509_certificate)
        subject_array = x509_certificate.subject.to_a
        subject_array.each do |subject_name|
          # subject_name is actually a triple like:
          #   ["OU", "<name>", "<number>"]
          if subject_name[0] == 'OU' && subject_name[1].include?('opc-tenant:')
            # 'opc-tenant:' is 11 character long, so we want to start at the index after that and to the end of the string (-1)
            return subject_name[1][11..-1]
          end
        end

        raise 'Certificate did not contain a tenancy in its subject'
      end

      def self.colon_separate_fingerprint(raw_fingerprint)
        raw_fingerprint.gsub(/(.{2})(?=.)/, '\1:\2')
      end

      def self.sanitize_certificate_string(cert_string)
        cert_string.gsub('-----BEGIN CERTIFICATE-----', '')
                   .gsub('-----END CERTIFICATE-----', '')
                   .gsub('-----BEGIN PUBLIC KEY-----', '')
                   .gsub('-----END PUBLIC KEY-----', '')
                   .delete("\n")
      end

      def self.get_metadata_request(request_url, type)
        case type
        when 'post'
          request = Net::HTTP::Post.new(request_url)
        when 'get'
          request = Net::HTTP::Get.new(request_url)
        when 'put'
          request = Net::HTTP::Put.new(request_url)
        else
          raise "Unknown request-type #{type} provided."
        end
        request[AUTHORIZATION_HEADER] = AUTHORIZATION_HEADER_VALUE
        request
      end
    end
  end
end
