# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20201101
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details required to fetch the Sql tuning set details.
  #
  class DatabaseManagement::Models::FetchSqlTuningSetDetails
    RECURSIVE_SQL_ENUM = [
      RECURSIVE_SQL_HAS_RECURSIVE_SQL = 'HAS_RECURSIVE_SQL'.freeze,
      RECURSIVE_SQL_NO_RECURSIVE_SQL = 'NO_RECURSIVE_SQL'.freeze
    ].freeze

    RANKING_MEASURE1_ENUM = [
      RANKING_MEASURE1_ELAPSED_TIME = 'ELAPSED_TIME'.freeze,
      RANKING_MEASURE1_CPU_TIME = 'CPU_TIME'.freeze,
      RANKING_MEASURE1_OPTIMIZER_COST = 'OPTIMIZER_COST'.freeze,
      RANKING_MEASURE1_BUFFER_GETS = 'BUFFER_GETS'.freeze,
      RANKING_MEASURE1_DISK_READS = 'DISK_READS'.freeze,
      RANKING_MEASURE1_DIRECT_WRITES = 'DIRECT_WRITES'.freeze
    ].freeze

    RANKING_MEASURE2_ENUM = [
      RANKING_MEASURE2_ELAPSED_TIME = 'ELAPSED_TIME'.freeze,
      RANKING_MEASURE2_CPU_TIME = 'CPU_TIME'.freeze,
      RANKING_MEASURE2_OPTIMIZER_COST = 'OPTIMIZER_COST'.freeze,
      RANKING_MEASURE2_BUFFER_GETS = 'BUFFER_GETS'.freeze,
      RANKING_MEASURE2_DISK_READS = 'DISK_READS'.freeze,
      RANKING_MEASURE2_DIRECT_WRITES = 'DIRECT_WRITES'.freeze
    ].freeze

    RANKING_MEASURE3_ENUM = [
      RANKING_MEASURE3_ELAPSED_TIME = 'ELAPSED_TIME'.freeze,
      RANKING_MEASURE3_CPU_TIME = 'CPU_TIME'.freeze,
      RANKING_MEASURE3_OPTIMIZER_COST = 'OPTIMIZER_COST'.freeze,
      RANKING_MEASURE3_BUFFER_GETS = 'BUFFER_GETS'.freeze,
      RANKING_MEASURE3_DISK_READS = 'DISK_READS'.freeze,
      RANKING_MEASURE3_DIRECT_WRITES = 'DIRECT_WRITES'.freeze
    ].freeze

    # This attribute is required.
    # @return [OCI::DatabaseManagement::Models::SqlTuningSetAdminCredentialDetails]
    attr_accessor :credential_details

    # **[Required]** The owner of the Sql tuning set.
    # @return [String]
    attr_accessor :owner

    # **[Required]** The name of the Sql tuning set.
    # @return [String]
    attr_accessor :name

    # Specifies the Sql predicate to filter the Sql from the Sql tuning set defined on attributes of the SQLSET_ROW.
    # User could use any combination of the following columns with appropriate values as Sql predicate
    # Refer to the documentation https://docs.oracle.com/en/database/oracle/oracle-database/18/arpls/DBMS_SQLTUNE.html#GUID-1F4AFB03-7B29-46FC-B3F2-CB01EC36326C
    #
    # @return [String]
    attr_accessor :basic_filter

    # Specifies that the filter must include recursive Sql in the Sql tuning set.
    # @return [String]
    attr_reader :recursive_sql

    # Specifies a filter that picks the top n% according to the supplied ranking measure.
    # Note that this parameter applies only if one ranking measure is supplied.
    #
    # @return [Float]
    attr_accessor :result_percentage

    # The top limit Sql from the filtered source, ranked by the ranking measure.
    # @return [Integer]
    attr_accessor :result_limit

    # Specifies an ORDER BY clause on the selected Sql. User can specify upto three ranking measures.
    #
    # @return [String]
    attr_reader :ranking_measure1

    # Specifies an ORDER BY clause on the selected Sql. User can specify upto three ranking measures.
    #
    # @return [String]
    attr_reader :ranking_measure2

    # Specifies an ORDER BY clause on the selected Sql. User can specify upto three ranking measures.
    #
    # @return [String]
    attr_reader :ranking_measure3

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'credential_details': :'credentialDetails',
        'owner': :'owner',
        'name': :'name',
        'basic_filter': :'basicFilter',
        'recursive_sql': :'recursiveSql',
        'result_percentage': :'resultPercentage',
        'result_limit': :'resultLimit',
        'ranking_measure1': :'rankingMeasure1',
        'ranking_measure2': :'rankingMeasure2',
        'ranking_measure3': :'rankingMeasure3'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'credential_details': :'OCI::DatabaseManagement::Models::SqlTuningSetAdminCredentialDetails',
        'owner': :'String',
        'name': :'String',
        'basic_filter': :'String',
        'recursive_sql': :'String',
        'result_percentage': :'Float',
        'result_limit': :'Integer',
        'ranking_measure1': :'String',
        'ranking_measure2': :'String',
        'ranking_measure3': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::DatabaseManagement::Models::SqlTuningSetAdminCredentialDetails] :credential_details The value to assign to the {#credential_details} property
    # @option attributes [String] :owner The value to assign to the {#owner} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :basic_filter The value to assign to the {#basic_filter} property
    # @option attributes [String] :recursive_sql The value to assign to the {#recursive_sql} property
    # @option attributes [Float] :result_percentage The value to assign to the {#result_percentage} property
    # @option attributes [Integer] :result_limit The value to assign to the {#result_limit} property
    # @option attributes [String] :ranking_measure1 The value to assign to the {#ranking_measure1} property
    # @option attributes [String] :ranking_measure2 The value to assign to the {#ranking_measure2} property
    # @option attributes [String] :ranking_measure3 The value to assign to the {#ranking_measure3} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.credential_details = attributes[:'credentialDetails'] if attributes[:'credentialDetails']

      raise 'You cannot provide both :credentialDetails and :credential_details' if attributes.key?(:'credentialDetails') && attributes.key?(:'credential_details')

      self.credential_details = attributes[:'credential_details'] if attributes[:'credential_details']

      self.owner = attributes[:'owner'] if attributes[:'owner']

      self.name = attributes[:'name'] if attributes[:'name']

      self.basic_filter = attributes[:'basicFilter'] if attributes[:'basicFilter']
      self.basic_filter = "null" if basic_filter.nil? && !attributes.key?(:'basicFilter') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :basicFilter and :basic_filter' if attributes.key?(:'basicFilter') && attributes.key?(:'basic_filter')

      self.basic_filter = attributes[:'basic_filter'] if attributes[:'basic_filter']
      self.basic_filter = "null" if basic_filter.nil? && !attributes.key?(:'basicFilter') && !attributes.key?(:'basic_filter') # rubocop:disable Style/StringLiterals

      self.recursive_sql = attributes[:'recursiveSql'] if attributes[:'recursiveSql']
      self.recursive_sql = "HAS_RECURSIVE_SQL" if recursive_sql.nil? && !attributes.key?(:'recursiveSql') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :recursiveSql and :recursive_sql' if attributes.key?(:'recursiveSql') && attributes.key?(:'recursive_sql')

      self.recursive_sql = attributes[:'recursive_sql'] if attributes[:'recursive_sql']
      self.recursive_sql = "HAS_RECURSIVE_SQL" if recursive_sql.nil? && !attributes.key?(:'recursiveSql') && !attributes.key?(:'recursive_sql') # rubocop:disable Style/StringLiterals

      self.result_percentage = attributes[:'resultPercentage'] if attributes[:'resultPercentage']
      self.result_percentage = 1.0 if result_percentage.nil? && !attributes.key?(:'resultPercentage') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :resultPercentage and :result_percentage' if attributes.key?(:'resultPercentage') && attributes.key?(:'result_percentage')

      self.result_percentage = attributes[:'result_percentage'] if attributes[:'result_percentage']
      self.result_percentage = 1.0 if result_percentage.nil? && !attributes.key?(:'resultPercentage') && !attributes.key?(:'result_percentage') # rubocop:disable Style/StringLiterals

      self.result_limit = attributes[:'resultLimit'] if attributes[:'resultLimit']

      raise 'You cannot provide both :resultLimit and :result_limit' if attributes.key?(:'resultLimit') && attributes.key?(:'result_limit')

      self.result_limit = attributes[:'result_limit'] if attributes[:'result_limit']

      self.ranking_measure1 = attributes[:'rankingMeasure1'] if attributes[:'rankingMeasure1']
      self.ranking_measure1 = "null" if ranking_measure1.nil? && !attributes.key?(:'rankingMeasure1') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :rankingMeasure1 and :ranking_measure1' if attributes.key?(:'rankingMeasure1') && attributes.key?(:'ranking_measure1')

      self.ranking_measure1 = attributes[:'ranking_measure1'] if attributes[:'ranking_measure1']
      self.ranking_measure1 = "null" if ranking_measure1.nil? && !attributes.key?(:'rankingMeasure1') && !attributes.key?(:'ranking_measure1') # rubocop:disable Style/StringLiterals

      self.ranking_measure2 = attributes[:'rankingMeasure2'] if attributes[:'rankingMeasure2']
      self.ranking_measure2 = "null" if ranking_measure2.nil? && !attributes.key?(:'rankingMeasure2') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :rankingMeasure2 and :ranking_measure2' if attributes.key?(:'rankingMeasure2') && attributes.key?(:'ranking_measure2')

      self.ranking_measure2 = attributes[:'ranking_measure2'] if attributes[:'ranking_measure2']
      self.ranking_measure2 = "null" if ranking_measure2.nil? && !attributes.key?(:'rankingMeasure2') && !attributes.key?(:'ranking_measure2') # rubocop:disable Style/StringLiterals

      self.ranking_measure3 = attributes[:'rankingMeasure3'] if attributes[:'rankingMeasure3']
      self.ranking_measure3 = "null" if ranking_measure3.nil? && !attributes.key?(:'rankingMeasure3') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :rankingMeasure3 and :ranking_measure3' if attributes.key?(:'rankingMeasure3') && attributes.key?(:'ranking_measure3')

      self.ranking_measure3 = attributes[:'ranking_measure3'] if attributes[:'ranking_measure3']
      self.ranking_measure3 = "null" if ranking_measure3.nil? && !attributes.key?(:'rankingMeasure3') && !attributes.key?(:'ranking_measure3') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] recursive_sql Object to be assigned
    def recursive_sql=(recursive_sql)
      raise "Invalid value for 'recursive_sql': this must be one of the values in RECURSIVE_SQL_ENUM." if recursive_sql && !RECURSIVE_SQL_ENUM.include?(recursive_sql)

      @recursive_sql = recursive_sql
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] ranking_measure1 Object to be assigned
    def ranking_measure1=(ranking_measure1)
      raise "Invalid value for 'ranking_measure1': this must be one of the values in RANKING_MEASURE1_ENUM." if ranking_measure1 && !RANKING_MEASURE1_ENUM.include?(ranking_measure1)

      @ranking_measure1 = ranking_measure1
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] ranking_measure2 Object to be assigned
    def ranking_measure2=(ranking_measure2)
      raise "Invalid value for 'ranking_measure2': this must be one of the values in RANKING_MEASURE2_ENUM." if ranking_measure2 && !RANKING_MEASURE2_ENUM.include?(ranking_measure2)

      @ranking_measure2 = ranking_measure2
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] ranking_measure3 Object to be assigned
    def ranking_measure3=(ranking_measure3)
      raise "Invalid value for 'ranking_measure3': this must be one of the values in RANKING_MEASURE3_ENUM." if ranking_measure3 && !RANKING_MEASURE3_ENUM.include?(ranking_measure3)

      @ranking_measure3 = ranking_measure3
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        credential_details == other.credential_details &&
        owner == other.owner &&
        name == other.name &&
        basic_filter == other.basic_filter &&
        recursive_sql == other.recursive_sql &&
        result_percentage == other.result_percentage &&
        result_limit == other.result_limit &&
        ranking_measure1 == other.ranking_measure1 &&
        ranking_measure2 == other.ranking_measure2 &&
        ranking_measure3 == other.ranking_measure3
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
      [credential_details, owner, name, basic_filter, recursive_sql, result_percentage, result_limit, ranking_measure1, ranking_measure2, ranking_measure3].hash
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
