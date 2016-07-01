require 'spec_helper'

describe UnsavedRecords do
  it 'has a version number' do
    expect(UnsavedRecords::VERSION).not_to be nil
  end

  it 'does something useful' do
    binding.pry
    expect(false).to eq(true)
  end
end
