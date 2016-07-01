require 'spec_helper'

RSpec.describe UnsavedRecords::Pool do
  let(:user) { User.create(first_name: "first", last_name: "last") }

  describe ".push" do
    it "adds a new record" do
      UnsavedRecords::Pool.push(user)
      expect(UnsavedRecords::Pool.tracked_data).to include(user)
    end
  end

  describe ".clear" do
    it "removes all data" do
      UnsavedRecords::Pool.push(user)
      UnsavedRecords::Pool.clear
      expect(UnsavedRecords::Pool.tracked_data).to be_empty
    end
  end

  describe ".each_unsaved" do
    let(:dirty_user) { User.create(first_name: "test", last_name: "test") }

    it "returns all unsaved records" do
      UnsavedRecords::Pool.push(dirty_user)
      dirty_user.assign_attributes(first_name: "first")
      data = UnsavedRecords::Pool.each_unsaved
      expect(data).to include(dirty_user)
    end
  end
end
