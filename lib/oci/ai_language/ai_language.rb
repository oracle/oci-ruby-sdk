# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module AiLanguage
    # Module containing models for requests made to, and responses received from,
    # OCI AiLanguage services
    module Models
    end
  end
end

# Require models
require 'oci/ai_language/models/batch_detect_dominant_language_details'
require 'oci/ai_language/models/batch_detect_dominant_language_result'
require 'oci/ai_language/models/batch_detect_language_entities_details'
require 'oci/ai_language/models/batch_detect_language_entities_result'
require 'oci/ai_language/models/batch_detect_language_key_phrases_details'
require 'oci/ai_language/models/batch_detect_language_key_phrases_result'
require 'oci/ai_language/models/batch_detect_language_sentiments_details'
require 'oci/ai_language/models/batch_detect_language_sentiments_result'
require 'oci/ai_language/models/batch_detect_language_text_classification_details'
require 'oci/ai_language/models/batch_detect_language_text_classification_result'
require 'oci/ai_language/models/detect_dominant_language_details'
require 'oci/ai_language/models/detect_dominant_language_result'
require 'oci/ai_language/models/detect_language_entities_details'
require 'oci/ai_language/models/detect_language_entities_result'
require 'oci/ai_language/models/detect_language_key_phrases_details'
require 'oci/ai_language/models/detect_language_key_phrases_result'
require 'oci/ai_language/models/detect_language_sentiments_details'
require 'oci/ai_language/models/detect_language_sentiments_result'
require 'oci/ai_language/models/detect_language_text_classification_details'
require 'oci/ai_language/models/detect_language_text_classification_result'
require 'oci/ai_language/models/detected_language'
require 'oci/ai_language/models/document_error'
require 'oci/ai_language/models/dominant_language_document'
require 'oci/ai_language/models/dominant_language_document_result'
require 'oci/ai_language/models/entity'
require 'oci/ai_language/models/entity_document'
require 'oci/ai_language/models/entity_document_result'
require 'oci/ai_language/models/error_details'
require 'oci/ai_language/models/hierarchical_entity'
require 'oci/ai_language/models/key_phrase'
require 'oci/ai_language/models/key_phrase_document'
require 'oci/ai_language/models/key_phrase_document_result'
require 'oci/ai_language/models/ner_model_version'
require 'oci/ai_language/models/sentiment_aspect'
require 'oci/ai_language/models/sentiment_document_result'
require 'oci/ai_language/models/sentiment_sentence'
require 'oci/ai_language/models/sentiments_document'
require 'oci/ai_language/models/text_classification'
require 'oci/ai_language/models/text_classification_document'
require 'oci/ai_language/models/text_classification_document_result'

# Require generated clients
require 'oci/ai_language/ai_service_language_client'

# Require service utilities
require 'oci/ai_language/util'
