require 'spec_helper'

RSpec.describe UnsavedRecords::Tracker do
  describe ".call" do

  end

  describe ".handler" do
    it "returns corresponded handler" do
      UnsavedRecords.setup do |config|
        config.severity = :exception
      end
      expect(UnsavedRecords::Tracker.handler).to be(UnsavedRecords::Handlers::Error)
    end
  end
end
