# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details to create a new masking policy. Use either a sensitive data model or a reference
  # target database to create your masking policy.
  #
  # To use a sensitive data model as the source of masking columns, set the columnSource
  # attribute to SENSITIVE_DATA_MODEL and provide the sensitiveDataModelId attribute. After
  # creating a masking policy, you can use the AddMaskingColumnsFromSdm operation to automatically
  # add all the columns from the associated sensitive data model. In this case, the target
  # database associated with the sensitive data model is used for column and masking format validations.
  #
  # You can also create a masking policy without using a sensitive data model. In this case,
  # you need to associate your masking policy with a target database by setting the columnSource
  # attribute to TARGET and providing the targetId attribute. The specified target database is
  # used for column and masking format validations.
  #
  # After creating a masking policy, you can use the CreateMaskingColumn or PatchMaskingColumns
  # operation to manually add columns to the policy. You need to add the parent columns only,
  # and it automatically adds the child columns (in referential relationship with the parent
  # columns) from the associated sensitive data model or target database.
  #
  class DataSafe::Models::CreateMaskingPolicyDetails
    # The display name of the masking policy. The name does not have to be unique, and it's changeable.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The OCID of the compartment where the masking policy should be created.
    # @return [String]
    attr_accessor :compartment_id

    # The description of the masking policy.
    # @return [String]
    attr_accessor :description

    # Indicates if the temporary tables created during a masking operation should be dropped after masking. It's enabled by default.
    # Set this attribute to false to preserve the temporary tables. Masking creates temporary tables that map the original sensitive
    # data values to mask values. By default, these temporary tables are dropped after masking. But, in some cases, you may want
    # to preserve this information to track how masking changed your data. Note that doing so compromises security. These tables
    # must be dropped before the database is available for unprivileged users.
    #
    # @return [BOOLEAN]
    attr_accessor :is_drop_temp_tables_enabled

    # Indicates if redo logging is enabled during a masking operation. It's disabled by default. Set this attribute to true to
    # enable redo logging. By default, masking disables redo logging and flashback logging to purge any original unmasked
    # data from logs. However, in certain circumstances when you only want to test masking, rollback changes, and retry masking,
    # you could enable logging and use a flashback database to retrieve the original unmasked data after it has been masked.
    #
    # @return [BOOLEAN]
    attr_accessor :is_redo_logging_enabled

    # Indicates if statistics gathering is enabled. It's enabled by default. Set this attribute to false to disable statistics
    # gathering. The masking process gathers statistics on masked database tables after masking completes.
    #
    # @return [BOOLEAN]
    attr_accessor :is_refresh_stats_enabled

    # Specifies options to enable parallel execution when running data masking. Allowed values are 'NONE' (no parallelism),
    # 'DEFAULT' (the Oracle Database computes the optimum degree of parallelism) or an integer value to be used as the degree
    # of parallelism. Parallel execution helps effectively use multiple CPUsi and improve masking performance. Refer to the
    # Oracle Database parallel execution framework when choosing an explicit degree of parallelism.
    #
    # @return [String]
    attr_accessor :parallel_degree

    # Specifies how to recompile invalid objects post data masking. Allowed values are 'SERIAL' (recompile in serial),
    # 'PARALLEL' (recompile in parallel), 'NONE' (do not recompile). If it's set to PARALLEL, the value of parallelDegree
    # attribute is used.
    #
    # @return [String]
    attr_accessor :recompile

    # A pre-masking script, which can contain SQL and PL/SQL statements. It's executed before
    # the core masking script generated using the masking policy. It's usually used to perform
    # any preparation or prerequisite work before masking data.
    #
    # @return [String]
    attr_accessor :pre_masking_script

    # A post-masking script, which can contain SQL and PL/SQL statements. It's executed after
    # the core masking script generated using the masking policy. It's usually used to perform
    # additional transformation or cleanup work after masking.
    #
    # @return [String]
    attr_accessor :post_masking_script

    # This attribute is required.
    # @return [OCI::DataSafe::Models::CreateColumnSourceDetails]
    attr_accessor :column_source

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm)
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm)
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'compartment_id': :'compartmentId',
        'description': :'description',
        'is_drop_temp_tables_enabled': :'isDropTempTablesEnabled',
        'is_redo_logging_enabled': :'isRedoLoggingEnabled',
        'is_refresh_stats_enabled': :'isRefreshStatsEnabled',
        'parallel_degree': :'parallelDegree',
        'recompile': :'recompile',
        'pre_masking_script': :'preMaskingScript',
        'post_masking_script': :'postMaskingScript',
        'column_source': :'columnSource',
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
        'compartment_id': :'String',
        'description': :'String',
        'is_drop_temp_tables_enabled': :'BOOLEAN',
        'is_redo_logging_enabled': :'BOOLEAN',
        'is_refresh_stats_enabled': :'BOOLEAN',
        'parallel_degree': :'String',
        'recompile': :'String',
        'pre_masking_script': :'String',
        'post_masking_script': :'String',
        'column_source': :'OCI::DataSafe::Models::CreateColumnSourceDetails',
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
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [BOOLEAN] :is_drop_temp_tables_enabled The value to assign to the {#is_drop_temp_tables_enabled} property
    # @option attributes [BOOLEAN] :is_redo_logging_enabled The value to assign to the {#is_redo_logging_enabled} property
    # @option attributes [BOOLEAN] :is_refresh_stats_enabled The value to assign to the {#is_refresh_stats_enabled} property
    # @option attributes [String] :parallel_degree The value to assign to the {#parallel_degree} property
    # @option attributes [String] :recompile The value to assign to the {#recompile} property
    # @option attributes [String] :pre_masking_script The value to assign to the {#pre_masking_script} property
    # @option attributes [String] :post_masking_script The value to assign to the {#post_masking_script} property
    # @option attributes [OCI::DataSafe::Models::CreateColumnSourceDetails] :column_source The value to assign to the {#column_source} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.description = attributes[:'description'] if attributes[:'description']

      self.is_drop_temp_tables_enabled = attributes[:'isDropTempTablesEnabled'] unless attributes[:'isDropTempTablesEnabled'].nil?
      self.is_drop_temp_tables_enabled = true if is_drop_temp_tables_enabled.nil? && !attributes.key?(:'isDropTempTablesEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isDropTempTablesEnabled and :is_drop_temp_tables_enabled' if attributes.key?(:'isDropTempTablesEnabled') && attributes.key?(:'is_drop_temp_tables_enabled')

      self.is_drop_temp_tables_enabled = attributes[:'is_drop_temp_tables_enabled'] unless attributes[:'is_drop_temp_tables_enabled'].nil?
      self.is_drop_temp_tables_enabled = true if is_drop_temp_tables_enabled.nil? && !attributes.key?(:'isDropTempTablesEnabled') && !attributes.key?(:'is_drop_temp_tables_enabled') # rubocop:disable Style/StringLiterals

      self.is_redo_logging_enabled = attributes[:'isRedoLoggingEnabled'] unless attributes[:'isRedoLoggingEnabled'].nil?
      self.is_redo_logging_enabled = false if is_redo_logging_enabled.nil? && !attributes.key?(:'isRedoLoggingEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isRedoLoggingEnabled and :is_redo_logging_enabled' if attributes.key?(:'isRedoLoggingEnabled') && attributes.key?(:'is_redo_logging_enabled')

      self.is_redo_logging_enabled = attributes[:'is_redo_logging_enabled'] unless attributes[:'is_redo_logging_enabled'].nil?
      self.is_redo_logging_enabled = false if is_redo_logging_enabled.nil? && !attributes.key?(:'isRedoLoggingEnabled') && !attributes.key?(:'is_redo_logging_enabled') # rubocop:disable Style/StringLiterals

      self.is_refresh_stats_enabled = attributes[:'isRefreshStatsEnabled'] unless attributes[:'isRefreshStatsEnabled'].nil?
      self.is_refresh_stats_enabled = true if is_refresh_stats_enabled.nil? && !attributes.key?(:'isRefreshStatsEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isRefreshStatsEnabled and :is_refresh_stats_enabled' if attributes.key?(:'isRefreshStatsEnabled') && attributes.key?(:'is_refresh_stats_enabled')

      self.is_refresh_stats_enabled = attributes[:'is_refresh_stats_enabled'] unless attributes[:'is_refresh_stats_enabled'].nil?
      self.is_refresh_stats_enabled = true if is_refresh_stats_enabled.nil? && !attributes.key?(:'isRefreshStatsEnabled') && !attributes.key?(:'is_refresh_stats_enabled') # rubocop:disable Style/StringLiterals

      self.parallel_degree = attributes[:'parallelDegree'] if attributes[:'parallelDegree']
      self.parallel_degree = "DEFAULT" if parallel_degree.nil? && !attributes.key?(:'parallelDegree') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :parallelDegree and :parallel_degree' if attributes.key?(:'parallelDegree') && attributes.key?(:'parallel_degree')

      self.parallel_degree = attributes[:'parallel_degree'] if attributes[:'parallel_degree']
      self.parallel_degree = "DEFAULT" if parallel_degree.nil? && !attributes.key?(:'parallelDegree') && !attributes.key?(:'parallel_degree') # rubocop:disable Style/StringLiterals

      self.recompile = attributes[:'recompile'] if attributes[:'recompile']
      self.recompile = "NONE" if recompile.nil? && !attributes.key?(:'recompile') # rubocop:disable Style/StringLiterals

      self.pre_masking_script = attributes[:'preMaskingScript'] if attributes[:'preMaskingScript']

      raise 'You cannot provide both :preMaskingScript and :pre_masking_script' if attributes.key?(:'preMaskingScript') && attributes.key?(:'pre_masking_script')

      self.pre_masking_script = attributes[:'pre_masking_script'] if attributes[:'pre_masking_script']

      self.post_masking_script = attributes[:'postMaskingScript'] if attributes[:'postMaskingScript']

      raise 'You cannot provide both :postMaskingScript and :post_masking_script' if attributes.key?(:'postMaskingScript') && attributes.key?(:'post_masking_script')

      self.post_masking_script = attributes[:'post_masking_script'] if attributes[:'post_masking_script']

      self.column_source = attributes[:'columnSource'] if attributes[:'columnSource']

      raise 'You cannot provide both :columnSource and :column_source' if attributes.key?(:'columnSource') && attributes.key?(:'column_source')

      self.column_source = attributes[:'column_source'] if attributes[:'column_source']

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
        compartment_id == other.compartment_id &&
        description == other.description &&
        is_drop_temp_tables_enabled == other.is_drop_temp_tables_enabled &&
        is_redo_logging_enabled == other.is_redo_logging_enabled &&
        is_refresh_stats_enabled == other.is_refresh_stats_enabled &&
        parallel_degree == other.parallel_degree &&
        recompile == other.recompile &&
        pre_masking_script == other.pre_masking_script &&
        post_masking_script == other.post_masking_script &&
        column_source == other.column_source &&
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
      [display_name, compartment_id, description, is_drop_temp_tables_enabled, is_redo_logging_enabled, is_refresh_stats_enabled, parallel_degree, recompile, pre_masking_script, post_masking_script, column_source, freeform_tags, defined_tags].hash
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