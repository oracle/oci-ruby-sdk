# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Specifies which plan job provides an execution plan for input to the apply or destroy job.
  # You can set only one of the three job properties. For destroy jobs, only `isAutoApproved` is permitted.
  #
  class ResourceManager::Models::ApplyJobPlanResolution
    # OCID that specifies the most recently executed plan job.
    #
    # @return [String]
    attr_accessor :plan_job_id

    # Specifies whether to use the OCID of the most recently run plan job.
    # `True` if using the latest job OCID. Must be a plan job that completed successfully.
    #
    # @return [BOOLEAN]
    attr_accessor :is_use_latest_job_id

    # Specifies whether to use the configuration directly, without reference to a Plan job.
    # `True` if using the configuration directly. Note that it is not necessary
    # for a Plan job to have run successfully.
    #
    # @return [BOOLEAN]
    attr_accessor :is_auto_approved

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'plan_job_id': :'planJobId',
        'is_use_latest_job_id': :'isUseLatestJobId',
        'is_auto_approved': :'isAutoApproved'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'plan_job_id': :'String',
        'is_use_latest_job_id': :'BOOLEAN',
        'is_auto_approved': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :plan_job_id The value to assign to the {#plan_job_id} property
    # @option attributes [BOOLEAN] :is_use_latest_job_id The value to assign to the {#is_use_latest_job_id} property
    # @option attributes [BOOLEAN] :is_auto_approved The value to assign to the {#is_auto_approved} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.plan_job_id = attributes[:'planJobId'] if attributes[:'planJobId']

      raise 'You cannot provide both :planJobId and :plan_job_id' if attributes.key?(:'planJobId') && attributes.key?(:'plan_job_id')

      self.plan_job_id = attributes[:'plan_job_id'] if attributes[:'plan_job_id']

      self.is_use_latest_job_id = attributes[:'isUseLatestJobId'] unless attributes[:'isUseLatestJobId'].nil?

      raise 'You cannot provide both :isUseLatestJobId and :is_use_latest_job_id' if attributes.key?(:'isUseLatestJobId') && attributes.key?(:'is_use_latest_job_id')

      self.is_use_latest_job_id = attributes[:'is_use_latest_job_id'] unless attributes[:'is_use_latest_job_id'].nil?

      self.is_auto_approved = attributes[:'isAutoApproved'] unless attributes[:'isAutoApproved'].nil?

      raise 'You cannot provide both :isAutoApproved and :is_auto_approved' if attributes.key?(:'isAutoApproved') && attributes.key?(:'is_auto_approved')

      self.is_auto_approved = attributes[:'is_auto_approved'] unless attributes[:'is_auto_approved'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        plan_job_id == other.plan_job_id &&
        is_use_latest_job_id == other.is_use_latest_job_id &&
        is_auto_approved == other.is_auto_approved
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
      [plan_job_id, is_use_latest_job_id, is_auto_approved].hash
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
