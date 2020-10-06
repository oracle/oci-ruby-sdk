# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module LogAnalytics::Models
    VALUE_TYPE_ENUM = [
      VALUE_TYPE_BOOLEAN = 'BOOLEAN'.freeze,
      VALUE_TYPE_STRING = 'STRING'.freeze,
      VALUE_TYPE_DOUBLE = 'DOUBLE'.freeze,
      VALUE_TYPE_FLOAT = 'FLOAT'.freeze,
      VALUE_TYPE_LONG = 'LONG'.freeze,
      VALUE_TYPE_INTEGER = 'INTEGER'.freeze,
      VALUE_TYPE_TIMESTAMP = 'TIMESTAMP'.freeze,
      VALUE_TYPE_FACET = 'FACET'.freeze
    ].freeze
  end
end
