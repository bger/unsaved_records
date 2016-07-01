module UnsavedRecords
  module Handlers
    class Error
      def initialize(record)
        @record = record
      end

      def call
        raise "Class #{@record.class.to_s} object has not been saved. Object data #{@record.as_json}"
      end
    end
  end
end
