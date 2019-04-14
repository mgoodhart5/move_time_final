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
  it 'returns per-capita-income of a particular city' do
    ods = ODSService.new(@location)

    expect(ods.income_info).to be_a(Hash)
    expect(ods.income_info[:fields]).to have_key(:"2015")
  end
  it 'returns the demographics of a particular city' do
    ods = ODSService.new(@location)

    expect(ods.demographics_info).to be_a(Hash)
    expect(ods.demographics_info).to have_key(:number_of_veterans)
    expect(ods.demographics_info).to have_key(:median_age)
    expect(ods.demographics_info).to have_key(:average_household_size)
  end
end
