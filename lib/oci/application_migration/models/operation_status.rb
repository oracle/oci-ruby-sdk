# Copyright (c) 2016, 2020, Oracle and/or its affiliates. All rights reserved.

module OCI
  module ApplicationMigration::Models
    OPERATION_STATUS_ENUM = [
      OPERATION_STATUS_ACCEPTED = 'ACCEPTED'.freeze,
      OPERATION_STATUS_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      OPERATION_STATUS_FAILED = 'FAILED'.freeze,
      OPERATION_STATUS_SUCCEEDED = 'SUCCEEDED'.freeze,
      OPERATION_STATUS_CANCELING = 'CANCELING'.freeze,
      OPERATION_STATUS_CANCELED = 'CANCELED'.freeze
    ].freeze
  end
end
