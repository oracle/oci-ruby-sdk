# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Opsi
    # Module containing models for requests made to, and responses received from,
    # OCI Opsi services
    module Models
    end
  end
end

# Require models
require 'oci/opsi/models/database_details'
require 'oci/opsi/models/database_insight_summary'
require 'oci/opsi/models/database_insights'
require 'oci/opsi/models/database_insights_collection'
require 'oci/opsi/models/historical_data_item'
require 'oci/opsi/models/ingest_sql_bucket_details'
require 'oci/opsi/models/ingest_sql_bucket_response_details'
require 'oci/opsi/models/ingest_sql_plan_lines_details'
require 'oci/opsi/models/ingest_sql_plan_lines_response_details'
require 'oci/opsi/models/ingest_sql_text_details'
require 'oci/opsi/models/ingest_sql_text_response_details'
require 'oci/opsi/models/projected_data_item'
require 'oci/opsi/models/resource_capacity_trend_aggregation'
require 'oci/opsi/models/resource_insight_current_utilization'
require 'oci/opsi/models/resource_insight_projected_utilization'
require 'oci/opsi/models/resource_insight_projected_utilization_item'
require 'oci/opsi/models/resource_statistics'
require 'oci/opsi/models/resource_statistics_aggregation'
require 'oci/opsi/models/resource_usage_trend_aggregation'
require 'oci/opsi/models/sort_order'
require 'oci/opsi/models/sql_bucket'
require 'oci/opsi/models/sql_insight_aggregation'
require 'oci/opsi/models/sql_insight_aggregation_collection'
require 'oci/opsi/models/sql_insight_thresholds'
require 'oci/opsi/models/sql_inventory'
require 'oci/opsi/models/sql_plan_collection'
require 'oci/opsi/models/sql_plan_insight_aggregation'
require 'oci/opsi/models/sql_plan_insight_aggregation_collection'
require 'oci/opsi/models/sql_plan_insights'
require 'oci/opsi/models/sql_plan_line'
require 'oci/opsi/models/sql_plan_summary'
require 'oci/opsi/models/sql_response_time_distribution_aggregation'
require 'oci/opsi/models/sql_response_time_distribution_aggregation_collection'
require 'oci/opsi/models/sql_search_collection'
require 'oci/opsi/models/sql_search_summary'
require 'oci/opsi/models/sql_statistic_aggregation'
require 'oci/opsi/models/sql_statistic_aggregation_collection'
require 'oci/opsi/models/sql_statistics'
require 'oci/opsi/models/sql_statistics_time_series'
require 'oci/opsi/models/sql_statistics_time_series_aggregation'
require 'oci/opsi/models/sql_statistics_time_series_aggregation_collection'
require 'oci/opsi/models/sql_statistics_time_series_by_plan_aggregation'
require 'oci/opsi/models/sql_statistics_time_series_by_plan_aggregation_collection'
require 'oci/opsi/models/sql_text'
require 'oci/opsi/models/sql_text_collection'
require 'oci/opsi/models/sql_text_summary'
require 'oci/opsi/models/summarize_database_insight_resource_capacity_trend_aggregation_collection'
require 'oci/opsi/models/summarize_database_insight_resource_forecast_trend_aggregation'
require 'oci/opsi/models/summarize_database_insight_resource_statistics_aggregation_collection'
require 'oci/opsi/models/summarize_database_insight_resource_usage_aggregation'
require 'oci/opsi/models/summarize_database_insight_resource_usage_trend_aggregation_collection'
require 'oci/opsi/models/summarize_database_insight_resource_utilization_insight_aggregation'
require 'oci/opsi/models/usage_unit'

# Require generated clients
require 'oci/opsi/operations_insights_client'

# Require service utilities
require 'oci/opsi/util'
