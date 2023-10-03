# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210630
require 'date'
require_relative 'connection'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The properties that define a connection of the type `GITLAB_SERVER_ACCESS_TOKEN`.
  # This type corresponds to a connection in GitLab self-hosted server that is authenticated with a
  # personal access token.
  #
  class Devops::Models::GitlabServerAccessTokenConnection < Devops::Models::Connection
    # **[Required]** The OCID of personal access token saved in secret store.
    # @return [String]
    attr_accessor :access_token

    # **[Required]** The baseUrl of the hosted GitLabServer.
    # @return [String]
    attr_accessor :base_url

    # @return [OCI::Devops::Models::TlsVerifyConfig]
    attr_accessor :tls_verify_config

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'description': :'description',
        'display_name': :'displayName',
        'compartment_id': :'compartmentId',
        'project_id': :'projectId',
        'connection_type': :'connectionType',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'last_connection_validation_result': :'lastConnectionValidationResult',
        'lifecycle_details': :'lifecycleDetails',
        'lifecycle_state': :'lifecycleState',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags',
        'access_token': :'accessToken',
        'base_url': :'baseUrl',
        'tls_verify_config': :'tlsVerifyConfig'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'description': :'String',
        'display_name': :'String',
        'compartment_id': :'String',
        'project_id': :'String',
        'connection_type': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'last_connection_validation_result': :'OCI::Devops::Models::ConnectionValidationResult',
        'lifecycle_details': :'String',
        'lifecycle_state': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>',
        'access_token': :'String',
        'base_url': :'String',
        'tls_verify_config': :'OCI::Devops::Models::TlsVerifyConfig'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::Devops::Models::Connection#id #id} proprety
    # @option attributes [String] :description The value to assign to the {OCI::Devops::Models::Connection#description #description} proprety
    # @option attributes [String] :display_name The value to assign to the {OCI::Devops::Models::Connection#display_name #display_name} proprety
    # @option attributes [String] :compartment_id The value to assign to the {OCI::Devops::Models::Connection#compartment_id #compartment_id} proprety
    # @option attributes [String] :project_id The value to assign to the {OCI::Devops::Models::Connection#project_id #project_id} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::Devops::Models::Connection#time_created #time_created} proprety
    # @option attributes [DateTime] :time_updated The value to assign to the {OCI::Devops::Models::Connection#time_updated #time_updated} proprety
    # @option attributes [OCI::Devops::Models::ConnectionValidationResult] :last_connection_validation_result The value to assign to the {OCI::Devops::Models::Connection#last_connection_validation_result #last_connection_validation_result} proprety
    # @option attributes [String] :lifecycle_details The value to assign to the {OCI::Devops::Models::Connection#lifecycle_details #lifecycle_details} proprety
    # @option attributes [String] :lifecycle_state The value to assign to the {OCI::Devops::Models::Connection#lifecycle_state #lifecycle_state} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::Devops::Models::Connection#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::Devops::Models::Connection#defined_tags #defined_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {OCI::Devops::Models::Connection#system_tags #system_tags} proprety
    # @option attributes [String] :access_token The value to assign to the {#access_token} property
    # @option attributes [String] :base_url The value to assign to the {#base_url} property
    # @option attributes [OCI::Devops::Models::TlsVerifyConfig] :tls_verify_config The value to assign to the {#tls_verify_config} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['connectionType'] = 'GITLAB_SERVER_ACCESS_TOKEN'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.access_token = attributes[:'accessToken'] if attributes[:'accessToken']

      raise 'You cannot provide both :accessToken and :access_token' if attributes.key?(:'accessToken') && attributes.key?(:'access_token')

      self.access_token = attributes[:'access_token'] if attributes[:'access_token']

      self.base_url = attributes[:'baseUrl'] if attributes[:'baseUrl']

      raise 'You cannot provide both :baseUrl and :base_url' if attributes.key?(:'baseUrl') && attributes.key?(:'base_url')

      self.base_url = attributes[:'base_url'] if attributes[:'base_url']

      self.tls_verify_config = attributes[:'tlsVerifyConfig'] if attributes[:'tlsVerifyConfig']

      raise 'You cannot provide both :tlsVerifyConfig and :tls_verify_config' if attributes.key?(:'tlsVerifyConfig') && attributes.key?(:'tls_verify_config')

      self.tls_verify_config = attributes[:'tls_verify_config'] if attributes[:'tls_verify_config']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        description == other.description &&
        display_name == other.display_name &&
        compartment_id == other.compartment_id &&
        project_id == other.project_id &&
        connection_type == other.connection_type &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        last_connection_validation_result == other.last_connection_validation_result &&
        lifecycle_details == other.lifecycle_details &&
        lifecycle_state == other.lifecycle_state &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags &&
        access_token == other.access_token &&
        base_url == other.base_url &&
        tls_verify_config == other.tls_verify_config
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, description, display_name, compartment_id, project_id, connection_type, time_created, time_updated, last_connection_validation_result, lifecycle_details, lifecycle_state, freeform_tags, defined_tags, system_tags, access_token, base_url, tls_verify_config].hash
    end
    # rubocop:enable Metrics/AbcSize, Layout/EmptyLines

    # rubocop:disable Metrics/AbcSize, Layout/EmptyLines


    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)

      self.class.swagger_types.each_pair do |key, type|
        if type =~ /^Array<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            public_method("#{key}=").call(
              attributes[self.class.attribute_map[key]]
                .map { |v| OCI::Internal::Util.convert_to_type(Regexp.last_match(1), v) }
            )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          public_method("#{key}=").call(
            OCI::Internal::Util.convert_to_type(type, attributes[self.class.attribute_map[key]])
          )
        end
        # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end
    # rubocop:enable Metrics/AbcSize, Layout/EmptyLines

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = public_method(attr).call
        next if value.nil? && !instance_variable_defined?("@#{attr}")

        hash[param] = _to_hash(value)
      end
      hash
    end

    private

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
