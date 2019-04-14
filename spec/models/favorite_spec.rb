require 'rails_helper'

describe Favorite do
  describe 'Validations' do
    it { should validate_presence_of(:location_name) }
  end
  describe 'Relationships' do
    it { should have_many(:users).through(:user_favorites)}
  end
end
