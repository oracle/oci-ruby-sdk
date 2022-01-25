# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # UpdateApplianceExportJobDetails model.
  class Dts::Models::UpdateApplianceExportJobDetails
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INPROGRESS = 'INPROGRESS'.freeze,
      LIFECYCLE_STATE_SUCCEEDED = 'SUCCEEDED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_CANCELLED = 'CANCELLED'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze
    ].freeze

    # @return [String]
    attr_accessor :bucket_name

    # List of objects with names matching this prefix would be part of this export job.
    # @return [String]
    attr_accessor :prefix

    # Object names returned by a list query must be greater or equal to this parameter.
    # @return [String]
    attr_accessor :range_start

    # Object names returned by a list query must be strictly less than this parameter.
    # @return [String]
    attr_accessor :range_end

    # @return [String]
    attr_accessor :display_name

    # @return [String]
    attr_reader :lifecycle_state

    # A property that can contain details on the lifecycle.
    # @return [String]
    attr_accessor :lifecycle_state_details

    # Manifest File associated with this export job.
    # @return [String]
    attr_accessor :manifest_file

    # md5 digest of the manifest file.
    # @return [String]
    attr_accessor :manifest_md5

    # Total number of objects that are exported in this job.
    # @return [String]
    attr_accessor :number_of_objects

    # Total size of objects in Bytes that are exported in this job.
    # @return [String]
    attr_accessor :total_size_in_bytes

    # First object in the list of objects that are exported in this job.
    # @return [String]
    attr_accessor :first_object

    # Last object in the list of objects that are exported in this job.
    # @return [String]
    attr_accessor :last_object

    # First object from which the next potential export job could start.
    # @return [String]
    attr_accessor :next_object

    # @return [OCI::Dts::Models::ShippingAddress]
    attr_accessor :customer_shipping_address

    # Free-form tags for this resource. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a
    # namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'bucket_name': :'bucketName',
        'prefix': :'prefix',
        'range_start': :'rangeStart',
        'range_end': :'rangeEnd',
        'display_name': :'displayName',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_state_details': :'lifecycleStateDetails',
        'manifest_file': :'manifestFile',
        'manifest_md5': :'manifestMd5',
        'number_of_objects': :'numberOfObjects',
        'total_size_in_bytes': :'totalSizeInBytes',
        'first_object': :'firstObject',
        'last_object': :'lastObject',
        'next_object': :'nextObject',
        'customer_shipping_address': :'customerShippingAddress',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'bucket_name': :'String',
        'prefix': :'String',
        'range_start': :'String',
        'range_end': :'String',
        'display_name': :'String',
        'lifecycle_state': :'String',
        'lifecycle_state_details': :'String',
        'manifest_file': :'String',
        'manifest_md5': :'String',
        'number_of_objects': :'String',
        'total_size_in_bytes': :'String',
        'first_object': :'String',
        'last_object': :'String',
        'next_object': :'String',
        'customer_shipping_address': :'OCI::Dts::Models::ShippingAddress',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :bucket_name The value to assign to the {#bucket_name} property
    # @option attributes [String] :prefix The value to assign to the {#prefix} property
    # @option attributes [String] :range_start The value to assign to the {#range_start} property
    # @option attributes [String] :range_end The value to assign to the {#range_end} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_state_details The value to assign to the {#lifecycle_state_details} property
    # @option attributes [String] :manifest_file The value to assign to the {#manifest_file} property
    # @option attributes [String] :manifest_md5 The value to assign to the {#manifest_md5} property
    # @option attributes [String] :number_of_objects The value to assign to the {#number_of_objects} property
    # @option attributes [String] :total_size_in_bytes The value to assign to the {#total_size_in_bytes} property
    # @option attributes [String] :first_object The value to assign to the {#first_object} property
    # @option attributes [String] :last_object The value to assign to the {#last_object} property
    # @option attributes [String] :next_object The value to assign to the {#next_object} property
    # @option attributes [OCI::Dts::Models::ShippingAddress] :customer_shipping_address The value to assign to the {#customer_shipping_address} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.bucket_name = attributes[:'bucketName'] if attributes[:'bucketName']

      raise 'You cannot provide both :bucketName and :bucket_name' if attributes.key?(:'bucketName') && attributes.key?(:'bucket_name')

      self.bucket_name = attributes[:'bucket_name'] if attributes[:'bucket_name']

      self.prefix = attributes[:'prefix'] if attributes[:'prefix']

      self.range_start = attributes[:'rangeStart'] if attributes[:'rangeStart']

      raise 'You cannot provide both :rangeStart and :range_start' if attributes.key?(:'rangeStart') && attributes.key?(:'range_start')

      self.range_start = attributes[:'range_start'] if attributes[:'range_start']

      self.range_end = attributes[:'rangeEnd'] if attributes[:'rangeEnd']

      raise 'You cannot provide both :rangeEnd and :range_end' if attributes.key?(:'rangeEnd') && attributes.key?(:'range_end')

      self.range_end = attributes[:'range_end'] if attributes[:'range_end']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_state_details = attributes[:'lifecycleStateDetails'] if attributes[:'lifecycleStateDetails']

      raise 'You cannot provide both :lifecycleStateDetails and :lifecycle_state_details' if attributes.key?(:'lifecycleStateDetails') && attributes.key?(:'lifecycle_state_details')

      self.lifecycle_state_details = attributes[:'lifecycle_state_details'] if attributes[:'lifecycle_state_details']

      self.manifest_file = attributes[:'manifestFile'] if attributes[:'manifestFile']

      raise 'You cannot provide both :manifestFile and :manifest_file' if attributes.key?(:'manifestFile') && attributes.key?(:'manifest_file')

      self.manifest_file = attributes[:'manifest_file'] if attributes[:'manifest_file']

      self.manifest_md5 = attributes[:'manifestMd5'] if attributes[:'manifestMd5']

      raise 'You cannot provide both :manifestMd5 and :manifest_md5' if attributes.key?(:'manifestMd5') && attributes.key?(:'manifest_md5')

      self.manifest_md5 = attributes[:'manifest_md5'] if attributes[:'manifest_md5']

      self.number_of_objects = attributes[:'numberOfObjects'] if attributes[:'numberOfObjects']

      raise 'You cannot provide both :numberOfObjects and :number_of_objects' if attributes.key?(:'numberOfObjects') && attributes.key?(:'number_of_objects')

      self.number_of_objects = attributes[:'number_of_objects'] if attributes[:'number_of_objects']

      self.total_size_in_bytes = attributes[:'totalSizeInBytes'] if attributes[:'totalSizeInBytes']

      raise 'You cannot provide both :totalSizeInBytes and :total_size_in_bytes' if attributes.key?(:'totalSizeInBytes') && attributes.key?(:'total_size_in_bytes')

      self.total_size_in_bytes = attributes[:'total_size_in_bytes'] if attributes[:'total_size_in_bytes']

      self.first_object = attributes[:'firstObject'] if attributes[:'firstObject']

      raise 'You cannot provide both :firstObject and :first_object' if attributes.key?(:'firstObject') && attributes.key?(:'first_object')

      self.first_object = attributes[:'first_object'] if attributes[:'first_object']

      self.last_object = attributes[:'lastObject'] if attributes[:'lastObject']

      raise 'You cannot provide both :lastObject and :last_object' if attributes.key?(:'lastObject') && attributes.key?(:'last_object')

      self.last_object = attributes[:'last_object'] if attributes[:'last_object']

      self.next_object = attributes[:'nextObject'] if attributes[:'nextObject']

      raise 'You cannot provide both :nextObject and :next_object' if attributes.key?(:'nextObject') && attributes.key?(:'next_object')

      self.next_object = attributes[:'next_object'] if attributes[:'next_object']

      self.customer_shipping_address = attributes[:'customerShippingAddress'] if attributes[:'customerShippingAddress']

      raise 'You cannot provide both :customerShippingAddress and :customer_shipping_address' if attributes.key?(:'customerShippingAddress') && attributes.key?(:'customer_shipping_address')

      self.customer_shipping_address = attributes[:'customer_shipping_address'] if attributes[:'customer_shipping_address']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      raise "Invalid value for 'lifecycle_state': this must be one of the values in LIFECYCLE_STATE_ENUM." if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)

      @lifecycle_state = lifecycle_state
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        bucket_name == other.bucket_name &&
        prefix == other.prefix &&
        range_start == other.range_start &&
        range_end == other.range_end &&
        display_name == other.display_name &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_state_details == other.lifecycle_state_details &&
        manifest_file == other.manifest_file &&
        manifest_md5 == other.manifest_md5 &&
        number_of_objects == other.number_of_objects &&
        total_size_in_bytes == other.total_size_in_bytes &&
        first_object == other.first_object &&
        last_object == other.last_object &&
        next_object == other.next_object &&
        customer_shipping_address == other.customer_shipping_address &&
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
      [bucket_name, prefix, range_start, range_end, display_name, lifecycle_state, lifecycle_state_details, manifest_file, manifest_md5, number_of_objects, total_size_in_bytes, first_object, last_object, next_object, customer_shipping_address, freeform_tags, defined_tags].hash
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
