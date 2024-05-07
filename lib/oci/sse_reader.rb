# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  # Used to read the server sent events
  module SSEReader
    # Read the stream using event_stream_parser library
    def self.read_stream
      proc { |response|
        require 'event_stream_parser'
        parser = EventStreamParser::Parser.new
        response.lines do |chunk|
          parser.feed(chunk) do |_type, data, _id, _reconnection_time|
            parsed = JSON.parse(data)
            print parsed['text']
          end
        end
      }
    end
  end
end
