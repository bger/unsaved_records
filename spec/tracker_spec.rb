require 'spec_helper'

RSpec.describe UnsavedRecords::Tracker do
  before(:all) { UnsavedRecords.setup { |config| config.severity = :exception }}
  
  describe ".call" do
    it "run handlers for all unsaved records" do
      
    end
  end

  describe ".handler" do
    it "returns corresponded handler" do
      expect(UnsavedRecords::Tracker.handler).to be(UnsavedRecords::Handlers::Error)
    end
  end
end
