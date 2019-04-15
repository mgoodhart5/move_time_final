require 'rails_helper'

describe QODService do
  xit 'exists' do
    qod = QODService.new

    expect(qod).to be_a(QODService)
  end
  xit 'returns a quote' do
    qod = QODService.new

    expect(qod.quote[:quote]).to be_a(String)
  end
end
