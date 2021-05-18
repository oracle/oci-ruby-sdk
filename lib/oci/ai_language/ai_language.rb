# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
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
require 'oci/ai_language/models/entity'
require 'oci/ai_language/models/key_phrase'
require 'oci/ai_language/models/ner_model_version'
require 'oci/ai_language/models/sentiment_aspect'
require 'oci/ai_language/models/text_classification'

# Require generated clients
require 'oci/ai_language/ai_service_language_client'

# Require service utilities
require 'oci/ai_language/util'
