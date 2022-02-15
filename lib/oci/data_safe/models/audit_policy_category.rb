# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DataSafe::Models
    AUDIT_POLICY_CATEGORY_ENUM = [
      AUDIT_POLICY_CATEGORY_BASIC_ACTIVITY = 'BASIC_ACTIVITY'.freeze,
      AUDIT_POLICY_CATEGORY_ADMIN_USER_ACTIVITY = 'ADMIN_USER_ACTIVITY'.freeze,
      AUDIT_POLICY_CATEGORY_USER_ACTIVITY = 'USER_ACTIVITY'.freeze,
      AUDIT_POLICY_CATEGORY_ORACLE_PREDEFINED = 'ORACLE_PREDEFINED'.freeze,
      AUDIT_POLICY_CATEGORY_COMPLIANCE_STANDARD = 'COMPLIANCE_STANDARD'.freeze,
      AUDIT_POLICY_CATEGORY_CUSTOM = 'CUSTOM'.freeze
    ].freeze
  end
end
