# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'base64'

module OCI
  module Core
    # This module contains utility methods for dealing with Core Services (Compute, Block Volume and Networking)
    module Util
      # Takes a file path and returns a Base64-encoded string which can be provided as the value of the `user_data`
      # key in the `metadata` dictionary when launching an instance. See {OCI::Core::Models::LaunchInstanceDetails}
      # for more information.
      #
      # @param [String] file_path The path to the file to use for user_data
      #
      # @return [String] A Base64-encoded string which can be used as the value of the `user_data` key in the
      #   `metadata` dictionary when launching an instance
      def self.file_content_as_launch_instance_user_data(file_path)
        expanded_path = File.expand_path(file_path)
        raise 'The specified file does not exist' unless File.exist?(file_path)

        file_content = nil
        File.open(expanded_path, 'rb') do |file|
          file_content = file.read
        end

        Base64.strict_encode64(file_content)
      end
    end
  end
end

