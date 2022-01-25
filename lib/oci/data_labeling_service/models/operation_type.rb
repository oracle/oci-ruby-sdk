# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DataLabelingService::Models
    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_CREATE_DATASET = 'CREATE_DATASET'.freeze,
      OPERATION_TYPE_DELETE_DATASET = 'DELETE_DATASET'.freeze,
      OPERATION_TYPE_MOVE_DATASET = 'MOVE_DATASET'.freeze,
      OPERATION_TYPE_GENERATE_DATASET_RECORDS = 'GENERATE_DATASET_RECORDS'.freeze,
      OPERATION_TYPE_SNAPSHOT_DATASET = 'SNAPSHOT_DATASET'.freeze,
      OPERATION_TYPE_ADD_DATASET_LABELS = 'ADD_DATASET_LABELS'.freeze,
      OPERATION_TYPE_REMOVE_DATASET_LABELS = 'REMOVE_DATASET_LABELS'.freeze,
      OPERATION_TYPE_RENAME_DATASET_LABELS = 'RENAME_DATASET_LABELS'.freeze
    ].freeze
  end
end
