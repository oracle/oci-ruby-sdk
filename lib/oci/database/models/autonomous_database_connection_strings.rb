# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Connection strings to connect to an Oracle Autonomous Database.
  #
  # Example output for connection strings. See {#database_connection_string_profile database_connection_string_profile} for additional details:
  #
  #     \t\"connectionStrings\": {
  #         \"allConnectionStrings\": {
  #           \"HIGH\": \"adb.region.oraclecloud.com:1522/unique_id_databasename_high.adwc.oraclecloud.com\",
  #           \"LOW\": \"adb.region.oraclecloud.com:1522/unique_id_databasename_low.adwc.oraclecloud.com\",
  #           \"MEDIUM\": \"adb.region.oraclecloud.com:1522/unique_id_databasename_medium.adwc.oraclecloud.com\"
  #         },
  #         \"profiles\": [
  #           {
  #             \"displayName\": \"databasename_high\",
  #             \"value\": \"(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1522)(host=adb.region.oraclecloud.com))(connect_data=(service_name=unique_id_databasename_high.adwc.oraclecloud.com))(security=(ssl_server_cert_dn=\"CN=adwc.uscom-east-1.oraclecloud.com,OU=Oracle BMCS US,O=Oracle Corporation,L=Redwood City,ST=California,C=US\")))\",
  #             \"consumerGroup\": \"HIGH\",
  #             \"protocol\": \"TCPS\",
  #             \"tlsAuthentication\": \"MUTUAL\",
  #             \"hostFormat\": \"FQDN\",
  #             \"sessionMode\": \"DIRECT\",
  #             \"syntaxFormat\": \"LONG\"
  #           },
  #           {
  #             \"displayName\": \"databasename_low\",
  #             \"value\": \"(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1522)(host=adb.region.oraclecloud.com))(connect_data=(service_name=unique_id_databasename_low.adwc.oraclecloud.com))(security=(ssl_server_cert_dn=\"CN=adwc.uscom-east-1.oraclecloud.com,OU=Oracle BMCS US,O=Oracle Corporation,L=Redwood City,ST=California,C=US\")))\",
  #             \"consumerGroup\": \"LOW\",
  #             \"protocol\": \"TCPS\",
  #             \"tlsAuthentication\": \"MUTUAL\",
  #             \"hostFormat\": \"FQDN\",
  #             \"sessionMode\": \"DIRECT\",
  #             \"syntaxFormat\": \"LONG\"
  #           },
  #           {
  #             \"displayName\": \"databasename_medium\",
  #             \"value\": \"(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1522)(host=adb.region.oraclecloud.com))(connect_data=(service_name=unique_id_databasename_medium.adwc.oraclecloud.com))(security=(ssl_server_cert_dn=\"CN=adwc.uscom-east-1.oraclecloud.com,OU=Oracle BMCS US,O=Oracle Corporation,L=Redwood City,ST=California,C=US\")))\",
  #             \"consumerGroup\": \"MEDIUM\",
  #             \"protocol\": \"TCPS\",
  #             \"tlsAuthentication\": \"MUTUAL\",
  #             \"hostFormat\": \"FQDN\",
  #             \"sessionMode\": \"DIRECT\",
  #             \"syntaxFormat\": \"LONG\"
  #           }
  #         ],
  #         \"dedicated\": null,
  #         \"high\": \"adb.region.oraclecloud.com:1522/unique_id_databasename_high.adwc.oraclecloud.com\",
  #         \"low\": \"adb.region.oraclecloud.com:1522/unique_id_databasename_low.adwc.oraclecloud.com\",
  #         \"medium\": \"adb.region.oraclecloud.com:1522/unique_id_databasename_medium.adwc.oraclecloud.com\"
  #       }
  #
  class Database::Models::AutonomousDatabaseConnectionStrings
    # The High database service provides the highest level of resources to each SQL statement resulting in the highest performance, but supports the fewest number of concurrent SQL statements.
    # @return [String]
    attr_accessor :high

    # The Medium database service provides a lower level of resources to each SQL statement potentially resulting a lower level of performance, but supports more concurrent SQL statements.
    # @return [String]
    attr_accessor :medium

    # The Low database service provides the least level of resources to each SQL statement, but supports the most number of concurrent SQL statements.
    # @return [String]
    attr_accessor :low

    # The database service provides the least level of resources to each SQL statement, but supports the most number of concurrent SQL statements.
    # @return [String]
    attr_accessor :dedicated

    # Returns all connection strings that can be used to connect to the Autonomous Database.
    # For more information, please see [Predefined Database Service Names for Autonomous Transaction Processing](https://docs.oracle.com/en/cloud/paas/atp-cloud/atpug/connect-predefined.html#GUID-9747539B-FD46-44F1-8FF8-F5AC650F15BE)
    #
    # @return [Hash<String, String>]
    attr_accessor :all_connection_strings

    # A list of connection string profiles to allow clients to group, filter and select connection string values based on structured metadata.
    #
    # @return [Array<OCI::Database::Models::DatabaseConnectionStringProfile>]
    attr_accessor :profiles

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'high': :'high',
        'medium': :'medium',
        'low': :'low',
        'dedicated': :'dedicated',
        'all_connection_strings': :'allConnectionStrings',
        'profiles': :'profiles'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'high': :'String',
        'medium': :'String',
        'low': :'String',
        'dedicated': :'String',
        'all_connection_strings': :'Hash<String, String>',
        'profiles': :'Array<OCI::Database::Models::DatabaseConnectionStringProfile>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :high The value to assign to the {#high} property
    # @option attributes [String] :medium The value to assign to the {#medium} property
    # @option attributes [String] :low The value to assign to the {#low} property
    # @option attributes [String] :dedicated The value to assign to the {#dedicated} property
    # @option attributes [Hash<String, String>] :all_connection_strings The value to assign to the {#all_connection_strings} property
    # @option attributes [Array<OCI::Database::Models::DatabaseConnectionStringProfile>] :profiles The value to assign to the {#profiles} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.high = attributes[:'high'] if attributes[:'high']

      self.medium = attributes[:'medium'] if attributes[:'medium']

      self.low = attributes[:'low'] if attributes[:'low']

      self.dedicated = attributes[:'dedicated'] if attributes[:'dedicated']

      self.all_connection_strings = attributes[:'allConnectionStrings'] if attributes[:'allConnectionStrings']

      raise 'You cannot provide both :allConnectionStrings and :all_connection_strings' if attributes.key?(:'allConnectionStrings') && attributes.key?(:'all_connection_strings')

      self.all_connection_strings = attributes[:'all_connection_strings'] if attributes[:'all_connection_strings']

      self.profiles = attributes[:'profiles'] if attributes[:'profiles']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        high == other.high &&
        medium == other.medium &&
        low == other.low &&
        dedicated == other.dedicated &&
        all_connection_strings == other.all_connection_strings &&
        profiles == other.profiles
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
      [high, medium, low, dedicated, all_connection_strings, profiles].hash
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
