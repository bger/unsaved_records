module UnsavedRecords
  module Handlers
    class Log
      def initialize(record)
        @record = record
      end

      def call
        binding.pry
        #TODO: write to log
      end
    end
  end
end
