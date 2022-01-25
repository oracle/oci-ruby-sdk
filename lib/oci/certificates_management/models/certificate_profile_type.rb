# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module CertificatesManagement::Models
    CERTIFICATE_PROFILE_TYPE_ENUM = [
      CERTIFICATE_PROFILE_TYPE_TLS_SERVER_OR_CLIENT = 'TLS_SERVER_OR_CLIENT'.freeze,
      CERTIFICATE_PROFILE_TYPE_TLS_SERVER = 'TLS_SERVER'.freeze,
      CERTIFICATE_PROFILE_TYPE_TLS_CLIENT = 'TLS_CLIENT'.freeze,
      CERTIFICATE_PROFILE_TYPE_TLS_CODE_SIGN = 'TLS_CODE_SIGN'.freeze
    ].freeze
  end
end
