# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Properties of a saved search.  Saved search ID must not be provided.
  class ManagementDashboard::Models::UpdateManagementSavedSearchDetails
    TYPE_ENUM = [
      TYPE_SEARCH_SHOW_IN_DASHBOARD = 'SEARCH_SHOW_IN_DASHBOARD'.freeze,
      TYPE_SEARCH_DONT_SHOW_IN_DASHBOARD = 'SEARCH_DONT_SHOW_IN_DASHBOARD'.freeze,
      TYPE_WIDGET_SHOW_IN_DASHBOARD = 'WIDGET_SHOW_IN_DASHBOARD'.freeze,
      TYPE_WIDGET_DONT_SHOW_IN_DASHBOARD = 'WIDGET_DONT_SHOW_IN_DASHBOARD'.freeze
    ].freeze

    # Display name of the saved search.
    # @return [String]
    attr_accessor :display_name

    # ID of the service (for example log-analytics) that owns the saved search. Each service has a unique ID.
    # @return [String]
    attr_accessor :provider_id

    # Version of the service that owns this saved search.
    # @return [String]
    attr_accessor :provider_version

    # Name of the service (for example, Logging Analytics) that owns the saved search.
    # @return [String]
    attr_accessor :provider_name

    # OCID of the compartment in which the saved search resides.
    # @return [String]
    attr_accessor :compartment_id

    # Determines whether the saved search is an Out-of-the-Box (OOB) saved search. Note that OOB saved searches are only provided by Oracle and cannot be modified.
    # @return [BOOLEAN]
    attr_accessor :is_oob_saved_search

    # Description of the saved search.
    # @return [String]
    attr_accessor :description

    # JSON that contains internationalization options.
    # @return [Object]
    attr_accessor :nls

    # Determines how the saved search is displayed in a dashboard.
    # @return [String]
    attr_reader :type

    # JSON that contains user interface options.
    # @return [Object]
    attr_accessor :ui_config

    # Array of JSON that contain data source options.
    # @return [Array<Object>]
    attr_accessor :data_config

    # Screen image of the saved search.
    # @return [String]
    attr_accessor :screen_image

    # Version of the metadata.
    # @return [String]
    attr_accessor :metadata_version

    # Reference to the HTML file of the widget.
    # @return [String]
    attr_accessor :widget_template

    # Reference to the view model of the widget.
    # @return [String]
    attr_accessor :widget_vm

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'provider_id': :'providerId',
        'provider_version': :'providerVersion',
        'provider_name': :'providerName',
        'compartment_id': :'compartmentId',
        'is_oob_saved_search': :'isOobSavedSearch',
        'description': :'description',
        'nls': :'nls',
        'type': :'type',
        'ui_config': :'uiConfig',
        'data_config': :'dataConfig',
        'screen_image': :'screenImage',
        'metadata_version': :'metadataVersion',
        'widget_template': :'widgetTemplate',
        'widget_vm': :'widgetVM',
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
        'provider_id': :'String',
        'provider_version': :'String',
        'provider_name': :'String',
        'compartment_id': :'String',
        'is_oob_saved_search': :'BOOLEAN',
        'description': :'String',
        'nls': :'Object',
        'type': :'String',
        'ui_config': :'Object',
        'data_config': :'Array<Object>',
        'screen_image': :'String',
        'metadata_version': :'String',
        'widget_template': :'String',
        'widget_vm': :'String',
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
    # @option attributes [String] :provider_id The value to assign to the {#provider_id} property
    # @option attributes [String] :provider_version The value to assign to the {#provider_version} property
    # @option attributes [String] :provider_name The value to assign to the {#provider_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [BOOLEAN] :is_oob_saved_search The value to assign to the {#is_oob_saved_search} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Object] :nls The value to assign to the {#nls} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [Object] :ui_config The value to assign to the {#ui_config} property
    # @option attributes [Array<Object>] :data_config The value to assign to the {#data_config} property
    # @option attributes [String] :screen_image The value to assign to the {#screen_image} property
    # @option attributes [String] :metadata_version The value to assign to the {#metadata_version} property
    # @option attributes [String] :widget_template The value to assign to the {#widget_template} property
    # @option attributes [String] :widget_vm The value to assign to the {#widget_vm} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.provider_id = attributes[:'providerId'] if attributes[:'providerId']

      raise 'You cannot provide both :providerId and :provider_id' if attributes.key?(:'providerId') && attributes.key?(:'provider_id')

      self.provider_id = attributes[:'provider_id'] if attributes[:'provider_id']

      self.provider_version = attributes[:'providerVersion'] if attributes[:'providerVersion']

      raise 'You cannot provide both :providerVersion and :provider_version' if attributes.key?(:'providerVersion') && attributes.key?(:'provider_version')

      self.provider_version = attributes[:'provider_version'] if attributes[:'provider_version']

      self.provider_name = attributes[:'providerName'] if attributes[:'providerName']

      raise 'You cannot provide both :providerName and :provider_name' if attributes.key?(:'providerName') && attributes.key?(:'provider_name')

      self.provider_name = attributes[:'provider_name'] if attributes[:'provider_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.is_oob_saved_search = attributes[:'isOobSavedSearch'] unless attributes[:'isOobSavedSearch'].nil?

      raise 'You cannot provide both :isOobSavedSearch and :is_oob_saved_search' if attributes.key?(:'isOobSavedSearch') && attributes.key?(:'is_oob_saved_search')

      self.is_oob_saved_search = attributes[:'is_oob_saved_search'] unless attributes[:'is_oob_saved_search'].nil?

      self.description = attributes[:'description'] if attributes[:'description']

      self.nls = attributes[:'nls'] if attributes[:'nls']

      self.type = attributes[:'type'] if attributes[:'type']

      self.ui_config = attributes[:'uiConfig'] if attributes[:'uiConfig']

      raise 'You cannot provide both :uiConfig and :ui_config' if attributes.key?(:'uiConfig') && attributes.key?(:'ui_config')

      self.ui_config = attributes[:'ui_config'] if attributes[:'ui_config']

      self.data_config = attributes[:'dataConfig'] if attributes[:'dataConfig']

      raise 'You cannot provide both :dataConfig and :data_config' if attributes.key?(:'dataConfig') && attributes.key?(:'data_config')

      self.data_config = attributes[:'data_config'] if attributes[:'data_config']

      self.screen_image = attributes[:'screenImage'] if attributes[:'screenImage']

      raise 'You cannot provide both :screenImage and :screen_image' if attributes.key?(:'screenImage') && attributes.key?(:'screen_image')

      self.screen_image = attributes[:'screen_image'] if attributes[:'screen_image']

      self.metadata_version = attributes[:'metadataVersion'] if attributes[:'metadataVersion']

      raise 'You cannot provide both :metadataVersion and :metadata_version' if attributes.key?(:'metadataVersion') && attributes.key?(:'metadata_version')

      self.metadata_version = attributes[:'metadata_version'] if attributes[:'metadata_version']

      self.widget_template = attributes[:'widgetTemplate'] if attributes[:'widgetTemplate']

      raise 'You cannot provide both :widgetTemplate and :widget_template' if attributes.key?(:'widgetTemplate') && attributes.key?(:'widget_template')

      self.widget_template = attributes[:'widget_template'] if attributes[:'widget_template']

      self.widget_vm = attributes[:'widgetVM'] if attributes[:'widgetVM']

      raise 'You cannot provide both :widgetVM and :widget_vm' if attributes.key?(:'widgetVM') && attributes.key?(:'widget_vm')

      self.widget_vm = attributes[:'widget_vm'] if attributes[:'widget_vm']

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
    # @param [Object] type Object to be assigned
    def type=(type)
      raise "Invalid value for 'type': this must be one of the values in TYPE_ENUM." if type && !TYPE_ENUM.include?(type)

      @type = type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        provider_id == other.provider_id &&
        provider_version == other.provider_version &&
        provider_name == other.provider_name &&
        compartment_id == other.compartment_id &&
        is_oob_saved_search == other.is_oob_saved_search &&
        description == other.description &&
        nls == other.nls &&
        type == other.type &&
        ui_config == other.ui_config &&
        data_config == other.data_config &&
        screen_image == other.screen_image &&
        metadata_version == other.metadata_version &&
        widget_template == other.widget_template &&
        widget_vm == other.widget_vm &&
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
      [display_name, provider_id, provider_version, provider_name, compartment_id, is_oob_saved_search, description, nls, type, ui_config, data_config, screen_image, metadata_version, widget_template, widget_vm, freeform_tags, defined_tags].hash
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
