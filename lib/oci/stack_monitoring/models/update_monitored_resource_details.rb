# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210330
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information about updating a monitored resource.
  class StackMonitoring::Models::UpdateMonitoredResourceDetails
    # Monitored resource display name.
    # @return [String]
    attr_accessor :display_name

    # Host name of the monitored resource.
    #
    # @return [String]
    attr_accessor :host_name

    # Time zone in the form of tz database canonical zone ID. Specifies the preference with
    # a value that uses the IANA Time Zone Database format (x-obmcs-time-zone).
    # For example - America/Los_Angeles
    #
    # @return [String]
    attr_accessor :resource_time_zone

    # List of monitored resource properties.
    #
    # @return [Array<OCI::StackMonitoring::Models::MonitoredResourceProperty>]
    attr_accessor :properties

    # @return [OCI::StackMonitoring::Models::ConnectionDetails]
    attr_accessor :database_connection_details

    # @return [OCI::StackMonitoring::Models::MonitoredResourceCredential]
    attr_accessor :credentials

    # @return [OCI::StackMonitoring::Models::MonitoredResourceAliasCredential]
    attr_accessor :aliases

    # List of MonitoredResourceCredentials. This property complements the existing
    # \"credentials\" property by allowing user to specify more than one credential.
    # If both \"credential\" and \"additionalCredentials\" are specified, union of the
    # values is used as list of credentials applicable for this resource.
    # If any duplicate found in the combined list of \"credentials\" and \"additionalCredentials\",
    # an error will be thrown.
    #
    # @return [Array<OCI::StackMonitoring::Models::MonitoredResourceCredential>]
    attr_accessor :additional_credentials

    # List of MonitoredResourceAliasCredentials. This property complements the existing
    # \"aliases\" property by allowing user to specify more than one credential alias.
    # If both \"aliases\" and \"additionalAliases\" are specified, union of the
    # values is used as list of aliases applicable for this resource.
    # If any duplicate found in the combined list of \"alias\" and \"additionalAliases\",
    # an error will be thrown.
    #
    # @return [Array<OCI::StackMonitoring::Models::MonitoredResourceAliasCredential>]
    attr_accessor :additional_aliases

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'host_name': :'hostName',
        'resource_time_zone': :'resourceTimeZone',
        'properties': :'properties',
        'database_connection_details': :'databaseConnectionDetails',
        'credentials': :'credentials',
        'aliases': :'aliases',
        'additional_credentials': :'additionalCredentials',
        'additional_aliases': :'additionalAliases',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'host_name': :'String',
        'resource_time_zone': :'String',
        'properties': :'Array<OCI::StackMonitoring::Models::MonitoredResourceProperty>',
        'database_connection_details': :'OCI::StackMonitoring::Models::ConnectionDetails',
        'credentials': :'OCI::StackMonitoring::Models::MonitoredResourceCredential',
        'aliases': :'OCI::StackMonitoring::Models::MonitoredResourceAliasCredential',
        'additional_credentials': :'Array<OCI::StackMonitoring::Models::MonitoredResourceCredential>',
        'additional_aliases': :'Array<OCI::StackMonitoring::Models::MonitoredResourceAliasCredential>',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :host_name The value to assign to the {#host_name} property
    # @option attributes [String] :resource_time_zone The value to assign to the {#resource_time_zone} property
    # @option attributes [Array<OCI::StackMonitoring::Models::MonitoredResourceProperty>] :properties The value to assign to the {#properties} property
    # @option attributes [OCI::StackMonitoring::Models::ConnectionDetails] :database_connection_details The value to assign to the {#database_connection_details} property
    # @option attributes [OCI::StackMonitoring::Models::MonitoredResourceCredential] :credentials The value to assign to the {#credentials} property
    # @option attributes [OCI::StackMonitoring::Models::MonitoredResourceAliasCredential] :aliases The value to assign to the {#aliases} property
    # @option attributes [Array<OCI::StackMonitoring::Models::MonitoredResourceCredential>] :additional_credentials The value to assign to the {#additional_credentials} property
    # @option attributes [Array<OCI::StackMonitoring::Models::MonitoredResourceAliasCredential>] :additional_aliases The value to assign to the {#additional_aliases} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.host_name = attributes[:'hostName'] if attributes[:'hostName']

      raise 'You cannot provide both :hostName and :host_name' if attributes.key?(:'hostName') && attributes.key?(:'host_name')

      self.host_name = attributes[:'host_name'] if attributes[:'host_name']

      self.resource_time_zone = attributes[:'resourceTimeZone'] if attributes[:'resourceTimeZone']
      self.resource_time_zone = "Etc/UTC" if resource_time_zone.nil? && !attributes.key?(:'resourceTimeZone') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :resourceTimeZone and :resource_time_zone' if attributes.key?(:'resourceTimeZone') && attributes.key?(:'resource_time_zone')

      self.resource_time_zone = attributes[:'resource_time_zone'] if attributes[:'resource_time_zone']
      self.resource_time_zone = "Etc/UTC" if resource_time_zone.nil? && !attributes.key?(:'resourceTimeZone') && !attributes.key?(:'resource_time_zone') # rubocop:disable Style/StringLiterals

      self.properties = attributes[:'properties'] if attributes[:'properties']

      self.database_connection_details = attributes[:'databaseConnectionDetails'] if attributes[:'databaseConnectionDetails']

      raise 'You cannot provide both :databaseConnectionDetails and :database_connection_details' if attributes.key?(:'databaseConnectionDetails') && attributes.key?(:'database_connection_details')

      self.database_connection_details = attributes[:'database_connection_details'] if attributes[:'database_connection_details']

      self.credentials = attributes[:'credentials'] if attributes[:'credentials']

      self.aliases = attributes[:'aliases'] if attributes[:'aliases']

      self.additional_credentials = attributes[:'additionalCredentials'] if attributes[:'additionalCredentials']

      raise 'You cannot provide both :additionalCredentials and :additional_credentials' if attributes.key?(:'additionalCredentials') && attributes.key?(:'additional_credentials')

      self.additional_credentials = attributes[:'additional_credentials'] if attributes[:'additional_credentials']

      self.additional_aliases = attributes[:'additionalAliases'] if attributes[:'additionalAliases']

      raise 'You cannot provide both :additionalAliases and :additional_aliases' if attributes.key?(:'additionalAliases') && attributes.key?(:'additional_aliases')

      self.additional_aliases = attributes[:'additional_aliases'] if attributes[:'additional_aliases']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        host_name == other.host_name &&
        resource_time_zone == other.resource_time_zone &&
        properties == other.properties &&
        database_connection_details == other.database_connection_details &&
        credentials == other.credentials &&
        aliases == other.aliases &&
        additional_credentials == other.additional_credentials &&
        additional_aliases == other.additional_aliases &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
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
      [display_name, host_name, resource_time_zone, properties, database_connection_details, credentials, aliases, additional_credentials, additional_aliases, freeform_tags, defined_tags].hash
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
