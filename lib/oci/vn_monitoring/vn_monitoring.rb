# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20160918

module OCI
  module VnMonitoring
    # Module containing models for requests made to, and responses received from,
    # OCI VnMonitoring services
    module Models
    end
  end
end

# Require models
require 'oci/vn_monitoring/models/access_denied_traffic_node'
require 'oci/vn_monitoring/models/action_type'
require 'oci/vn_monitoring/models/add_drg_route_distribution_statement_details'
require 'oci/vn_monitoring/models/add_drg_route_distribution_statements_details'
require 'oci/vn_monitoring/models/add_drg_route_rule_details'
require 'oci/vn_monitoring/models/add_drg_route_rules_details'
require 'oci/vn_monitoring/models/add_network_security_group_security_rules_details'
require 'oci/vn_monitoring/models/add_public_ip_pool_capacity_details'
require 'oci/vn_monitoring/models/add_security_rule_details'
require 'oci/vn_monitoring/models/add_subnet_ipv6_cidr_details'
require 'oci/vn_monitoring/models/add_vcn_cidr_details'
require 'oci/vn_monitoring/models/add_vcn_ipv6_cidr_details'
require 'oci/vn_monitoring/models/added_network_security_group_security_rules'
require 'oci/vn_monitoring/models/adhoc_get_path_analysis_details'
require 'oci/vn_monitoring/models/allowed_ike_ip_sec_parameters'
require 'oci/vn_monitoring/models/allowed_phase_one_parameters'
require 'oci/vn_monitoring/models/allowed_phase_two_parameters'
require 'oci/vn_monitoring/models/allowed_security_action'
require 'oci/vn_monitoring/models/allowed_security_action_details'
require 'oci/vn_monitoring/models/allowed_security_configuration'
require 'oci/vn_monitoring/models/bgp_session_info'
require 'oci/vn_monitoring/models/bulk_add_virtual_circuit_public_prefixes_details'
require 'oci/vn_monitoring/models/bulk_delete_virtual_circuit_public_prefixes_details'
require 'oci/vn_monitoring/models/byoip_allocated_range_collection'
require 'oci/vn_monitoring/models/byoip_allocated_range_summary'
require 'oci/vn_monitoring/models/byoip_range'
require 'oci/vn_monitoring/models/byoip_range_collection'
require 'oci/vn_monitoring/models/byoip_range_summary'
require 'oci/vn_monitoring/models/byoip_range_vcn_ipv6_allocation_summary'
require 'oci/vn_monitoring/models/byoipv6_cidr_details'
require 'oci/vn_monitoring/models/capture_filter'
require 'oci/vn_monitoring/models/change_byoip_range_compartment_details'
require 'oci/vn_monitoring/models/change_capture_filter_compartment_details'
require 'oci/vn_monitoring/models/change_cpe_compartment_details'
require 'oci/vn_monitoring/models/change_cross_connect_compartment_details'
require 'oci/vn_monitoring/models/change_cross_connect_group_compartment_details'
require 'oci/vn_monitoring/models/change_dhcp_options_compartment_details'
require 'oci/vn_monitoring/models/change_drg_compartment_details'
require 'oci/vn_monitoring/models/change_ip_sec_connection_compartment_details'
require 'oci/vn_monitoring/models/change_internet_gateway_compartment_details'
require 'oci/vn_monitoring/models/change_local_peering_gateway_compartment_details'
require 'oci/vn_monitoring/models/change_nat_gateway_compartment_details'
require 'oci/vn_monitoring/models/change_network_security_group_compartment_details'
require 'oci/vn_monitoring/models/change_path_analyzer_test_compartment_details'
require 'oci/vn_monitoring/models/change_public_ip_compartment_details'
require 'oci/vn_monitoring/models/change_public_ip_pool_compartment_details'
require 'oci/vn_monitoring/models/change_remote_peering_connection_compartment_details'
require 'oci/vn_monitoring/models/change_route_table_compartment_details'
require 'oci/vn_monitoring/models/change_security_list_compartment_details'
require 'oci/vn_monitoring/models/change_service_gateway_compartment_details'
require 'oci/vn_monitoring/models/change_subnet_compartment_details'
require 'oci/vn_monitoring/models/change_vcn_compartment_details'
require 'oci/vn_monitoring/models/change_virtual_circuit_compartment_details'
require 'oci/vn_monitoring/models/change_vlan_compartment_details'
require 'oci/vn_monitoring/models/change_vtap_compartment_details'
require 'oci/vn_monitoring/models/compartment_internal'
require 'oci/vn_monitoring/models/compute_instance_endpoint'
require 'oci/vn_monitoring/models/connect_local_peering_gateways_details'
require 'oci/vn_monitoring/models/connect_remote_peering_connections_details'
require 'oci/vn_monitoring/models/cpe'
require 'oci/vn_monitoring/models/cpe_device_config_answer'
require 'oci/vn_monitoring/models/cpe_device_config_question'
require 'oci/vn_monitoring/models/cpe_device_info'
require 'oci/vn_monitoring/models/cpe_device_shape_detail'
require 'oci/vn_monitoring/models/cpe_device_shape_summary'
require 'oci/vn_monitoring/models/create_byoip_range_details'
require 'oci/vn_monitoring/models/create_capture_filter_details'
require 'oci/vn_monitoring/models/create_cpe_details'
require 'oci/vn_monitoring/models/create_cross_connect_details'
require 'oci/vn_monitoring/models/create_cross_connect_group_details'
require 'oci/vn_monitoring/models/create_dhcp_details'
require 'oci/vn_monitoring/models/create_drg_attachment_details'
require 'oci/vn_monitoring/models/create_drg_details'
require 'oci/vn_monitoring/models/create_drg_route_distribution_details'
require 'oci/vn_monitoring/models/create_drg_route_table_details'
require 'oci/vn_monitoring/models/create_ip_sec_connection_details'
require 'oci/vn_monitoring/models/create_ip_sec_connection_tunnel_details'
require 'oci/vn_monitoring/models/create_ip_sec_tunnel_bgp_session_details'
require 'oci/vn_monitoring/models/create_ip_sec_tunnel_encryption_domain_details'
require 'oci/vn_monitoring/models/create_internet_gateway_details'
require 'oci/vn_monitoring/models/create_ipv6_details'
require 'oci/vn_monitoring/models/create_local_peering_gateway_details'
require 'oci/vn_monitoring/models/create_macsec_key'
require 'oci/vn_monitoring/models/create_macsec_properties'
require 'oci/vn_monitoring/models/create_nat_gateway_details'
require 'oci/vn_monitoring/models/create_network_security_group_details'
require 'oci/vn_monitoring/models/create_path_analyzer_test_details'
require 'oci/vn_monitoring/models/create_private_ip_details'
require 'oci/vn_monitoring/models/create_public_ip_details'
require 'oci/vn_monitoring/models/create_public_ip_pool_details'
require 'oci/vn_monitoring/models/create_remote_peering_connection_details'
require 'oci/vn_monitoring/models/create_route_table_details'
require 'oci/vn_monitoring/models/create_security_list_details'
require 'oci/vn_monitoring/models/create_service_gateway_details'
require 'oci/vn_monitoring/models/create_subnet_details'
require 'oci/vn_monitoring/models/create_vcn_details'
require 'oci/vn_monitoring/models/create_virtual_circuit_details'
require 'oci/vn_monitoring/models/create_virtual_circuit_public_prefix_details'
require 'oci/vn_monitoring/models/create_vlan_details'
require 'oci/vn_monitoring/models/create_vnic_details'
require 'oci/vn_monitoring/models/create_vtap_details'
require 'oci/vn_monitoring/models/cross_connect'
require 'oci/vn_monitoring/models/cross_connect_group'
require 'oci/vn_monitoring/models/cross_connect_location'
require 'oci/vn_monitoring/models/cross_connect_mapping'
require 'oci/vn_monitoring/models/cross_connect_mapping_details'
require 'oci/vn_monitoring/models/cross_connect_mapping_details_collection'
require 'oci/vn_monitoring/models/cross_connect_port_speed_shape'
require 'oci/vn_monitoring/models/cross_connect_status'
require 'oci/vn_monitoring/models/default_drg_route_tables'
require 'oci/vn_monitoring/models/default_phase_one_parameters'
require 'oci/vn_monitoring/models/default_phase_two_parameters'
require 'oci/vn_monitoring/models/delete_virtual_circuit_public_prefix_details'
require 'oci/vn_monitoring/models/denied_security_action'
require 'oci/vn_monitoring/models/denied_security_action_details'
require 'oci/vn_monitoring/models/dhcp_dns_option'
require 'oci/vn_monitoring/models/dhcp_option'
require 'oci/vn_monitoring/models/dhcp_options'
require 'oci/vn_monitoring/models/dhcp_search_domain_option'
require 'oci/vn_monitoring/models/dpd_config'
require 'oci/vn_monitoring/models/drg'
require 'oci/vn_monitoring/models/drg_attachment'
require 'oci/vn_monitoring/models/drg_attachment_id_drg_route_distribution_match_criteria'
require 'oci/vn_monitoring/models/drg_attachment_info'
require 'oci/vn_monitoring/models/drg_attachment_match_all_drg_route_distribution_match_criteria'
require 'oci/vn_monitoring/models/drg_attachment_network_create_details'
require 'oci/vn_monitoring/models/drg_attachment_network_details'
require 'oci/vn_monitoring/models/drg_attachment_network_update_details'
require 'oci/vn_monitoring/models/drg_attachment_type_drg_route_distribution_match_criteria'
require 'oci/vn_monitoring/models/drg_redundancy_status'
require 'oci/vn_monitoring/models/drg_route_distribution'
require 'oci/vn_monitoring/models/drg_route_distribution_match_criteria'
require 'oci/vn_monitoring/models/drg_route_distribution_statement'
require 'oci/vn_monitoring/models/drg_route_rule'
require 'oci/vn_monitoring/models/drg_route_table'
require 'oci/vn_monitoring/models/drg_routing_configuration'
require 'oci/vn_monitoring/models/egress_security_list_configuration'
require 'oci/vn_monitoring/models/egress_security_rule'
require 'oci/vn_monitoring/models/egress_traffic_spec'
require 'oci/vn_monitoring/models/encryption_domain_config'
require 'oci/vn_monitoring/models/endpoint'
require 'oci/vn_monitoring/models/fast_connect_provider_service'
require 'oci/vn_monitoring/models/fast_connect_provider_service_key'
require 'oci/vn_monitoring/models/flow_log_capture_filter_rule_details'
require 'oci/vn_monitoring/models/forwarded_routing_action'
require 'oci/vn_monitoring/models/forwarded_routing_action_details'
require 'oci/vn_monitoring/models/forwarded_routing_configuration'
require 'oci/vn_monitoring/models/get_path_analysis_details'
require 'oci/vn_monitoring/models/get_public_ip_by_ip_address_details'
require 'oci/vn_monitoring/models/get_public_ip_by_private_ip_id_details'
require 'oci/vn_monitoring/models/ip_sec_connection'
require 'oci/vn_monitoring/models/ip_sec_connection_device_config'
require 'oci/vn_monitoring/models/ip_sec_connection_device_status'
require 'oci/vn_monitoring/models/ip_sec_connection_tunnel'
require 'oci/vn_monitoring/models/ip_sec_connection_tunnel_error_details'
require 'oci/vn_monitoring/models/ip_sec_connection_tunnel_shared_secret'
require 'oci/vn_monitoring/models/icmp_options'
require 'oci/vn_monitoring/models/icmp_protocol_parameters'
require 'oci/vn_monitoring/models/icmp_traffic_protocol_parameters'
require 'oci/vn_monitoring/models/indeterminate_routing_action'
require 'oci/vn_monitoring/models/ingress_security_list_configuration'
require 'oci/vn_monitoring/models/ingress_security_rule'
require 'oci/vn_monitoring/models/internet_gateway'
require 'oci/vn_monitoring/models/ip_address_endpoint'
require 'oci/vn_monitoring/models/ipsec_tunnel_drg_attachment_network_details'
require 'oci/vn_monitoring/models/ipv6'
require 'oci/vn_monitoring/models/letter_of_authority'
require 'oci/vn_monitoring/models/load_balancer_endpoint'
require 'oci/vn_monitoring/models/load_balancer_listener_endpoint'
require 'oci/vn_monitoring/models/local_peering_gateway'
require 'oci/vn_monitoring/models/loop_back_drg_attachment_network_details'
require 'oci/vn_monitoring/models/macsec_encryption_cipher'
require 'oci/vn_monitoring/models/macsec_key'
require 'oci/vn_monitoring/models/macsec_properties'
require 'oci/vn_monitoring/models/macsec_state'
require 'oci/vn_monitoring/models/modify_vcn_cidr_details'
require 'oci/vn_monitoring/models/nat_gateway'
require 'oci/vn_monitoring/models/network_load_balancer_endpoint'
require 'oci/vn_monitoring/models/network_load_balancer_listener_endpoint'
require 'oci/vn_monitoring/models/network_security_group'
require 'oci/vn_monitoring/models/network_security_group_vnic'
require 'oci/vn_monitoring/models/networking_topology'
require 'oci/vn_monitoring/models/no_route_routing_action'
require 'oci/vn_monitoring/models/no_route_routing_action_details'
require 'oci/vn_monitoring/models/nsg_configuration'
require 'oci/vn_monitoring/models/on_prem_endpoint'
require 'oci/vn_monitoring/models/operation_status'
require 'oci/vn_monitoring/models/operation_type'
require 'oci/vn_monitoring/models/path'
require 'oci/vn_monitoring/models/path_analysis_work_request_result'
require 'oci/vn_monitoring/models/path_analyzer_test'
require 'oci/vn_monitoring/models/path_analyzer_test_collection'
require 'oci/vn_monitoring/models/path_analyzer_test_summary'
require 'oci/vn_monitoring/models/path_topology'
require 'oci/vn_monitoring/models/persisted_get_path_analysis_details'
require 'oci/vn_monitoring/models/phase_one_config_details'
require 'oci/vn_monitoring/models/phase_two_config_details'
require 'oci/vn_monitoring/models/port_range'
require 'oci/vn_monitoring/models/private_ip'
require 'oci/vn_monitoring/models/protocol_parameters'
require 'oci/vn_monitoring/models/public_ip'
require 'oci/vn_monitoring/models/public_ip_pool'
require 'oci/vn_monitoring/models/public_ip_pool_collection'
require 'oci/vn_monitoring/models/public_ip_pool_summary'
require 'oci/vn_monitoring/models/query_options'
require 'oci/vn_monitoring/models/remote_peering_connection'
require 'oci/vn_monitoring/models/remote_peering_connection_drg_attachment_network_details'
require 'oci/vn_monitoring/models/remove_drg_route_distribution_statements_details'
require 'oci/vn_monitoring/models/remove_drg_route_rules_details'
require 'oci/vn_monitoring/models/remove_network_security_group_security_rules_details'
require 'oci/vn_monitoring/models/remove_public_ip_pool_capacity_details'
require 'oci/vn_monitoring/models/remove_subnet_ipv6_cidr_details'
require 'oci/vn_monitoring/models/remove_vcn_cidr_details'
require 'oci/vn_monitoring/models/remove_vcn_ipv6_cidr_details'
require 'oci/vn_monitoring/models/route_rule'
require 'oci/vn_monitoring/models/route_table'
require 'oci/vn_monitoring/models/routing_action'
require 'oci/vn_monitoring/models/security_action'
require 'oci/vn_monitoring/models/security_list'
require 'oci/vn_monitoring/models/security_rule'
require 'oci/vn_monitoring/models/service'
require 'oci/vn_monitoring/models/service_gateway'
require 'oci/vn_monitoring/models/service_id_request_details'
require 'oci/vn_monitoring/models/service_id_response_details'
require 'oci/vn_monitoring/models/sort_order'
require 'oci/vn_monitoring/models/stateful_egress_security_list_configuration'
require 'oci/vn_monitoring/models/stateful_ingress_security_list_configuration'
require 'oci/vn_monitoring/models/stateful_nsg_configuration'
require 'oci/vn_monitoring/models/subnet'
require 'oci/vn_monitoring/models/subnet_endpoint'
require 'oci/vn_monitoring/models/subnet_topology'
require 'oci/vn_monitoring/models/tcp_options'
require 'oci/vn_monitoring/models/tcp_protocol_parameters'
require 'oci/vn_monitoring/models/tcp_traffic_protocol_parameters'
require 'oci/vn_monitoring/models/topology'
require 'oci/vn_monitoring/models/topology_associated_with_entity_relationship'
require 'oci/vn_monitoring/models/topology_associated_with_relationship_details'
require 'oci/vn_monitoring/models/topology_contains_entity_relationship'
require 'oci/vn_monitoring/models/topology_entity_relationship'
require 'oci/vn_monitoring/models/topology_routes_to_entity_relationship'
require 'oci/vn_monitoring/models/topology_routes_to_relationship_details'
require 'oci/vn_monitoring/models/traffic_node'
require 'oci/vn_monitoring/models/traffic_protocol_parameters'
require 'oci/vn_monitoring/models/traffic_route'
require 'oci/vn_monitoring/models/tunnel_config'
require 'oci/vn_monitoring/models/tunnel_cpe_device_config'
require 'oci/vn_monitoring/models/tunnel_phase_one_details'
require 'oci/vn_monitoring/models/tunnel_phase_two_details'
require 'oci/vn_monitoring/models/tunnel_route_summary'
require 'oci/vn_monitoring/models/tunnel_security_association_summary'
require 'oci/vn_monitoring/models/tunnel_status'
require 'oci/vn_monitoring/models/udp_options'
require 'oci/vn_monitoring/models/udp_protocol_parameters'
require 'oci/vn_monitoring/models/udp_traffic_protocol_parameters'
require 'oci/vn_monitoring/models/update_byoip_range_details'
require 'oci/vn_monitoring/models/update_capture_filter_details'
require 'oci/vn_monitoring/models/update_cpe_details'
require 'oci/vn_monitoring/models/update_cross_connect_details'
require 'oci/vn_monitoring/models/update_cross_connect_group_details'
require 'oci/vn_monitoring/models/update_dhcp_details'
require 'oci/vn_monitoring/models/update_drg_attachment_details'
require 'oci/vn_monitoring/models/update_drg_details'
require 'oci/vn_monitoring/models/update_drg_route_distribution_details'
require 'oci/vn_monitoring/models/update_drg_route_distribution_statement_details'
require 'oci/vn_monitoring/models/update_drg_route_distribution_statements_details'
require 'oci/vn_monitoring/models/update_drg_route_rule_details'
require 'oci/vn_monitoring/models/update_drg_route_rules_details'
require 'oci/vn_monitoring/models/update_drg_route_table_details'
require 'oci/vn_monitoring/models/update_ip_sec_connection_details'
require 'oci/vn_monitoring/models/update_ip_sec_connection_tunnel_details'
require 'oci/vn_monitoring/models/update_ip_sec_connection_tunnel_shared_secret_details'
require 'oci/vn_monitoring/models/update_ip_sec_tunnel_bgp_session_details'
require 'oci/vn_monitoring/models/update_ip_sec_tunnel_encryption_domain_details'
require 'oci/vn_monitoring/models/update_internet_gateway_details'
require 'oci/vn_monitoring/models/update_ipv6_details'
require 'oci/vn_monitoring/models/update_local_peering_gateway_details'
require 'oci/vn_monitoring/models/update_macsec_key'
require 'oci/vn_monitoring/models/update_macsec_properties'
require 'oci/vn_monitoring/models/update_nat_gateway_details'
require 'oci/vn_monitoring/models/update_network_security_group_details'
require 'oci/vn_monitoring/models/update_network_security_group_security_rules_details'
require 'oci/vn_monitoring/models/update_path_analyzer_test_details'
require 'oci/vn_monitoring/models/update_private_ip_details'
require 'oci/vn_monitoring/models/update_public_ip_details'
require 'oci/vn_monitoring/models/update_public_ip_pool_details'
require 'oci/vn_monitoring/models/update_remote_peering_connection_details'
require 'oci/vn_monitoring/models/update_route_table_details'
require 'oci/vn_monitoring/models/update_security_list_details'
require 'oci/vn_monitoring/models/update_security_rule_details'
require 'oci/vn_monitoring/models/update_service_gateway_details'
require 'oci/vn_monitoring/models/update_subnet_details'
require 'oci/vn_monitoring/models/update_tunnel_cpe_device_config_details'
require 'oci/vn_monitoring/models/update_vcn_details'
require 'oci/vn_monitoring/models/update_virtual_circuit_details'
require 'oci/vn_monitoring/models/update_vlan_details'
require 'oci/vn_monitoring/models/update_vnic_details'
require 'oci/vn_monitoring/models/update_vtap_details'
require 'oci/vn_monitoring/models/updated_network_security_group_security_rules'
require 'oci/vn_monitoring/models/upgrade_status'
require 'oci/vn_monitoring/models/vcn'
require 'oci/vn_monitoring/models/vcn_dns_resolver_association'
require 'oci/vn_monitoring/models/vcn_drg_attachment_network_create_details'
require 'oci/vn_monitoring/models/vcn_drg_attachment_network_details'
require 'oci/vn_monitoring/models/vcn_drg_attachment_network_update_details'
require 'oci/vn_monitoring/models/vcn_routing_configuration'
require 'oci/vn_monitoring/models/vcn_topology'
require 'oci/vn_monitoring/models/virtual_circuit'
require 'oci/vn_monitoring/models/virtual_circuit_associated_tunnel_details'
require 'oci/vn_monitoring/models/virtual_circuit_bandwidth_shape'
require 'oci/vn_monitoring/models/virtual_circuit_drg_attachment_network_details'
require 'oci/vn_monitoring/models/virtual_circuit_ip_mtu'
require 'oci/vn_monitoring/models/virtual_circuit_public_prefix'
require 'oci/vn_monitoring/models/visible_traffic_node'
require 'oci/vn_monitoring/models/vlan'
require 'oci/vn_monitoring/models/vlan_endpoint'
require 'oci/vn_monitoring/models/vnic'
require 'oci/vn_monitoring/models/vnic_endpoint'
require 'oci/vn_monitoring/models/vtap'
require 'oci/vn_monitoring/models/vtap_capture_filter_rule_details'
require 'oci/vn_monitoring/models/work_request'
require 'oci/vn_monitoring/models/work_request_error'
require 'oci/vn_monitoring/models/work_request_error_collection'
require 'oci/vn_monitoring/models/work_request_log_entry'
require 'oci/vn_monitoring/models/work_request_log_entry_collection'
require 'oci/vn_monitoring/models/work_request_resource'
require 'oci/vn_monitoring/models/work_request_result'
require 'oci/vn_monitoring/models/work_request_result_collection'
require 'oci/vn_monitoring/models/work_request_summary'
require 'oci/vn_monitoring/models/work_request_summary_collection'

# Require generated clients
require 'oci/vn_monitoring/vn_monitoring_client'
require 'oci/vn_monitoring/vn_monitoring_client_composite_operations'

# Require service utilities
require 'oci/vn_monitoring/util'
