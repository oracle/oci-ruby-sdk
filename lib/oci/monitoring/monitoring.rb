# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module Monitoring
    # Module containing models for requests made to, and responses received from,
    # OCI Monitoring services
    module Models
    end
  end
end

# Require models
require 'oci/monitoring/models/aggregated_datapoint'
require 'oci/monitoring/models/alarm'
require 'oci/monitoring/models/alarm_history_collection'
require 'oci/monitoring/models/alarm_history_entry'
require 'oci/monitoring/models/alarm_status_summary'
require 'oci/monitoring/models/alarm_summary'
require 'oci/monitoring/models/change_alarm_compartment_details'
require 'oci/monitoring/models/create_alarm_details'
require 'oci/monitoring/models/datapoint'
require 'oci/monitoring/models/failed_metric_record'
require 'oci/monitoring/models/list_metrics_details'
require 'oci/monitoring/models/metric'
require 'oci/monitoring/models/metric_data'
require 'oci/monitoring/models/metric_data_details'
require 'oci/monitoring/models/post_metric_data_details'
require 'oci/monitoring/models/post_metric_data_response_details'
require 'oci/monitoring/models/summarize_metrics_data_details'
require 'oci/monitoring/models/suppression'
require 'oci/monitoring/models/update_alarm_details'

# Require generated clients
require 'oci/monitoring/monitoring_client'
require 'oci/monitoring/monitoring_client_composite_operations'

# Require service utilities
require 'oci/monitoring/util'
