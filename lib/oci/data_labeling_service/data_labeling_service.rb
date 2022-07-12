# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DataLabelingService
    # Module containing models for requests made to, and responses received from,
    # OCI DataLabelingService services
    module Models
    end
  end
end

# Require models
require 'oci/data_labeling_service/models/action_type'
require 'oci/data_labeling_service/models/add_dataset_labels_details'
require 'oci/data_labeling_service/models/annotation_format'
require 'oci/data_labeling_service/models/annotation_format_collection'
require 'oci/data_labeling_service/models/annotation_format_summary'
require 'oci/data_labeling_service/models/change_dataset_compartment_details'
require 'oci/data_labeling_service/models/create_dataset_details'
require 'oci/data_labeling_service/models/dataset'
require 'oci/data_labeling_service/models/dataset_collection'
require 'oci/data_labeling_service/models/dataset_format_details'
require 'oci/data_labeling_service/models/dataset_source_details'
require 'oci/data_labeling_service/models/dataset_summary'
require 'oci/data_labeling_service/models/delimited_file_type_metadata'
require 'oci/data_labeling_service/models/document_dataset_format_details'
require 'oci/data_labeling_service/models/export_format'
require 'oci/data_labeling_service/models/generate_dataset_records_details'
require 'oci/data_labeling_service/models/image_dataset_format_details'
require 'oci/data_labeling_service/models/initial_record_generation_configuration'
require 'oci/data_labeling_service/models/label'
require 'oci/data_labeling_service/models/label_set'
require 'oci/data_labeling_service/models/object_storage_snapshot_export_details'
require 'oci/data_labeling_service/models/object_storage_source_details'
require 'oci/data_labeling_service/models/operation_status'
require 'oci/data_labeling_service/models/operation_type'
require 'oci/data_labeling_service/models/remove_dataset_labels_details'
require 'oci/data_labeling_service/models/rename_dataset_labels_details'
require 'oci/data_labeling_service/models/snapshot_dataset_details'
require 'oci/data_labeling_service/models/snapshot_export_details'
require 'oci/data_labeling_service/models/sort_order'
require 'oci/data_labeling_service/models/text_dataset_format_details'
require 'oci/data_labeling_service/models/text_file_type_metadata'
require 'oci/data_labeling_service/models/update_dataset_details'
require 'oci/data_labeling_service/models/work_request'
require 'oci/data_labeling_service/models/work_request_error'
require 'oci/data_labeling_service/models/work_request_error_collection'
require 'oci/data_labeling_service/models/work_request_log_entry'
require 'oci/data_labeling_service/models/work_request_log_entry_collection'
require 'oci/data_labeling_service/models/work_request_resource'
require 'oci/data_labeling_service/models/work_request_resource_metadata_key'
require 'oci/data_labeling_service/models/work_request_summary'
require 'oci/data_labeling_service/models/work_request_summary_collection'

# Require generated clients
require 'oci/data_labeling_service/data_labeling_management_client'
require 'oci/data_labeling_service/data_labeling_management_client_composite_operations'

# Require service utilities
require 'oci/data_labeling_service/util'
