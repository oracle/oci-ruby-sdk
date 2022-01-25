# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A summary of the database parameter.
  class DatabaseManagement::Models::DatabaseParameterSummary
    TYPE_ENUM = [
      TYPE_BOOLEAN = 'BOOLEAN'.freeze,
      TYPE_STRING = 'STRING'.freeze,
      TYPE_INTEGER = 'INTEGER'.freeze,
      TYPE_FILENAME = 'FILENAME'.freeze,
      TYPE_BIG_INTEGER = 'BIG_INTEGER'.freeze,
      TYPE_RESERVED = 'RESERVED'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    IS_SYSTEM_MODIFIABLE_ENUM = [
      IS_SYSTEM_MODIFIABLE_IMMEDIATE = 'IMMEDIATE'.freeze,
      IS_SYSTEM_MODIFIABLE_DEFERRED = 'DEFERRED'.freeze,
      IS_SYSTEM_MODIFIABLE_FALSE = 'FALSE'.freeze,
      IS_SYSTEM_MODIFIABLE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    IS_MODIFIED_ENUM = [
      IS_MODIFIED_MODIFIED = 'MODIFIED'.freeze,
      IS_MODIFIED_FALSE = 'FALSE'.freeze,
      IS_MODIFIED_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    CONSTRAINT_ENUM = [
      CONSTRAINT_UNIQUE = 'UNIQUE'.freeze,
      CONSTRAINT_IDENTICAL = 'IDENTICAL'.freeze,
      CONSTRAINT_NONE = 'NONE'.freeze,
      CONSTRAINT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The parameter name.
    # @return [String]
    attr_accessor :name

    # **[Required]** The parameter type.
    # @return [String]
    attr_reader :type

    # **[Required]** The parameter value.
    # @return [String]
    attr_accessor :value

    # **[Required]** The parameter value in a user-friendly format. For example, if the `value` property shows the value 262144 for a big integer parameter, then the `displayValue` property will show the value 256K.
    #
    # @return [String]
    attr_accessor :display_value

    # The parameter number.
    # @return [Float]
    attr_accessor :number

    # Indicates whether the parameter is set to the default value (`TRUE`) or the parameter value was specified in the parameter file (`FALSE`).
    #
    # @return [BOOLEAN]
    attr_accessor :is_default

    # Indicates whether the parameter can be changed with `ALTER SESSION` (`TRUE`) or not (`FALSE`)
    #
    # @return [BOOLEAN]
    attr_accessor :is_session_modifiable

    # Indicates whether the parameter can be changed with `ALTER SYSTEM` and when the change takes effect:
    # - IMMEDIATE: Parameter can be changed with `ALTER SYSTEM` regardless of the type of parameter file used to start the instance. The change takes effect immediately.
    # - DEFERRED: Parameter can be changed with `ALTER SYSTEM` regardless of the type of parameter file used to start the instance. The change takes effect in subsequent sessions.
    # - FALSE: Parameter cannot be changed with `ALTER SYSTEM` unless a server parameter file was used to start the instance. The change takes effect in subsequent instances.
    #
    # @return [String]
    attr_reader :is_system_modifiable

    # Indicates whether the parameter can be modified on a per-PDB basis (`TRUE`) or not (`FALSE`). In a non-CDB, the value of this property is `null`.
    #
    # @return [BOOLEAN]
    attr_accessor :is_pdb_modifiable

    # For parameters that can be changed with `ALTER SYSTEM`, indicates whether the value of the parameter can be different for every instance (`TRUE`) or whether the parameter must have the same value for all Real Application Clusters instances (`FALSE`). For other parameters, this is always `FALSE`.
    #
    # @return [BOOLEAN]
    attr_accessor :is_instance_modifiable

    # Indicates how the parameter was modified. If an `ALTER SYSTEM` was performed, the value will be `MODIFIED`.
    #
    # @return [String]
    attr_reader :is_modified

    # Indicates whether Oracle adjusted the input value to a more suitable value.
    # @return [BOOLEAN]
    attr_accessor :is_adjusted

    # Indicates whether the parameter has been deprecated (`TRUE`) or not (`FALSE`).
    # @return [BOOLEAN]
    attr_accessor :is_deprecated

    # Indicates whether the parameter is a basic parameter (`TRUE`) or not (`FALSE`).
    # @return [BOOLEAN]
    attr_accessor :is_basic

    # The description of the parameter.
    # @return [String]
    attr_accessor :description

    # The position (ordinal number) of the parameter value. Useful only for parameters whose values are lists of strings.
    #
    # @return [Float]
    attr_accessor :ordinal

    # The comments associated with the most recent update.
    # @return [String]
    attr_accessor :update_comment

    # The ID of the database container to which the data pertains.
    # Possible values include:
    # - `0`: This value is used for data that pertain to the entire CDB. This value is also used for data in non-CDBs.
    # - `1`: This value is used for data that pertain to only the root container.
    # - `n`: Where n is the applicable container ID for the data.
    #
    # @return [Float]
    attr_accessor :container_id

    # The parameter category.
    # @return [String]
    attr_accessor :category

    # Applicable in case of Oracle Real Application Clusters (Oracle RAC) databases.
    # A `UNIQUE` parameter is one which is unique to each Oracle Real Application
    # Clusters (Oracle RAC) instance. For example, the parameter `INSTANCE_NUMBER`
    # must have different values in each instance. An `IDENTICAL` parameter must
    # have the same value for every instance. For example, the parameter
    # `DB_BLOCK_SIZE` must have the same value in all instances.
    #
    # @return [String]
    attr_reader :constraint

    # The database instance SID for which the parameter is defined.
    # @return [String]
    attr_accessor :sid

    # Indicates whether the parameter was specified in the server parameter file (`TRUE`) or not (`FALSE`). Applicable only when the parameter source is `SPFILE`.
    #
    # @return [BOOLEAN]
    attr_accessor :is_specified

    # A list of allowed values for this parameter.
    # @return [Array<OCI::DatabaseManagement::Models::AllowedParameterValue>]
    attr_accessor :allowed_values

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'type': :'type',
        'value': :'value',
        'display_value': :'displayValue',
        'number': :'number',
        'is_default': :'isDefault',
        'is_session_modifiable': :'isSessionModifiable',
        'is_system_modifiable': :'isSystemModifiable',
        'is_pdb_modifiable': :'isPdbModifiable',
        'is_instance_modifiable': :'isInstanceModifiable',
        'is_modified': :'isModified',
        'is_adjusted': :'isAdjusted',
        'is_deprecated': :'isDeprecated',
        'is_basic': :'isBasic',
        'description': :'description',
        'ordinal': :'ordinal',
        'update_comment': :'updateComment',
        'container_id': :'containerId',
        'category': :'category',
        'constraint': :'constraint',
        'sid': :'sid',
        'is_specified': :'isSpecified',
        'allowed_values': :'allowedValues'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'type': :'String',
        'value': :'String',
        'display_value': :'String',
        'number': :'Float',
        'is_default': :'BOOLEAN',
        'is_session_modifiable': :'BOOLEAN',
        'is_system_modifiable': :'String',
        'is_pdb_modifiable': :'BOOLEAN',
        'is_instance_modifiable': :'BOOLEAN',
        'is_modified': :'String',
        'is_adjusted': :'BOOLEAN',
        'is_deprecated': :'BOOLEAN',
        'is_basic': :'BOOLEAN',
        'description': :'String',
        'ordinal': :'Float',
        'update_comment': :'String',
        'container_id': :'Float',
        'category': :'String',
        'constraint': :'String',
        'sid': :'String',
        'is_specified': :'BOOLEAN',
        'allowed_values': :'Array<OCI::DatabaseManagement::Models::AllowedParameterValue>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :value The value to assign to the {#value} property
    # @option attributes [String] :display_value The value to assign to the {#display_value} property
    # @option attributes [Float] :number The value to assign to the {#number} property
    # @option attributes [BOOLEAN] :is_default The value to assign to the {#is_default} property
    # @option attributes [BOOLEAN] :is_session_modifiable The value to assign to the {#is_session_modifiable} property
    # @option attributes [String] :is_system_modifiable The value to assign to the {#is_system_modifiable} property
    # @option attributes [BOOLEAN] :is_pdb_modifiable The value to assign to the {#is_pdb_modifiable} property
    # @option attributes [BOOLEAN] :is_instance_modifiable The value to assign to the {#is_instance_modifiable} property
    # @option attributes [String] :is_modified The value to assign to the {#is_modified} property
    # @option attributes [BOOLEAN] :is_adjusted The value to assign to the {#is_adjusted} property
    # @option attributes [BOOLEAN] :is_deprecated The value to assign to the {#is_deprecated} property
    # @option attributes [BOOLEAN] :is_basic The value to assign to the {#is_basic} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Float] :ordinal The value to assign to the {#ordinal} property
    # @option attributes [String] :update_comment The value to assign to the {#update_comment} property
    # @option attributes [Float] :container_id The value to assign to the {#container_id} property
    # @option attributes [String] :category The value to assign to the {#category} property
    # @option attributes [String] :constraint The value to assign to the {#constraint} property
    # @option attributes [String] :sid The value to assign to the {#sid} property
    # @option attributes [BOOLEAN] :is_specified The value to assign to the {#is_specified} property
    # @option attributes [Array<OCI::DatabaseManagement::Models::AllowedParameterValue>] :allowed_values The value to assign to the {#allowed_values} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.type = attributes[:'type'] if attributes[:'type']

      self.value = attributes[:'value'] if attributes[:'value']

      self.display_value = attributes[:'displayValue'] if attributes[:'displayValue']

      raise 'You cannot provide both :displayValue and :display_value' if attributes.key?(:'displayValue') && attributes.key?(:'display_value')

      self.display_value = attributes[:'display_value'] if attributes[:'display_value']

      self.number = attributes[:'number'] if attributes[:'number']

      self.is_default = attributes[:'isDefault'] unless attributes[:'isDefault'].nil?

      raise 'You cannot provide both :isDefault and :is_default' if attributes.key?(:'isDefault') && attributes.key?(:'is_default')

      self.is_default = attributes[:'is_default'] unless attributes[:'is_default'].nil?

      self.is_session_modifiable = attributes[:'isSessionModifiable'] unless attributes[:'isSessionModifiable'].nil?

      raise 'You cannot provide both :isSessionModifiable and :is_session_modifiable' if attributes.key?(:'isSessionModifiable') && attributes.key?(:'is_session_modifiable')

      self.is_session_modifiable = attributes[:'is_session_modifiable'] unless attributes[:'is_session_modifiable'].nil?

      self.is_system_modifiable = attributes[:'isSystemModifiable'] if attributes[:'isSystemModifiable']

      raise 'You cannot provide both :isSystemModifiable and :is_system_modifiable' if attributes.key?(:'isSystemModifiable') && attributes.key?(:'is_system_modifiable')

      self.is_system_modifiable = attributes[:'is_system_modifiable'] if attributes[:'is_system_modifiable']

      self.is_pdb_modifiable = attributes[:'isPdbModifiable'] unless attributes[:'isPdbModifiable'].nil?

      raise 'You cannot provide both :isPdbModifiable and :is_pdb_modifiable' if attributes.key?(:'isPdbModifiable') && attributes.key?(:'is_pdb_modifiable')

      self.is_pdb_modifiable = attributes[:'is_pdb_modifiable'] unless attributes[:'is_pdb_modifiable'].nil?

      self.is_instance_modifiable = attributes[:'isInstanceModifiable'] unless attributes[:'isInstanceModifiable'].nil?

      raise 'You cannot provide both :isInstanceModifiable and :is_instance_modifiable' if attributes.key?(:'isInstanceModifiable') && attributes.key?(:'is_instance_modifiable')

      self.is_instance_modifiable = attributes[:'is_instance_modifiable'] unless attributes[:'is_instance_modifiable'].nil?

      self.is_modified = attributes[:'isModified'] if attributes[:'isModified']

      raise 'You cannot provide both :isModified and :is_modified' if attributes.key?(:'isModified') && attributes.key?(:'is_modified')

      self.is_modified = attributes[:'is_modified'] if attributes[:'is_modified']

      self.is_adjusted = attributes[:'isAdjusted'] unless attributes[:'isAdjusted'].nil?

      raise 'You cannot provide both :isAdjusted and :is_adjusted' if attributes.key?(:'isAdjusted') && attributes.key?(:'is_adjusted')

      self.is_adjusted = attributes[:'is_adjusted'] unless attributes[:'is_adjusted'].nil?

      self.is_deprecated = attributes[:'isDeprecated'] unless attributes[:'isDeprecated'].nil?

      raise 'You cannot provide both :isDeprecated and :is_deprecated' if attributes.key?(:'isDeprecated') && attributes.key?(:'is_deprecated')

      self.is_deprecated = attributes[:'is_deprecated'] unless attributes[:'is_deprecated'].nil?

      self.is_basic = attributes[:'isBasic'] unless attributes[:'isBasic'].nil?

      raise 'You cannot provide both :isBasic and :is_basic' if attributes.key?(:'isBasic') && attributes.key?(:'is_basic')

      self.is_basic = attributes[:'is_basic'] unless attributes[:'is_basic'].nil?

      self.description = attributes[:'description'] if attributes[:'description']

      self.ordinal = attributes[:'ordinal'] if attributes[:'ordinal']

      self.update_comment = attributes[:'updateComment'] if attributes[:'updateComment']

      raise 'You cannot provide both :updateComment and :update_comment' if attributes.key?(:'updateComment') && attributes.key?(:'update_comment')

      self.update_comment = attributes[:'update_comment'] if attributes[:'update_comment']

      self.container_id = attributes[:'containerId'] if attributes[:'containerId']

      raise 'You cannot provide both :containerId and :container_id' if attributes.key?(:'containerId') && attributes.key?(:'container_id')

      self.container_id = attributes[:'container_id'] if attributes[:'container_id']

      self.category = attributes[:'category'] if attributes[:'category']

      self.constraint = attributes[:'constraint'] if attributes[:'constraint']

      self.sid = attributes[:'sid'] if attributes[:'sid']

      self.is_specified = attributes[:'isSpecified'] unless attributes[:'isSpecified'].nil?

      raise 'You cannot provide both :isSpecified and :is_specified' if attributes.key?(:'isSpecified') && attributes.key?(:'is_specified')

      self.is_specified = attributes[:'is_specified'] unless attributes[:'is_specified'].nil?

      self.allowed_values = attributes[:'allowedValues'] if attributes[:'allowedValues']

      raise 'You cannot provide both :allowedValues and :allowed_values' if attributes.key?(:'allowedValues') && attributes.key?(:'allowed_values')

      self.allowed_values = attributes[:'allowed_values'] if attributes[:'allowed_values']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      # rubocop:disable Style/ConditionalAssignment
      if type && !TYPE_ENUM.include?(type)
        OCI.logger.debug("Unknown value for 'type' [" + type + "]. Mapping to 'TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @type = TYPE_UNKNOWN_ENUM_VALUE
      else
        @type = type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] is_system_modifiable Object to be assigned
    def is_system_modifiable=(is_system_modifiable)
      # rubocop:disable Style/ConditionalAssignment
      if is_system_modifiable && !IS_SYSTEM_MODIFIABLE_ENUM.include?(is_system_modifiable)
        OCI.logger.debug("Unknown value for 'is_system_modifiable' [" + is_system_modifiable + "]. Mapping to 'IS_SYSTEM_MODIFIABLE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @is_system_modifiable = IS_SYSTEM_MODIFIABLE_UNKNOWN_ENUM_VALUE
      else
        @is_system_modifiable = is_system_modifiable
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] is_modified Object to be assigned
    def is_modified=(is_modified)
      # rubocop:disable Style/ConditionalAssignment
      if is_modified && !IS_MODIFIED_ENUM.include?(is_modified)
        OCI.logger.debug("Unknown value for 'is_modified' [" + is_modified + "]. Mapping to 'IS_MODIFIED_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @is_modified = IS_MODIFIED_UNKNOWN_ENUM_VALUE
      else
        @is_modified = is_modified
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] constraint Object to be assigned
    def constraint=(constraint)
      # rubocop:disable Style/ConditionalAssignment
      if constraint && !CONSTRAINT_ENUM.include?(constraint)
        OCI.logger.debug("Unknown value for 'constraint' [" + constraint + "]. Mapping to 'CONSTRAINT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @constraint = CONSTRAINT_UNKNOWN_ENUM_VALUE
      else
        @constraint = constraint
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        type == other.type &&
        value == other.value &&
        display_value == other.display_value &&
        number == other.number &&
        is_default == other.is_default &&
        is_session_modifiable == other.is_session_modifiable &&
        is_system_modifiable == other.is_system_modifiable &&
        is_pdb_modifiable == other.is_pdb_modifiable &&
        is_instance_modifiable == other.is_instance_modifiable &&
        is_modified == other.is_modified &&
        is_adjusted == other.is_adjusted &&
        is_deprecated == other.is_deprecated &&
        is_basic == other.is_basic &&
        description == other.description &&
        ordinal == other.ordinal &&
        update_comment == other.update_comment &&
        container_id == other.container_id &&
        category == other.category &&
        constraint == other.constraint &&
        sid == other.sid &&
        is_specified == other.is_specified &&
        allowed_values == other.allowed_values
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
      [name, type, value, display_value, number, is_default, is_session_modifiable, is_system_modifiable, is_pdb_modifiable, is_instance_modifiable, is_modified, is_adjusted, is_deprecated, is_basic, description, ordinal, update_comment, container_id, category, constraint, sid, is_specified, allowed_values].hash
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
