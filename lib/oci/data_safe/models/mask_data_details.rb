# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details to mask data.
  class DataSafe::Models::MaskDataDetails
    # The OCID of the target database to be masked. If it's not provided, the value of the
    # targetId attribute in the MaskingPolicy resource is used. The OCID of the target
    # database to be masked. If it's not provided, the value of the targetId attribute in
    # the MaskingPolicy resource is used.
    #
    # @return [String]
    attr_accessor :target_id

    # Indicates if the masking request is to decrypt the data values previously encrypted using Deterministic Encryption. Note that, to
    # correctly decrypt the encrypted data values, it requires the same seed value that was provided to encrypt those data values.
    #
    # @return [BOOLEAN]
    attr_accessor :is_decrypt

    # Indicates if the masking request is to rerun the previously failed masking steps. If a masking request is submitted with the
    # isIgnoreErrorsEnabled attribute set to true, the masking process tracks the failed masking steps. Another masking request can be
    # submitted with the isRun attribute set to true to rerun those failed masking steps. It helps save time by executing only the failed
    # masking steps and not doing the whole masking again.
    #
    # @return [BOOLEAN]
    attr_accessor :is_rerun

    # The tablespace that should be used to create the mapping tables, DMASK objects, and other temporary tables for data masking.
    # If no tablespace is provided, the DEFAULT tablespace is used.
    #
    # @return [String]
    attr_accessor :tablespace

    # Indicates if the masking process should continue on hitting an error. It provides fault tolerance support and is enabled by
    # default. In fault-tolerant mode, the masking process saves the failed step and continues. You can then submit another masking
    # request (with isRerun attribute set to true) to execute only the failed steps.
    #
    # @return [BOOLEAN]
    attr_accessor :is_ignore_errors_enabled

    # The seed value to be used in case of Deterministic Encryption and Deterministic Substitution masking formats.
    # @return [String]
    attr_accessor :seed

    # Indicates if the interim DMASK tables should be moved to the user-specified tablespace. As interim tables can be large in size,
    # set it to false if moving them causes performance overhead during masking.
    #
    # @return [BOOLEAN]
    attr_accessor :is_move_interim_tables_enabled

    # Indicates if data masking should be performed using a saved masking script. Setting this attribute to true skips masking script
    # generation and executes the masking script stored in the Data Safe repository. It helps save time if there are no changes in
    # the database tables and their dependencies.
    #
    # @return [BOOLEAN]
    attr_accessor :is_execute_saved_script_enabled

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'target_id': :'targetId',
        'is_decrypt': :'isDecrypt',
        'is_rerun': :'isRerun',
        'tablespace': :'tablespace',
        'is_ignore_errors_enabled': :'isIgnoreErrorsEnabled',
        'seed': :'seed',
        'is_move_interim_tables_enabled': :'isMoveInterimTablesEnabled',
        'is_execute_saved_script_enabled': :'isExecuteSavedScriptEnabled'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'target_id': :'String',
        'is_decrypt': :'BOOLEAN',
        'is_rerun': :'BOOLEAN',
        'tablespace': :'String',
        'is_ignore_errors_enabled': :'BOOLEAN',
        'seed': :'String',
        'is_move_interim_tables_enabled': :'BOOLEAN',
        'is_execute_saved_script_enabled': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :target_id The value to assign to the {#target_id} property
    # @option attributes [BOOLEAN] :is_decrypt The value to assign to the {#is_decrypt} property
    # @option attributes [BOOLEAN] :is_rerun The value to assign to the {#is_rerun} property
    # @option attributes [String] :tablespace The value to assign to the {#tablespace} property
    # @option attributes [BOOLEAN] :is_ignore_errors_enabled The value to assign to the {#is_ignore_errors_enabled} property
    # @option attributes [String] :seed The value to assign to the {#seed} property
    # @option attributes [BOOLEAN] :is_move_interim_tables_enabled The value to assign to the {#is_move_interim_tables_enabled} property
    # @option attributes [BOOLEAN] :is_execute_saved_script_enabled The value to assign to the {#is_execute_saved_script_enabled} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.target_id = attributes[:'targetId'] if attributes[:'targetId']

      raise 'You cannot provide both :targetId and :target_id' if attributes.key?(:'targetId') && attributes.key?(:'target_id')

      self.target_id = attributes[:'target_id'] if attributes[:'target_id']

      self.is_decrypt = attributes[:'isDecrypt'] unless attributes[:'isDecrypt'].nil?
      self.is_decrypt = false if is_decrypt.nil? && !attributes.key?(:'isDecrypt') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isDecrypt and :is_decrypt' if attributes.key?(:'isDecrypt') && attributes.key?(:'is_decrypt')

      self.is_decrypt = attributes[:'is_decrypt'] unless attributes[:'is_decrypt'].nil?
      self.is_decrypt = false if is_decrypt.nil? && !attributes.key?(:'isDecrypt') && !attributes.key?(:'is_decrypt') # rubocop:disable Style/StringLiterals

      self.is_rerun = attributes[:'isRerun'] unless attributes[:'isRerun'].nil?
      self.is_rerun = false if is_rerun.nil? && !attributes.key?(:'isRerun') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isRerun and :is_rerun' if attributes.key?(:'isRerun') && attributes.key?(:'is_rerun')

      self.is_rerun = attributes[:'is_rerun'] unless attributes[:'is_rerun'].nil?
      self.is_rerun = false if is_rerun.nil? && !attributes.key?(:'isRerun') && !attributes.key?(:'is_rerun') # rubocop:disable Style/StringLiterals

      self.tablespace = attributes[:'tablespace'] if attributes[:'tablespace']

      self.is_ignore_errors_enabled = attributes[:'isIgnoreErrorsEnabled'] unless attributes[:'isIgnoreErrorsEnabled'].nil?
      self.is_ignore_errors_enabled = true if is_ignore_errors_enabled.nil? && !attributes.key?(:'isIgnoreErrorsEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isIgnoreErrorsEnabled and :is_ignore_errors_enabled' if attributes.key?(:'isIgnoreErrorsEnabled') && attributes.key?(:'is_ignore_errors_enabled')

      self.is_ignore_errors_enabled = attributes[:'is_ignore_errors_enabled'] unless attributes[:'is_ignore_errors_enabled'].nil?
      self.is_ignore_errors_enabled = true if is_ignore_errors_enabled.nil? && !attributes.key?(:'isIgnoreErrorsEnabled') && !attributes.key?(:'is_ignore_errors_enabled') # rubocop:disable Style/StringLiterals

      self.seed = attributes[:'seed'] if attributes[:'seed']

      self.is_move_interim_tables_enabled = attributes[:'isMoveInterimTablesEnabled'] unless attributes[:'isMoveInterimTablesEnabled'].nil?
      self.is_move_interim_tables_enabled = true if is_move_interim_tables_enabled.nil? && !attributes.key?(:'isMoveInterimTablesEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isMoveInterimTablesEnabled and :is_move_interim_tables_enabled' if attributes.key?(:'isMoveInterimTablesEnabled') && attributes.key?(:'is_move_interim_tables_enabled')

      self.is_move_interim_tables_enabled = attributes[:'is_move_interim_tables_enabled'] unless attributes[:'is_move_interim_tables_enabled'].nil?
      self.is_move_interim_tables_enabled = true if is_move_interim_tables_enabled.nil? && !attributes.key?(:'isMoveInterimTablesEnabled') && !attributes.key?(:'is_move_interim_tables_enabled') # rubocop:disable Style/StringLiterals

      self.is_execute_saved_script_enabled = attributes[:'isExecuteSavedScriptEnabled'] unless attributes[:'isExecuteSavedScriptEnabled'].nil?
      self.is_execute_saved_script_enabled = false if is_execute_saved_script_enabled.nil? && !attributes.key?(:'isExecuteSavedScriptEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isExecuteSavedScriptEnabled and :is_execute_saved_script_enabled' if attributes.key?(:'isExecuteSavedScriptEnabled') && attributes.key?(:'is_execute_saved_script_enabled')

      self.is_execute_saved_script_enabled = attributes[:'is_execute_saved_script_enabled'] unless attributes[:'is_execute_saved_script_enabled'].nil?
      self.is_execute_saved_script_enabled = false if is_execute_saved_script_enabled.nil? && !attributes.key?(:'isExecuteSavedScriptEnabled') && !attributes.key?(:'is_execute_saved_script_enabled') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        target_id == other.target_id &&
        is_decrypt == other.is_decrypt &&
        is_rerun == other.is_rerun &&
        tablespace == other.tablespace &&
        is_ignore_errors_enabled == other.is_ignore_errors_enabled &&
        seed == other.seed &&
        is_move_interim_tables_enabled == other.is_move_interim_tables_enabled &&
        is_execute_saved_script_enabled == other.is_execute_saved_script_enabled
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
      [target_id, is_decrypt, is_rerun, tablespace, is_ignore_errors_enabled, seed, is_move_interim_tables_enabled, is_execute_saved_script_enabled].hash
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
