# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The statistics of an SQL execution plan.
  #
  class DatabaseManagement::Models::SqlTuningTaskPlanStats
    PLAN_STATUS_ENUM = [
      PLAN_STATUS_COMPLETE = 'COMPLETE'.freeze,
      PLAN_STATUS_PARTIAL = 'PARTIAL'.freeze,
      PLAN_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The type of the plan for the original or the new plan with profile/index etc.
    # @return [String]
    attr_accessor :plan_type

    # **[Required]** A map contains the statistics for the SQL execution using the plan.
    # The key of the map is the metric's name. The value of the map is the metric's value.
    #
    # @return [Hash<String, Float>]
    attr_accessor :plan_stats

    # **[Required]** The status of the execution using the plan.
    #
    # @return [String]
    attr_reader :plan_status

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'plan_type': :'planType',
        'plan_stats': :'planStats',
        'plan_status': :'planStatus'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'plan_type': :'String',
        'plan_stats': :'Hash<String, Float>',
        'plan_status': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :plan_type The value to assign to the {#plan_type} property
    # @option attributes [Hash<String, Float>] :plan_stats The value to assign to the {#plan_stats} property
    # @option attributes [String] :plan_status The value to assign to the {#plan_status} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.plan_type = attributes[:'planType'] if attributes[:'planType']

      raise 'You cannot provide both :planType and :plan_type' if attributes.key?(:'planType') && attributes.key?(:'plan_type')

      self.plan_type = attributes[:'plan_type'] if attributes[:'plan_type']

      self.plan_stats = attributes[:'planStats'] if attributes[:'planStats']

      raise 'You cannot provide both :planStats and :plan_stats' if attributes.key?(:'planStats') && attributes.key?(:'plan_stats')

      self.plan_stats = attributes[:'plan_stats'] if attributes[:'plan_stats']

      self.plan_status = attributes[:'planStatus'] if attributes[:'planStatus']

      raise 'You cannot provide both :planStatus and :plan_status' if attributes.key?(:'planStatus') && attributes.key?(:'plan_status')

      self.plan_status = attributes[:'plan_status'] if attributes[:'plan_status']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] plan_status Object to be assigned
    def plan_status=(plan_status)
      # rubocop:disable Style/ConditionalAssignment
      if plan_status && !PLAN_STATUS_ENUM.include?(plan_status)
        OCI.logger.debug("Unknown value for 'plan_status' [" + plan_status + "]. Mapping to 'PLAN_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @plan_status = PLAN_STATUS_UNKNOWN_ENUM_VALUE
      else
        @plan_status = plan_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        plan_type == other.plan_type &&
        plan_stats == other.plan_stats &&
        plan_status == other.plan_status
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
      [plan_type, plan_stats, plan_status].hash
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
