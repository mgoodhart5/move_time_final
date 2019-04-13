require 'rails_helper'

describe WalkscoreService do
  it 'exists' do
    wss = WalkscoreService.new

    expect(wss).to be_a(WalkscoreService)
  end
  it 'returns the walk, bike, transit scores' do
    location = "Denver, CO"
    geo_s = GeoService.new(location)
    wss = WalkscoreService.new
    results = wss.scores(geo_s.latitude, geo_s.longitude)

    expect(results).to be_a(Hash)
    expect(results).to have_key(:walkscore)
    expect(results[:transit]).to have_key(:score)
    expect(results[:bike]).to have_key(:score)
  end
end
