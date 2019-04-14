require 'rails_helper'

describe UserFavorite do
  describe 'Relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:favorite) }
  end
end
