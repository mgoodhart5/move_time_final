require 'rails_helper'

describe User do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end
  describe 'Relationships' do
    it { should have_many(:favorites)}
  end
end
