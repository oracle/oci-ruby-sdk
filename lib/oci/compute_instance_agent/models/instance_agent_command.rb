# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The command payload.
  class ComputeInstanceAgent::Models::InstanceAgentCommand
    # **[Required]** The command OCID
    # @return [String]
    attr_accessor :id

    # **[Required]** The OCID of the compartment the command is created in.
    # @return [String]
    attr_accessor :compartment_id

    # The user friendly display name of the command.
    # @return [String]
    attr_accessor :display_name

    # the time command was created at.
    # @return [DateTime]
    attr_accessor :time_created

    # the time command was updated at.
    # @return [DateTime]
    attr_accessor :time_updated

    # Whether the command has been requested to be canceled.
    # @return [BOOLEAN]
    attr_accessor :is_canceled

    # Command execution time limit that the instance agent will honor when executing the command inside the instance. This timer starts when the instance agent starts the commond. Zero means no timeout.
    # @return [Integer]
    attr_accessor :execution_time_out_in_seconds

    # This attribute is required.
    # @return [OCI::ComputeInstanceAgent::Models::InstanceAgentCommandTarget]
    attr_accessor :target

    # This attribute is required.
    # @return [OCI::ComputeInstanceAgent::Models::InstanceAgentCommandContent]
    attr_accessor :content

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'is_canceled': :'isCanceled',
        'execution_time_out_in_seconds': :'executionTimeOutInSeconds',
        'target': :'target',
        'content': :'content'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'display_name': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'is_canceled': :'BOOLEAN',
        'execution_time_out_in_seconds': :'Integer',
        'target': :'OCI::ComputeInstanceAgent::Models::InstanceAgentCommandTarget',
        'content': :'OCI::ComputeInstanceAgent::Models::InstanceAgentCommandContent'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [BOOLEAN] :is_canceled The value to assign to the {#is_canceled} property
    # @option attributes [Integer] :execution_time_out_in_seconds The value to assign to the {#execution_time_out_in_seconds} property
    # @option attributes [OCI::ComputeInstanceAgent::Models::InstanceAgentCommandTarget] :target The value to assign to the {#target} property
    # @option attributes [OCI::ComputeInstanceAgent::Models::InstanceAgentCommandContent] :content The value to assign to the {#content} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.is_canceled = attributes[:'isCanceled'] unless attributes[:'isCanceled'].nil?
      self.is_canceled = false if is_canceled.nil? && !attributes.key?(:'isCanceled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isCanceled and :is_canceled' if attributes.key?(:'isCanceled') && attributes.key?(:'is_canceled')

      self.is_canceled = attributes[:'is_canceled'] unless attributes[:'is_canceled'].nil?
      self.is_canceled = false if is_canceled.nil? && !attributes.key?(:'isCanceled') && !attributes.key?(:'is_canceled') # rubocop:disable Style/StringLiterals

      self.execution_time_out_in_seconds = attributes[:'executionTimeOutInSeconds'] if attributes[:'executionTimeOutInSeconds']

      raise 'You cannot provide both :executionTimeOutInSeconds and :execution_time_out_in_seconds' if attributes.key?(:'executionTimeOutInSeconds') && attributes.key?(:'execution_time_out_in_seconds')

      self.execution_time_out_in_seconds = attributes[:'execution_time_out_in_seconds'] if attributes[:'execution_time_out_in_seconds']

      self.target = attributes[:'target'] if attributes[:'target']

      self.content = attributes[:'content'] if attributes[:'content']
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
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        is_canceled == other.is_canceled &&
        execution_time_out_in_seconds == other.execution_time_out_in_seconds &&
        target == other.target &&
        content == other.content
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
      [id, compartment_id, display_name, time_created, time_updated, is_canceled, execution_time_out_in_seconds, target, content].hash
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
