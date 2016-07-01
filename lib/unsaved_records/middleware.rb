module UnsavedRecords
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      response = @app.call(env)
      UnsavedRecords::Tracker.call
      response
    ensure
      UnsavedRecords::Pool.clear
    end
  end
end
