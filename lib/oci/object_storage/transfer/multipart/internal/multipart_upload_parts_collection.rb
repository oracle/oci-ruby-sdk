# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module ObjectStorage
    module Transfer
      module Multipart
        module Internal
          # Wraps a collection of parts to be uploaded to Object Storage in order to provide
          # thread-safe access to the collection
          class MultipartUploadPartsCollection
            def initialize(parts = [])
              @parts = parts
              @lock = Mutex.new
            end

            def push(part)
              @lock.synchronize { @parts.push(part) }
            end

            def shift
              @lock.synchronize { @parts.shift }
            end

            def clear!
              @lock.synchronize { @parts.clear }
            end

            def to_a
              @lock.synchronize { @parts.dup }
            end

            def length
              @lock.synchronize { @parts.length }
            end
            alias size length
          end
        end
      end
    end
  end
end
