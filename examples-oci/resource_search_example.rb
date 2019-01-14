# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# This example demonstrates how to programatically retrieve resource types and query for resources.
# When running this example, it is assumed that you already have active VCN resources associated with
# your tenant to display the search results.
#
# Querying for resources may be done via a structured query or free text.  For more information on how to
# format queries, please refer to {https://docs.cloud.oracle.com/iaas/Content/Search/Concepts/querysyntax.htm}.

require 'oci'
require 'pp'

SECTION_BREAK_LENGTH = 80 # 80 characters

resource_search_client = OCI::ResourceSearch::ResourceSearchClient.new

puts 'List all resource types'
puts '=' * SECTION_BREAK_LENGTH
# Using pagination for displaying all of the resource types
resource_search_client.list_resource_types.each do |response|
  response.data.each do |resource_type|
    pp resource_type.to_hash
  end
end

puts
puts 'Get the single Vcn resource type'
puts '=' * SECTION_BREAK_LENGTH
resource_type = resource_search_client.get_resource_type('Vcn').data
pp resource_type.to_hash

query = 'query vcn resources where lifecycleState =\'AVAILABLE\''
puts
puts "Search using structured query: \"#{query}\""
puts '=' * SECTION_BREAK_LENGTH
# Using pagination for displaying all of the search results
resource_search_client.search_resources(
  OCI::ResourceSearch::Models::StructuredSearchDetails.new(
    query: query,
    type: 'Structured',
    matching_context_type: OCI::ResourceSearch::Models::SearchDetails::MATCHING_CONTEXT_TYPE_NONE
  )
).each do |response|
  pp response.data.to_hash
end

text = 'vcn with lifecycleState as AVAILABLE'
puts
puts "Search using free text: \"#{text}\""
puts '=' * SECTION_BREAK_LENGTH
# Using pagination for displaying all of the search results
resource_search_client.search_resources(
  OCI::ResourceSearch::Models::FreeTextSearchDetails.new(
    text: text,
    type: 'FreeText',
    # Highlights adds additional search context to the response to aid when rendering the results in HTML
    matching_context_type: OCI::ResourceSearch::Models::SearchDetails::MATCHING_CONTEXT_TYPE_HIGHLIGHTS
  )
).each do |response|
  pp response.data.to_hash
end
