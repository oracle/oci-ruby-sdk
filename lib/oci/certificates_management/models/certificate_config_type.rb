# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module CertificatesManagement::Models
    CERTIFICATE_CONFIG_TYPE_ENUM = [
      CERTIFICATE_CONFIG_TYPE_ISSUED_BY_INTERNAL_CA = 'ISSUED_BY_INTERNAL_CA'.freeze,
      CERTIFICATE_CONFIG_TYPE_MANAGED_EXTERNALLY_ISSUED_BY_INTERNAL_CA = 'MANAGED_EXTERNALLY_ISSUED_BY_INTERNAL_CA'.freeze,
      CERTIFICATE_CONFIG_TYPE_IMPORTED = 'IMPORTED'.freeze
    ].freeze
  end
end