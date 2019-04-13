require 'rails_helper'

describe ODSService do
  before(:each) do
    @location = "Denver, CO"
  end
  it 'exists' do
    ods = ODSService.new(@location)

    expect(ods).to be_a(ODSService)
  end
  it 'returns data for something' do
    ods = ODSService.new(@location)

    expect(ods.population_info).to be_a(Hash)
  end
  it 'returns data for population of a particular city' do
    ods = ODSService.new(@location)

    expect(ods.population_info).to be_a(Hash)
    expect(ods.population_info[:fields]).to have_key(:population)
  end
end
