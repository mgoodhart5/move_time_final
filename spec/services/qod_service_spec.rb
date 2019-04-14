require 'rails_helper'

describe QODService do
  it 'exists' do
    qod = QODService.new

    expect(qod).to be_a(QODService)
  end
  it 'returns latitude and longitude for location' do
    qod = QODService.new

    expect(qod.quote[:quote]).to be_a(String)
  end
end
