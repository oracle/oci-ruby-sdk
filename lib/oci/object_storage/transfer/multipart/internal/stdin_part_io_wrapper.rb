# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module ObjectStorage
    module Transfer
      module Multipart
        module Internal
          # A class which wraps standard input ($stdin) so that, for example, piped input can participate
          # in multipart uploads. Standard input is not seekable so we need a special class to handle it
          # rather than using {OCI::ObjectStorage::Transfer::Multipart::Internal::SeekableNonFilePartIOWrapper}.
          #
          # This class can also vend data for each part to upload as part of a multipart upload. However, since
          # we may not know the full size of $stdin beforehand, in addition to vending data this wrapper will
          # also vend the part number to assign to the uploaded part.
          #
          # Reading data out of stdin is synchronised so that only a single thread can read at any one time. This
          # prevents issues where we could write the same part multiple times or write inconsistent data.
          class StdinPartIOWrapper
            # A reference to $stdin
            # @return [IO]
            attr_reader :source

            # Creates a new StdinPartIOWrapper
            #
            # @param [IO] source A reference to $stdin
            def initialize(source:)
              @source = source
              @lock = Mutex.new
              @part_number = 0
            end

            # Reads bytes from $stdin. This is synchronised so that only a single thread can
            # perform this operation at any one time.
            #
            # @param [Integer] part_size The number of bytes to read from $stdin
            #
            # @return [Hash] A hash with two keys. The :content key will contain the content we read from $stdin
            # and the :part_number key will contain the part number we will assign to the part when we upload it as
            # part of a multipart upload. If there is no more data from $stdin then this method will return nil.
            def read(part_size)
              @lock.synchronize do
                read_content = @source.read(part_size)
                if read_content
                  @part_number += 1
                  { content: read_content, part_number: @part_number }
                end
              end
            end
          end
        end
      end
    end
  end
end
