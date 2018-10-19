# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # CreateCrossConnectDetails model.
  class Core::Models::CreateCrossConnectDetails # rubocop:disable Metrics/LineLength
    # **[Required]** The OCID of the compartment to contain the cross-connect.
    # @return [String]
    attr_accessor :compartment_id

    # The OCID of the cross-connect group to put this cross-connect in.
    # @return [String]
    attr_accessor :cross_connect_group_id

    # A user-friendly name. Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # If you already have an existing cross-connect or cross-connect group at this FastConnect
    # location, and you want this new cross-connect to be on a different router (for the
    # purposes of redundancy), provide the OCID of that existing cross-connect or
    # cross-connect group.
    #
    # @return [String]
    attr_accessor :far_cross_connect_or_cross_connect_group_id

    # **[Required]** The name of the FastConnect location where this cross-connect will be installed.
    # To get a list of the available locations, see
    # {#list_cross_connect_locations list_cross_connect_locations}.
    #
    # Example: `CyrusOne, Chandler, AZ`
    #
    # @return [String]
    attr_accessor :location_name

    # If you already have an existing cross-connect or cross-connect group at this FastConnect
    # location, and you want this new cross-connect to be on the same router, provide the
    # OCID of that existing cross-connect or cross-connect group.
    #
    # @return [String]
    attr_accessor :near_cross_connect_or_cross_connect_group_id

    # **[Required]** The port speed for this cross-connect. To get a list of the available port speeds, see
    # {#list_crossconnect_port_speed_shapes list_crossconnect_port_speed_shapes}.
    #
    # Example: `10 Gbps`
    #
    # @return [String]
    attr_accessor :port_speed_shape_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'cross_connect_group_id': :'crossConnectGroupId',
        'display_name': :'displayName',
        'far_cross_connect_or_cross_connect_group_id': :'farCrossConnectOrCrossConnectGroupId',
        'location_name': :'locationName',
        'near_cross_connect_or_cross_connect_group_id': :'nearCrossConnectOrCrossConnectGroupId',
        'port_speed_shape_name': :'portSpeedShapeName'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'cross_connect_group_id': :'String',
        'display_name': :'String',
        'far_cross_connect_or_cross_connect_group_id': :'String',
        'location_name': :'String',
        'near_cross_connect_or_cross_connect_group_id': :'String',
        'port_speed_shape_name': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :cross_connect_group_id The value to assign to the {#cross_connect_group_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :far_cross_connect_or_cross_connect_group_id The value to assign to the {#far_cross_connect_or_cross_connect_group_id} property
    # @option attributes [String] :location_name The value to assign to the {#location_name} property
    # @option attributes [String] :near_cross_connect_or_cross_connect_group_id The value to assign to the {#near_cross_connect_or_cross_connect_group_id} property
    # @option attributes [String] :port_speed_shape_name The value to assign to the {#port_speed_shape_name} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.cross_connect_group_id = attributes[:'crossConnectGroupId'] if attributes[:'crossConnectGroupId']

      raise 'You cannot provide both :crossConnectGroupId and :cross_connect_group_id' if attributes.key?(:'crossConnectGroupId') && attributes.key?(:'cross_connect_group_id')

      self.cross_connect_group_id = attributes[:'cross_connect_group_id'] if attributes[:'cross_connect_group_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.far_cross_connect_or_cross_connect_group_id = attributes[:'farCrossConnectOrCrossConnectGroupId'] if attributes[:'farCrossConnectOrCrossConnectGroupId']

      raise 'You cannot provide both :farCrossConnectOrCrossConnectGroupId and :far_cross_connect_or_cross_connect_group_id' if attributes.key?(:'farCrossConnectOrCrossConnectGroupId') && attributes.key?(:'far_cross_connect_or_cross_connect_group_id')

      self.far_cross_connect_or_cross_connect_group_id = attributes[:'far_cross_connect_or_cross_connect_group_id'] if attributes[:'far_cross_connect_or_cross_connect_group_id']

      self.location_name = attributes[:'locationName'] if attributes[:'locationName']

      raise 'You cannot provide both :locationName and :location_name' if attributes.key?(:'locationName') && attributes.key?(:'location_name')

      self.location_name = attributes[:'location_name'] if attributes[:'location_name']

      self.near_cross_connect_or_cross_connect_group_id = attributes[:'nearCrossConnectOrCrossConnectGroupId'] if attributes[:'nearCrossConnectOrCrossConnectGroupId']

      raise 'You cannot provide both :nearCrossConnectOrCrossConnectGroupId and :near_cross_connect_or_cross_connect_group_id' if attributes.key?(:'nearCrossConnectOrCrossConnectGroupId') && attributes.key?(:'near_cross_connect_or_cross_connect_group_id')

      self.near_cross_connect_or_cross_connect_group_id = attributes[:'near_cross_connect_or_cross_connect_group_id'] if attributes[:'near_cross_connect_or_cross_connect_group_id']

      self.port_speed_shape_name = attributes[:'portSpeedShapeName'] if attributes[:'portSpeedShapeName']

      raise 'You cannot provide both :portSpeedShapeName and :port_speed_shape_name' if attributes.key?(:'portSpeedShapeName') && attributes.key?(:'port_speed_shape_name')

      self.port_speed_shape_name = attributes[:'port_speed_shape_name'] if attributes[:'port_speed_shape_name']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        compartment_id == other.compartment_id &&
        cross_connect_group_id == other.cross_connect_group_id &&
        display_name == other.display_name &&
        far_cross_connect_or_cross_connect_group_id == other.far_cross_connect_or_cross_connect_group_id &&
        location_name == other.location_name &&
        near_cross_connect_or_cross_connect_group_id == other.near_cross_connect_or_cross_connect_group_id &&
        port_speed_shape_name == other.port_speed_shape_name
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
      [compartment_id, cross_connect_group_id, display_name, far_cross_connect_or_cross_connect_group_id, location_name, near_cross_connect_or_cross_connect_group_id, port_speed_shape_name].hash
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
