# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20190325

module OCI
  module DataCatalog
    # Module containing models for requests made to, and responses received from,
    # OCI DataCatalog services
    module Models
    end
  end
end

# Require models
require 'oci/data_catalog/models/asynchronous_export_glossary_details'
require 'oci/data_catalog/models/asynchronous_export_glossary_result'
require 'oci/data_catalog/models/asynchronous_export_request_details'
require 'oci/data_catalog/models/asynchronous_export_result'
require 'oci/data_catalog/models/attach_catalog_private_endpoint_details'
require 'oci/data_catalog/models/attribute'
require 'oci/data_catalog/models/attribute_collection'
require 'oci/data_catalog/models/attribute_summary'
require 'oci/data_catalog/models/attribute_tag'
require 'oci/data_catalog/models/attribute_tag_collection'
require 'oci/data_catalog/models/attribute_tag_summary'
require 'oci/data_catalog/models/base_permissions_summary'
require 'oci/data_catalog/models/base_tag'
require 'oci/data_catalog/models/base_tag_summary'
require 'oci/data_catalog/models/catalog'
require 'oci/data_catalog/models/catalog_permissions_summary'
require 'oci/data_catalog/models/catalog_private_endpoint'
require 'oci/data_catalog/models/catalog_private_endpoint_summary'
require 'oci/data_catalog/models/catalog_summary'
require 'oci/data_catalog/models/change_catalog_compartment_details'
require 'oci/data_catalog/models/change_catalog_private_endpoint_compartment_details'
require 'oci/data_catalog/models/change_metastore_compartment_details'
require 'oci/data_catalog/models/connection'
require 'oci/data_catalog/models/connection_alias_summary'
require 'oci/data_catalog/models/connection_collection'
require 'oci/data_catalog/models/connection_result'
require 'oci/data_catalog/models/connection_summary'
require 'oci/data_catalog/models/create_attribute_details'
require 'oci/data_catalog/models/create_catalog_details'
require 'oci/data_catalog/models/create_catalog_private_endpoint_details'
require 'oci/data_catalog/models/create_connection_details'
require 'oci/data_catalog/models/create_custom_property_details'
require 'oci/data_catalog/models/create_data_asset_details'
require 'oci/data_catalog/models/create_entity_details'
require 'oci/data_catalog/models/create_folder_details'
require 'oci/data_catalog/models/create_glossary_details'
require 'oci/data_catalog/models/create_job_definition_details'
require 'oci/data_catalog/models/create_job_details'
require 'oci/data_catalog/models/create_job_execution_details'
require 'oci/data_catalog/models/create_metastore_details'
require 'oci/data_catalog/models/create_namespace_details'
require 'oci/data_catalog/models/create_pattern_details'
require 'oci/data_catalog/models/create_tag_details'
require 'oci/data_catalog/models/create_term_details'
require 'oci/data_catalog/models/create_term_relationship_details'
require 'oci/data_catalog/models/custom_property'
require 'oci/data_catalog/models/custom_property_collection'
require 'oci/data_catalog/models/custom_property_data_type'
require 'oci/data_catalog/models/custom_property_get_usage'
require 'oci/data_catalog/models/custom_property_set_usage'
require 'oci/data_catalog/models/custom_property_summary'
require 'oci/data_catalog/models/custom_property_type_usage'
require 'oci/data_catalog/models/data_asset'
require 'oci/data_catalog/models/data_asset_collection'
require 'oci/data_catalog/models/data_asset_export_scope'
require 'oci/data_catalog/models/data_asset_import_export_type_filter'
require 'oci/data_catalog/models/data_asset_permissions_summary'
require 'oci/data_catalog/models/data_asset_summary'
require 'oci/data_catalog/models/data_asset_tag'
require 'oci/data_catalog/models/data_asset_tag_collection'
require 'oci/data_catalog/models/data_asset_tag_summary'
require 'oci/data_catalog/models/data_selector_pattern_details'
require 'oci/data_catalog/models/derived_logical_entities'
require 'oci/data_catalog/models/detach_catalog_private_endpoint_details'
require 'oci/data_catalog/models/entity'
require 'oci/data_catalog/models/entity_collection'
require 'oci/data_catalog/models/entity_lineage'
require 'oci/data_catalog/models/entity_summary'
require 'oci/data_catalog/models/entity_tag'
require 'oci/data_catalog/models/entity_tag_collection'
require 'oci/data_catalog/models/entity_tag_summary'
require 'oci/data_catalog/models/event_config'
require 'oci/data_catalog/models/event_config_status'
require 'oci/data_catalog/models/export_data_asset_details'
require 'oci/data_catalog/models/faceted_search_aggregation'
require 'oci/data_catalog/models/faceted_search_custom_property'
require 'oci/data_catalog/models/faceted_search_date_filter_request'
require 'oci/data_catalog/models/faceted_search_filter_request'
require 'oci/data_catalog/models/faceted_search_sort_request'
require 'oci/data_catalog/models/faceted_search_string_filter_request'
require 'oci/data_catalog/models/fetch_entity_lineage_details'
require 'oci/data_catalog/models/folder'
require 'oci/data_catalog/models/folder_collection'
require 'oci/data_catalog/models/folder_summary'
require 'oci/data_catalog/models/folder_tag'
require 'oci/data_catalog/models/folder_tag_collection'
require 'oci/data_catalog/models/folder_tag_summary'
require 'oci/data_catalog/models/glossary'
require 'oci/data_catalog/models/glossary_collection'
require 'oci/data_catalog/models/glossary_permissions_summary'
require 'oci/data_catalog/models/glossary_summary'
require 'oci/data_catalog/models/glossary_tree_element'
require 'oci/data_catalog/models/harvest_status'
require 'oci/data_catalog/models/import_connection_details'
require 'oci/data_catalog/models/import_data_asset_details'
require 'oci/data_catalog/models/import_data_asset_job_result'
require 'oci/data_catalog/models/import_glossary_details'
require 'oci/data_catalog/models/job'
require 'oci/data_catalog/models/job_collection'
require 'oci/data_catalog/models/job_definition'
require 'oci/data_catalog/models/job_definition_collection'
require 'oci/data_catalog/models/job_definition_permissions_summary'
require 'oci/data_catalog/models/job_definition_scope'
require 'oci/data_catalog/models/job_definition_summary'
require 'oci/data_catalog/models/job_execution'
require 'oci/data_catalog/models/job_execution_collection'
require 'oci/data_catalog/models/job_execution_state'
require 'oci/data_catalog/models/job_execution_summary'
require 'oci/data_catalog/models/job_lifecycle_state'
require 'oci/data_catalog/models/job_log'
require 'oci/data_catalog/models/job_log_collection'
require 'oci/data_catalog/models/job_log_summary'
require 'oci/data_catalog/models/job_metric'
require 'oci/data_catalog/models/job_metric_collection'
require 'oci/data_catalog/models/job_metric_summary'
require 'oci/data_catalog/models/job_schedule_type'
require 'oci/data_catalog/models/job_summary'
require 'oci/data_catalog/models/job_type'
require 'oci/data_catalog/models/lifecycle_state'
require 'oci/data_catalog/models/lineage_direction'
require 'oci/data_catalog/models/lineage_object'
require 'oci/data_catalog/models/lineage_relationship'
require 'oci/data_catalog/models/metastore'
require 'oci/data_catalog/models/metastore_summary'
require 'oci/data_catalog/models/namespace'
require 'oci/data_catalog/models/namespace_collection'
require 'oci/data_catalog/models/namespace_summary'
require 'oci/data_catalog/models/object_lineage'
require 'oci/data_catalog/models/object_lineage_request_details'
require 'oci/data_catalog/models/object_relationship'
require 'oci/data_catalog/models/object_storage_object_reference'
require 'oci/data_catalog/models/parse_connection_details'
require 'oci/data_catalog/models/pattern'
require 'oci/data_catalog/models/pattern_collection'
require 'oci/data_catalog/models/pattern_summary'
require 'oci/data_catalog/models/process_recommendation_details'
require 'oci/data_catalog/models/property_definition'
require 'oci/data_catalog/models/recommendation_collection'
require 'oci/data_catalog/models/recommendation_details'
require 'oci/data_catalog/models/recommendation_resource_type'
require 'oci/data_catalog/models/recommendation_status'
require 'oci/data_catalog/models/recommendation_type'
require 'oci/data_catalog/models/rule_attribute'
require 'oci/data_catalog/models/rule_collection'
require 'oci/data_catalog/models/rule_origin_type'
require 'oci/data_catalog/models/rule_summary'
require 'oci/data_catalog/models/rule_type'
require 'oci/data_catalog/models/search_criteria'
require 'oci/data_catalog/models/search_result'
require 'oci/data_catalog/models/search_result_collection'
require 'oci/data_catalog/models/search_tag_summary'
require 'oci/data_catalog/models/search_term_summary'
require 'oci/data_catalog/models/suggest_list_item'
require 'oci/data_catalog/models/suggest_results'
require 'oci/data_catalog/models/term'
require 'oci/data_catalog/models/term_associated_object'
require 'oci/data_catalog/models/term_collection'
require 'oci/data_catalog/models/term_relationship'
require 'oci/data_catalog/models/term_relationship_collection'
require 'oci/data_catalog/models/term_relationship_summary'
require 'oci/data_catalog/models/term_summary'
require 'oci/data_catalog/models/term_workflow_status'
require 'oci/data_catalog/models/type'
require 'oci/data_catalog/models/type_collection'
require 'oci/data_catalog/models/type_custom_property_details'
require 'oci/data_catalog/models/type_summary'
require 'oci/data_catalog/models/update_attribute_details'
require 'oci/data_catalog/models/update_catalog_details'
require 'oci/data_catalog/models/update_catalog_private_endpoint_details'
require 'oci/data_catalog/models/update_connection_details'
require 'oci/data_catalog/models/update_custom_property_details'
require 'oci/data_catalog/models/update_data_asset_details'
require 'oci/data_catalog/models/update_entity_details'
require 'oci/data_catalog/models/update_folder_details'
require 'oci/data_catalog/models/update_glossary_details'
require 'oci/data_catalog/models/update_job_definition_details'
require 'oci/data_catalog/models/update_job_details'
require 'oci/data_catalog/models/update_metastore_details'
require 'oci/data_catalog/models/update_namespace_details'
require 'oci/data_catalog/models/update_pattern_details'
require 'oci/data_catalog/models/update_term_details'
require 'oci/data_catalog/models/update_term_relationship_details'
require 'oci/data_catalog/models/upload_credentials_details'
require 'oci/data_catalog/models/validate_connection_details'
require 'oci/data_catalog/models/validate_connection_result'
require 'oci/data_catalog/models/validate_pattern_details'
require 'oci/data_catalog/models/validate_pattern_result'
require 'oci/data_catalog/models/work_request'
require 'oci/data_catalog/models/work_request_error'
require 'oci/data_catalog/models/work_request_log'
require 'oci/data_catalog/models/work_request_resource'

# Require generated clients
require 'oci/data_catalog/data_catalog_client'
require 'oci/data_catalog/data_catalog_client_composite_operations'

# Require service utilities
require 'oci/data_catalog/util'
