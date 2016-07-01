module UnsavedRecords
  module Tracker
    extend self

    def call
      UnsavedRecords::Pool.each_unsaved do |record|
        handler.new(record).call
      end
    end

    def handler
      {
        log: UnsavedRecords::Handlers::Log,
        exception: UnsavedRecords::Handlers::Error
      }[UnsavedRecords.severity]
    end
  end
end
