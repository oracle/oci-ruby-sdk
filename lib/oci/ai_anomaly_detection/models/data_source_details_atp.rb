# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'data_source_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Data Source details for ATP
  class AiAnomalyDetection::Models::DataSourceDetailsATP < AiAnomalyDetection::Models::DataSourceDetails
    # wallet password Secret ID in String format
    # @return [String]
    attr_accessor :wallet_password_secret_id

    # atp db user name
    # @return [String]
    attr_accessor :atp_user_name

    # atp db password Secret Id
    # @return [String]
    attr_accessor :atp_password_secret_id

    # OCID of the secret containing the containers certificates of ATP wallet
    # @return [String]
    attr_accessor :cwallet_file_secret_id

    # OCID of the secret containing the PDB'S certificates of ATP wallet
    # @return [String]
    attr_accessor :ewallet_file_secret_id

    # OCID of the secret containing Keystore.jks file of the ATP wallet
    # @return [String]
    attr_accessor :key_store_file_secret_id

    # OCID of the secret that contains jdbc properties file of ATP wallet
    # @return [String]
    attr_accessor :ojdbc_file_secret_id

    # OCID of the secret that contains the tnsnames file of ATP wallet
    # @return [String]
    attr_accessor :tnsnames_file_secret_id

    # OCID of the secret containing truststore.jks file of the ATP wallet
    # @return [String]
    attr_accessor :truststore_file_secret_id

    # atp database name
    # @return [String]
    attr_accessor :database_name

    # atp database table name
    # @return [String]
    attr_accessor :table_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'data_source_type': :'dataSourceType',
        'wallet_password_secret_id': :'walletPasswordSecretId',
        'atp_user_name': :'atpUserName',
        'atp_password_secret_id': :'atpPasswordSecretId',
        'cwallet_file_secret_id': :'cwalletFileSecretId',
        'ewallet_file_secret_id': :'ewalletFileSecretId',
        'key_store_file_secret_id': :'keyStoreFileSecretId',
        'ojdbc_file_secret_id': :'ojdbcFileSecretId',
        'tnsnames_file_secret_id': :'tnsnamesFileSecretId',
        'truststore_file_secret_id': :'truststoreFileSecretId',
        'database_name': :'databaseName',
        'table_name': :'tableName'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'data_source_type': :'String',
        'wallet_password_secret_id': :'String',
        'atp_user_name': :'String',
        'atp_password_secret_id': :'String',
        'cwallet_file_secret_id': :'String',
        'ewallet_file_secret_id': :'String',
        'key_store_file_secret_id': :'String',
        'ojdbc_file_secret_id': :'String',
        'tnsnames_file_secret_id': :'String',
        'truststore_file_secret_id': :'String',
        'database_name': :'String',
        'table_name': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :wallet_password_secret_id The value to assign to the {#wallet_password_secret_id} property
    # @option attributes [String] :atp_user_name The value to assign to the {#atp_user_name} property
    # @option attributes [String] :atp_password_secret_id The value to assign to the {#atp_password_secret_id} property
    # @option attributes [String] :cwallet_file_secret_id The value to assign to the {#cwallet_file_secret_id} property
    # @option attributes [String] :ewallet_file_secret_id The value to assign to the {#ewallet_file_secret_id} property
    # @option attributes [String] :key_store_file_secret_id The value to assign to the {#key_store_file_secret_id} property
    # @option attributes [String] :ojdbc_file_secret_id The value to assign to the {#ojdbc_file_secret_id} property
    # @option attributes [String] :tnsnames_file_secret_id The value to assign to the {#tnsnames_file_secret_id} property
    # @option attributes [String] :truststore_file_secret_id The value to assign to the {#truststore_file_secret_id} property
    # @option attributes [String] :database_name The value to assign to the {#database_name} property
    # @option attributes [String] :table_name The value to assign to the {#table_name} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['dataSourceType'] = 'ORACLE_ATP'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.wallet_password_secret_id = attributes[:'walletPasswordSecretId'] if attributes[:'walletPasswordSecretId']

      raise 'You cannot provide both :walletPasswordSecretId and :wallet_password_secret_id' if attributes.key?(:'walletPasswordSecretId') && attributes.key?(:'wallet_password_secret_id')

      self.wallet_password_secret_id = attributes[:'wallet_password_secret_id'] if attributes[:'wallet_password_secret_id']

      self.atp_user_name = attributes[:'atpUserName'] if attributes[:'atpUserName']

      raise 'You cannot provide both :atpUserName and :atp_user_name' if attributes.key?(:'atpUserName') && attributes.key?(:'atp_user_name')

      self.atp_user_name = attributes[:'atp_user_name'] if attributes[:'atp_user_name']

      self.atp_password_secret_id = attributes[:'atpPasswordSecretId'] if attributes[:'atpPasswordSecretId']

      raise 'You cannot provide both :atpPasswordSecretId and :atp_password_secret_id' if attributes.key?(:'atpPasswordSecretId') && attributes.key?(:'atp_password_secret_id')

      self.atp_password_secret_id = attributes[:'atp_password_secret_id'] if attributes[:'atp_password_secret_id']

      self.cwallet_file_secret_id = attributes[:'cwalletFileSecretId'] if attributes[:'cwalletFileSecretId']

      raise 'You cannot provide both :cwalletFileSecretId and :cwallet_file_secret_id' if attributes.key?(:'cwalletFileSecretId') && attributes.key?(:'cwallet_file_secret_id')

      self.cwallet_file_secret_id = attributes[:'cwallet_file_secret_id'] if attributes[:'cwallet_file_secret_id']

      self.ewallet_file_secret_id = attributes[:'ewalletFileSecretId'] if attributes[:'ewalletFileSecretId']

      raise 'You cannot provide both :ewalletFileSecretId and :ewallet_file_secret_id' if attributes.key?(:'ewalletFileSecretId') && attributes.key?(:'ewallet_file_secret_id')

      self.ewallet_file_secret_id = attributes[:'ewallet_file_secret_id'] if attributes[:'ewallet_file_secret_id']

      self.key_store_file_secret_id = attributes[:'keyStoreFileSecretId'] if attributes[:'keyStoreFileSecretId']

      raise 'You cannot provide both :keyStoreFileSecretId and :key_store_file_secret_id' if attributes.key?(:'keyStoreFileSecretId') && attributes.key?(:'key_store_file_secret_id')

      self.key_store_file_secret_id = attributes[:'key_store_file_secret_id'] if attributes[:'key_store_file_secret_id']

      self.ojdbc_file_secret_id = attributes[:'ojdbcFileSecretId'] if attributes[:'ojdbcFileSecretId']

      raise 'You cannot provide both :ojdbcFileSecretId and :ojdbc_file_secret_id' if attributes.key?(:'ojdbcFileSecretId') && attributes.key?(:'ojdbc_file_secret_id')

      self.ojdbc_file_secret_id = attributes[:'ojdbc_file_secret_id'] if attributes[:'ojdbc_file_secret_id']

      self.tnsnames_file_secret_id = attributes[:'tnsnamesFileSecretId'] if attributes[:'tnsnamesFileSecretId']

      raise 'You cannot provide both :tnsnamesFileSecretId and :tnsnames_file_secret_id' if attributes.key?(:'tnsnamesFileSecretId') && attributes.key?(:'tnsnames_file_secret_id')

      self.tnsnames_file_secret_id = attributes[:'tnsnames_file_secret_id'] if attributes[:'tnsnames_file_secret_id']

      self.truststore_file_secret_id = attributes[:'truststoreFileSecretId'] if attributes[:'truststoreFileSecretId']

      raise 'You cannot provide both :truststoreFileSecretId and :truststore_file_secret_id' if attributes.key?(:'truststoreFileSecretId') && attributes.key?(:'truststore_file_secret_id')

      self.truststore_file_secret_id = attributes[:'truststore_file_secret_id'] if attributes[:'truststore_file_secret_id']

      self.database_name = attributes[:'databaseName'] if attributes[:'databaseName']

      raise 'You cannot provide both :databaseName and :database_name' if attributes.key?(:'databaseName') && attributes.key?(:'database_name')

      self.database_name = attributes[:'database_name'] if attributes[:'database_name']

      self.table_name = attributes[:'tableName'] if attributes[:'tableName']

      raise 'You cannot provide both :tableName and :table_name' if attributes.key?(:'tableName') && attributes.key?(:'table_name')

      self.table_name = attributes[:'table_name'] if attributes[:'table_name']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        data_source_type == other.data_source_type &&
        wallet_password_secret_id == other.wallet_password_secret_id &&
        atp_user_name == other.atp_user_name &&
        atp_password_secret_id == other.atp_password_secret_id &&
        cwallet_file_secret_id == other.cwallet_file_secret_id &&
        ewallet_file_secret_id == other.ewallet_file_secret_id &&
        key_store_file_secret_id == other.key_store_file_secret_id &&
        ojdbc_file_secret_id == other.ojdbc_file_secret_id &&
        tnsnames_file_secret_id == other.tnsnames_file_secret_id &&
        truststore_file_secret_id == other.truststore_file_secret_id &&
        database_name == other.database_name &&
        table_name == other.table_name
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
      [data_source_type, wallet_password_secret_id, atp_user_name, atp_password_secret_id, cwallet_file_secret_id, ewallet_file_secret_id, key_store_file_secret_id, ojdbc_file_secret_id, tnsnames_file_secret_id, truststore_file_secret_id, database_name, table_name].hash
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
