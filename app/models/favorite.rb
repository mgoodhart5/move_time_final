class Favorite < ApplicationRecord
  validates_presence_of :location_name
  has_many :user_favorites, dependent: :destroy
  has_many :users, through: :user_favorites
end
