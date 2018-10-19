# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # The properties that define meta data for a cluster.
  class ContainerEngine::Models::ClusterMetadata # rubocop:disable Metrics/LineLength
    # The time the cluster was created.
    # @return [DateTime]
    attr_accessor :time_created

    # The user who created the cluster.
    # @return [String]
    attr_accessor :created_by_user_id

    # The OCID of the work request which created the cluster.
    # @return [String]
    attr_accessor :created_by_work_request_id

    # The time the cluster was deleted.
    # @return [DateTime]
    attr_accessor :time_deleted

    # The user who deleted the cluster.
    # @return [String]
    attr_accessor :deleted_by_user_id

    # The OCID of the work request which deleted the cluster.
    # @return [String]
    attr_accessor :deleted_by_work_request_id

    # The time the cluster was updated.
    # @return [DateTime]
    attr_accessor :time_updated

    # The user who updated the cluster.
    # @return [String]
    attr_accessor :updated_by_user_id

    # The OCID of the work request which updated the cluster.
    # @return [String]
    attr_accessor :updated_by_work_request_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'time_created': :'timeCreated',
        'created_by_user_id': :'createdByUserId',
        'created_by_work_request_id': :'createdByWorkRequestId',
        'time_deleted': :'timeDeleted',
        'deleted_by_user_id': :'deletedByUserId',
        'deleted_by_work_request_id': :'deletedByWorkRequestId',
        'time_updated': :'timeUpdated',
        'updated_by_user_id': :'updatedByUserId',
        'updated_by_work_request_id': :'updatedByWorkRequestId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'time_created': :'DateTime',
        'created_by_user_id': :'String',
        'created_by_work_request_id': :'String',
        'time_deleted': :'DateTime',
        'deleted_by_user_id': :'String',
        'deleted_by_work_request_id': :'String',
        'time_updated': :'DateTime',
        'updated_by_user_id': :'String',
        'updated_by_work_request_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :created_by_user_id The value to assign to the {#created_by_user_id} property
    # @option attributes [String] :created_by_work_request_id The value to assign to the {#created_by_work_request_id} property
    # @option attributes [DateTime] :time_deleted The value to assign to the {#time_deleted} property
    # @option attributes [String] :deleted_by_user_id The value to assign to the {#deleted_by_user_id} property
    # @option attributes [String] :deleted_by_work_request_id The value to assign to the {#deleted_by_work_request_id} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :updated_by_user_id The value to assign to the {#updated_by_user_id} property
    # @option attributes [String] :updated_by_work_request_id The value to assign to the {#updated_by_work_request_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.created_by_user_id = attributes[:'createdByUserId'] if attributes[:'createdByUserId']

      raise 'You cannot provide both :createdByUserId and :created_by_user_id' if attributes.key?(:'createdByUserId') && attributes.key?(:'created_by_user_id')

      self.created_by_user_id = attributes[:'created_by_user_id'] if attributes[:'created_by_user_id']

      self.created_by_work_request_id = attributes[:'createdByWorkRequestId'] if attributes[:'createdByWorkRequestId']

      raise 'You cannot provide both :createdByWorkRequestId and :created_by_work_request_id' if attributes.key?(:'createdByWorkRequestId') && attributes.key?(:'created_by_work_request_id')

      self.created_by_work_request_id = attributes[:'created_by_work_request_id'] if attributes[:'created_by_work_request_id']

      self.time_deleted = attributes[:'timeDeleted'] if attributes[:'timeDeleted']

      raise 'You cannot provide both :timeDeleted and :time_deleted' if attributes.key?(:'timeDeleted') && attributes.key?(:'time_deleted')

      self.time_deleted = attributes[:'time_deleted'] if attributes[:'time_deleted']

      self.deleted_by_user_id = attributes[:'deletedByUserId'] if attributes[:'deletedByUserId']

      raise 'You cannot provide both :deletedByUserId and :deleted_by_user_id' if attributes.key?(:'deletedByUserId') && attributes.key?(:'deleted_by_user_id')

      self.deleted_by_user_id = attributes[:'deleted_by_user_id'] if attributes[:'deleted_by_user_id']

      self.deleted_by_work_request_id = attributes[:'deletedByWorkRequestId'] if attributes[:'deletedByWorkRequestId']

      raise 'You cannot provide both :deletedByWorkRequestId and :deleted_by_work_request_id' if attributes.key?(:'deletedByWorkRequestId') && attributes.key?(:'deleted_by_work_request_id')

      self.deleted_by_work_request_id = attributes[:'deleted_by_work_request_id'] if attributes[:'deleted_by_work_request_id']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.updated_by_user_id = attributes[:'updatedByUserId'] if attributes[:'updatedByUserId']

      raise 'You cannot provide both :updatedByUserId and :updated_by_user_id' if attributes.key?(:'updatedByUserId') && attributes.key?(:'updated_by_user_id')

      self.updated_by_user_id = attributes[:'updated_by_user_id'] if attributes[:'updated_by_user_id']

      self.updated_by_work_request_id = attributes[:'updatedByWorkRequestId'] if attributes[:'updatedByWorkRequestId']

      raise 'You cannot provide both :updatedByWorkRequestId and :updated_by_work_request_id' if attributes.key?(:'updatedByWorkRequestId') && attributes.key?(:'updated_by_work_request_id')

      self.updated_by_work_request_id = attributes[:'updated_by_work_request_id'] if attributes[:'updated_by_work_request_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        time_created == other.time_created &&
        created_by_user_id == other.created_by_user_id &&
        created_by_work_request_id == other.created_by_work_request_id &&
        time_deleted == other.time_deleted &&
        deleted_by_user_id == other.deleted_by_user_id &&
        deleted_by_work_request_id == other.deleted_by_work_request_id &&
        time_updated == other.time_updated &&
        updated_by_user_id == other.updated_by_user_id &&
        updated_by_work_request_id == other.updated_by_work_request_id
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [time_created, created_by_user_id, created_by_work_request_id, time_deleted, deleted_by_user_id, deleted_by_work_request_id, time_updated, updated_by_user_id, updated_by_work_request_id].hash
    end
    # rubocop:enable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines

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
# rubocop:enable Lint/UnneededCopDisableDirective
