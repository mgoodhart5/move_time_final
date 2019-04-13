require 'rails_helper'

describe WalkscoreService do
  it 'exists' do
    wss = WalkscoreService.new

    expect(wss).to be_a(WalkscoreService)
  end

end
