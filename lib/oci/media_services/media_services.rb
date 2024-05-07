# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20211101

module OCI
  module MediaServices
    # Module containing models for requests made to, and responses received from,
    # OCI MediaServices services
    module Models
    end
  end
end

# Require models
require 'oci/media_services/models/add_lock_details'
require 'oci/media_services/models/akamai_manual_stream_cdn_config'
require 'oci/media_services/models/asset_metadata_entry_details'
require 'oci/media_services/models/asset_type'
require 'oci/media_services/models/change_media_asset_compartment_details'
require 'oci/media_services/models/change_media_workflow_compartment_details'
require 'oci/media_services/models/change_media_workflow_configuration_compartment_details'
require 'oci/media_services/models/change_media_workflow_job_compartment_details'
require 'oci/media_services/models/change_stream_distribution_channel_compartment_details'
require 'oci/media_services/models/create_media_asset_details'
require 'oci/media_services/models/create_media_workflow_configuration_details'
require 'oci/media_services/models/create_media_workflow_details'
require 'oci/media_services/models/create_media_workflow_job_by_id_details'
require 'oci/media_services/models/create_media_workflow_job_by_name_details'
require 'oci/media_services/models/create_media_workflow_job_details'
require 'oci/media_services/models/create_stream_cdn_config_details'
require 'oci/media_services/models/create_stream_distribution_channel_details'
require 'oci/media_services/models/create_stream_packaging_config_details'
require 'oci/media_services/models/dash_stream_packaging_config'
require 'oci/media_services/models/delete_mode'
require 'oci/media_services/models/edge_stream_cdn_config'
require 'oci/media_services/models/generate_session_token_details'
require 'oci/media_services/models/hls_stream_packaging_config'
require 'oci/media_services/models/ingest_stream_distribution_channel_details'
require 'oci/media_services/models/ingest_stream_distribution_channel_result'
require 'oci/media_services/models/job_output'
require 'oci/media_services/models/lifecycle_state'
require 'oci/media_services/models/media_asset'
require 'oci/media_services/models/media_asset_collection'
require 'oci/media_services/models/media_asset_distribution_channel_attachment'
require 'oci/media_services/models/media_asset_distribution_channel_attachment_collection'
require 'oci/media_services/models/media_asset_distribution_channel_attachment_sort_by'
require 'oci/media_services/models/media_asset_distribution_channel_attachment_summary'
require 'oci/media_services/models/media_asset_sort_by'
require 'oci/media_services/models/media_asset_summary'
require 'oci/media_services/models/media_asset_tag'
require 'oci/media_services/models/media_workflow'
require 'oci/media_services/models/media_workflow_collection'
require 'oci/media_services/models/media_workflow_configuration'
require 'oci/media_services/models/media_workflow_configuration_collection'
require 'oci/media_services/models/media_workflow_configuration_summary'
require 'oci/media_services/models/media_workflow_job'
require 'oci/media_services/models/media_workflow_job_collection'
require 'oci/media_services/models/media_workflow_job_sort_by'
require 'oci/media_services/models/media_workflow_job_summary'
require 'oci/media_services/models/media_workflow_summary'
require 'oci/media_services/models/media_workflow_task'
require 'oci/media_services/models/media_workflow_task_declaration'
require 'oci/media_services/models/media_workflow_task_declaration_collection'
require 'oci/media_services/models/media_workflow_task_declaration_sort_by'
require 'oci/media_services/models/media_workflow_task_state'
require 'oci/media_services/models/metadata'
require 'oci/media_services/models/remove_lock_details'
require 'oci/media_services/models/resource_lock'
require 'oci/media_services/models/session_token'
require 'oci/media_services/models/sort_by'
require 'oci/media_services/models/sort_order'
require 'oci/media_services/models/stream_cdn_config'
require 'oci/media_services/models/stream_cdn_config_collection'
require 'oci/media_services/models/stream_cdn_config_section'
require 'oci/media_services/models/stream_cdn_config_summary'
require 'oci/media_services/models/stream_distribution_channel'
require 'oci/media_services/models/stream_distribution_channel_collection'
require 'oci/media_services/models/stream_distribution_channel_summary'
require 'oci/media_services/models/stream_packaging_config'
require 'oci/media_services/models/stream_packaging_config_collection'
require 'oci/media_services/models/stream_packaging_config_encryption'
require 'oci/media_services/models/stream_packaging_config_encryption_aes128'
require 'oci/media_services/models/stream_packaging_config_encryption_none'
require 'oci/media_services/models/stream_packaging_config_summary'
require 'oci/media_services/models/system_media_workflow'
require 'oci/media_services/models/system_media_workflow_collection'
require 'oci/media_services/models/update_media_asset_details'
require 'oci/media_services/models/update_media_workflow_configuration_details'
require 'oci/media_services/models/update_media_workflow_details'
require 'oci/media_services/models/update_media_workflow_job_details'
require 'oci/media_services/models/update_stream_cdn_config_details'
require 'oci/media_services/models/update_stream_distribution_channel_details'
require 'oci/media_services/models/update_stream_packaging_config_details'

# Require generated clients
require 'oci/media_services/media_services_client'
require 'oci/media_services/media_services_client_composite_operations'
require 'oci/media_services/media_stream_client'

# Require service utilities
require 'oci/media_services/util'
