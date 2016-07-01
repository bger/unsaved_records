require "unsaved_records/version"
require "active_support"
require "active_record"


module UnsavedRecords
  autoload :Pool,     'unsaved_records/pool'
  autoload :Tracker,  'unsaved_records/tracker'
  autoload :Middleware, 'unsaved_records/middleware'

  module Support
    autoload :ActiveRecord, 'unsaved_records/support/active_record'
  end

  module Handlers
    autoload :Log, 'unsaved_records/handlers/log'
    autoload :Error, 'unsaved_records/handlers/error'
  end

  class << self
    attr_accessor :severity

    def setup
      yield self
    end
  end
end

ActiveSupport.on_load(:active_record) do
  ActiveRecord::Base.prepend(UnsavedRecords::Support::ActiveRecord)
end
