# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module ContainerEngine::Models
    WORK_REQUEST_STATUS_ENUM = [
      WORK_REQUEST_STATUS_ACCEPTED = 'ACCEPTED'.freeze,
      WORK_REQUEST_STATUS_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      WORK_REQUEST_STATUS_FAILED = 'FAILED'.freeze,
      WORK_REQUEST_STATUS_SUCCEEDED = 'SUCCEEDED'.freeze,
      WORK_REQUEST_STATUS_CANCELING = 'CANCELING'.freeze,
      WORK_REQUEST_STATUS_CANCELED = 'CANCELED'.freeze
    ].freeze
  end
end
