# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ApplicationMigration::Models
    SOURCE_TYPES_ENUM = [
      SOURCE_TYPES_OCIC = 'OCIC'.freeze,
      SOURCE_TYPES_INTERNAL_COMPUTE = 'INTERNAL_COMPUTE'.freeze,
      SOURCE_TYPES_OCC = 'OCC'.freeze,
      SOURCE_TYPES_OCIC_IDCS = 'OCIC_IDCS'.freeze,
      SOURCE_TYPES_IMPORT = 'IMPORT'.freeze
    ].freeze
  end
end
