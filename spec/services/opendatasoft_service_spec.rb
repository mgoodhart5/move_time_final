require 'rails_helper'

describe ODSService do
  it 'exists' do
    ods = ODSService.new

    expect(ods).to be_a(ODSService)
  end
  it 'returns data for something' do
    ods = ODSService.new

    expect(ods.returned_info).to be_a(Hash)
  end
  it 'returns data for population of a particular city' do
    ods = ODSService.new

    expect(ods.returned_info).to be_a(Hash)
  end
end
