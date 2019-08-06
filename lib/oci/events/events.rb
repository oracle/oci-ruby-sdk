# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module Events
    # Module containing models for requests made to, and responses received from,
    # OCI Events services
    module Models
    end
  end
end

# Require models
require 'oci/events/models/action'
require 'oci/events/models/action_details'
require 'oci/events/models/action_details_list'
require 'oci/events/models/action_list'
require 'oci/events/models/change_rule_compartment_details'
require 'oci/events/models/create_faa_s_action_details'
require 'oci/events/models/create_notification_service_action_details'
require 'oci/events/models/create_rule_details'
require 'oci/events/models/create_streaming_service_action_details'
require 'oci/events/models/faa_s_action'
require 'oci/events/models/notification_service_action'
require 'oci/events/models/rule'
require 'oci/events/models/rule_summary'
require 'oci/events/models/streaming_service_action'
require 'oci/events/models/update_rule_details'

# Require generated clients
require 'oci/events/events_client'
require 'oci/events/events_client_composite_operations'

# Require service utilities
require 'oci/events/util'
