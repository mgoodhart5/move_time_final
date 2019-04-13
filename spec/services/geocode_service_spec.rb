require 'rails_helper'

describe GeoService do
  it 'exists' do
    geo_s = GeoService.new("Denver, Co")

    expect(geo_s).to be_a(GeoService)
  end
  it 'returns latitude and longitude for location' do
    location = "Denver, CO"
    geo_s = GeoService.new(location)

    expect(geo_s.latitude).to eq(39.7392358)
    expect(geo_s.longitude).to eq(-104.990251)
  end
end
