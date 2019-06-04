# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A file system and the path that you can use to mount it. Each export
  # resource belongs to exactly one export set.
  #
  # The export's path attribute is not a path in the
  # referenced file system, but the value used by clients for the path
  # component of the remotetarget argument when mounting the file
  # system.
  #
  # The path must start with a slash (/) followed by a sequence of zero or more
  # slash-separated path elements. For any two export resources associated with
  # the same export set, except those in a 'DELETED' state, the path element
  # sequence for the first export resource can't contain the
  # complete path element sequence of the second export resource.
  #
  #
  # For example, the following are acceptable:
  #
  #   * /example and /path
  #   * /example1 and /example2
  #   * /example and /example1
  #
  # The following examples are not acceptable:
  #   * /example and /example/path
  #   * / and /example
  #
  # Paths may not end in a slash (/). No path element can be a period (.)
  # or two periods in sequence (..). All path elements must be 255 bytes or less.
  #
  # No two non-'DELETED' export resources in the same export set can
  # reference the same file system.
  #
  # Use `exportOptions` to control access to an export. For more information, see
  # [Export Options](https://docs.cloud.oracle.com/Content/File/Tasks/exportoptions.htm).
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class FileStorage::Models::Export
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Policies that apply to NFS requests made through this
    # export. `exportOptions` contains a sequential list of
    # `ClientOptions`. Each `ClientOptions` item defines the
    # export options that are applied to a specified
    # set of clients.
    #
    # For each NFS request, the first `ClientOptions` option
    # in the list whose `source` attribute matches the source
    # IP address of the request is applied.
    #
    # If a client source IP address does not match the `source`
    # property of any `ClientOptions` in the list, then the
    # export will be invisible to that client. This export will
    # not be returned by `MOUNTPROC_EXPORT` calls made by the client
    # and any attempt to mount or access the file system through
    # this export will result in an error.
    #
    # **Exports without defined `ClientOptions` are invisible to all clients.**
    #
    # If one export is invisible to a particular client, associated file
    # systems may still be accessible through other exports on the same
    # or different mount targets.
    # To completely deny client access to a file system, be sure that the client
    # source IP address is not included in any export for any mount target
    # associated with the file system.
    #
    # @return [Array<OCI::FileStorage::Models::ClientOptions>]
    attr_accessor :export_options

    # **[Required]** The OCID of this export's export set.
    # @return [String]
    attr_accessor :export_set_id

    # **[Required]** The OCID of this export's file system.
    # @return [String]
    attr_accessor :file_system_id

    # **[Required]** The OCID of this export.
    # @return [String]
    attr_accessor :id

    # **[Required]** The current state of this export.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** Path used to access the associated file system.
    #
    # Avoid entering confidential information.
    #
    # Example: `/accounting`
    #
    # @return [String]
    attr_accessor :path

    # **[Required]** The date and time the export was created, expressed
    # in [RFC 3339](https://tools.ietf.org/rfc/rfc3339) timestamp format.
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'export_options': :'exportOptions',
        'export_set_id': :'exportSetId',
        'file_system_id': :'fileSystemId',
        'id': :'id',
        'lifecycle_state': :'lifecycleState',
        'path': :'path',
        'time_created': :'timeCreated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'export_options': :'Array<OCI::FileStorage::Models::ClientOptions>',
        'export_set_id': :'String',
        'file_system_id': :'String',
        'id': :'String',
        'lifecycle_state': :'String',
        'path': :'String',
        'time_created': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<OCI::FileStorage::Models::ClientOptions>] :export_options The value to assign to the {#export_options} property
    # @option attributes [String] :export_set_id The value to assign to the {#export_set_id} property
    # @option attributes [String] :file_system_id The value to assign to the {#file_system_id} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :path The value to assign to the {#path} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.export_options = attributes[:'exportOptions'] if attributes[:'exportOptions']

      raise 'You cannot provide both :exportOptions and :export_options' if attributes.key?(:'exportOptions') && attributes.key?(:'export_options')

      self.export_options = attributes[:'export_options'] if attributes[:'export_options']

      self.export_set_id = attributes[:'exportSetId'] if attributes[:'exportSetId']

      raise 'You cannot provide both :exportSetId and :export_set_id' if attributes.key?(:'exportSetId') && attributes.key?(:'export_set_id')

      self.export_set_id = attributes[:'export_set_id'] if attributes[:'export_set_id']

      self.file_system_id = attributes[:'fileSystemId'] if attributes[:'fileSystemId']

      raise 'You cannot provide both :fileSystemId and :file_system_id' if attributes.key?(:'fileSystemId') && attributes.key?(:'file_system_id')

      self.file_system_id = attributes[:'file_system_id'] if attributes[:'file_system_id']

      self.id = attributes[:'id'] if attributes[:'id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.path = attributes[:'path'] if attributes[:'path']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        export_options == other.export_options &&
        export_set_id == other.export_set_id &&
        file_system_id == other.file_system_id &&
        id == other.id &&
        lifecycle_state == other.lifecycle_state &&
        path == other.path &&
        time_created == other.time_created
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
      [export_options, export_set_id, file_system_id, id, lifecycle_state, path, time_created].hash
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
