# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information required to search monitored resource associations.
  class StackMonitoring::Models::SearchMonitoredResourceAssociationsDetails
    SORT_BY_ENUM = [
      SORT_BY_TIME_CREATED = 'TIME_CREATED'.freeze,
      SORT_BY_ASSOC_TYPE = 'ASSOC_TYPE'.freeze
    ].freeze

    SORT_ORDER_ENUM = [
      SORT_ORDER_ASC = 'ASC'.freeze,
      SORT_ORDER_DESC = 'DESC'.freeze
    ].freeze

    # **[Required]** Compartment Identifier [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm)
    # @return [String]
    attr_accessor :compartment_id

    # Source Monitored Resource Identifier [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm)
    # @return [String]
    attr_accessor :source_resource_id

    # Source Monitored Resource Name
    # @return [String]
    attr_accessor :source_resource_name

    # Source Monitored Resource Type
    # @return [String]
    attr_accessor :source_resource_type

    # Destination Monitored Resource Identifier [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm)
    # @return [String]
    attr_accessor :destination_resource_id

    # Source Monitored Resource Name
    # @return [String]
    attr_accessor :destination_resource_name

    # Source Monitored Resource Type
    # @return [String]
    attr_accessor :destination_resource_type

    # Association type to be created between source and destination resources
    # @return [String]
    attr_accessor :association_type

    # The field to sort by. Only one sort order may be provided.
    # Default order for timeCreated is descending. Default order for assocType is descending.
    #
    # @return [String]
    attr_reader :sort_by

    # The sort order to use, either 'ASC' or 'DESC'.
    # @return [String]
    attr_reader :sort_order

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'source_resource_id': :'sourceResourceId',
        'source_resource_name': :'sourceResourceName',
        'source_resource_type': :'sourceResourceType',
        'destination_resource_id': :'destinationResourceId',
        'destination_resource_name': :'destinationResourceName',
        'destination_resource_type': :'destinationResourceType',
        'association_type': :'associationType',
        'sort_by': :'sortBy',
        'sort_order': :'sortOrder'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'source_resource_id': :'String',
        'source_resource_name': :'String',
        'source_resource_type': :'String',
        'destination_resource_id': :'String',
        'destination_resource_name': :'String',
        'destination_resource_type': :'String',
        'association_type': :'String',
        'sort_by': :'String',
        'sort_order': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :source_resource_id The value to assign to the {#source_resource_id} property
    # @option attributes [String] :source_resource_name The value to assign to the {#source_resource_name} property
    # @option attributes [String] :source_resource_type The value to assign to the {#source_resource_type} property
    # @option attributes [String] :destination_resource_id The value to assign to the {#destination_resource_id} property
    # @option attributes [String] :destination_resource_name The value to assign to the {#destination_resource_name} property
    # @option attributes [String] :destination_resource_type The value to assign to the {#destination_resource_type} property
    # @option attributes [String] :association_type The value to assign to the {#association_type} property
    # @option attributes [String] :sort_by The value to assign to the {#sort_by} property
    # @option attributes [String] :sort_order The value to assign to the {#sort_order} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.source_resource_id = attributes[:'sourceResourceId'] if attributes[:'sourceResourceId']

      raise 'You cannot provide both :sourceResourceId and :source_resource_id' if attributes.key?(:'sourceResourceId') && attributes.key?(:'source_resource_id')

      self.source_resource_id = attributes[:'source_resource_id'] if attributes[:'source_resource_id']

      self.source_resource_name = attributes[:'sourceResourceName'] if attributes[:'sourceResourceName']

      raise 'You cannot provide both :sourceResourceName and :source_resource_name' if attributes.key?(:'sourceResourceName') && attributes.key?(:'source_resource_name')

      self.source_resource_name = attributes[:'source_resource_name'] if attributes[:'source_resource_name']

      self.source_resource_type = attributes[:'sourceResourceType'] if attributes[:'sourceResourceType']

      raise 'You cannot provide both :sourceResourceType and :source_resource_type' if attributes.key?(:'sourceResourceType') && attributes.key?(:'source_resource_type')

      self.source_resource_type = attributes[:'source_resource_type'] if attributes[:'source_resource_type']

      self.destination_resource_id = attributes[:'destinationResourceId'] if attributes[:'destinationResourceId']

      raise 'You cannot provide both :destinationResourceId and :destination_resource_id' if attributes.key?(:'destinationResourceId') && attributes.key?(:'destination_resource_id')

      self.destination_resource_id = attributes[:'destination_resource_id'] if attributes[:'destination_resource_id']

      self.destination_resource_name = attributes[:'destinationResourceName'] if attributes[:'destinationResourceName']

      raise 'You cannot provide both :destinationResourceName and :destination_resource_name' if attributes.key?(:'destinationResourceName') && attributes.key?(:'destination_resource_name')

      self.destination_resource_name = attributes[:'destination_resource_name'] if attributes[:'destination_resource_name']

      self.destination_resource_type = attributes[:'destinationResourceType'] if attributes[:'destinationResourceType']

      raise 'You cannot provide both :destinationResourceType and :destination_resource_type' if attributes.key?(:'destinationResourceType') && attributes.key?(:'destination_resource_type')

      self.destination_resource_type = attributes[:'destination_resource_type'] if attributes[:'destination_resource_type']

      self.association_type = attributes[:'associationType'] if attributes[:'associationType']

      raise 'You cannot provide both :associationType and :association_type' if attributes.key?(:'associationType') && attributes.key?(:'association_type')

      self.association_type = attributes[:'association_type'] if attributes[:'association_type']

      self.sort_by = attributes[:'sortBy'] if attributes[:'sortBy']
      self.sort_by = "TIME_CREATED" if sort_by.nil? && !attributes.key?(:'sortBy') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :sortBy and :sort_by' if attributes.key?(:'sortBy') && attributes.key?(:'sort_by')

      self.sort_by = attributes[:'sort_by'] if attributes[:'sort_by']
      self.sort_by = "TIME_CREATED" if sort_by.nil? && !attributes.key?(:'sortBy') && !attributes.key?(:'sort_by') # rubocop:disable Style/StringLiterals

      self.sort_order = attributes[:'sortOrder'] if attributes[:'sortOrder']

      raise 'You cannot provide both :sortOrder and :sort_order' if attributes.key?(:'sortOrder') && attributes.key?(:'sort_order')

      self.sort_order = attributes[:'sort_order'] if attributes[:'sort_order']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] sort_by Object to be assigned
    def sort_by=(sort_by)
      raise "Invalid value for 'sort_by': this must be one of the values in SORT_BY_ENUM." if sort_by && !SORT_BY_ENUM.include?(sort_by)

      @sort_by = sort_by
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] sort_order Object to be assigned
    def sort_order=(sort_order)
      raise "Invalid value for 'sort_order': this must be one of the values in SORT_ORDER_ENUM." if sort_order && !SORT_ORDER_ENUM.include?(sort_order)

      @sort_order = sort_order
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        source_resource_id == other.source_resource_id &&
        source_resource_name == other.source_resource_name &&
        source_resource_type == other.source_resource_type &&
        destination_resource_id == other.destination_resource_id &&
        destination_resource_name == other.destination_resource_name &&
        destination_resource_type == other.destination_resource_type &&
        association_type == other.association_type &&
        sort_by == other.sort_by &&
        sort_order == other.sort_order
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
      [compartment_id, source_resource_id, source_resource_name, source_resource_type, destination_resource_id, destination_resource_name, destination_resource_type, association_type, sort_by, sort_order].hash
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
