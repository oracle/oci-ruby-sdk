# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'oci'

gen_ai_inference_client = OCI::GenerativeAiInference::GenerativeAiInferenceClient.new(region: '')
model_id = 'cohere.command'
prompt = 'What is sound?'
max_tokens = 100
temperature = 0.75
frequency_penalty = 1.0
top_p = 0.7

text_details_no_stream = OCI::GenerativeAiInference::Models::GenerateTextDetails.new(
  'compartment_id': ' ',
  'serving_mode': OCI::GenerativeAiInference::Models::
      OnDemandServingMode.new('model_id': model_id),
  'inference_request': OCI::GenerativeAiInference::Models::
      CohereLlmInferenceRequest.new('prompt': prompt,
                                    'is_stream': false,
                                    'max_tokens': max_tokens,
                                    'temperature': temperature,
                                    'top_p': top_p,
                                    'frequency_penalty': frequency_penalty)
)

response = gen_ai_inference_client.generate_text(text_details_no_stream)
puts '================================'
puts 'Non Streaming mode'
puts '================================'
puts response.data

text_details_stream = OCI::GenerativeAiInference::Models::GenerateTextDetails.new(
  'compartment_id': compartment_id,
  'serving_mode': OCI::GenerativeAiInference::Models::
      OnDemandServingMode.new('model_id': model_id),
  'inference_request': OCI::GenerativeAiInference::Models::
      CohereLlmInferenceRequest.new('prompt': prompt,
                                    'is_stream': true,
                                    'max_tokens': max_tokens,
                                    'temperature': temperature,
                                    'top_p': top_p,
                                    'frequency_penalty': frequency_penalty)
)

puts
puts '================================'
puts 'Streaming mode'
puts '================================'
puts

# pass the block to generate_text api to read the stream
gen_ai_inference_client.generate_text(text_details_stream, &OCI::SSEReader.read_stream)
